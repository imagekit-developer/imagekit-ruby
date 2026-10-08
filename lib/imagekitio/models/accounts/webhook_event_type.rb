# frozen_string_literal: true

module Imagekitio
  module Models
    module Accounts
      # A webhook event type. Learn more about the payload of each
      # [webhook event](https://imagekit.io/docs/webhooks#list-of-events).
      module WebhookEventType
        extend Imagekitio::Internal::Type::Enum

        VIDEO_TRANSFORMATION_ACCEPTED = :"video.transformation.accepted"
        VIDEO_TRANSFORMATION_READY = :"video.transformation.ready"
        VIDEO_TRANSFORMATION_ERROR = :"video.transformation.error"
        UPLOAD_PRE_TRANSFORM_SUCCESS = :"upload.pre-transform.success"
        UPLOAD_PRE_TRANSFORM_ERROR = :"upload.pre-transform.error"
        UPLOAD_POST_TRANSFORM_SUCCESS = :"upload.post-transform.success"
        UPLOAD_POST_TRANSFORM_ERROR = :"upload.post-transform.error"
        FILE_CREATED = :"file.created"
        FILE_UPDATED = :"file.updated"
        FILE_DELETED = :"file.deleted"
        FILE_VERSION_CREATED = :"file-version.created"
        FILE_VERSION_DELETED = :"file-version.deleted"

        # @!method self.values
        #   @return [Array<Symbol>]
      end
    end
  end
end
