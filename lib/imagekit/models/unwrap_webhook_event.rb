# frozen_string_literal: true

module Imagekit
  module Models
    module UnwrapWebhookEvent
      extend Imagekit::Internal::Type::Union

      variant -> { Imagekit::VideoTransformationAcceptedEvent }

      variant -> { Imagekit::VideoTransformationReadyEvent }

      variant -> { Imagekit::VideoTransformationErrorEvent }

      # @!method self.variants
      #   @return [Array(Imagekit::Models::VideoTransformationAcceptedEvent, Imagekit::Models::VideoTransformationReadyEvent, Imagekit::Models::VideoTransformationErrorEvent)]
    end
  end
end
