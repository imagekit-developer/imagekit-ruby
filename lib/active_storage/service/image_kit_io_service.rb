module ActiveStorage
  class Service::ImageKitIoService < Service

    def initialize(**options)
      @options = options
    end

    def upload(key, io, checksum: nil, **options)

    end

    def download(key, &block)

    end

    def download_chunk(key, range)

    end

    def delete(key)

    end

    def delete_prefixed(prefix)

    end

    def exist?(key)

    end

    def url_for_direct_upload(key, expires_in:, content_type:, content_length:, checksum:)

    end

    def headers_for_direct_upload(key, current_type:, **options)

    end

    def path_for(key)

    end
  end
end
