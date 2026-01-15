# frozen_string_literal: true

module Imagekitio
  module Models
    class SolidColorOverlayTransformation < Imagekitio::Internal::Type::BaseModel
      # @!attribute alpha
      #   Specifies the transparency level of the overlaid solid color layer. Supports
      #   integers from `1` to `9`.
      #
      #   @return [Float, nil]
      optional :alpha, Float

      # @!attribute background
      #   Specifies the background color of the solid color overlay. Accepts an RGB hex
      #   code (e.g., `FF0000`), an RGBA code (e.g., `FFAABB50`), or a color name.
      #
      #   @return [String, nil]
      optional :background, String

      # @!attribute gradient
      #   Creates a linear gradient with two colors. Pass `true` for a default gradient,
      #   or provide a string for a custom gradient. Only works if the base asset is an
      #   image. See
      #   [gradient](https://imagekit.io/docs/effects-and-enhancements#gradient---e-gradient).
      #
      #   @return [Boolean, true, String, nil]
      optional :gradient, union: -> { Imagekitio::SolidColorOverlayTransformation::Gradient }

      # @!attribute height
      #   Controls the height of the solid color overlay. Accepts a numeric value or an
      #   arithmetic expression. Learn about
      #   [arithmetic expressions](https://imagekit.io/docs/arithmetic-expressions-in-transformations).
      #
      #   @return [Float, String, nil]
      optional :height, union: -> { Imagekitio::SolidColorOverlayTransformation::Height }

      # @!attribute radius
      #   Specifies the corner radius of the solid color overlay.
      #
      #   - Single value (positive integer): Applied to all corners (e.g., `20`).
      #   - `max`: Creates a circular or oval shape.
      #   - Per-corner array: Provide four underscore-separated values representing
      #     top-left, top-right, bottom-right, and bottom-left corners respectively (e.g.,
      #     `10_20_30_40`). See
      #     [Radius](https://imagekit.io/docs/effects-and-enhancements#radius---r).
      #
      #   @return [Float, Symbol, :max, String, nil]
      optional :radius, union: -> { Imagekitio::SolidColorOverlayTransformation::Radius }

      # @!attribute width
      #   Controls the width of the solid color overlay. Accepts a numeric value or an
      #   arithmetic expression (e.g., `bw_mul_0.2` or `bh_div_2`). Learn about
      #   [arithmetic expressions](https://imagekit.io/docs/arithmetic-expressions-in-transformations).
      #
      #   @return [Float, String, nil]
      optional :width, union: -> { Imagekitio::SolidColorOverlayTransformation::Width }

      # @!method initialize(alpha: nil, background: nil, gradient: nil, height: nil, radius: nil, width: nil)
      #   Some parameter documentations has been truncated, see
      #   {Imagekitio::Models::SolidColorOverlayTransformation} for more details.
      #
      #   @param alpha [Float] Specifies the transparency level of the overlaid solid color layer. Supports int
      #
      #   @param background [String] Specifies the background color of the solid color overlay. Accepts an RGB hex co
      #
      #   @param gradient [Boolean, true, String] Creates a linear gradient with two colors. Pass `true` for a default gradient, o
      #
      #   @param height [Float, String] Controls the height of the solid color overlay. Accepts a numeric value or an ar
      #
      #   @param radius [Float, Symbol, :max, String] Specifies the corner radius of the solid color overlay.
      #
      #   @param width [Float, String] Controls the width of the solid color overlay. Accepts a numeric value or an ari

      # Creates a linear gradient with two colors. Pass `true` for a default gradient,
      # or provide a string for a custom gradient. Only works if the base asset is an
      # image. See
      # [gradient](https://imagekit.io/docs/effects-and-enhancements#gradient---e-gradient).
      #
      # @see Imagekitio::Models::SolidColorOverlayTransformation#gradient
      module Gradient
        extend Imagekitio::Internal::Type::Union

        variant const: true

        variant String

        # @!method self.variants
        #   @return [Array(Boolean, true, String)]
      end

      # Controls the height of the solid color overlay. Accepts a numeric value or an
      # arithmetic expression. Learn about
      # [arithmetic expressions](https://imagekit.io/docs/arithmetic-expressions-in-transformations).
      #
      # @see Imagekitio::Models::SolidColorOverlayTransformation#height
      module Height
        extend Imagekitio::Internal::Type::Union

        variant Float

        variant String

        # @!method self.variants
        #   @return [Array(Float, String)]
      end

      # Specifies the corner radius of the solid color overlay.
      #
      # - Single value (positive integer): Applied to all corners (e.g., `20`).
      # - `max`: Creates a circular or oval shape.
      # - Per-corner array: Provide four underscore-separated values representing
      #   top-left, top-right, bottom-right, and bottom-left corners respectively (e.g.,
      #   `10_20_30_40`). See
      #   [Radius](https://imagekit.io/docs/effects-and-enhancements#radius---r).
      #
      # @see Imagekitio::Models::SolidColorOverlayTransformation#radius
      module Radius
        extend Imagekitio::Internal::Type::Union

        variant Float

        variant const: :max

        variant String

        # @!method self.variants
        #   @return [Array(Float, Symbol, :max, String)]
      end

      # Controls the width of the solid color overlay. Accepts a numeric value or an
      # arithmetic expression (e.g., `bw_mul_0.2` or `bh_div_2`). Learn about
      # [arithmetic expressions](https://imagekit.io/docs/arithmetic-expressions-in-transformations).
      #
      # @see Imagekitio::Models::SolidColorOverlayTransformation#width
      module Width
        extend Imagekitio::Internal::Type::Union

        variant Float

        variant String

        # @!method self.variants
        #   @return [Array(Float, String)]
      end
    end
  end
end
