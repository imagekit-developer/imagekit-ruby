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

      # Set it to `true` to include deleted field objects in the API response. Default
      # value is `false`.
      sig { returns(T.nilable(T::Boolean)) }
      attr_reader :include_deleted

      sig { params(include_deleted: T::Boolean).void }
      attr_writer :include_deleted

      sig do
        params(
          include_deleted: T::Boolean,
          request_options: Imagekit::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        # Set it to `true` to include deleted field objects in the API response. Default
        # value is `false`.
        include_deleted: nil,
        request_options: {}
      )
      end

      sig do
        override.returns(
          {
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
