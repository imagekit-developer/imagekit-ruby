# typed: strong

module Imagekit
  module Models
    module UnwrapWebhookEvent
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

      sig { override.returns(T::Array[Imagekit::UnwrapWebhookEvent::Variants]) }
      def self.variants
      end
    end
  end
end
