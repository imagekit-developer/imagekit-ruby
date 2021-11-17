require_relative './ik_file'

module ActiveStorageBlobExtension
  def self.included(base)
    base.class_eval do
      before_destroy :remove_imagekit_file
      # ActiveRecord::Blob class first destroy the record data and then calls the service.delete method with key
      # as an argument. But the imagekit.io needs fileId to destroy the file which can be get from the metadata.
      # So first destroy the remote file and then destroy the local blob record.
      def remove_imagekit_file
        service.class.delete_ik_file(self)
      end

      def remote_file_exist?
        service.exist?(self.key)
      end

      def remote_file
        return false unless remote_file_exist?

        service.class.remote_file(self)
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
        ik_file(blob).delete
      end

      def remote_file(blob)
        ik_file(blob)
      end

      def ik_file(blob)
        self.new.send(:ik_file).new(blob.metadata)
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
      if block_given?
        instrument :stream_file, key: key do
          stream_file(key, &block)
        end
      else
        instrument :download, key: key do
          image_kit_file(key)
        end
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
      image_kit_file(key).exist?
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

    def stream_file(key, &download_block)
      file_obj = image_kit_file(key)
      block = proc { |response|
        response.read_body do |chunk|
          download_block.call(chunk) if download_block.present?
        end
      }
      client.stream_file(file_obj.url, &block)
    end
  end
end