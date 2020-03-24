# frozen_string_literal: true

# Url holds url generation method

require "cgi"
require "openssl"
require_relative "utils/formatter"
require_relative "constants/defaults"
require_relative "constants/supported_transformation"

class Url
  def initialize(request_obj)
    @req_obj = request_obj
  end

  def generate_url(options)
    if options.key? :src
      options[:transformation_position] = Default::TRANSFORMATION_POSITION
    end
    extended_options = extend_url_options(options)
    build_url(extended_options)
  end

  def build_url(options)
    # build url from all options

    path = options.fetch(:path, "")
    src = options.fetch(:src, "")
    url_endpoint = options.fetch(:url_endpoint, "")
    transformation_position = options[:transformation_position]

    unless Default::VALID_TRANSFORMATION_POSITION.include? transformation_position
      raise ArgumentError, INVALID_TRANSFORMATION_POS
    end

    src_param_used_for_url = false
    if (src != "") || (transformation_position == Default::QUERY_TRANSFORMATION_POSITION)
      src_param_used_for_url = true
    end

    if path == "" && src == ""
      return ""
    end

    result_url_hash = {'host': "", 'path': "", 'query': ""}
    existing_query=nil
    if path != ""
      parsed_url = URI.parse(path)
      existing_query=parsed_url.query
      parsed_host = URI(url_endpoint)
      result_url_hash[:scheme] = parsed_host.scheme

      # making sure single '/' at end
      result_url_hash[:host] = parsed_host.host.to_s.chomp("/") + parsed_host.path.chomp("/") + "/"
      result_url_hash[:path] = trim_slash(parsed_url.path)
    else
      parsed_url = URI.parse(src)
      existing_query=parsed_url.query
      host = parsed_url.host
      result_url_hash[:userinfo] = parsed_url.userinfo if parsed_url.userinfo
      result_url_hash[:host] = host
      result_url_hash[:scheme] = parsed_url.scheme
      result_url_hash[:path] = parsed_url.path
      src_param_used_for_url = true
    end
    query_params = {}
    if existing_query!=nil
      existing_query.split("&").each do |part|
        parts=part.split("=")
        if parts.length==2
          query_params[parts[0]]=parts[1]
        else
          query_params[parts[0]]=""
        end
      end
    end
    options.fetch(:query_parameters, {}).each do |key, value|
      query_params[key]=value
    end
    transformation_str = transformation_to_str(options[:transformation]).chomp("/")

    if transformation_str
      if (transformation_position == Default::QUERY_TRANSFORMATION_POSITION) || src_param_used_for_url == true
        result_url_hash[:query] = "#{Default::TRANSFORMATION_PARAMETER}=#{transformation_str}"
        query_params[:tr]=transformation_str
      else
        result_url_hash[:path] = "#{Default::TRANSFORMATION_PARAMETER}:#{transformation_str}/#{result_url_hash[:path]}"
      end

    end

    result_url_hash[:host] = result_url_hash[:host].to_s.reverse.chomp("/").reverse
    result_url_hash[:path] = result_url_hash[:path].chomp("/")
    result_url_hash[:scheme] ||= "https"


    # Signature String and Timestamp
    # We can do this only for URLs that are created using urlEndpoint and path parameter
    # because we need to know the endpoint to be able to remove it from the URL to create a signature
    # for the remaining. With the src parameter, we would not know the "pattern" in the URL
    query_param_arr = []
    query_param_arr.push("ik-sdk-version=ruby-"+Imagekit::Sdk::VERSION)
    if options[:signed] && !(options[:src])
      intermediate_url = result_url_hash.fetch(:scheme, "") + "://" + result_url_hash.fetch(:host, "") + result_url_hash.fetch(:path, "")
      if result_url_hash[:query]!=nil && result_url_hash[:query]!=""
        intermediate_url += result_url_hash.fetch(:query, "")
      end
    end
    query_params.each do |key, value|
      query_param_arr.push(key.to_s + "=" + value.to_s)
    end

    query_param_str = query_param_arr.join("&")
    result_url_hash[:query] = query_param_str
    url=hash_to_url(result_url_hash)
    if options[:signed]
      private_key = options[:private_key]
      expire_seconds = options[:expire_seconds]
      expire_timestamp = get_signature_timestamp(expire_seconds)
      url_signature = get_signature(private_key, url, url_endpoint, expire_timestamp)
      query_param_arr.push(Default::SIGNATURE_PARAMETER + "=" + url_signature)

      if expire_timestamp && (expire_timestamp != Default::TIMESTAMP)
        query_param_arr.push(Default::TIMESTAMP_PARAMETER + "=" + expire_timestamp.to_s)
      end
    
      query_param_str = query_param_arr.join("&")
      result_url_hash[:query] = query_param_str
      
      url=hash_to_url(result_url_hash)
    end
    url
  end

  def transformation_to_str(transformation)
    # creates transformation_position string for url
    # from transformation dictionary

    unless transformation.is_a?(Array)
      return ""
    end

    parsed_transforms = []
    (0..(transformation.length - 1)).each do |i|
      parsed_transform_step = []

      transformation[i].keys.each do |key|
        transform_key = SUPPORTED_TRANS.fetch(key, nil)
        transform_key ||= key

        if transformation[i][key] == "-"
          parsed_transform_step.push(transform_key)
        else
          parsed_transform_step.push("#{transform_key}#{Default::TRANSFORM_KEY_VALUE_DELIMITER}#{transformation[i][key]}")
        end
      end
      parsed_transforms.push(parsed_transform_step.join(Default::TRANSFORM_DELIMITER))
    end
    parsed_transforms.join(Default::CHAIN_TRANSFORM_DELIMITER)
  end

  def get_signature_timestamp(seconds)
    # this function returns either default time stamp
    # or current unix time and expiry seconds to get
    # signature time stamp

    if seconds.to_i == 0
      Default::DEFAULT_TIMESTAMP
    else
      DateTime.now.strftime("%s").to_i + seconds.to_i
    end
  end

  def get_signature(private_key, url, url_endpoint, expiry_timestamp)
    # creates signature(hashed hex key) and returns from
    # private_key, url, url_endpoint and expiry_timestamp
    if expiry_timestamp==0
      expiry_timestamp=Default::DEFAULT_TIMESTAMP
    end
    if url_endpoint[url_endpoint.length-1]!="/"
      url_endpoint+="/"
    end
    replaced_url=url.gsub(url_endpoint, "")
    replaced_url =  replaced_url + expiry_timestamp.to_s
    OpenSSL::HMAC.hexdigest("SHA1", private_key, replaced_url)
  end

  def extend_url_options(options)
    attr_dict = {"public_key": @req_obj.public_key,
                 "private_key": @req_obj.private_key,
                 "url_endpoint": @req_obj.url_endpoint,
                 "transformation_position": @req_obj.transformation_position, }
    # extending  url options
    attr_dict.merge(options)
  end

  def hash_to_url(url_hash)
    generated_url = url_hash.fetch(:scheme, "") + "://" + url_hash.fetch(:host, "") + url_hash.fetch(:path, "")
    if url_hash[:query] != ""
      generated_url = generated_url + "?" + url_hash.fetch(:query, "")
      return generated_url
    end
    generated_url
  end

  def trim_slash(str, both = true)
    if str == ""
      return ""
    end
    # remove slash from a string
    # if both is not provide trims both slash
    # example - '/abc/' returns 'abc'
    # if both=false it will only trim end slash
    # example - '/abc/' returns '/abc'
    # NOTE: IT'S RECOMMENDED TO USE inbuilt .chomp('string you want to remove')
    # FOR REMOVING ONLY TRAILING SLASh
    if both
      str[0].chomp("/") + str[1..-2] + str[-1].chomp("/")
    else
      str.chomp("/")
    end
  end
end
