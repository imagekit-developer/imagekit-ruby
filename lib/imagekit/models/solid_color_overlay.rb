# frozen_string_literal: true

module Imagekit
  module Models
    class SolidColorOverlay < Imagekit::Models::BaseOverlay
      # @!attribute color
      #   Specifies the color of the block using an RGB hex code (e.g., `FF0000`), an RGBA
      #   code (e.g., `FFAABB50`), or a color name (e.g., `red`). If an 8-character value
      #   is provided, the last two characters represent the opacity level (from `00` for
      #   0.00 to `99` for 0.99).
      #
      #   @return [String]
      required :color, String

      # @!attribute type
      #
      #   @return [Symbol, :solidColor]
      required :type, const: :solidColor

      # @!attribute transformation
      #   Control width and height of the solid color overlay. Supported transformations
      #   depend on the base/parent asset. See overlays on
      #   [Images](https://imagekit.io/docs/add-overlays-on-images#apply-transformation-on-solid-color-overlay)
      #   and
      #   [Videos](https://imagekit.io/docs/add-overlays-on-videos#apply-transformations-on-solid-color-block-overlay).
      #
      #   @return [Array<Imagekit::Models::SolidColorOverlayTransformation>, nil]
      optional :transformation,
               -> { Imagekit::Internal::Type::ArrayOf[Imagekit::SolidColorOverlayTransformation] }

      # @!method initialize(color:, transformation: nil, type: :solidColor)
      #   Some parameter documentations has been truncated, see
      #   {Imagekit::Models::SolidColorOverlay} for more details.
      #
      #   @param color [String] Specifies the color of the block using an RGB hex code (e.g., `FF0000`), an RGBA
      #
      #   @param transformation [Array<Imagekit::Models::SolidColorOverlayTransformation>] Control width and height of the solid color overlay. Supported transformations d
      #
      #   @param type [Symbol, :solidColor]
    end
  end
end
