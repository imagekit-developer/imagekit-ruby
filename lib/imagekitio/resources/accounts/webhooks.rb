# frozen_string_literal: true

module Imagekitio
  module Resources
    class Accounts
      class Webhooks
        # Some parameter documentations has been truncated, see
        # {Imagekitio::Models::Accounts::WebhookCreateParams} for more details.
        #
        # Creates a new webhook and returns the created object, including the generated
        # signing `secret`.
        #
        # ImageKit sends a `POST` request to the webhook `endpoint` whenever one of the
        # subscribed `events` occurs. Use the `secret` to verify the signature of each
        # request. Learn more about [webhooks](https://imagekit.io/docs/webhooks).
        #
        # You can create up to 3 webhooks per account.
        #
        # @overload create(endpoint:, events:, enabled: nil, request_options: {})
        #
        # @param endpoint [String] The URL where ImageKit sends webhook events as `POST` requests. Must use the `ht
        #
        # @param events [Array<Symbol, Imagekitio::Models::Accounts::WebhookEventType>] The event types this webhook is subscribed to. ImageKit sends a request to the `
        #
        # @param enabled [Boolean] Whether the webhook is enabled. When `false`, ImageKit doesn't send any events t
        #
        # @param request_options [Imagekitio::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [Imagekitio::Models::Accounts::Webhook]
        #
        # @see Imagekitio::Models::Accounts::WebhookCreateParams
        def create(params)
          parsed, options = Imagekitio::Accounts::WebhookCreateParams.dump_request(params)
          @client.request(
            method: :post,
            path: "v1/accounts/webhooks",
            body: parsed,
            model: Imagekitio::Accounts::Webhook,
            options: options
          )
        end

        # Some parameter documentations has been truncated, see
        # {Imagekitio::Models::Accounts::WebhookUpdateParams} for more details.
        #
        # Updates the webhook identified by `id` and returns the updated object. Only the
        # fields included in the request body are changed.
        #
        # When `events` is provided, it replaces the existing list of subscribed events.
        # The signing `secret` can't be changed.
        #
        # @overload update(id, enabled: nil, endpoint: nil, events: nil, request_options: {})
        #
        # @param id [String] Unique identifier for a webhook.
        #
        # @param enabled [Boolean] Whether the webhook is enabled. Omit to leave the current value unchanged.
        #
        # @param endpoint [String] The URL where ImageKit sends webhook events as `POST` requests. Must use the `ht
        #
        # @param events [Array<Symbol, Imagekitio::Models::Accounts::WebhookEventType>] The event types this webhook is subscribed to. Replaces the existing list. Omit
        #
        # @param request_options [Imagekitio::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [Imagekitio::Models::Accounts::Webhook]
        #
        # @see Imagekitio::Models::Accounts::WebhookUpdateParams
        def update(id, params = {})
          parsed, options = Imagekitio::Accounts::WebhookUpdateParams.dump_request(params)
          @client.request(
            method: :patch,
            path: ["v1/accounts/webhooks/%1$s", id],
            body: parsed,
            model: Imagekitio::Accounts::Webhook,
            options: options
          )
        end

        # Returns an array of all webhooks configured for your account.
        #
        # @overload list(request_options: {})
        #
        # @param request_options [Imagekitio::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [Array<Imagekitio::Models::Accounts::Webhook>]
        #
        # @see Imagekitio::Models::Accounts::WebhookListParams
        def list(params = {})
          @client.request(
            method: :get,
            path: "v1/accounts/webhooks",
            model: Imagekitio::Internal::Type::ArrayOf[Imagekitio::Accounts::Webhook],
            options: params[:request_options]
          )
        end

        # Permanently deletes the webhook identified by `id`. ImageKit stops sending
        # events to its endpoint.
        #
        # @overload delete(id, request_options: {})
        #
        # @param id [String] Unique identifier for a webhook.
        #
        # @param request_options [Imagekitio::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [nil]
        #
        # @see Imagekitio::Models::Accounts::WebhookDeleteParams
        def delete(id, params = {})
          @client.request(
            method: :delete,
            path: ["v1/accounts/webhooks/%1$s", id],
            model: NilClass,
            options: params[:request_options]
          )
        end

        # Retrieves the webhook identified by `id`.
        #
        # @overload get(id, request_options: {})
        #
        # @param id [String] Unique identifier for a webhook.
        #
        # @param request_options [Imagekitio::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [Imagekitio::Models::Accounts::Webhook]
        #
        # @see Imagekitio::Models::Accounts::WebhookGetParams
        def get(id, params = {})
          @client.request(
            method: :get,
            path: ["v1/accounts/webhooks/%1$s", id],
            model: Imagekitio::Accounts::Webhook,
            options: params[:request_options]
          )
        end

        # @api private
        #
        # @param client [Imagekitio::Client]
        def initialize(client:)
          @client = client
        end
      end
    end
  end
end
