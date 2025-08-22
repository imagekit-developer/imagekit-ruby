# frozen_string_literal: true

module Imagekit
  module Resources
    class Webhooks
      # @param payload [String] The raw webhook payload as a string
      #
      # @return [Imagekit::Models::VideoTransformationAcceptedWebhookEvent, Imagekit::Models::VideoTransformationReadyWebhookEvent, Imagekit::Models::VideoTransformationErrorWebhookEvent]
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
