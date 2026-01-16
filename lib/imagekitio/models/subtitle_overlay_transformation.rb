# frozen_string_literal: true

module Imagekitio
  module Models
    class SubtitleOverlayTransformation < Imagekitio::Internal::Type::BaseModel
      # @!attribute background
      #   Specifies the subtitle background color using a standard color name, an RGB
      #   color code (e.g., FF0000), or an RGBA color code (e.g., FFAABB50).
      #
      #   [Subtitle styling options](https://imagekit.io/docs/add-overlays-on-videos#styling-controls-for-subtitles-layer)
      #
      #   @return [String, nil]
      optional :background, String

      # @!attribute color
      #   Sets the font color of the subtitle text using a standard color name, an RGB
      #   color code (e.g., FF0000), or an RGBA color code (e.g., FFAABB50).
      #
      #   [Subtitle styling options](https://imagekit.io/docs/add-overlays-on-videos#styling-controls-for-subtitles-layer)
      #
      #   @return [String, nil]
      optional :color, String

      # @!attribute font_family
      #   Sets the font family of subtitle text. Refer to the
      #   [supported fonts documented](https://imagekit.io/docs/add-overlays-on-images#supported-text-font-list)
      #   in the ImageKit transformations guide.
      #
      #   @return [String, nil]
      optional :font_family, String, api_name: :fontFamily

      # @!attribute font_outline
      #   Sets the font outline of the subtitle text. Requires the outline width (an
      #   integer) and the outline color (as an RGB color code, RGBA color code, or
      #   standard web color name) separated by an underscore. Example: `fol-2_blue`
      #   (outline width of 2px and outline color blue), `fol-2_A1CCDD` (outline width of
      #   2px and outline color `#A1CCDD`) and `fol-2_A1CCDD50` (outline width of 2px and
      #   outline color `#A1CCDD` at 50% opacity).
      #
      #   [Subtitle styling options](https://imagekit.io/docs/add-overlays-on-videos#styling-controls-for-subtitles-layer)
      #
      #   @return [String, nil]
      optional :font_outline, String, api_name: :fontOutline

      # @!attribute font_shadow
      #   Sets the font shadow for the subtitle text. Requires the shadow color (as an RGB
      #   color code, RGBA color code, or standard web color name) and shadow indent (an
      #   integer) separated by an underscore. Example: `fsh-blue_2` (shadow color blue,
      #   indent of 2px), `fsh-A1CCDD_3` (shadow color `#A1CCDD`, indent of 3px),
      #   `fsh-A1CCDD50_3` (shadow color `#A1CCDD` at 50% opacity, indent of 3px).
      #
      #   [Subtitle styling options](https://imagekit.io/docs/add-overlays-on-videos#styling-controls-for-subtitles-layer)
      #
      #   @return [String, nil]
      optional :font_shadow, String, api_name: :fontShadow

      # @!attribute font_size
      #   Sets the font size of subtitle text.
      #
      #   [Subtitle styling options](https://imagekit.io/docs/add-overlays-on-videos#styling-controls-for-subtitles-layer)
      #
      #   @return [Float, nil]
      optional :font_size, Float, api_name: :fontSize

      # @!attribute typography
      #   Sets the typography style of the subtitle text. Supports values are `b` for
      #   bold, `i` for italics, and `b_i` for bold with italics.
      #
      #   [Subtitle styling options](https://imagekit.io/docs/add-overlays-on-videos#styling-controls-for-subtitles-layer)
      #
      #   @return [Symbol, Imagekitio::Models::SubtitleOverlayTransformation::Typography, nil]
      optional :typography, enum: -> { Imagekitio::SubtitleOverlayTransformation::Typography }

      # @!method initialize(background: nil, color: nil, font_family: nil, font_outline: nil, font_shadow: nil, font_size: nil, typography: nil)
      #   Some parameter documentations has been truncated, see
      #   {Imagekitio::Models::SubtitleOverlayTransformation} for more details.
      #
      #   Subtitle styling options.
      #   [Learn more](https://imagekit.io/docs/add-overlays-on-videos#styling-controls-for-subtitles-layer)
      #   from the docs.
      #
      #   @param background [String] Specifies the subtitle background color using a standard color name, an RGB colo
      #
      #   @param color [String] Sets the font color of the subtitle text using a standard color name, an RGB col
      #
      #   @param font_family [String] Sets the font family of subtitle text.
      #
      #   @param font_outline [String] Sets the font outline of the subtitle text.
      #
      #   @param font_shadow [String] Sets the font shadow for the subtitle text.
      #
      #   @param font_size [Float] Sets the font size of subtitle text.
      #
      #   @param typography [Symbol, Imagekitio::Models::SubtitleOverlayTransformation::Typography] Sets the typography style of the subtitle text. Supports values are `b` for bold

      # Sets the typography style of the subtitle text. Supports values are `b` for
      # bold, `i` for italics, and `b_i` for bold with italics.
      #
      # [Subtitle styling options](https://imagekit.io/docs/add-overlays-on-videos#styling-controls-for-subtitles-layer)
      #
      # @see Imagekitio::Models::SubtitleOverlayTransformation#typography
      module Typography
        extend Imagekitio::Internal::Type::Enum

        B = :b
        I = :i
        B_I = :b_i

        # @!method self.values
        #   @return [Array<Symbol>]
      end
    end
  end
end
