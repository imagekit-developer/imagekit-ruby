require_relative './ik_file'

module ActiveStorageBlobExtension
  def self.included(base)
    base.class_eval do
      before_destroy :remove_imagekit_file
      # ActiveRecord::Blob class first destroy the record data and then calls the service.delete method with key
      # as an argument. But the imagekit.io needs fileId to destroy the file which can be get from the metadata.
      # So first destroy the remote file and then destroy the local blob record.
      def remove_imagekit_file
        ActiveStorage::Service::ImageKitIoService.delete_ik_file(self)
      end

      def remote_file_exist?
        service.exist?(self.key)
      end
    end
  end
end

Rails.application.config.to_prepare do
  ActiveStorage::Blob.send :include, ::ActiveStorageBlobExtension
end

module ActiveStorage
  class Service::ImageKitIoService < Service
    class << self
      def delete_ik_file(blob)
        ImageKiIo::ActiveStorage::IKFile.new(blob.metadata).delete
      end
    end

    def initialize(**options)
      @options = options
    end

    def upload(key, io, checksum: nil, **options)
      instrument :upload, key: key, checksum: checksum do
        blob = storage_blob(key)
        response = client.upload_file(io, blob.filename.to_s)
        if response[:error].nil?
          blob.update(metadata: response[:response])
        end
      end
    end

    def download(key, &block)
      instrument :download, key: key do
        image_kit_file(key)
      end
    end

    def download_chunk(key, range)
      puts 'Not implemented download_chunk'
    end

    def delete(key)
      instrument :delete, key: key do
        # image kit file is already deleted on before blob destroy callback
        key
      end
    end

    def delete_prefixed(prefix)
      # delete the variants files
      puts 'Not implemented delete_prefixed'
    end

    def exist?(key)
      ik_file = image_kit_file(key)
      ik_client = client
      details = ik_client.get_file_details(ik_file.file_id)
      if details[:response].present?
        true
      else
        false
      end
    end

    def url_for_direct_upload(key, expires_in:, content_type:, content_length:, checksum:)
      puts 'Not implemented url_for_direct_upload'
    end

    def headers_for_direct_upload(key, current_type:, **options)
      puts 'Not implemented header_for_direct_upload'
    end

    def path_for(key)
      image_kit_file(key).path
    end

    def url(key, filename: nil, content_type: '', **options)
      image_kit_file(key).url
    end

    private

    def private_url(key, expires_in:, filename:, disposition:, content_type:, **)
      generate_url(key, expires_in: expires_in, filename: filename, disposition: disposition, content_type: content_type)
    end

    def generate_url(key, expires_in:, filename:, content_type:, disposition:)
      filename = '/' + filename.to_s if filename.is_a? ActiveStorage::Filename
      client.url(path: filename, url_endpoint: config.url_endpoint)
    end

    def client
      ImageKitIo.client
    end

    def config
      ImageKitIo.config
    end

    def storage_blob(key)
      ActiveStorage::Blob.find_by_key(key)
    end

    def image_kit_file(key)
      blob = storage_blob(key)
      ik_file.new(blob.metadata)
    end

    def ik_file
      ImageKiIo::ActiveStorage::IKFile
    end
  end
end
