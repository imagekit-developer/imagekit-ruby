# frozen_string_literal: true

require "base64"
require "rest-client"
require "json"
require_relative "./constants/default"

# Request requests and sends data from server
module ImageKitIo
  class Request
    include Constants::Default
    attr_reader :private_key, :public_key, :url_endpoint, :transformation_position, :options

    def initialize(private_key, public_key, url_endpoint, transformation_position = nil, options = nil)
      @private_key = private_key
      @public_key = public_key
      @url_endpoint = url_endpoint
      @transformation_position = transformation_position || TRANSFORMATION_POSITION
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
    def request(method, url, headers = nil, payload = nil)
      headers ||= create_headers
      response = {response: nil, error: nil}
      begin
        resp = RestClient::Request.new(method: method,
                                       url: url,
                                       headers: headers,
                                       payload: payload).execute

        if (resp.code >= 200) && (resp.code < 204)
          if (resp.headers[:content_type].include? "application/json")
            response[:response] = JSON.parse(resp.body.to_s)
          else
            raise =RestClient::ExceptionWithResponse
          end
        elsif resp.code == 204
          response[:response] = {'success': true}
        end

      rescue RestClient::ExceptionWithResponse => err
        err.http_code == 404 ? response[:error] = {'message': err.response.to_s} : JSON.parse(err.response)
      end
      response
    end
  end
end
