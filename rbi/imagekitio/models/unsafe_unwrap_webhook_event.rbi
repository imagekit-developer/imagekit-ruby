# typed: strong

module Imagekitio
  module Models
    # Triggered when a new video transformation request is accepted for processing.
    # This event confirms that ImageKit has received and queued your transformation
    # request. Use this for debugging and tracking transformation lifecycle.
    module UnsafeUnwrapWebhookEvent
      extend Imagekitio::Internal::Type::Union

      Variants =
        T.type_alias do
          T.any(
            Imagekitio::VideoTransformationAcceptedEvent,
            Imagekitio::VideoTransformationReadyEvent,
            Imagekitio::VideoTransformationErrorEvent,
            Imagekitio::UploadPreTransformSuccessEvent,
            Imagekitio::UploadPreTransformErrorEvent,
            Imagekitio::UploadPostTransformSuccessEvent,
            Imagekitio::UploadPostTransformErrorEvent
          )
        end

      sig do
        override.returns(
          T::Array[Imagekitio::UnsafeUnwrapWebhookEvent::Variants]
        )
      end
      def self.variants
      end
    end
  end
end
