# frozen_string_literal: true

module Imagekit
  module Models
    module UnsafeUnwrapWebhookEvent
      extend Imagekit::Internal::Type::Union

      variant -> { Imagekit::VideoTransformationAcceptedEvent }

      variant -> { Imagekit::VideoTransformationReadyEvent }

      variant -> { Imagekit::VideoTransformationErrorEvent }

      variant -> { Imagekit::UploadPreTransformSuccessEvent }

      variant -> { Imagekit::UploadPreTransformErrorEvent }

      variant -> { Imagekit::UploadPostTransformSuccessEvent }

      variant -> { Imagekit::UploadPostTransformErrorEvent }

      # @!method self.variants
      #   @return [Array(Imagekit::Models::VideoTransformationAcceptedEvent, Imagekit::Models::VideoTransformationReadyEvent, Imagekit::Models::VideoTransformationErrorEvent, Imagekit::Models::UploadPreTransformSuccessEvent, Imagekit::Models::UploadPreTransformErrorEvent, Imagekit::Models::UploadPostTransformSuccessEvent, Imagekit::Models::UploadPostTransformErrorEvent)]
    end
  end
end
