# frozen_string_literal: true

module Imagekitio
  module Models
    # Specifies an overlay to be applied on the parent image or video. ImageKit
    # supports overlays including images, text, videos, subtitles, and solid colors.
    # See
    # [Overlay using layers](https://imagekit.io/docs/transformations#overlay-using-layers).
    module Overlay
      extend Imagekitio::Internal::Type::Union

      discriminator :type

      variant :text, -> { Imagekitio::TextOverlay }

      variant :image, -> { Imagekitio::ImageOverlay }

      variant :video, -> { Imagekitio::VideoOverlay }

      variant :subtitle, -> { Imagekitio::SubtitleOverlay }

      variant :solidColor, -> { Imagekitio::SolidColorOverlay }

      # @!method self.variants
      #   @return [Array(Imagekitio::Models::TextOverlay, Imagekitio::Models::ImageOverlay, Imagekitio::Models::VideoOverlay, Imagekitio::Models::SubtitleOverlay, Imagekitio::Models::SolidColorOverlay)]
    end
  end
end
