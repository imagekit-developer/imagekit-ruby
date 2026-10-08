# frozen_string_literal: true

module Imagekitio
  module Models
    module Accounts
      # @see Imagekitio::Resources::Accounts::Webhooks#create
      class WebhookCreateParams < Imagekitio::Internal::Type::BaseModel
        extend Imagekitio::Internal::Type::RequestParameters::Converter
        include Imagekitio::Internal::Type::RequestParameters

        # @!attribute endpoint
        #   The URL where ImageKit sends webhook events as `POST` requests. Must use the
        #   `http` or `https` protocol, and must be unique across all webhooks for your
        #   account.
        #
        #   @return [String]
        required :endpoint, String

        # @!attribute events
        #   The event types this webhook is subscribed to. ImageKit sends a request to the
        #   `endpoint` only for these events.
        #
        #   @return [Array<Symbol, Imagekitio::Models::Accounts::WebhookEventType>]
        required :events, -> { Imagekitio::Internal::Type::ArrayOf[enum: Imagekitio::Accounts::WebhookEventType] }

        # @!attribute enabled
        #   Whether the webhook is enabled. When `false`, ImageKit doesn't send any events
        #   to the `endpoint`.
        #
        #   @return [Boolean, nil]
        optional :enabled, Imagekitio::Internal::Type::Boolean

        # @!method initialize(endpoint:, events:, enabled: nil, request_options: {})
        #   Some parameter documentations has been truncated, see
        #   {Imagekitio::Models::Accounts::WebhookCreateParams} for more details.
        #
        #   @param endpoint [String] The URL where ImageKit sends webhook events as `POST` requests. Must use the `ht
        #
        #   @param events [Array<Symbol, Imagekitio::Models::Accounts::WebhookEventType>] The event types this webhook is subscribed to. ImageKit sends a request to the `
        #
        #   @param enabled [Boolean] Whether the webhook is enabled. When `false`, ImageKit doesn't send any events t
        #
        #   @param request_options [Imagekitio::RequestOptions, Hash{Symbol=>Object}]
      end
    end
  end
end
