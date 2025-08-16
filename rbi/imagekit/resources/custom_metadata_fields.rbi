# typed: strong

module Imagekit
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
          schema: Imagekit::CustomMetadataFieldCreateParams::Schema::OrHash,
          request_options: Imagekit::RequestOptions::OrHash
        ).returns(Imagekit::Models::CustomMetadataFieldCreateResponse)
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
          schema: Imagekit::CustomMetadataFieldUpdateParams::Schema::OrHash,
          request_options: Imagekit::RequestOptions::OrHash
        ).returns(Imagekit::Models::CustomMetadataFieldUpdateResponse)
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
      sig do
        params(
          include_deleted: T::Boolean,
          request_options: Imagekit::RequestOptions::OrHash
        ).returns(
          T::Array[Imagekit::Models::CustomMetadataFieldListResponseItem]
        )
      end
      def list(
        # Set it to `true` to include deleted field objects in the API response. Default
        # value is `false`.
        include_deleted: nil,
        request_options: {}
      )
      end

      # This API deletes a custom metadata field. Even after deleting a custom metadata
      # field, you cannot create any new custom metadata field with the same name.
      sig do
        params(
          id: String,
          request_options: Imagekit::RequestOptions::OrHash
        ).returns(T.anything)
      end
      def delete(
        # Should be a valid custom metadata field id.
        id,
        request_options: {}
      )
      end

      # @api private
      sig { params(client: Imagekit::Client).returns(T.attached_class) }
      def self.new(client:)
      end
    end
  end
end
