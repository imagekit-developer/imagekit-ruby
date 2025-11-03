# typed: strong

module Imagekitio
  module Resources
    class Webhooks
      sig do
        params(payload: String).returns(
          T.any(
            Imagekitio::VideoTransformationAcceptedEvent,
            Imagekitio::VideoTransformationReadyEvent,
            Imagekitio::VideoTransformationErrorEvent,
            Imagekitio::UploadPreTransformSuccessEvent,
            Imagekitio::UploadPreTransformErrorEvent,
            Imagekitio::UploadPostTransformSuccessEvent,
            Imagekitio::UploadPostTransformErrorEvent
          )
        )
      end
      def unsafe_unwrap(
        # The raw webhook payload as a string
        payload
      )
      end

      sig do
        params(payload: String).returns(
          T.any(
            Imagekitio::VideoTransformationAcceptedEvent,
            Imagekitio::VideoTransformationReadyEvent,
            Imagekitio::VideoTransformationErrorEvent,
            Imagekitio::UploadPreTransformSuccessEvent,
            Imagekitio::UploadPreTransformErrorEvent,
            Imagekitio::UploadPostTransformSuccessEvent,
            Imagekitio::UploadPostTransformErrorEvent
          )
        )
      end
      def unwrap(
        # The raw webhook payload as a string
        payload
      )
      end

      # @api private
      sig { params(client: Imagekitio::Client).returns(T.attached_class) }
      def self.new(client:)
      end
    end
  end
end
