# frozen_string_literal: true
require_relative "utils/formatter"

module ImageKitIo
  class File
    include Utils::Formatter
    include Constantable

    # This File class holds file related operations like
    # upload, list etc
    def initialize(req_obj)
      @req_obj = req_obj
    end

    # uploads files with required arguments, supports bot url and binary
    # Options types:
    #  - `extensions` should be array of hash
    #     eg: option['extension'] = [
    #           { 'name' => 'remove-bg', 'options' => { 'add_shadow' => true } },
    #           { 'name' => 'google-auto-tagging', 'minConfidence' => 80 }
    #         ]
    #  - `custom_metadata` should be hash
    #     eg: option['custom_metadata'] = {
    #            "SKU": "VS882HJ2JD",
    #            "price": 599.99,
    #            "brand": "H&M",
    #            "discount": 30
    #         }
    def upload(file, file_name, options)
      raise ArgumentError, constants.MISSING_UPLOAD_FILE_PARAMETER unless file
      raise ArgumentError, constants.MISSING_UPLOAD_FILE_PARAMETER unless file_name

      options = format_to_json(options, :extensions, Array)
      options = format_to_json(options, :custom_metadata, Hash)
      options = validate_upload_options(options || {})
      if options.is_a?(FalseClass)
        raise ArgumentError, "Invalid Upload option"
      else
        headers = @req_obj.create_headers
        payload = {multipart: true, file: file, fileName: file_name}.merge(options)

        url = "#{constants.BASE_URL}#{constants.UPLOAD}"
        @req_obj.request("post", url, headers, payload)
      end
    end

    def update_details(file_id, options)
      # Update file detail by file_id and options

      unless (options.key? :tags) || (options.key? :custom_coordinates)
        raise ArgumentError, constants.UPDATE_DATA_MISSING
      end
      unless options.fetch(:tags, []).is_a?(Array)
        raise ArgumentError, constants.UPDATE_DATA_TAGS_INVALID
      end
      unless options.fetch(:custom_coordinates, "").is_a?(String)
        raise ArgumentError, constants.UPDATE_DATA_COORDS_INVALID
      end
      url = "#{constants.BASE_URL}/#{file_id}/details/"
      headers = @req_obj.create_headers
      payload = request_formatter(options)
      @req_obj.request("patch", url, headers, payload.to_json)
    end

    def list(options)
      #  returns list of files on ImageKitIo Server
      #  :options dictionary of options
      formatted_options = request_formatter(options)
      raise KeyError(constants.LIST_FILES_INPUT_MISSING) unless formatted_options.is_a?(Hash)
      url = constants.BASE_URL
      headers = @req_obj.create_headers.update({params: formatted_options})
      @req_obj.request("get", url, headers, formatted_options)
    end

    def details(file_identifier)
      # Get detail of file by file_identifier
      url = "#{constants.BASE_URL}/#{file_identifier}/details/"
      headers = @req_obj.create_headers
      @req_obj.request("get", url, headers)
    end

    def get_metadata(file_id)
      # Get metadata of a file by file_id
      url = "#{constants.BASE_URL}/#{file_id}/metadata"
      @req_obj.request("get", url, @req_obj.create_headers)
    end

    def delete(file_id)
      # Delete a file_id by file_id
      url = "#{constants.BASE_URL}/#{file_id}"
      headers = @req_obj.create_headers
      @req_obj.request("delete", url, headers)
    end

    def batch_delete(file_ids)
      url = "#{constants.BASE_URL}#{constants.BULK_FILE_DELETE}"
      payload = {'fileIds': file_ids}
      @req_obj.request("post", url, @req_obj.create_headers, payload.to_json)
    end

    def purge_cache(file_url)

      # purges cache from server by file_url

      url = "#{constants.BASE_URL}/purge"
      payload = {'url': file_url}
      @req_obj.request("post", url, @req_obj.create_headers, payload)
    end

    def purge_cache_status(request_id)
      # This function is to get cache_status
      url = "#{constants.BASE_URL}/purge/#{request_id}"
      @req_obj.request("get", url, @req_obj.create_headers)
    end

    def get_metadata_from_remote_url(remote_file_url)
      if remote_file_url == ""
        raise ArgumentError, "remote_file_url is required"
      end
      url = "#{constants.REMOTE_METADATA_FULL_URL}?url=#{remote_file_url}"
      @req_obj.request("get", url, @req_obj.create_headers)
    end

    def stream_file(remote_file_url, &block)
      if remote_file_url == '' || remote_file_url.nil?
        raise ArgumentError, 'remote_file_url is required'
      end
      @req_obj.request_stream('get', remote_file_url, headers: @req_obj.create_headers, &block)
    end

    def validate_upload_options(options)

      #  Validates upload value, checks if params are valid,
      #  changes snake to camel case which is supported by
      #  ImageKitIo server


      response_list = []
      options.each do |key, val|
        if constants.VALID_UPLOAD_OPTIONS.include?(key.to_s)
          if val.is_a?(Array)
            val = val.join(",")
          end
          if val.is_a?(TrueClass) || val.is_a?(FalseClass)
            val = val.to_s
          end
          options[key] = val
        else
          return false
        end
      end
      request_formatter(options)
    end
  end
end
