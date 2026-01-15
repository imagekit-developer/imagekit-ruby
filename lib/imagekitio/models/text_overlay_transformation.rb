# frozen_string_literal: true

module Imagekitio
  module Models
    class TextOverlayTransformation < Imagekitio::Internal::Type::BaseModel
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
      #   Flip/mirror the text horizontally, vertically, or in both directions. Acceptable
      #   values: `h` (horizontal), `v` (vertical), `h_v` (horizontal and vertical), or
      #   `v_h`.
      #
      #   @return [Symbol, Imagekitio::Models::TextOverlayTransformation::Flip, nil]
      optional :flip, enum: -> { Imagekitio::TextOverlayTransformation::Flip }

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
      optional :font_size, union: -> { Imagekitio::TextOverlayTransformation::FontSize }, api_name: :fontSize

      # @!attribute inner_alignment
      #   Specifies the inner alignment of the text when width is more than the text
      #   length.
      #
      #   @return [Symbol, Imagekitio::Models::TextOverlayTransformation::InnerAlignment, nil]
      optional :inner_alignment,
               enum: -> { Imagekitio::TextOverlayTransformation::InnerAlignment },
               api_name: :innerAlignment

      # @!attribute line_height
      #   Specifies the line height for multi-line text overlays. It will come into effect
      #   only if the text wraps over multiple lines. Accepts either an integer value or
      #   an arithmetic expression.
      #
      #   @return [Float, String, nil]
      optional :line_height,
               union: -> { Imagekitio::TextOverlayTransformation::LineHeight },
               api_name: :lineHeight

      # @!attribute padding
      #   Specifies the padding around the overlaid text. Can be provided as a single
      #   positive integer or multiple values separated by underscores (following CSS
      #   shorthand order). Arithmetic expressions are also accepted.
      #
      #   @return [Float, String, nil]
      optional :padding, union: -> { Imagekitio::TextOverlayTransformation::Padding }

      # @!attribute radius
      #   Specifies the corner radius:
      #
      #   - Single value (positive integer): Applied to all corners (e.g., `20`).
      #   - `max`: Creates a circular or oval shape.
      #   - Per-corner array: Provide four underscore-separated values representing
      #     top-left, top-right, bottom-right, and bottom-left corners respectively (e.g.,
      #     `10_20_30_40`). See
      #     [Radius](https://imagekit.io/docs/effects-and-enhancements#radius---r).
      #
      #   @return [Float, Symbol, :max, String, nil]
      optional :radius, union: -> { Imagekitio::TextOverlayTransformation::Radius }

      # @!attribute rotation
      #   Specifies the rotation angle of the text overlay. Accepts a numeric value for
      #   clockwise rotation or a string prefixed with "N" for counter-clockwise rotation.
      #
      #   @return [Float, String, nil]
      optional :rotation, union: -> { Imagekitio::TextOverlayTransformation::Rotation }

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
      optional :width, union: -> { Imagekitio::TextOverlayTransformation::Width }

      # @!method initialize(alpha: nil, background: nil, flip: nil, font_color: nil, font_family: nil, font_size: nil, inner_alignment: nil, line_height: nil, padding: nil, radius: nil, rotation: nil, typography: nil, width: nil)
      #   Some parameter documentations has been truncated, see
      #   {Imagekitio::Models::TextOverlayTransformation} for more details.
      #
      #   @param alpha [Float] Specifies the transparency level of the text overlay. Accepts integers from `1`
      #
      #   @param background [String] Specifies the background color of the text overlay.
      #
      #   @param flip [Symbol, Imagekitio::Models::TextOverlayTransformation::Flip] Flip/mirror the text horizontally, vertically, or in both directions.
      #
      #   @param font_color [String] Specifies the font color of the overlaid text. Accepts an RGB hex code (e.g., `F
      #
      #   @param font_family [String] Specifies the font family of the overlaid text. Choose from the supported fonts
      #
      #   @param font_size [Float, String] Specifies the font size of the overlaid text. Accepts a numeric value or an arit
      #
      #   @param inner_alignment [Symbol, Imagekitio::Models::TextOverlayTransformation::InnerAlignment] Specifies the inner alignment of the text when width is more than the text lengt
      #
      #   @param line_height [Float, String] Specifies the line height for multi-line text overlays. It will come into effect
      #
      #   @param padding [Float, String] Specifies the padding around the overlaid text.
      #
      #   @param radius [Float, Symbol, :max, String] Specifies the corner radius:
      #
      #   @param rotation [Float, String] Specifies the rotation angle of the text overlay.
      #
      #   @param typography [String] Specifies the typography style of the text.
      #
      #   @param width [Float, String] Specifies the maximum width (in pixels) of the overlaid text. The text wraps aut

      # Flip/mirror the text horizontally, vertically, or in both directions. Acceptable
      # values: `h` (horizontal), `v` (vertical), `h_v` (horizontal and vertical), or
      # `v_h`.
      #
      # @see Imagekitio::Models::TextOverlayTransformation#flip
      module Flip
        extend Imagekitio::Internal::Type::Enum

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
      # @see Imagekitio::Models::TextOverlayTransformation#font_size
      module FontSize
        extend Imagekitio::Internal::Type::Union

        variant Float

        variant String

        # @!method self.variants
        #   @return [Array(Float, String)]
      end

      # Specifies the inner alignment of the text when width is more than the text
      # length.
      #
      # @see Imagekitio::Models::TextOverlayTransformation#inner_alignment
      module InnerAlignment
        extend Imagekitio::Internal::Type::Enum

        LEFT = :left
        RIGHT = :right
        CENTER = :center

        # @!method self.values
        #   @return [Array<Symbol>]
      end

      # Specifies the line height for multi-line text overlays. It will come into effect
      # only if the text wraps over multiple lines. Accepts either an integer value or
      # an arithmetic expression.
      #
      # @see Imagekitio::Models::TextOverlayTransformation#line_height
      module LineHeight
        extend Imagekitio::Internal::Type::Union

        variant Float

        variant String

        # @!method self.variants
        #   @return [Array(Float, String)]
      end

      # Specifies the padding around the overlaid text. Can be provided as a single
      # positive integer or multiple values separated by underscores (following CSS
      # shorthand order). Arithmetic expressions are also accepted.
      #
      # @see Imagekitio::Models::TextOverlayTransformation#padding
      module Padding
        extend Imagekitio::Internal::Type::Union

        variant Float

        variant String

        # @!method self.variants
        #   @return [Array(Float, String)]
      end

      # Specifies the corner radius:
      #
      # - Single value (positive integer): Applied to all corners (e.g., `20`).
      # - `max`: Creates a circular or oval shape.
      # - Per-corner array: Provide four underscore-separated values representing
      #   top-left, top-right, bottom-right, and bottom-left corners respectively (e.g.,
      #   `10_20_30_40`). See
      #   [Radius](https://imagekit.io/docs/effects-and-enhancements#radius---r).
      #
      # @see Imagekitio::Models::TextOverlayTransformation#radius
      module Radius
        extend Imagekitio::Internal::Type::Union

        variant Float

        variant const: :max

        variant String

        # @!method self.variants
        #   @return [Array(Float, Symbol, :max, String)]
      end

      # Specifies the rotation angle of the text overlay. Accepts a numeric value for
      # clockwise rotation or a string prefixed with "N" for counter-clockwise rotation.
      #
      # @see Imagekitio::Models::TextOverlayTransformation#rotation
      module Rotation
        extend Imagekitio::Internal::Type::Union

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
      # @see Imagekitio::Models::TextOverlayTransformation#width
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
