# typed: strong

module Imagekitio
  module Resources
    class CustomMetadataFields
      # This API creates a new custom metadata field. Once a custom metadata field is
      # created either through this API or using the dashboard UI, its value can be set
      # on the assets. The value of a field for an asset can be set using the media
      # library UI or programmatically through upload or update assets API.
      sig do
        params(
          label: String,
          name: String,
          schema: Imagekitio::CustomMetadataFieldCreateParams::Schema::OrHash,
          request_options: Imagekitio::RequestOptions::OrHash
        ).returns(Imagekitio::CustomMetadataField)
      end
      def create(
        # Human readable name of the custom metadata field. This should be unique across
        # all non deleted custom metadata fields. This name is displayed as form field
        # label to the users while setting field value on an asset in the media library
        # UI.
        label:,
        # API name of the custom metadata field. This should be unique across all
        # (including deleted) custom metadata fields.
        name:,
        schema:,
        request_options: {}
      )
      end

      # This API updates the label or schema of an existing custom metadata field.
      sig do
        params(
          id: String,
          label: String,
          schema: Imagekitio::CustomMetadataFieldUpdateParams::Schema::OrHash,
          request_options: Imagekitio::RequestOptions::OrHash
        ).returns(Imagekitio::CustomMetadataField)
      end
      def update(
        # Should be a valid custom metadata field id.
        id,
        # Human readable name of the custom metadata field. This should be unique across
        # all non deleted custom metadata fields. This name is displayed as form field
        # label to the users while setting field value on an asset in the media library
        # UI. This parameter is required if `schema` is not provided.
        label: nil,
        # An object that describes the rules for the custom metadata key. This parameter
        # is required if `label` is not provided. Note: `type` cannot be updated and will
        # be ignored if sent with the `schema`. The schema will be validated as per the
        # existing `type`.
        schema: nil,
        request_options: {}
      )
      end

      # This API returns the array of created custom metadata field objects. By default
      # the API returns only non deleted field objects, but you can include deleted
      # fields in the API response.
      #
      # You can also filter results by a specific folder path to retrieve custom
      # metadata fields applicable at that location. This path-specific filtering is
      # useful when using the **Path policy** feature to determine which custom metadata
      # fields are selected for a given path.
      sig do
        params(
          folder_path: String,
          include_deleted: T::Boolean,
          request_options: Imagekitio::RequestOptions::OrHash
        ).returns(T::Array[Imagekitio::CustomMetadataField])
      end
      def list(
        # The folder path (e.g., `/path/to/folder`) for which to retrieve applicable
        # custom metadata fields. Useful for determining path-specific field selections
        # when the [Path policy](https://imagekit.io/docs/dam/path-policy) feature is in
        # use.
        folder_path: nil,
        # Set it to `true` to include deleted field objects in the API response.
        include_deleted: nil,
        request_options: {}
      )
      end

      # This API deletes a custom metadata field. Even after deleting a custom metadata
      # field, you cannot create any new custom metadata field with the same name.
      sig do
        params(
          id: String,
          request_options: Imagekitio::RequestOptions::OrHash
        ).returns(Imagekitio::Models::CustomMetadataFieldDeleteResponse)
      end
      def delete(
        # Should be a valid custom metadata field id.
        id,
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
