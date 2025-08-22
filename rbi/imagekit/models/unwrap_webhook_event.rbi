# typed: strong

module Imagekit
  module Models
    module UnwrapWebhookEvent
      extend Imagekit::Internal::Type::Union

      Variants =
        T.type_alias do
          T.any(
            Imagekit::VideoTransformationAcceptedWebhookEvent,
            Imagekit::VideoTransformationReadyWebhookEvent,
            Imagekit::VideoTransformationErrorWebhookEvent
          )
        end

      sig { override.returns(T::Array[Imagekit::UnwrapWebhookEvent::Variants]) }
      def self.variants
      end
    end
  end
end
