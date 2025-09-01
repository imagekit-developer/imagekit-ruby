# typed: strong

module Imagekit
  module Models
    # Triggered when a new video transformation request is accepted for processing.
    # This event confirms that ImageKit has received and queued your transformation
    # request. Use this for debugging and tracking transformation lifecycle.
    module UnsafeUnwrapWebhookEvent
      extend Imagekit::Internal::Type::Union

      Variants =
        T.type_alias do
          T.any(
            Imagekit::VideoTransformationAcceptedEvent,
            Imagekit::VideoTransformationReadyEvent,
            Imagekit::VideoTransformationErrorEvent,
            Imagekit::UploadPreTransformSuccessEvent,
            Imagekit::UploadPreTransformErrorEvent,
            Imagekit::UploadPostTransformSuccessEvent,
            Imagekit::UploadPostTransformErrorEvent
          )
        end

      sig do
        override.returns(T::Array[Imagekit::UnsafeUnwrapWebhookEvent::Variants])
      end
      def self.variants
      end
    end
  end
end
