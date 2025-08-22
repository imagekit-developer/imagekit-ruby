# typed: strong

module Imagekit
  module Resources
    class Webhooks
      sig do
        params(payload: String).returns(
          T.any(
            Imagekit::VideoTransformationAcceptedWebhookEvent,
            Imagekit::VideoTransformationReadyWebhookEvent,
            Imagekit::VideoTransformationErrorWebhookEvent
          )
        )
      end
      def unwrap(
        # The raw webhook payload as a string
        payload
      )
      end

      # @api private
      sig { params(client: Imagekit::Client).returns(T.attached_class) }
      def self.new(client:)
      end
    end
  end
end
