# typed: strong

module Imagekit
  module Resources
    class Cache
      class Invalidation
        # This API will purge CDN cache and ImageKit.io's internal cache for a file. Note:
        # Purge cache is an asynchronous process and it may take some time to reflect the
        # changes.
        sig do
          params(
            url: String,
            request_options: Imagekit::RequestOptions::OrHash
          ).returns(Imagekit::Models::Cache::InvalidationCreateResponse)
        end
        def create(
          # The full URL of the file to be purged.
          url:,
          request_options: {}
        )
        end

        # This API returns the status of a purge cache request.
        sig do
          params(
            request_id: String,
            request_options: Imagekit::RequestOptions::OrHash
          ).returns(Imagekit::Models::Cache::InvalidationGetResponse)
        end
        def get(
          # Should be a valid requestId.
          request_id,
          request_options: {}
        )
        end

        # @api private
        sig { params(client: Imagekit::Client).returns(T.attached_class) }
        def self.new(client:)
        end
      end
    end
  end
end
