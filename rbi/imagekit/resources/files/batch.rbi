# typed: strong

module Imagekit
  module Resources
    class Files
      class Batch
        # This API deletes multiple files and all their file versions permanently.
        #
        # Note: If a file or specific transformation has been requested in the past, then
        # the response is cached. Deleting a file does not purge the cache. You can purge
        # the cache using purge cache API.
        #
        # A maximum of 100 files can be deleted at a time.
        sig do
          params(
            file_ids: T::Array[String],
            request_options: Imagekit::RequestOptions::OrHash
          ).returns(Imagekit::Models::Files::BatchDeleteResponse)
        end
        def delete(
          # An array of fileIds which you want to delete.
          file_ids:,
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
