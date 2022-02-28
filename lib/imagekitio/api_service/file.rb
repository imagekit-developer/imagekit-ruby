# frozen_string_literal: true
require_relative '../constant'
require_relative '../utils/option_validator'
require 'net/http/post/multipart'

module ImageKitIo
  module ApiService
    class File
      include Utils::OptionValidator
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
      #           { 'name' => 'remove-bg', 'options' => { 'add_shadow' => 'true' } },
      #           { 'name' => 'google-auto-tagging', 'minConfidence' => 80 }
      #         ]
      #  - `custom_metadata` should be hash
      #     eg: option['custom_metadata'] = {
      #            "SKU": "VS882HJ2JD",
      #            "price": 599.99,
      #            "brand": "H&M",
      #            "discount": 30
      #         }
      def upload(file: nil, file_name: nil, **options)
        raise ArgumentError, constants.MISSING_UPLOAD_FILE_PARAMETER unless file
        raise ArgumentError, constants.MISSING_UPLOAD_FILE_PARAMETER unless file_name

        content_type = options.delete(:content_type) || ''
        options = format_to_json(options, :extensions, Array)
        options = format_to_json(options, :custom_metadata, Hash)
        options = validate_upload_options(options || {})
        if options.is_a?(FalseClass)
          raise ArgumentError, "Invalid Upload option"
        else
          headers = @req_obj.create_headers
          payload =  {
            multipart: true,
            file: file.is_a?(String) ? file : ::UploadIO.new(file, content_type, file_name),
            fileName: file_name
          }
          payload.merge!(options)
          url = "#{constants.BASE_URL}#{constants.UPLOAD}"
          @req_obj.request("post", url, headers, payload)
        end
      end

      def update_details(file_id: nil, **options)
        unless options.fetch(:tags, []).is_a?(Array)
          raise ArgumentError, constants.UPDATE_DATA_TAGS_INVALID
        end
        unless options.fetch(:custom_coordinates, "").is_a?(String)
          raise ArgumentError, constants.UPDATE_DATA_COORDS_INVALID
        end
        url = "#{constants.BASE_URL}/#{file_id}/details/"
        headers = @req_obj.create_headers
        payload = request_formatter(options || {})
        @req_obj.request("patch", url, headers, payload.to_json)
      end

      def list(**options)
        #  returns list of files on ImageKitIo Server
        #  :options dictionary of options
        formatted_options = request_formatter(options || {})
        raise KeyError(constants.LIST_FILES_INPUT_MISSING) unless formatted_options.is_a?(Hash)
        url = constants.BASE_URL
        headers = @req_obj.create_headers.update({params: formatted_options})
        @req_obj.request("get", url, headers, formatted_options)
      end

      def details(file_identifier: nil)
        # Get detail of file by file_identifier
        if file_identifier == "" || file_identifier.nil?
          raise ArgumentError, "file_identifier is required"
        end
        url = "#{constants.BASE_URL}/#{file_identifier}/details/"
        headers = @req_obj.create_headers
        @req_obj.request("get", url, headers)
      end

      def get_metadata(file_id: nil)
        # Get metadata of a file by file_id
        if file_id == "" || file_id.nil?
          raise ArgumentError, "file_id is required"
        end
        url = "#{constants.BASE_URL}/#{file_id}/metadata"
        @req_obj.request("get", url, @req_obj.create_headers)
      end

      def delete(file_id: nil)
        # Delete a file_id by file_id
        if file_id == "" || file_id.nil?
          raise ArgumentError, "file_id is required"
        end
        url = "#{constants.BASE_URL}/#{file_id}"
        headers = @req_obj.create_headers
        @req_obj.request("delete", url, headers)
      end

      def purge_cache(file_url: nil)
        # purges cache from server by file_url
        if file_url == "" || file_url.nil?
          raise ArgumentError, "file_url is required"
        end
        url = "#{constants.BASE_URL}/purge"
        payload = {'url': file_url}
        @req_obj.request("post", url, @req_obj.create_headers, payload)
      end

      def purge_cache_status(request_id: nil)
        # This function is to get cache_status
        if request_id == "" || request_id.nil?
          raise ArgumentError, "remote_file_url is required"
        end
        url = "#{constants.BASE_URL}/purge/#{request_id}"
        @req_obj.request("get", url, @req_obj.create_headers)
      end

      def get_metadata_from_remote_url(remote_file_url: nil)
        if remote_file_url == "" || remote_file_url.nil?
          raise ArgumentError, "remote_file_url is required"
        end
        url = "#{constants.REMOTE_METADATA_FULL_URL}?url=#{remote_file_url}"
        @req_obj.request("get", url, @req_obj.create_headers)
      end

      def stream_file(remote_file_url: nil, &block)
        if remote_file_url == '' || remote_file_url.nil?
          raise ArgumentError, 'remote_file_url is required'
        end
        @req_obj.request_stream('get', remote_file_url, headers: @req_obj.create_headers, &block)
      end

      def copy(source_file_path: nil, destination_path: nil)
        if source_file_path == '' || source_file_path.nil? || destination_path == '' || destination_path.nil?
          raise ArgumentError, 'parameters required'
        end
        url = "#{constants.BASE_URL}/copy"
        payload = { 'sourceFilePath': source_file_path, 'destinationPath': destination_path }
        @req_obj.request('post', url, @req_obj.create_headers, payload)
      end

      def move(source_file_path: nil, destination_path: nil)
        if source_file_path == '' || source_file_path.nil? || destination_path == '' || destination_path.nil?
          raise ArgumentError, 'parameters required'
        end
        url = "#{constants.BASE_URL}/move"
        payload = { 'sourceFilePath': source_file_path, 'destinationPath': destination_path }
        @req_obj.request('post', url, @req_obj.create_headers, payload)
      end

      def rename(file_path: nil, new_file_name: nil, **options)
        if file_path == '' || file_path.nil? || new_file_name == '' || new_file_name.nil?
          raise ArgumentError, 'parameters required'
        end
        url = "#{constants.BASE_URL}/rename"
        payload = { 'filePath': file_path, 'newFileName': new_file_name }.merge(request_formatter(options)).to_json
        @req_obj.request('put', url, @req_obj.create_headers, payload)
      end


      private
      def image_format?(type)
        %(image/jpeg image/bmp image/apng image/avif image/gif image/ief image/svg+xml image/tiff image/x-icon image/rgb image/webp).include?(type)
      end
    end
  end
end
