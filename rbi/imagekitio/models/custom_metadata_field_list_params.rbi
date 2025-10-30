# typed: strong

module Imagekitio
  module Models
    class CustomMetadataFieldListParams < Imagekitio::Internal::Type::BaseModel
      extend Imagekitio::Internal::Type::RequestParameters::Converter
      include Imagekitio::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(
            Imagekitio::CustomMetadataFieldListParams,
            Imagekitio::Internal::AnyHash
          )
        end

      # The folder path (e.g., `/path/to/folder`) for which to retrieve applicable
      # custom metadata fields. Useful for determining path-specific field selections
      # when the [Path policy](https://imagekit.io/docs/dam/path-policy) feature is in
      # use.
      sig { returns(T.nilable(String)) }
      attr_reader :folder_path

      sig { params(folder_path: String).void }
      attr_writer :folder_path

      # Set it to `true` to include deleted field objects in the API response.
      sig { returns(T.nilable(T::Boolean)) }
      attr_reader :include_deleted

      sig { params(include_deleted: T::Boolean).void }
      attr_writer :include_deleted

      sig do
        params(
          folder_path: String,
          include_deleted: T::Boolean,
          request_options: Imagekitio::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
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

      sig do
        override.returns(
          {
            folder_path: String,
            include_deleted: T::Boolean,
            request_options: Imagekitio::RequestOptions
          }
        )
      end
      def to_hash
      end
    end
  end
end
