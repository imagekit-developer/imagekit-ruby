# frozen_string_literal: true

$VERBOSE = nil

require_relative "./request"
require_relative "./url"
require_relative "./utils/calculation"
require_relative './constant'
require_relative './configurable'
require_relative './api_service/custom_metadata_field'
require_relative './api_service/folder'
require_relative './api_service/file'
require_relative './api_service/bulk'

module ImageKitIo
  # ImageKitIo class holds each method will be used by user
  class Client
    include Utils::Calculation
    include Constantable

    attr_reader :file_service, :custom_metadata_field_service, :folder_service, :bulk_service

    def initialize(private_key, public_key, url_endpoint, transformation_pos = nil, options = nil)
      unless(private_key.is_a?(String) && private_key.to_s.strip.length != 0)
        raise ArgumentError, constants.MISSING_PRIVATE_KEY
      end
      unless(public_key.is_a?(String) && public_key.to_s.strip.length != 0)
        raise ArgumentError, constants.MISSING_PUBLIC_KEY
      end
      unless(url_endpoint.is_a?(String) && url_endpoint.to_s.strip.length != 0)
        raise ArgumentError, constants.MISSING_URL_ENDPOINT
      end

      @private_key = private_key
      @public_key = public_key
      @url_endpoint = url_endpoint
      @transformation_position = transformation_pos
      @options = options

      @ik_req = Request.new(private_key, public_key, url_endpoint)
      @url_obj = Url.new(@ik_req)
      @file_service = ApiService::File.new(@ik_req)
      @custom_metadata_field_service = ApiService::CustomMetadataField.new(@ik_req)
      @folder_service = ApiService::Folder.new(@ik_req)
      @bulk_service = ApiService::Bulk.new(@ik_req)
    end

    def set_ik_request(ik_req)
      # setter for imagekit request mainly will be used for
      # test
      @ik_req = ik_req
    end

    def url(options = {})
      @url_obj.generate_url(options)
    end

    def upload_file(file: nil, file_name: nil, **options)
      # upload file to imagekit server
      @file_service.upload(file: file, file_name: file_name, **options)
    end

    def list_files(options = {})
      # list all files
      @file_service.list(**options)
    end

    def file_versions(file_id: nil)
      @file_service.get_file_versions(file_id: file_id)
    end

    def file_version_detail(file_id: nil, version_id: nil)
      @file_service.get_file_version_detail(file_id: file_id, version_id: version_id)
    end

    def delete_file_version(file_id: nil, version_id: nil)
      @file_service.delete_file_version(file_id: file_id, version_id: version_id)
    end

    def restore_file_version(file_id: nil, version_id: nil)
      @file_service.restore_file_version(file_id: file_id, version_id: version_id)
    end

    def get_file_details(file_id: nil)
      # Get file detail by file-id or file_url
      @file_service.details(file_identifier: file_id)
    end

    def update_file_details(file_id: nil, **options)
      # update file details by file id and other options payload
      @file_service.update_details(file_id: file_id, **options)
    end

    def delete_file(file_id: nil)
      # Delete a file by file-id
      @file_service.delete(file_id: file_id)
    end

    def get_file_metadata(file_id: nil)
      # Get metadata of a file by file-id
      @file_service.get_metadata(file_id: file_id)
    end

    def purge_file_cache(file_url: nil)
      # Purge cache from ImageKitIo server by file_url
      @file_service.purge_cache(file_url: file_url)
    end

    def purge_file_cache_status(request_id: nil)
      @file_service.purge_cache_status(request_id: request_id.to_s)
    end

    # Get metadata from remote_file_url
    # param remote_file_url: url string of remote file
    def get_remote_file_url_metadata(remote_file_url: "")
      @file_service.get_metadata_from_remote_url(remote_file_url: remote_file_url)
    end

    def stream_file(file_url: nil, &block)
      @file_service.stream_file(remote_file_url: file_url, &block)
    end

    def copy_file(source_file_path: nil, destination_path: nil, include_file_versions: false)
      @file_service.copy(source_file_path: source_file_path, destination_path: destination_path, include_file_versions: include_file_versions)
    end

    def move_file(source_file_path: nil, destination_path: nil)
      @file_service.move(source_file_path: source_file_path, destination_path: destination_path)
    end

    def rename_file(file_path: nil, new_file_name: nil, **options)
      @file_service.rename(file_path: file_path, new_file_name: new_file_name, **options)
    end

    def add_bulk_tags(file_ids: [], tags: [])
      @bulk_service.add_tags(file_ids: file_ids, tags: tags)
    end

    def delete_bulk_files(file_ids: [])
      # Delete file in bulks by list of file id
      @bulk_service.remove_files(file_ids: file_ids)
    end

    def delete_bulk_tags(file_ids: [], tags: [])
      @bulk_service.remove_tags(file_ids: file_ids, tags: tags)
    end

    def delete_bulk_ai_tags(file_ids: [], ai_tags: [])
      @bulk_service.remove_ai_tags(file_ids: file_ids, ai_tags: ai_tags)
    end

    def bulk_job_status(job_id: nil)
      @bulk_service.job_status(job_id: job_id)
    end

    def create_folder(folder_name: nil, parent_folder_path: "/")
      @folder_service.create(folder_name: folder_name, parent_folder_path: parent_folder_path)
    end

    def delete_folder(folder_path: nil)
      @folder_service.delete(folder_path: folder_path)
    end

    def copy_folder(source_folder_path: nil, destination_path: nil, include_file_versions: false)
      @folder_service.copy(source_folder_path: source_folder_path, destination_path: destination_path, include_file_versions: include_file_versions)
    end

    def move_folder(source_folder_path: nil, destination_path: nil)
      @folder_service.move(source_folder_path: source_folder_path, destination_path: destination_path)
    end

    def create_custom_metadata_field(name: nil, label: nil, schema: {})
      @custom_metadata_field_service.create(name: name, label: label, schema: schema)
    end

    def get_custom_metadata_fields(options = {})
      @custom_metadata_field_service.list(**options)
    end

    def update_custom_metadata_field(id: nil, label: nil, schema: nil)
      @custom_metadata_field_service.update(id: id, label: label, schema: schema)
    end

    def delete_custom_metadata_field(id: nil)
      @custom_metadata_field_service.delete(id: id)
    end

    def phash_distance(first, second)
      # Get hamming distance between two phash(image hash) to check
      # similarity between images
      if first.to_s.strip == "" || second.to_s.strip == ""
        raise ArgumentError, constants.MISSING_PHASH_VALUE
      end
      hamming_distance(first, second)
    end

    def get_authentication_parameters(token = nil, expire = nil)
      # Get Authentication params
      get_authenticated_params(token, expire, @ik_req.private_key)
    end
  end
end
