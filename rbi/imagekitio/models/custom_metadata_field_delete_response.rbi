# typed: strong

module Imagekitio
  module Models
    class CustomMetadataFieldDeleteResponse < Imagekitio::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            Imagekitio::Models::CustomMetadataFieldDeleteResponse,
            Imagekitio::Internal::AnyHash
          )
        end

      sig { returns(T.attached_class) }
      def self.new
      end

      sig { override.returns({}) }
      def to_hash
      end
    end
  end
end
