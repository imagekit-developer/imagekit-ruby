# typed: strong

module Imagekit
  module Models
    class CustomMetadataFieldListParams < Imagekit::Internal::Type::BaseModel
      extend Imagekit::Internal::Type::RequestParameters::Converter
      include Imagekit::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(
            Imagekit::CustomMetadataFieldListParams,
            Imagekit::Internal::AnyHash
          )
        end

      # The folder path (e.g., `/path/to/folder`) for which to retrieve applicable
      # custom metadata fields.
      # Useful for determining path-specific field selections when the
      # [Path policy](https://imagekit.io/docs/dam/path-policy) feature is in use.
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
          request_options: Imagekit::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        # The folder path (e.g., `/path/to/folder`) for which to retrieve applicable
        # custom metadata fields.
        # Useful for determining path-specific field selections when the
        # [Path policy](https://imagekit.io/docs/dam/path-policy) feature is in use.
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
            request_options: Imagekit::RequestOptions
          }
        )
      end
      def to_hash
      end
    end
  end
end
