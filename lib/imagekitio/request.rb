# frozen_string_literal: true

require "base64"
require "rest-client"
require "json"
require 'net/http/post/multipart'
require_relative './constant'
# Request requests and sends data from server
module ImageKitIo
  class Request
    include Constantable

    attr_reader :private_key, :public_key, :url_endpoint, :transformation_position, :options

    def initialize(private_key, public_key, url_endpoint, transformation_position = nil, options = nil)
      @private_key = private_key
      @public_key = public_key
      @url_endpoint = url_endpoint
      @transformation_position = transformation_position || constants.TRANSFORMATION_POSITION
      @options = options || {}
    end

    # creates required headers
    def create_headers
      headers = {'Accept-Encoding': "application/json", 'Content-Type': "application/json"}
      headers.update(auth_headers)
    end

    def auth_headers
      encoded_private_key = Base64.strict_encode64(@private_key+":")
      {Authorization: "Basic #{encoded_private_key}"}
    end

    # request method communicates with server
    def request(method, url, headers = create_headers, payload = nil)
      headers ||= create_headers
      response = {}
      begin
        if(method.downcase.to_sym == :post && payload.is_a?(Hash) && payload[:multipart])
          uri = URI.parse(url)
          http = Net::HTTP.new(uri.host, uri.port)
          http.use_ssl = (uri.scheme == 'https')
          req = Net::HTTP::Post::Multipart.new uri.path, payload, headers
          resp = http.request(req)
          response[:headers] = resp.to_hash
        else
          resp = RestClient::Request.new(method: method,
                                         url: url,
                                         headers: headers,
                                         payload: payload).execute
          response[:headers] = resp.raw_headers
        end
        response[:raw_body] = resp.body
        response[:status_code] = resp.code
        resp_c = resp.code.to_i
        if [400, 403].include?(resp_c)
          raise RestClient::ExceptionWithResponse, OpenStruct.new({ body: resp.body, code: resp_c, headers: response[:headers] })
        end
        if (resp.code.to_i >= 200) && (resp.code.to_i < 204)
          content_type = resp.respond_to?(:headers) ? resp.headers[:content_type] : resp.content_type
          if (content_type.include? "application/json")
            response[:response] = JSON.parse(resp.body.to_s)
          else
            raise RestClient::ExceptionWithResponse, OpenStruct.new(code: 404, body: resp.body)
          end
        elsif resp.code.to_i == 204
          response[:response] = {'success': true}
        end

      rescue RestClient::ExceptionWithResponse => err
        response[:status_code] = err.http_code if response[:status_code].nil?
        response[:headers] = err.http_headers if response[:headers].nil?
        response[:error] = if err.http_code.to_i == 404
                             {'message': err.response.to_s}
                           else
                             err.response.is_a?(OpenStruct) ? JSON.parse(err.response.body) : JSON.parse(err.response)
                           end
      end
      response
    end

    def request_stream(method, url, headers: nil, payload: nil, **options, &block)
      headers ||= create_headers
      response = { response: nil, error: nil }
      begin
        RestClient::Request.execute(method: method,
                                    url: url,
                                    headers: headers,
                                    payload: payload,
                                    **options,
                                    block_response: block
                                    )
      rescue RestClient::ExceptionWithResponse => err
        err.http_code == 404 ? response[:error] = {'message': err.response.to_s} : JSON.parse(err.response)
      end
    end
  end
end
