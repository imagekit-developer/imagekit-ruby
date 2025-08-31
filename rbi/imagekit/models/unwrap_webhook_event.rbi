# typed: strong

module Imagekit
  module Models
    # Triggered when a new video transformation request is accepted for processing.
    # This event confirms that ImageKit has received and queued your transformation
    # request. Use this for debugging and tracking transformation lifecycle.
    module UnwrapWebhookEvent
      extend Imagekit::Internal::Type::Union

      Variants =
        T.type_alias do
          T.any(
            Imagekit::VideoTransformationAcceptedEvent,
            Imagekit::VideoTransformationReadyEvent,
            Imagekit::VideoTransformationErrorEvent,
            Imagekit::UploadPreTransformSuccessWebhookEvent,
            Imagekit::UploadPreTransformErrorWebhookEvent,
            Imagekit::UploadPostTransformSuccessWebhookEvent,
            Imagekit::UploadPostTransformErrorWebhookEvent
          )
        end

      sig { override.returns(T::Array[Imagekit::UnwrapWebhookEvent::Variants]) }
      def self.variants
      end
    end
  end
end
