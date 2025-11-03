# frozen_string_literal: true

module Imagekitio
  module Resources
    class Cache
      class Invalidation
        # Some parameter documentations has been truncated, see
        # {Imagekitio::Models::Cache::InvalidationCreateParams} for more details.
        #
        # This API will purge CDN cache and ImageKit.io's internal cache for a file. Note:
        # Purge cache is an asynchronous process and it may take some time to reflect the
        # changes.
        #
        # @overload create(url:, request_options: {})
        #
        # @param url [String] The full URL of the file to be purged.
        #
        # @param request_options [Imagekitio::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [Imagekitio::Models::Cache::InvalidationCreateResponse]
        #
        # @see Imagekitio::Models::Cache::InvalidationCreateParams
        def create(params)
          parsed, options = Imagekitio::Cache::InvalidationCreateParams.dump_request(params)
          @client.request(
            method: :post,
            path: "v1/files/purge",
            body: parsed,
            model: Imagekitio::Models::Cache::InvalidationCreateResponse,
            options: options
          )
        end

        # Some parameter documentations has been truncated, see
        # {Imagekitio::Models::Cache::InvalidationGetParams} for more details.
        #
        # This API returns the status of a purge cache request.
        #
        # @overload get(request_id, request_options: {})
        #
        # @param request_id [String] Should be a valid requestId.
        #
        # @param request_options [Imagekitio::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [Imagekitio::Models::Cache::InvalidationGetResponse]
        #
        # @see Imagekitio::Models::Cache::InvalidationGetParams
        def get(request_id, params = {})
          @client.request(
            method: :get,
            path: ["v1/files/purge/%1$s", request_id],
            model: Imagekitio::Models::Cache::InvalidationGetResponse,
            options: params[:request_options]
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
