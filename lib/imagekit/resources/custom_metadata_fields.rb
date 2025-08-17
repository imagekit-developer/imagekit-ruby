# frozen_string_literal: true

module Imagekit
  module Resources
    class CustomMetadataFields
      # Some parameter documentations has been truncated, see
      # {Imagekit::Models::CustomMetadataFieldCreateParams} for more details.
      #
      # This API creates a new custom metadata field. Once a custom metadata field is
      # created either through this API or using the dashboard UI, its value can be set
      # on the assets. The value of a field for an asset can be set using the media
      # library UI or programmatically through upload or update assets API.
      #
      # @overload create(label:, name:, schema:, request_options: {})
      #
      # @param label [String] Human readable name of the custom metadata field. This should be unique across a
      #
      # @param name [String] API name of the custom metadata field. This should be unique across all (includi
      #
      # @param schema [Imagekit::Models::CustomMetadataFieldCreateParams::Schema]
      #
      # @param request_options [Imagekit::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Imagekit::Models::CustomMetadataFieldCreateResponse]
      #
      # @see Imagekit::Models::CustomMetadataFieldCreateParams
      def create(params)
        parsed, options = Imagekit::CustomMetadataFieldCreateParams.dump_request(params)
        @client.request(
          method: :post,
          path: "v1/customMetadataFields",
          body: parsed,
          model: Imagekit::Models::CustomMetadataFieldCreateResponse,
          options: options
        )
      end

      # Some parameter documentations has been truncated, see
      # {Imagekit::Models::CustomMetadataFieldUpdateParams} for more details.
      #
      # This API updates the label or schema of an existing custom metadata field.
      #
      # @overload update(id, label: nil, schema: nil, request_options: {})
      #
      # @param id [String] Should be a valid custom metadata field id.
      #
      # @param label [String] Human readable name of the custom metadata field. This should be unique across a
      #
      # @param schema [Imagekit::Models::CustomMetadataFieldUpdateParams::Schema] An object that describes the rules for the custom metadata key. This parameter i
      #
      # @param request_options [Imagekit::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Imagekit::Models::CustomMetadataFieldUpdateResponse]
      #
      # @see Imagekit::Models::CustomMetadataFieldUpdateParams
      def update(id, params = {})
        parsed, options = Imagekit::CustomMetadataFieldUpdateParams.dump_request(params)
        @client.request(
          method: :patch,
          path: ["v1/customMetadataFields/%1$s", id],
          body: parsed,
          model: Imagekit::Models::CustomMetadataFieldUpdateResponse,
          options: options
        )
      end

      # Some parameter documentations has been truncated, see
      # {Imagekit::Models::CustomMetadataFieldListParams} for more details.
      #
      # This API returns the array of created custom metadata field objects. By default
      # the API returns only non deleted field objects, but you can include deleted
      # fields in the API response.
      #
      # @overload list(include_deleted: nil, request_options: {})
      #
      # @param include_deleted [Boolean] Set it to `true` to include deleted field objects in the API response.
      #
      # @param request_options [Imagekit::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Array<Imagekit::Models::CustomMetadataFieldListResponseItem>]
      #
      # @see Imagekit::Models::CustomMetadataFieldListParams
      def list(params = {})
        parsed, options = Imagekit::CustomMetadataFieldListParams.dump_request(params)
        @client.request(
          method: :get,
          path: "v1/customMetadataFields",
          query: parsed.transform_keys(include_deleted: "includeDeleted"),
          model: Imagekit::Internal::Type::ArrayOf[Imagekit::Models::CustomMetadataFieldListResponseItem],
          options: options
        )
      end

      # Some parameter documentations has been truncated, see
      # {Imagekit::Models::CustomMetadataFieldDeleteParams} for more details.
      #
      # This API deletes a custom metadata field. Even after deleting a custom metadata
      # field, you cannot create any new custom metadata field with the same name.
      #
      # @overload delete(id, request_options: {})
      #
      # @param id [String] Should be a valid custom metadata field id.
      #
      # @param request_options [Imagekit::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Object]
      #
      # @see Imagekit::Models::CustomMetadataFieldDeleteParams
      def delete(id, params = {})
        @client.request(
          method: :delete,
          path: ["v1/customMetadataFields/%1$s", id],
          model: Imagekit::Internal::Type::Unknown,
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
