# frozen_string_literal: true

$VERBOSE = nil

require_relative "./resource"
require_relative "./file"
require_relative "./url"
require_relative "./utils/calculation"

module ImageKit
  class Error < StandardError
  end

  # ImageKit class holds each method will be used by user
  class ImageKitClient
    attr_reader :file

    def initialize(private_key, public_key, url_endpoint, transformation_pos = nil, options = nil)

      unless(private_key.is_a?(String) && private_key.to_s.strip.length != 0)
        raise ArgumentError, "ImageKit private key must be a valid, non-blank string"
      end
      unless(public_key.is_a?(String) && public_key.to_s.strip.length != 0)
        raise ArgumentError, "ImageKit public key must be a valid, non-blank string"
      end
      unless(url_endpoint.is_a?(String) && url_endpoint.to_s.strip.length != 0)
        raise ArgumentError, "ImageKit URL Endpoint should be valid, non-blank string"
      end

      @private_key = private_key
      @public_key = public_key
      @url_endpoint = url_endpoint
      @transformation_position = transformation_pos
      @options = options

      @ik_req = ImageKitRequest.new(private_key, public_key, url_endpoint)
      @file = ImageKitFile.new(@ik_req)
      @url_obj = Url.new(@ik_req)

    end

    def set_ik_request(ik_req)
      # setter for imagekit request mainly will be used for
      # test
      @ik_req = ik_req
    end

    def url(options)
      @url_obj.generate_url(options)
    end

    def upload_file(file = nil, file_name = nil, options = nil)
      # upload file to imagekit server
      @file.upload(file, file_name, options)
    end

    def list_files(options)
      # list all files
      @file.list(options)
    end

    def get_file_details(file_identifier)
      # Get file detail by file-id or file_url
      @file.details(file_identifier)
    end

    def update_file_details(file_id, options)
      # update file details by file id and other options payload
      @file.update_details(file_id, options)
    end

    def delete_file(file_id)
      # Delete a file by file-id
      @file.delete(file_id)
    end

    def bulk_file_delete(file_ids)
      # Delete file in bulks by list of file id
      @file.batch_delete(file_ids)
    end

    def get_file_metadata(file_id)
      # Get metadata of a file by file-id
      @file.get_metadata(file_id)
    end

    def purge_file_cache(file_url)
      # Purge cache from ImageKit server by file_url
      @file.purge_cache(file_url)
    end

    def purge_file_cache_status(request_id)
      @file.purge_cache_status(request_id.to_s)
    end

    def get_remote_file_url_metadata(remote_file_url = "")
      @file.get_metadata_from_remote_url(remote_file_url)
    end

    # Get metadata from remote_file_url
    # param remote_file_url: url string of remote file

    def phash_distance(first, second)
      # Get hamming distance between two phash(image hash) to check
      # similarity between images
      if first.to_s.strip == "" || second.to_s.strip == ""
        raise ArgumentError, Error::MISSING_PHASH_VALUE
      end
      hamming_distance(first, second)
    end

    def get_authentication_parameters(token = nil, expire = nil)
      # Get Authentication params
      get_authenticated_params(token, expire, @ik_req.private_key)
    end
  end
end