# typed: strong

module Imagekitio
  module Models
    module Accounts
      # A webhook event type. Learn more about the payload of each
      # [webhook event](https://imagekit.io/docs/webhooks#list-of-events).
      module WebhookEventType
        extend Imagekitio::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias { T.all(Symbol, Imagekitio::Accounts::WebhookEventType) }
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        VIDEO_TRANSFORMATION_ACCEPTED =
          T.let(
            :"video.transformation.accepted",
            Imagekitio::Accounts::WebhookEventType::TaggedSymbol
          )
        VIDEO_TRANSFORMATION_READY =
          T.let(
            :"video.transformation.ready",
            Imagekitio::Accounts::WebhookEventType::TaggedSymbol
          )
        VIDEO_TRANSFORMATION_ERROR =
          T.let(
            :"video.transformation.error",
            Imagekitio::Accounts::WebhookEventType::TaggedSymbol
          )
        UPLOAD_PRE_TRANSFORM_SUCCESS =
          T.let(
            :"upload.pre-transform.success",
            Imagekitio::Accounts::WebhookEventType::TaggedSymbol
          )
        UPLOAD_PRE_TRANSFORM_ERROR =
          T.let(
            :"upload.pre-transform.error",
            Imagekitio::Accounts::WebhookEventType::TaggedSymbol
          )
        UPLOAD_POST_TRANSFORM_SUCCESS =
          T.let(
            :"upload.post-transform.success",
            Imagekitio::Accounts::WebhookEventType::TaggedSymbol
          )
        UPLOAD_POST_TRANSFORM_ERROR =
          T.let(
            :"upload.post-transform.error",
            Imagekitio::Accounts::WebhookEventType::TaggedSymbol
          )
        FILE_CREATED =
          T.let(
            :"file.created",
            Imagekitio::Accounts::WebhookEventType::TaggedSymbol
          )
        FILE_UPDATED =
          T.let(
            :"file.updated",
            Imagekitio::Accounts::WebhookEventType::TaggedSymbol
          )
        FILE_DELETED =
          T.let(
            :"file.deleted",
            Imagekitio::Accounts::WebhookEventType::TaggedSymbol
          )
        FILE_VERSION_CREATED =
          T.let(
            :"file-version.created",
            Imagekitio::Accounts::WebhookEventType::TaggedSymbol
          )
        FILE_VERSION_DELETED =
          T.let(
            :"file-version.deleted",
            Imagekitio::Accounts::WebhookEventType::TaggedSymbol
          )

        sig do
          override.returns(
            T::Array[Imagekitio::Accounts::WebhookEventType::TaggedSymbol]
          )
        end
        def self.values
        end
      end
    end
  end
end
