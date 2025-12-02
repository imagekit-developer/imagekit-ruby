# frozen_string_literal: true

module Imagekitio
  module Models
    # Triggered when a new video transformation request is accepted for processing.
    # This event confirms that ImageKit has received and queued your transformation
    # request. Use this for debugging and tracking transformation lifecycle.
    module UnwrapWebhookEvent
      extend Imagekitio::Internal::Type::Union

      discriminator :type

      # Triggered when a new video transformation request is accepted for processing. This event confirms that ImageKit has received and queued your transformation request. Use this for debugging and tracking transformation lifecycle.
      variant -> { Imagekitio::VideoTransformationAcceptedEvent }

      # Triggered when video encoding is finished and the transformed resource is ready to be served. This is the key event to listen for - update your database or CMS flags when you receive this so your application can start showing the transformed video to users.
      variant -> { Imagekitio::VideoTransformationReadyEvent }

      # Triggered when an error occurs during video encoding. Listen to this webhook to log error reasons and debug issues. Check your origin and URL endpoint settings if the reason is related to download failure. For other errors, contact ImageKit support.
      variant -> { Imagekitio::VideoTransformationErrorEvent }

      # Triggered when a pre-transformation completes successfully. The file has been processed with the requested transformation and is now available in the Media Library.
      variant -> { Imagekitio::UploadPreTransformSuccessEvent }

      # Triggered when a pre-transformation fails. The file upload may have been accepted, but the requested transformation could not be applied.
      variant -> { Imagekitio::UploadPreTransformErrorEvent }

      # Triggered when a post-transformation completes successfully. The transformed version of the file is now ready and can be accessed via the provided URL. Note that each post-transformation generates a separate webhook event.
      variant -> { Imagekitio::UploadPostTransformSuccessEvent }

      # Triggered when a post-transformation fails. The original file remains available, but the requested transformation could not be generated.
      variant -> { Imagekitio::UploadPostTransformErrorEvent }

      # @!method self.variants
      #   @return [Array(Imagekitio::Models::VideoTransformationAcceptedEvent, Imagekitio::Models::VideoTransformationReadyEvent, Imagekitio::Models::VideoTransformationErrorEvent, Imagekitio::Models::UploadPreTransformSuccessEvent, Imagekitio::Models::UploadPreTransformErrorEvent, Imagekitio::Models::UploadPostTransformSuccessEvent, Imagekitio::Models::UploadPostTransformErrorEvent)]
    end
  end
end
