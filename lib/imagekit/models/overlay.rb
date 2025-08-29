# frozen_string_literal: true

module Imagekit
  module Models
    # Specifies an overlay to be applied on the parent image or video. ImageKit
    # supports overlays including images, text, videos, subtitles, and solid colors.
    module Overlay
      extend Imagekit::Internal::Type::Union

      discriminator :type

      variant :text, -> { Imagekit::TextOverlay }

      variant :image, -> { Imagekit::ImageOverlay }

      variant :video, -> { Imagekit::VideoOverlay }

      variant :subtitle, -> { Imagekit::SubtitleOverlay }

      variant :solidColor, -> { Imagekit::SolidColorOverlay }

      # @!method self.variants
      #   @return [Array(Imagekit::Models::TextOverlay, Imagekit::Models::ImageOverlay, Imagekit::Models::VideoOverlay, Imagekit::Models::SubtitleOverlay, Imagekit::Models::SolidColorOverlay)]
    end
  end
end
