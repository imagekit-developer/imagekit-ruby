# typed: strong

module Imagekitio
  module Resources
    class Accounts
      class Webhooks
        # Creates a new webhook and returns the created object, including the generated
        # signing `secret`.
        #
        # ImageKit sends a `POST` request to the webhook `endpoint` whenever one of the
        # subscribed `events` occurs. Use the `secret` to verify the signature of each
        # request. Learn more about [webhooks](https://imagekit.io/docs/webhooks).
        #
        # You can create up to 3 webhooks per account.
        sig do
          params(
            endpoint: String,
            events: T::Array[Imagekitio::Accounts::WebhookEventType::OrSymbol],
            enabled: T::Boolean,
            request_options: Imagekitio::RequestOptions::OrHash
          ).returns(Imagekitio::Accounts::Webhook)
        end
        def create(
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

        # Updates the webhook identified by `id` and returns the updated object. Only the
        # fields included in the request body are changed.
        #
        # When `events` is provided, it replaces the existing list of subscribed events.
        # The signing `secret` can't be changed.
        sig do
          params(
            id: String,
            enabled: T::Boolean,
            endpoint: String,
            events: T::Array[Imagekitio::Accounts::WebhookEventType::OrSymbol],
            request_options: Imagekitio::RequestOptions::OrHash
          ).returns(Imagekitio::Accounts::Webhook)
        end
        def update(
          # Unique identifier for a webhook.
          id,
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

        # Returns an array of all webhooks configured for your account.
        sig do
          params(request_options: Imagekitio::RequestOptions::OrHash).returns(
            T::Array[Imagekitio::Accounts::Webhook]
          )
        end
        def list(request_options: {})
        end

        # Permanently deletes the webhook identified by `id`. ImageKit stops sending
        # events to its endpoint.
        sig do
          params(
            id: String,
            request_options: Imagekitio::RequestOptions::OrHash
          ).void
        end
        def delete(
          # Unique identifier for a webhook.
          id,
          request_options: {}
        )
        end

        # Retrieves the webhook identified by `id`.
        sig do
          params(
            id: String,
            request_options: Imagekitio::RequestOptions::OrHash
          ).returns(Imagekitio::Accounts::Webhook)
        end
        def get(
          # Unique identifier for a webhook.
          id,
          request_options: {}
        )
        end

        # @api private
        sig { params(client: Imagekitio::Client).returns(T.attached_class) }
        def self.new(client:)
        end
      end
    end
  end
end
