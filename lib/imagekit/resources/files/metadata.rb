# frozen_string_literal: true

module Imagekit
  module Resources
    class Files
      class Metadata
        # Some parameter documentations has been truncated, see
        # {Imagekit::Models::Files::MetadataGetParams} for more details.
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
        # @param request_options [Imagekit::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [Imagekit::Models::Files::MetadataGetResponse]
        #
        # @see Imagekit::Models::Files::MetadataGetParams
        def get(file_id, params = {})
          @client.request(
            method: :get,
            path: ["v1/files/%1$s/metadata", file_id],
            model: Imagekit::Models::Files::MetadataGetResponse,
            options: params[:request_options]
          )
        end

        # Some parameter documentations has been truncated, see
        # {Imagekit::Models::Files::MetadataGetFromURLParams} for more details.
        #
        # Get image EXIF, pHash, and other metadata from ImageKit.io powered remote URL
        # using this API.
        #
        # @overload get_from_url(url:, request_options: {})
        #
        # @param url [String] Should be a valid file URL. It should be accessible using your ImageKit.io accou
        #
        # @param request_options [Imagekit::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [Imagekit::Models::Files::MetadataGetFromURLResponse]
        #
        # @see Imagekit::Models::Files::MetadataGetFromURLParams
        def get_from_url(params)
          parsed, options = Imagekit::Files::MetadataGetFromURLParams.dump_request(params)
          @client.request(
            method: :get,
            path: "v1/files/metadata",
            query: parsed,
            model: Imagekit::Models::Files::MetadataGetFromURLResponse,
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
