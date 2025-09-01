# frozen_string_literal: true

module Imagekit
  module Models
    class TextOverlayTransformation < Imagekit::Internal::Type::BaseModel
      # @!attribute alpha
      #   Specifies the transparency level of the text overlay. Accepts integers from `1`
      #   to `9`.
      #
      #   @return [Float, nil]
      optional :alpha, Float

      # @!attribute background
      #   Specifies the background color of the text overlay. Accepts an RGB hex code, an
      #   RGBA code, or a color name.
      #
      #   @return [String, nil]
      optional :background, String

      # @!attribute flip
      #   Flip the text overlay horizontally, vertically, or both.
      #
      #   @return [Symbol, Imagekit::Models::TextOverlayTransformation::Flip, nil]
      optional :flip, enum: -> { Imagekit::TextOverlayTransformation::Flip }

      # @!attribute font_color
      #   Specifies the font color of the overlaid text. Accepts an RGB hex code (e.g.,
      #   `FF0000`), an RGBA code (e.g., `FFAABB50`), or a color name.
      #
      #   @return [String, nil]
      optional :font_color, String, api_name: :fontColor

      # @!attribute font_family
      #   Specifies the font family of the overlaid text. Choose from the supported fonts
      #   list or use a custom font. See
      #   [Supported fonts](https://imagekit.io/docs/add-overlays-on-images#supported-text-font-list)
      #   and
      #   [Custom font](https://imagekit.io/docs/add-overlays-on-images#change-font-family-in-text-overlay).
      #
      #   @return [String, nil]
      optional :font_family, String, api_name: :fontFamily

      # @!attribute font_size
      #   Specifies the font size of the overlaid text. Accepts a numeric value or an
      #   arithmetic expression.
      #
      #   @return [Float, String, nil]
      optional :font_size, union: -> { Imagekit::TextOverlayTransformation::FontSize }, api_name: :fontSize

      # @!attribute inner_alignment
      #   Specifies the inner alignment of the text when width is more than the text
      #   length.
      #
      #   @return [Symbol, Imagekit::Models::TextOverlayTransformation::InnerAlignment, nil]
      optional :inner_alignment,
               enum: -> { Imagekit::TextOverlayTransformation::InnerAlignment },
               api_name: :innerAlignment

      # @!attribute line_height
      #   Specifies the line height of the text overlay. Accepts integer values
      #   representing line height in points. It can also accept
      #   [arithmetic expressions](https://imagekit.io/docs/arithmetic-expressions-in-transformations)
      #   such as `bw_mul_0.2`, or `bh_div_20`.
      #
      #   @return [Float, String, nil]
      optional :line_height,
               union: -> { Imagekit::TextOverlayTransformation::LineHeight },
               api_name: :lineHeight

      # @!attribute padding
      #   Specifies the padding around the overlaid text. Can be provided as a single
      #   positive integer or multiple values separated by underscores (following CSS
      #   shorthand order). Arithmetic expressions are also accepted.
      #
      #   @return [Float, String, nil]
      optional :padding, union: -> { Imagekit::TextOverlayTransformation::Padding }

      # @!attribute radius
      #   Specifies the corner radius of the text overlay. Set to `max` to achieve a
      #   circular or oval shape.
      #
      #   @return [Float, Symbol, :max, nil]
      optional :radius, union: -> { Imagekit::TextOverlayTransformation::Radius }

      # @!attribute rotation
      #   Specifies the rotation angle of the text overlay. Accepts a numeric value for
      #   clockwise rotation or a string prefixed with "N" for counter-clockwise rotation.
      #
      #   @return [Float, String, nil]
      optional :rotation, union: -> { Imagekit::TextOverlayTransformation::Rotation }

      # @!attribute typography
      #   Specifies the typography style of the text. Supported values:
      #
      #   - Single styles: `b` (bold), `i` (italic), `strikethrough`.
      #   - Combinations: Any combination separated by underscores, e.g., `b_i`,
      #     `b_i_strikethrough`.
      #
      #   @return [String, nil]
      optional :typography, String

      # @!attribute width
      #   Specifies the maximum width (in pixels) of the overlaid text. The text wraps
      #   automatically, and arithmetic expressions (e.g., `bw_mul_0.2` or `bh_div_2`) are
      #   supported. Useful when used in conjunction with the `background`. Learn about
      #   [Arithmetic expressions](https://imagekit.io/docs/arithmetic-expressions-in-transformations).
      #
      #   @return [Float, String, nil]
      optional :width, union: -> { Imagekit::TextOverlayTransformation::Width }

      # @!method initialize(alpha: nil, background: nil, flip: nil, font_color: nil, font_family: nil, font_size: nil, inner_alignment: nil, line_height: nil, padding: nil, radius: nil, rotation: nil, typography: nil, width: nil)
      #   Some parameter documentations has been truncated, see
      #   {Imagekit::Models::TextOverlayTransformation} for more details.
      #
      #   @param alpha [Float] Specifies the transparency level of the text overlay. Accepts integers from `1`
      #
      #   @param background [String] Specifies the background color of the text overlay.
      #
      #   @param flip [Symbol, Imagekit::Models::TextOverlayTransformation::Flip] Flip the text overlay horizontally, vertically, or both.
      #
      #   @param font_color [String] Specifies the font color of the overlaid text. Accepts an RGB hex code (e.g., `F
      #
      #   @param font_family [String] Specifies the font family of the overlaid text. Choose from the supported fonts
      #
      #   @param font_size [Float, String] Specifies the font size of the overlaid text. Accepts a numeric value or an arit
      #
      #   @param inner_alignment [Symbol, Imagekit::Models::TextOverlayTransformation::InnerAlignment] Specifies the inner alignment of the text when width is more than the text lengt
      #
      #   @param line_height [Float, String] Specifies the line height of the text overlay.
      #
      #   @param padding [Float, String] Specifies the padding around the overlaid text.
      #
      #   @param radius [Float, Symbol, :max] Specifies the corner radius of the text overlay.
      #
      #   @param rotation [Float, String] Specifies the rotation angle of the text overlay.
      #
      #   @param typography [String] Specifies the typography style of the text.
      #
      #   @param width [Float, String] Specifies the maximum width (in pixels) of the overlaid text. The text wraps aut

      # Flip the text overlay horizontally, vertically, or both.
      #
      # @see Imagekit::Models::TextOverlayTransformation#flip
      module Flip
        extend Imagekit::Internal::Type::Enum

        H = :h
        V = :v
        H_V = :h_v
        V_H = :v_h

        # @!method self.values
        #   @return [Array<Symbol>]
      end

      # Specifies the font size of the overlaid text. Accepts a numeric value or an
      # arithmetic expression.
      #
      # @see Imagekit::Models::TextOverlayTransformation#font_size
      module FontSize
        extend Imagekit::Internal::Type::Union

        variant Float

        variant String

        # @!method self.variants
        #   @return [Array(Float, String)]
      end

      # Specifies the inner alignment of the text when width is more than the text
      # length.
      #
      # @see Imagekit::Models::TextOverlayTransformation#inner_alignment
      module InnerAlignment
        extend Imagekit::Internal::Type::Enum

        LEFT = :left
        RIGHT = :right
        CENTER = :center

        # @!method self.values
        #   @return [Array<Symbol>]
      end

      # Specifies the line height of the text overlay. Accepts integer values
      # representing line height in points. It can also accept
      # [arithmetic expressions](https://imagekit.io/docs/arithmetic-expressions-in-transformations)
      # such as `bw_mul_0.2`, or `bh_div_20`.
      #
      # @see Imagekit::Models::TextOverlayTransformation#line_height
      module LineHeight
        extend Imagekit::Internal::Type::Union

        variant Float

        variant String

        # @!method self.variants
        #   @return [Array(Float, String)]
      end

      # Specifies the padding around the overlaid text. Can be provided as a single
      # positive integer or multiple values separated by underscores (following CSS
      # shorthand order). Arithmetic expressions are also accepted.
      #
      # @see Imagekit::Models::TextOverlayTransformation#padding
      module Padding
        extend Imagekit::Internal::Type::Union

        variant Float

        variant String

        # @!method self.variants
        #   @return [Array(Float, String)]
      end

      # Specifies the corner radius of the text overlay. Set to `max` to achieve a
      # circular or oval shape.
      #
      # @see Imagekit::Models::TextOverlayTransformation#radius
      module Radius
        extend Imagekit::Internal::Type::Union

        variant Float

        variant const: :max

        # @!method self.variants
        #   @return [Array(Float, Symbol, :max)]
      end

      # Specifies the rotation angle of the text overlay. Accepts a numeric value for
      # clockwise rotation or a string prefixed with "N" for counter-clockwise rotation.
      #
      # @see Imagekit::Models::TextOverlayTransformation#rotation
      module Rotation
        extend Imagekit::Internal::Type::Union

        variant Float

        variant String

        # @!method self.variants
        #   @return [Array(Float, String)]
      end

      # Specifies the maximum width (in pixels) of the overlaid text. The text wraps
      # automatically, and arithmetic expressions (e.g., `bw_mul_0.2` or `bh_div_2`) are
      # supported. Useful when used in conjunction with the `background`. Learn about
      # [Arithmetic expressions](https://imagekit.io/docs/arithmetic-expressions-in-transformations).
      #
      # @see Imagekit::Models::TextOverlayTransformation#width
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
