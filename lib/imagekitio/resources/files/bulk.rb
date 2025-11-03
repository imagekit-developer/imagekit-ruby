# frozen_string_literal: true

module Imagekitio
  module Resources
    class Files
      class Bulk
        # Some parameter documentations has been truncated, see
        # {Imagekitio::Models::Files::BulkDeleteParams} for more details.
        #
        # This API deletes multiple files and all their file versions permanently.
        #
        # Note: If a file or specific transformation has been requested in the past, then
        # the response is cached. Deleting a file does not purge the cache. You can purge
        # the cache using purge cache API.
        #
        # A maximum of 100 files can be deleted at a time.
        #
        # @overload delete(file_ids:, request_options: {})
        #
        # @param file_ids [Array<String>] An array of fileIds which you want to delete.
        #
        # @param request_options [Imagekitio::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [Imagekitio::Models::Files::BulkDeleteResponse]
        #
        # @see Imagekitio::Models::Files::BulkDeleteParams
        def delete(params)
          parsed, options = Imagekitio::Files::BulkDeleteParams.dump_request(params)
          @client.request(
            method: :post,
            path: "v1/files/batch/deleteByFileIds",
            body: parsed,
            model: Imagekitio::Models::Files::BulkDeleteResponse,
            options: options
          )
        end

        # Some parameter documentations has been truncated, see
        # {Imagekitio::Models::Files::BulkAddTagsParams} for more details.
        #
        # This API adds tags to multiple files in bulk. A maximum of 50 files can be
        # specified at a time.
        #
        # @overload add_tags(file_ids:, tags:, request_options: {})
        #
        # @param file_ids [Array<String>] An array of fileIds to which you want to add tags.
        #
        # @param tags [Array<String>] An array of tags that you want to add to the files.
        #
        # @param request_options [Imagekitio::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [Imagekitio::Models::Files::BulkAddTagsResponse]
        #
        # @see Imagekitio::Models::Files::BulkAddTagsParams
        def add_tags(params)
          parsed, options = Imagekitio::Files::BulkAddTagsParams.dump_request(params)
          @client.request(
            method: :post,
            path: "v1/files/addTags",
            body: parsed,
            model: Imagekitio::Models::Files::BulkAddTagsResponse,
            options: options
          )
        end

        # Some parameter documentations has been truncated, see
        # {Imagekitio::Models::Files::BulkRemoveAITagsParams} for more details.
        #
        # This API removes AITags from multiple files in bulk. A maximum of 50 files can
        # be specified at a time.
        #
        # @overload remove_ai_tags(ai_tags:, file_ids:, request_options: {})
        #
        # @param ai_tags [Array<String>] An array of AITags that you want to remove from the files.
        #
        # @param file_ids [Array<String>] An array of fileIds from which you want to remove AITags.
        #
        # @param request_options [Imagekitio::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [Imagekitio::Models::Files::BulkRemoveAITagsResponse]
        #
        # @see Imagekitio::Models::Files::BulkRemoveAITagsParams
        def remove_ai_tags(params)
          parsed, options = Imagekitio::Files::BulkRemoveAITagsParams.dump_request(params)
          @client.request(
            method: :post,
            path: "v1/files/removeAITags",
            body: parsed,
            model: Imagekitio::Models::Files::BulkRemoveAITagsResponse,
            options: options
          )
        end

        # Some parameter documentations has been truncated, see
        # {Imagekitio::Models::Files::BulkRemoveTagsParams} for more details.
        #
        # This API removes tags from multiple files in bulk. A maximum of 50 files can be
        # specified at a time.
        #
        # @overload remove_tags(file_ids:, tags:, request_options: {})
        #
        # @param file_ids [Array<String>] An array of fileIds from which you want to remove tags.
        #
        # @param tags [Array<String>] An array of tags that you want to remove from the files.
        #
        # @param request_options [Imagekitio::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [Imagekitio::Models::Files::BulkRemoveTagsResponse]
        #
        # @see Imagekitio::Models::Files::BulkRemoveTagsParams
        def remove_tags(params)
          parsed, options = Imagekitio::Files::BulkRemoveTagsParams.dump_request(params)
          @client.request(
            method: :post,
            path: "v1/files/removeTags",
            body: parsed,
            model: Imagekitio::Models::Files::BulkRemoveTagsResponse,
            options: options
          )
        end

        # @api private
        #
        # @param client [Imagekitio::Client]
        def initialize(client:)
          @client = client
        end
      end
    end
  end
end
