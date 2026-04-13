# frozen_string_literal: true

module Imagekitio
  module Resources
    class Webhooks
      # @param payload [String] The raw webhook payload as a string
      #
      # @return [Imagekitio::Models::VideoTransformationAcceptedEvent, Imagekitio::Models::VideoTransformationReadyEvent, Imagekitio::Models::VideoTransformationErrorEvent, Imagekitio::Models::UploadPreTransformSuccessEvent, Imagekitio::Models::UploadPreTransformErrorEvent, Imagekitio::Models::UploadPostTransformSuccessEvent, Imagekitio::Models::UploadPostTransformErrorEvent, Imagekitio::Models::FileCreateEvent, Imagekitio::Models::FileUpdateEvent, Imagekitio::Models::FileDeleteEvent, Imagekitio::Models::FileVersionCreateEvent, Imagekitio::Models::FileVersionDeleteEvent]
      def unsafe_unwrap(payload)
        parsed = JSON.parse(payload, symbolize_names: true)
        Imagekitio::Internal::Type::Converter.coerce(Imagekitio::Models::UnsafeUnwrapWebhookEvent, parsed)
      end

      # @param payload [String] The raw webhook payload as a string
      #
      # @param headers [Hash{String=>String}] The raw HTTP headers that came with the payload
      #
      # @param key [String, nil] The webhook signing key
      #
      # @return [Imagekitio::Models::VideoTransformationAcceptedEvent, Imagekitio::Models::VideoTransformationReadyEvent, Imagekitio::Models::VideoTransformationErrorEvent, Imagekitio::Models::UploadPreTransformSuccessEvent, Imagekitio::Models::UploadPreTransformErrorEvent, Imagekitio::Models::UploadPostTransformSuccessEvent, Imagekitio::Models::UploadPostTransformErrorEvent, Imagekitio::Models::FileCreateEvent, Imagekitio::Models::FileUpdateEvent, Imagekitio::Models::FileDeleteEvent, Imagekitio::Models::FileVersionCreateEvent, Imagekitio::Models::FileVersionDeleteEvent]
      def unwrap(payload, headers:, key: @client.webhook_secret)
        if key.nil?
          raise ArgumentError.new("Cannot verify a webhook without a key on either the client's webhook_secret or passed in as an argument")
        end

        encoded_key = Base64.strict_encode64(key)
        ::StandardWebhooks::Webhook.new(encoded_key).verify(payload, headers)

        parsed = JSON.parse(payload, symbolize_names: true)
        Imagekitio::Internal::Type::Converter.coerce(Imagekitio::Models::UnwrapWebhookEvent, parsed)
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
