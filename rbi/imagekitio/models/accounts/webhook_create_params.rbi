# typed: strong

module Imagekitio
  module Models
    module Accounts
      class WebhookCreateParams < Imagekitio::Internal::Type::BaseModel
        extend Imagekitio::Internal::Type::RequestParameters::Converter
        include Imagekitio::Internal::Type::RequestParameters

        OrHash =
          T.type_alias do
            T.any(
              Imagekitio::Accounts::WebhookCreateParams,
              Imagekitio::Internal::AnyHash
            )
          end

        # The URL where ImageKit sends webhook events as `POST` requests. Must use the
        # `http` or `https` protocol, and must be unique across all webhooks for your
        # account.
        sig { returns(String) }
        attr_accessor :endpoint

        # The event types this webhook is subscribed to. ImageKit sends a request to the
        # `endpoint` only for these events.
        sig do
          returns(T::Array[Imagekitio::Accounts::WebhookEventType::OrSymbol])
        end
        attr_accessor :events

        # Whether the webhook is enabled. When `false`, ImageKit doesn't send any events
        # to the `endpoint`.
        sig { returns(T.nilable(T::Boolean)) }
        attr_reader :enabled

        sig { params(enabled: T::Boolean).void }
        attr_writer :enabled

        sig do
          params(
            endpoint: String,
            events: T::Array[Imagekitio::Accounts::WebhookEventType::OrSymbol],
            enabled: T::Boolean,
            request_options: Imagekitio::RequestOptions::OrHash
          ).returns(T.attached_class)
        end
        def self.new(
          # The URL where ImageKit sends webhook events as `POST` requests. Must use the
          # `http` or `https` protocol, and must be unique across all webhooks for your
          # account.
          endpoint:,
          # The event types this webhook is subscribed to. ImageKit sends a request to the
          # `endpoint` only for these events.
          events:,
          # Whether the webhook is enabled. When `false`, ImageKit doesn't send any events
          # to the `endpoint`.
          enabled: nil,
          request_options: {}
        )
        end

        sig do
          override.returns(
            {
              endpoint: String,
              events:
                T::Array[Imagekitio::Accounts::WebhookEventType::OrSymbol],
              enabled: T::Boolean,
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
