# typed: strong

module Imagekitio
  module Models
    module Accounts
      class WebhookDeleteParams < Imagekitio::Internal::Type::BaseModel
        extend Imagekitio::Internal::Type::RequestParameters::Converter
        include Imagekitio::Internal::Type::RequestParameters

        OrHash =
          T.type_alias do
            T.any(
              Imagekitio::Accounts::WebhookDeleteParams,
              Imagekitio::Internal::AnyHash
            )
          end

        # Unique identifier for a webhook.
        sig { returns(String) }
        attr_accessor :id

        sig do
          params(
            id: String,
            request_options: Imagekitio::RequestOptions::OrHash
          ).returns(T.attached_class)
        end
        def self.new(
          # Unique identifier for a webhook.
          id:,
          request_options: {}
        )
        end

        sig do
          override.returns(
            { id: String, request_options: Imagekitio::RequestOptions }
          )
        end
        def to_hash
        end
      end
    end
  end
end
