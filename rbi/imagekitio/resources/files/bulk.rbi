# typed: strong

module Imagekitio
  module Resources
    class Files
      class Bulk
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
            request_options: Imagekitio::RequestOptions::OrHash
          ).returns(Imagekitio::Models::Files::BulkDeleteResponse)
        end
        def delete(
          # An array of fileIds which you want to delete.
          file_ids:,
          request_options: {}
        )
        end

        # This API adds tags to multiple files in bulk. A maximum of 50 files can be
        # specified at a time.
        sig do
          params(
            file_ids: T::Array[String],
            tags: T::Array[String],
            request_options: Imagekitio::RequestOptions::OrHash
          ).returns(Imagekitio::Models::Files::BulkAddTagsResponse)
        end
        def add_tags(
          # An array of fileIds to which you want to add tags.
          file_ids:,
          # An array of tags that you want to add to the files.
          tags:,
          request_options: {}
        )
        end

        # This API removes AITags from multiple files in bulk. A maximum of 50 files can
        # be specified at a time.
        sig do
          params(
            ai_tags: T::Array[String],
            file_ids: T::Array[String],
            request_options: Imagekitio::RequestOptions::OrHash
          ).returns(Imagekitio::Models::Files::BulkRemoveAITagsResponse)
        end
        def remove_ai_tags(
          # An array of AITags that you want to remove from the files.
          ai_tags:,
          # An array of fileIds from which you want to remove AITags.
          file_ids:,
          request_options: {}
        )
        end

        # This API removes tags from multiple files in bulk. A maximum of 50 files can be
        # specified at a time.
        sig do
          params(
            file_ids: T::Array[String],
            tags: T::Array[String],
            request_options: Imagekitio::RequestOptions::OrHash
          ).returns(Imagekitio::Models::Files::BulkRemoveTagsResponse)
        end
        def remove_tags(
          # An array of fileIds from which you want to remove tags.
          file_ids:,
          # An array of tags that you want to remove from the files.
          tags:,
          request_options: {}
        )
        end

        # @api private
        sig { params(client: Imagekitio::Client).returns(T.attached_class) }
        def self.new(client:)
        end
      end
    end
  end
end
