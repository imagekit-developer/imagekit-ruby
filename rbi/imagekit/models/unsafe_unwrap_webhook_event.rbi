# typed: strong

module Imagekit
  module Models
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
