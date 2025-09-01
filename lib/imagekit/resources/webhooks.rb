# frozen_string_literal: true

module Imagekit
  module Resources
    class Webhooks
      # @param payload [String] The raw webhook payload as a string
      #
      # @return [Imagekit::Models::VideoTransformationAcceptedEvent, Imagekit::Models::VideoTransformationReadyEvent, Imagekit::Models::VideoTransformationErrorEvent, Imagekit::Models::UploadPreTransformSuccessEvent, Imagekit::Models::UploadPreTransformErrorEvent, Imagekit::Models::UploadPostTransformSuccessEvent, Imagekit::Models::UploadPostTransformErrorEvent]
      def unsafe_unwrap(payload)
        parsed = JSON.parse(payload, symbolize_names: true)
        Imagekit::Internal::Type::Converter.coerce(Imagekit::Models::UnsafeUnwrapWebhookEvent, parsed)
      end

      # @param payload [String] The raw webhook payload as a string
      #
      # @return [Imagekit::Models::VideoTransformationAcceptedEvent, Imagekit::Models::VideoTransformationReadyEvent, Imagekit::Models::VideoTransformationErrorEvent, Imagekit::Models::UploadPreTransformSuccessEvent, Imagekit::Models::UploadPreTransformErrorEvent, Imagekit::Models::UploadPostTransformSuccessEvent, Imagekit::Models::UploadPostTransformErrorEvent]
      def unwrap(payload)
        parsed = JSON.parse(payload, symbolize_names: true)
        Imagekit::Internal::Type::Converter.coerce(Imagekit::Models::UnwrapWebhookEvent, parsed)
      end

      # @api private
      #
      # @param client [Imagekit::Client]
      def initialize(client:)
        @client = client
      end
    end
  end
end
