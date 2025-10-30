# frozen_string_literal: true

module Imagekitio
  module Resources
    class Webhooks
      # @param payload [String] The raw webhook payload as a string
      #
      # @return [Imagekitio::Models::VideoTransformationAcceptedEvent, Imagekitio::Models::VideoTransformationReadyEvent, Imagekitio::Models::VideoTransformationErrorEvent, Imagekitio::Models::UploadPreTransformSuccessEvent, Imagekitio::Models::UploadPreTransformErrorEvent, Imagekitio::Models::UploadPostTransformSuccessEvent, Imagekitio::Models::UploadPostTransformErrorEvent]
      def unsafe_unwrap(payload)
        parsed = JSON.parse(payload, symbolize_names: true)
        Imagekitio::Internal::Type::Converter.coerce(Imagekitio::Models::UnsafeUnwrapWebhookEvent, parsed)
      end

      # @param payload [String] The raw webhook payload as a string
      #
      # @return [Imagekitio::Models::VideoTransformationAcceptedEvent, Imagekitio::Models::VideoTransformationReadyEvent, Imagekitio::Models::VideoTransformationErrorEvent, Imagekitio::Models::UploadPreTransformSuccessEvent, Imagekitio::Models::UploadPreTransformErrorEvent, Imagekitio::Models::UploadPostTransformSuccessEvent, Imagekitio::Models::UploadPostTransformErrorEvent]
      def unwrap(payload)
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
