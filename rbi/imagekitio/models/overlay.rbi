# typed: strong

module Imagekitio
  module Models
    # Specifies an overlay to be applied on the parent image or video. ImageKit
    # supports overlays including images, text, videos, subtitles, and solid colors.
    # See
    # [Overlay using layers](https://imagekit.io/docs/transformations#overlay-using-layers).
    module Overlay
      extend Imagekitio::Internal::Type::Union

      Variants =
        T.type_alias do
          T.any(
            Imagekitio::TextOverlay,
            Imagekitio::ImageOverlay,
            Imagekitio::VideoOverlay,
            Imagekitio::SubtitleOverlay,
            Imagekitio::SolidColorOverlay
          )
        end

      sig { override.returns(T::Array[Imagekitio::Overlay::Variants]) }
      def self.variants
      end
    end
  end
end
