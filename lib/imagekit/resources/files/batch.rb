# frozen_string_literal: true

module Imagekit
  module Resources
    class Files
      class Batch
        # Some parameter documentations has been truncated, see
        # {Imagekit::Models::Files::BatchDeleteParams} for more details.
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
        # @param request_options [Imagekit::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [Imagekit::Models::Files::BatchDeleteResponse]
        #
        # @see Imagekit::Models::Files::BatchDeleteParams
        def delete(params)
          parsed, options = Imagekit::Files::BatchDeleteParams.dump_request(params)
          @client.request(
            method: :post,
            path: "v1/files/batch/deleteByFileIds",
            body: parsed,
            model: Imagekit::Models::Files::BatchDeleteResponse,
            options: options
          )
        end

        # @api private
        #
        # @param client [Imagekit::Client]
        def initialize(client:)
          @client = client
        end
      end
    end
  end
end
