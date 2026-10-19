# frozen_string_literal: true

module Imagekitio
  module Models
    module Accounts
      # @see Imagekitio::Resources::Accounts::Webhooks#update
      class WebhookUpdateParams < Imagekitio::Internal::Type::BaseModel
        extend Imagekitio::Internal::Type::RequestParameters::Converter
        include Imagekitio::Internal::Type::RequestParameters

        # @!attribute id
        #   Unique identifier for a webhook.
        #
        #   @return [String]
        required :id, String

        # @!attribute enabled
        #   Whether the webhook is enabled. Omit to leave the current value unchanged.
        #
        #   @return [Boolean, nil]
        optional :enabled, Imagekitio::Internal::Type::Boolean

        # @!attribute endpoint
        #   The URL where ImageKit sends webhook events as `POST` requests. Must use the
        #   `http` or `https` protocol, and must be unique across all webhooks for your
        #   account.
        #
        #   @return [String, nil]
        optional :endpoint, String

        # @!attribute events
        #   The event types this webhook is subscribed to. Replaces the existing list. Omit
        #   to leave the current value unchanged.
        #
        #   @return [Array<Symbol, Imagekitio::Models::Accounts::WebhookEventType>, nil]
        optional :events, -> { Imagekitio::Internal::Type::ArrayOf[enum: Imagekitio::Accounts::WebhookEventType] }

        # @!method initialize(id:, enabled: nil, endpoint: nil, events: nil, request_options: {})
        #   Some parameter documentations has been truncated, see
        #   {Imagekitio::Models::Accounts::WebhookUpdateParams} for more details.
        #
        #   @param id [String] Unique identifier for a webhook.
        #
        #   @param enabled [Boolean] Whether the webhook is enabled. Omit to leave the current value unchanged.
        #
        #   @param endpoint [String] The URL where ImageKit sends webhook events as `POST` requests. Must use the `ht
        #
        #   @param events [Array<Symbol, Imagekitio::Models::Accounts::WebhookEventType>] The event types this webhook is subscribed to. Replaces the existing list. Omit
        #
        #   @param request_options [Imagekitio::RequestOptions, Hash{Symbol=>Object}]
      end
    end
  end
end
