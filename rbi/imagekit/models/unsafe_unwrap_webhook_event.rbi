# typed: strong

module Imagekit
  module Models
    module UnsafeUnwrapWebhookEvent
      extend Imagekit::Internal::Type::Union

      Variants =
        T.type_alias do
          T.any(
            Imagekit::VideoTransformationAcceptedWebhookEvent,
            Imagekit::VideoTransformationReadyWebhookEvent,
            Imagekit::VideoTransformationErrorWebhookEvent
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
