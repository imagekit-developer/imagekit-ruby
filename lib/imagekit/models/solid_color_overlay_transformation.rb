# frozen_string_literal: true

module Imagekit
  module Models
    class SolidColorOverlayTransformation < Imagekit::Internal::Type::BaseModel
      # @!attribute alpha
      #   Specifies the transparency level of the solid color overlay. Accepts integers
      #   from `1` to `9`.
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
      optional :gradient, union: -> { Imagekit::SolidColorOverlayTransformation::Gradient }

      # @!attribute height
      #   Controls the height of the solid color overlay. Accepts a numeric value or an
      #   arithmetic expression. Learn about
      #   [arithmetic expressions](https://imagekit.io/docs/arithmetic-expressions-in-transformations).
      #
      #   @return [Float, String, nil]
      optional :height, union: -> { Imagekit::SolidColorOverlayTransformation::Height }

      # @!attribute radius
      #   Specifies the corner radius of the solid color overlay. Set to `max` for
      #   circular or oval shape. See
      #   [radius](https://imagekit.io/docs/effects-and-enhancements#radius---r).
      #
      #   @return [Float, Symbol, :max, nil]
      optional :radius, union: -> { Imagekit::SolidColorOverlayTransformation::Radius }

      # @!attribute width
      #   Controls the width of the solid color overlay. Accepts a numeric value or an
      #   arithmetic expression (e.g., `bw_mul_0.2` or `bh_div_2`). Learn about
      #   [arithmetic expressions](https://imagekit.io/docs/arithmetic-expressions-in-transformations).
      #
      #   @return [Float, String, nil]
      optional :width, union: -> { Imagekit::SolidColorOverlayTransformation::Width }

      # @!method initialize(alpha: nil, background: nil, gradient: nil, height: nil, radius: nil, width: nil)
      #   Some parameter documentations has been truncated, see
      #   {Imagekit::Models::SolidColorOverlayTransformation} for more details.
      #
      #   @param alpha [Float] Specifies the transparency level of the solid color overlay. Accepts integers fr
      #
      #   @param background [String] Specifies the background color of the solid color overlay. Accepts an RGB hex co
      #
      #   @param gradient [Boolean, true, String] Creates a linear gradient with two colors. Pass `true` for a default gradient, o
      #
      #   @param height [Float, String] Controls the height of the solid color overlay. Accepts a numeric value or an ar
      #
      #   @param radius [Float, Symbol, :max] Specifies the corner radius of the solid color overlay. Set to `max` for circula
      #
      #   @param width [Float, String] Controls the width of the solid color overlay. Accepts a numeric value or an ari

      # Creates a linear gradient with two colors. Pass `true` for a default gradient,
      # or provide a string for a custom gradient. Only works if the base asset is an
      # image. See
      # [gradient](https://imagekit.io/docs/effects-and-enhancements#gradient---e-gradient).
      #
      # @see Imagekit::Models::SolidColorOverlayTransformation#gradient
      module Gradient
        extend Imagekit::Internal::Type::Union

        variant const: true

        variant String

        # @!method self.variants
        #   @return [Array(Boolean, true, String)]
      end

      # Controls the height of the solid color overlay. Accepts a numeric value or an
      # arithmetic expression. Learn about
      # [arithmetic expressions](https://imagekit.io/docs/arithmetic-expressions-in-transformations).
      #
      # @see Imagekit::Models::SolidColorOverlayTransformation#height
      module Height
        extend Imagekit::Internal::Type::Union

        variant Float

        variant String

        # @!method self.variants
        #   @return [Array(Float, String)]
      end

      # Specifies the corner radius of the solid color overlay. Set to `max` for
      # circular or oval shape. See
      # [radius](https://imagekit.io/docs/effects-and-enhancements#radius---r).
      #
      # @see Imagekit::Models::SolidColorOverlayTransformation#radius
      module Radius
        extend Imagekit::Internal::Type::Union

        variant Float

        variant const: :max

        # @!method self.variants
        #   @return [Array(Float, Symbol, :max)]
      end

      # Controls the width of the solid color overlay. Accepts a numeric value or an
      # arithmetic expression (e.g., `bw_mul_0.2` or `bh_div_2`). Learn about
      # [arithmetic expressions](https://imagekit.io/docs/arithmetic-expressions-in-transformations).
      #
      # @see Imagekit::Models::SolidColorOverlayTransformation#width
      module Width
        extend Imagekit::Internal::Type::Union

        variant Float

        variant String

        # @!method self.variants
        #   @return [Array(Float, String)]
      end
    end
  end
end
