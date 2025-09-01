# typed: strong

module Imagekit
  module Resources
    class Webhooks
      sig do
        params(payload: String).returns(
          T.any(
            Imagekit::VideoTransformationAcceptedEvent,
            Imagekit::VideoTransformationReadyEvent,
            Imagekit::VideoTransformationErrorEvent,
            Imagekit::UploadPreTransformSuccessEvent,
            Imagekit::UploadPreTransformErrorEvent,
            Imagekit::UploadPostTransformSuccessEvent,
            Imagekit::UploadPostTransformErrorEvent
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
            Imagekit::VideoTransformationAcceptedEvent,
            Imagekit::VideoTransformationReadyEvent,
            Imagekit::VideoTransformationErrorEvent,
            Imagekit::UploadPreTransformSuccessEvent,
            Imagekit::UploadPreTransformErrorEvent,
            Imagekit::UploadPostTransformSuccessEvent,
            Imagekit::UploadPostTransformErrorEvent
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
