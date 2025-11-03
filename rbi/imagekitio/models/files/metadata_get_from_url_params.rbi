# typed: strong

module Imagekitio
  module Models
    module Files
      class MetadataGetFromURLParams < Imagekitio::Internal::Type::BaseModel
        extend Imagekitio::Internal::Type::RequestParameters::Converter
        include Imagekitio::Internal::Type::RequestParameters

        OrHash =
          T.type_alias do
            T.any(
              Imagekitio::Files::MetadataGetFromURLParams,
              Imagekitio::Internal::AnyHash
            )
          end

        # Should be a valid file URL. It should be accessible using your ImageKit.io
        # account.
        sig { returns(String) }
        attr_accessor :url

        sig do
          params(
            url: String,
            request_options: Imagekitio::RequestOptions::OrHash
          ).returns(T.attached_class)
        end
        def self.new(
          # Should be a valid file URL. It should be accessible using your ImageKit.io
          # account.
          url:,
          request_options: {}
        )
        end

        sig do
          override.returns(
            { url: String, request_options: Imagekitio::RequestOptions }
          )
        end
        def to_hash
        end
      end
    end
  end
end
