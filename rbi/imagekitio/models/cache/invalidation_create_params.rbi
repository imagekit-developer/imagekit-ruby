# typed: strong

module Imagekitio
  module Models
    module Cache
      class InvalidationCreateParams < Imagekitio::Internal::Type::BaseModel
        extend Imagekitio::Internal::Type::RequestParameters::Converter
        include Imagekitio::Internal::Type::RequestParameters

        OrHash =
          T.type_alias do
            T.any(
              Imagekitio::Cache::InvalidationCreateParams,
              Imagekitio::Internal::AnyHash
            )
          end

        # The full URL of the file to be purged.
        sig { returns(String) }
        attr_accessor :url

        sig do
          params(
            url: String,
            request_options: Imagekitio::RequestOptions::OrHash
          ).returns(T.attached_class)
        end
        def self.new(
          # The full URL of the file to be purged.
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
