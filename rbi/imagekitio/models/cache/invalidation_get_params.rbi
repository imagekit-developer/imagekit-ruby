# typed: strong

module Imagekitio
  module Models
    module Cache
      class InvalidationGetParams < Imagekitio::Internal::Type::BaseModel
        extend Imagekitio::Internal::Type::RequestParameters::Converter
        include Imagekitio::Internal::Type::RequestParameters

        OrHash =
          T.type_alias do
            T.any(
              Imagekitio::Cache::InvalidationGetParams,
              Imagekitio::Internal::AnyHash
            )
          end

        sig { returns(String) }
        attr_accessor :request_id

        sig do
          params(
            request_id: String,
            request_options: Imagekitio::RequestOptions::OrHash
          ).returns(T.attached_class)
        end
        def self.new(request_id:, request_options: {})
        end

        sig do
          override.returns(
            { request_id: String, request_options: Imagekitio::RequestOptions }
          )
        end
        def to_hash
        end
      end
    end
  end
end
