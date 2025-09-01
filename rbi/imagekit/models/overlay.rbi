# typed: strong

module Imagekit
  module Models
    # Specifies an overlay to be applied on the parent image or video. ImageKit
    # supports overlays including images, text, videos, subtitles, and solid colors.
    # See
    # [Overlay using layers](https://imagekit.io/docs/transformations#overlay-using-layers).
    module Overlay
      extend Imagekit::Internal::Type::Union

      Variants =
        T.type_alias do
          T.any(
            Imagekit::TextOverlay,
            Imagekit::ImageOverlay,
            Imagekit::VideoOverlay,
            Imagekit::SubtitleOverlay,
            Imagekit::SolidColorOverlay
          )
        end

      sig { override.returns(T::Array[Imagekit::Overlay::Variants]) }
      def self.variants
      end
    end
  end
end
