# frozen_string_literal: true

module Imagekitio
  module Resources
    class CustomMetadataFields
      # Some parameter documentations has been truncated, see
      # {Imagekitio::Models::CustomMetadataFieldCreateParams} for more details.
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
      # @param schema [Imagekitio::Models::CustomMetadataFieldCreateParams::Schema]
      #
      # @param request_options [Imagekitio::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Imagekitio::Models::CustomMetadataField]
      #
      # @see Imagekitio::Models::CustomMetadataFieldCreateParams
      def create(params)
        parsed, options = Imagekitio::CustomMetadataFieldCreateParams.dump_request(params)
        @client.request(
          method: :post,
          path: "v1/customMetadataFields",
          body: parsed,
          model: Imagekitio::CustomMetadataField,
          options: options
        )
      end

      # Some parameter documentations has been truncated, see
      # {Imagekitio::Models::CustomMetadataFieldUpdateParams} for more details.
      #
      # This API updates the label or schema of an existing custom metadata field.
      #
      # @overload update(id, label: nil, schema: nil, request_options: {})
      #
      # @param id [String] Should be a valid custom metadata field id.
      #
      # @param label [String] Human readable name of the custom metadata field. This should be unique across a
      #
      # @param schema [Imagekitio::Models::CustomMetadataFieldUpdateParams::Schema] An object that describes the rules for the custom metadata key. This parameter i
      #
      # @param request_options [Imagekitio::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Imagekitio::Models::CustomMetadataField]
      #
      # @see Imagekitio::Models::CustomMetadataFieldUpdateParams
      def update(id, params = {})
        parsed, options = Imagekitio::CustomMetadataFieldUpdateParams.dump_request(params)
        @client.request(
          method: :patch,
          path: ["v1/customMetadataFields/%1$s", id],
          body: parsed,
          model: Imagekitio::CustomMetadataField,
          options: options
        )
      end

      # Some parameter documentations has been truncated, see
      # {Imagekitio::Models::CustomMetadataFieldListParams} for more details.
      #
      # This API returns the array of created custom metadata field objects. By default
      # the API returns only non deleted field objects, but you can include deleted
      # fields in the API response.
      #
      # You can also filter results by a specific folder path to retrieve custom
      # metadata fields applicable at that location. This path-specific filtering is
      # useful when using the **Path policy** feature to determine which custom metadata
      # fields are selected for a given path.
      #
      # @overload list(folder_path: nil, include_deleted: nil, request_options: {})
      #
      # @param folder_path [String] The folder path (e.g., `/path/to/folder`) for which to retrieve applicable custo
      #
      # @param include_deleted [Boolean] Set it to `true` to include deleted field objects in the API response.
      #
      # @param request_options [Imagekitio::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Array<Imagekitio::Models::CustomMetadataField>]
      #
      # @see Imagekitio::Models::CustomMetadataFieldListParams
      def list(params = {})
        parsed, options = Imagekitio::CustomMetadataFieldListParams.dump_request(params)
        @client.request(
          method: :get,
          path: "v1/customMetadataFields",
          query: parsed.transform_keys(folder_path: "folderPath", include_deleted: "includeDeleted"),
          model: Imagekitio::Internal::Type::ArrayOf[Imagekitio::CustomMetadataField],
          options: options
        )
      end

      # Some parameter documentations has been truncated, see
      # {Imagekitio::Models::CustomMetadataFieldDeleteParams} for more details.
      #
      # This API deletes a custom metadata field. Even after deleting a custom metadata
      # field, you cannot create any new custom metadata field with the same name.
      #
      # @overload delete(id, request_options: {})
      #
      # @param id [String] Should be a valid custom metadata field id.
      #
      # @param request_options [Imagekitio::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Imagekitio::Models::CustomMetadataFieldDeleteResponse]
      #
      # @see Imagekitio::Models::CustomMetadataFieldDeleteParams
      def delete(id, params = {})
        @client.request(
          method: :delete,
          path: ["v1/customMetadataFields/%1$s", id],
          model: Imagekitio::Models::CustomMetadataFieldDeleteResponse,
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
