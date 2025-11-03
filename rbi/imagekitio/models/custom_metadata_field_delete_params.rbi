# typed: strong

module Imagekitio
  module Models
    class CustomMetadataFieldDeleteParams < Imagekitio::Internal::Type::BaseModel
      extend Imagekitio::Internal::Type::RequestParameters::Converter
      include Imagekitio::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(
            Imagekitio::CustomMetadataFieldDeleteParams,
            Imagekitio::Internal::AnyHash
          )
        end

      sig do
        params(request_options: Imagekitio::RequestOptions::OrHash).returns(
          T.attached_class
        )
      end
      def self.new(request_options: {})
      end

      sig { override.returns({ request_options: Imagekitio::RequestOptions }) }
      def to_hash
      end
    end
  end
end
