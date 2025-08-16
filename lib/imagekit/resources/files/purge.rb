# frozen_string_literal: true

module Imagekit
  module Resources
    class Files
      class Purge
        # Some parameter documentations has been truncated, see
        # {Imagekit::Models::Files::PurgeExecuteParams} for more details.
        #
        # This API will purge CDN cache and ImageKit.io's internal cache for a file. Note:
        # Purge cache is an asynchronous process and it may take some time to reflect the
        # changes.
        #
        # @overload execute(url:, request_options: {})
        #
        # @param url [String] The full URL of the file to be purged.
        #
        # @param request_options [Imagekit::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [Imagekit::Models::Files::PurgeExecuteResponse]
        #
        # @see Imagekit::Models::Files::PurgeExecuteParams
        def execute(params)
          parsed, options = Imagekit::Files::PurgeExecuteParams.dump_request(params)
          @client.request(
            method: :post,
            path: "v1/files/purge",
            body: parsed,
            model: Imagekit::Models::Files::PurgeExecuteResponse,
            options: options
          )
        end

        # Some parameter documentations has been truncated, see
        # {Imagekit::Models::Files::PurgeStatusParams} for more details.
        #
        # This API returns the status of a purge cache request.
        #
        # @overload status(request_id, request_options: {})
        #
        # @param request_id [String] Should be a valid requestId.
        #
        # @param request_options [Imagekit::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [Imagekit::Models::Files::PurgeStatusResponse]
        #
        # @see Imagekit::Models::Files::PurgeStatusParams
        def status(request_id, params = {})
          @client.request(
            method: :get,
            path: ["v1/files/purge/%1$s", request_id],
            model: Imagekit::Models::Files::PurgeStatusResponse,
            options: params[:request_options]
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
