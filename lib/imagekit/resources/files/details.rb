# frozen_string_literal: true

module Imagekit
  module Resources
    class Files
      class Details
        # Some parameter documentations has been truncated, see
        # {Imagekit::Models::Files::DetailRetrieveParams} for more details.
        #
        # This API returns an object with details or attributes about the current version
        # of the file.
        #
        # @overload retrieve(file_id, request_options: {})
        #
        # @param file_id [String] The unique `fileId` of the uploaded file. `fileId` is returned in the list and s
        #
        # @param request_options [Imagekit::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [Imagekit::Models::Files::DetailRetrieveResponse]
        #
        # @see Imagekit::Models::Files::DetailRetrieveParams
        def retrieve(file_id, params = {})
          @client.request(
            method: :get,
            path: ["v1/files/%1$s/details", file_id],
            model: Imagekit::Models::Files::DetailRetrieveResponse,
            options: params[:request_options]
          )
        end

        # Some parameter documentations has been truncated, see
        # {Imagekit::Models::Files::DetailUpdateParams} for more details.
        #
        # This API updates the details or attributes of the current version of the file.
        # You can update `tags`, `customCoordinates`, `customMetadata`, publication
        # status, remove existing `AITags` and apply extensions using this API.
        #
        # @overload update(file_id, custom_coordinates: nil, custom_metadata: nil, extensions: nil, remove_ai_tags: nil, tags: nil, webhook_url: nil, publish: nil, request_options: {})
        #
        # @param file_id [String] The unique `fileId` of the uploaded file. `fileId` is returned in list and searc
        #
        # @param custom_coordinates [String, nil] Define an important area in the image in the format `x,y,width,height` e.g. `10,
        #
        # @param custom_metadata [Object] A key-value data to be associated with the asset. To unset a key, send `null` va
        #
        # @param extensions [Array<Imagekit::Models::Files::DetailUpdateParams::Extension::RemovedotBgExtension, Imagekit::Models::Files::DetailUpdateParams::Extension::AutoTaggingExtension>] Array of extensions to be applied to the asset. Each extension can be configured
        #
        # @param remove_ai_tags [Array<String>, Symbol, Imagekit::Models::Files::DetailUpdateParams::RemoveAITags] An array of AITags associated with the file that you want to remove, e.g. `["car
        #
        # @param tags [Array<String>, nil] An array of tags associated with the file, such as `["tag1", "tag2"]`. Send `nul
        #
        # @param webhook_url [String] The final status of extensions after they have completed execution will be deliv
        #
        # @param publish [Imagekit::Models::Files::DetailUpdateParams::Publish] Configure the publication status of a file and its versions.
        #
        # @param request_options [Imagekit::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [Imagekit::Models::Files::DetailUpdateResponse]
        #
        # @see Imagekit::Models::Files::DetailUpdateParams
        def update(file_id, params = {})
          parsed, options = Imagekit::Files::DetailUpdateParams.dump_request(params)
          @client.request(
            method: :patch,
            path: ["v1/files/%1$s/details", file_id],
            body: parsed,
            model: Imagekit::Models::Files::DetailUpdateResponse,
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
