# frozen_string_literal: true

module Imagekit
  module Models
    module UnwrapWebhookEvent
      extend Imagekit::Internal::Type::Union

      variant -> { Imagekit::VideoTransformationAcceptedWebhookEvent }

      variant -> { Imagekit::VideoTransformationReadyWebhookEvent }

      variant -> { Imagekit::VideoTransformationErrorWebhookEvent }

      # @!method self.variants
      #   @return [Array(Imagekit::Models::VideoTransformationAcceptedWebhookEvent, Imagekit::Models::VideoTransformationReadyWebhookEvent, Imagekit::Models::VideoTransformationErrorWebhookEvent)]
    end
  end
end
