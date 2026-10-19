# typed: strong

module Imagekitio
  module Models
    module Accounts
      class WebhookUpdateParams < Imagekitio::Internal::Type::BaseModel
        extend Imagekitio::Internal::Type::RequestParameters::Converter
        include Imagekitio::Internal::Type::RequestParameters

        OrHash =
          T.type_alias do
            T.any(
              Imagekitio::Accounts::WebhookUpdateParams,
              Imagekitio::Internal::AnyHash
            )
          end

        # Unique identifier for a webhook.
        sig { returns(String) }
        attr_accessor :id

        # Whether the webhook is enabled. Omit to leave the current value unchanged.
        sig { returns(T.nilable(T::Boolean)) }
        attr_reader :enabled

        sig { params(enabled: T::Boolean).void }
        attr_writer :enabled

        # The URL where ImageKit sends webhook events as `POST` requests. Must use the
        # `http` or `https` protocol, and must be unique across all webhooks for your
        # account.
        sig { returns(T.nilable(String)) }
        attr_reader :endpoint

        sig { params(endpoint: String).void }
        attr_writer :endpoint

        # The event types this webhook is subscribed to. Replaces the existing list. Omit
        # to leave the current value unchanged.
        sig do
          returns(
            T.nilable(
              T::Array[Imagekitio::Accounts::WebhookEventType::OrSymbol]
            )
          )
        end
        attr_reader :events

        sig do
          params(
            events: T::Array[Imagekitio::Accounts::WebhookEventType::OrSymbol]
          ).void
        end
        attr_writer :events

        sig do
          params(
            id: String,
            enabled: T::Boolean,
            endpoint: String,
            events: T::Array[Imagekitio::Accounts::WebhookEventType::OrSymbol],
            request_options: Imagekitio::RequestOptions::OrHash
          ).returns(T.attached_class)
        end
        def self.new(
          # Unique identifier for a webhook.
          id:,
          # Whether the webhook is enabled. Omit to leave the current value unchanged.
          enabled: nil,
          # The URL where ImageKit sends webhook events as `POST` requests. Must use the
          # `http` or `https` protocol, and must be unique across all webhooks for your
          # account.
          endpoint: nil,
          # The event types this webhook is subscribed to. Replaces the existing list. Omit
          # to leave the current value unchanged.
          events: nil,
          request_options: {}
        )
        end

        sig do
          override.returns(
            {
              id: String,
              enabled: T::Boolean,
              endpoint: String,
              events:
                T::Array[Imagekitio::Accounts::WebhookEventType::OrSymbol],
              request_options: Imagekitio::RequestOptions
            }
          )
        end
        def to_hash
        end
      end
    end
  end
end
