# frozen_string_literal: true

module Imagekitio
  module Resources
    class Files
      class Metadata
        # Some parameter documentations has been truncated, see
        # {Imagekitio::Models::Files::MetadataGetParams} for more details.
        #
        # You can programmatically get image EXIF, pHash, and other metadata for uploaded
        # files in the ImageKit.io media library using this API.
        #
        # You can also get the metadata in upload API response by passing `metadata` in
        # `responseFields` parameter.
        #
        # @overload get(file_id, request_options: {})
        #
        # @param file_id [String] The unique `fileId` of the uploaded file. `fileId` is returned in the list and s
        #
        # @param request_options [Imagekitio::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [Imagekitio::Models::Metadata]
        #
        # @see Imagekitio::Models::Files::MetadataGetParams
        def get(file_id, params = {})
          @client.request(
            method: :get,
            path: ["v1/files/%1$s/metadata", file_id],
            model: Imagekitio::Metadata,
            options: params[:request_options]
          )
        end

        # Some parameter documentations has been truncated, see
        # {Imagekitio::Models::Files::MetadataGetFromURLParams} for more details.
        #
        # Get image EXIF, pHash, and other metadata from ImageKit.io powered remote URL
        # using this API.
        #
        # @overload get_from_url(url:, request_options: {})
        #
        # @param url [String] Should be a valid file URL. It should be accessible using your ImageKit.io accou
        #
        # @param request_options [Imagekitio::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [Imagekitio::Models::Metadata]
        #
        # @see Imagekitio::Models::Files::MetadataGetFromURLParams
        def get_from_url(params)
          parsed, options = Imagekitio::Files::MetadataGetFromURLParams.dump_request(params)
          @client.request(
            method: :get,
            path: "v1/metadata",
            query: parsed,
            model: Imagekitio::Metadata,
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
