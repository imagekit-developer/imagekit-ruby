# typed: strong

module Imagekitio
  module Models
    class SubtitleOverlayTransformation < Imagekitio::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            Imagekitio::SubtitleOverlayTransformation,
            Imagekitio::Internal::AnyHash
          )
        end

      # Specifies the subtitle background color using a standard color name, an RGB
      # color code (e.g., FF0000), or an RGBA color code (e.g., FFAABB50).
      #
      # [Subtitle styling options](https://imagekit.io/docs/add-overlays-on-videos#styling-controls-for-subtitles-layer)
      sig { returns(T.nilable(String)) }
      attr_reader :background

      sig { params(background: String).void }
      attr_writer :background

      # Sets the font color of the subtitle text using a standard color name, an RGB
      # color code (e.g., FF0000), or an RGBA color code (e.g., FFAABB50).
      #
      # [Subtitle styling options](https://imagekit.io/docs/add-overlays-on-videos#styling-controls-for-subtitles-layer)
      sig { returns(T.nilable(String)) }
      attr_reader :color

      sig { params(color: String).void }
      attr_writer :color

      # Sets the font family of subtitle text. Refer to the
      # [supported fonts documented](https://imagekit.io/docs/add-overlays-on-images#supported-text-font-list)
      # in the ImageKit transformations guide.
      sig { returns(T.nilable(String)) }
      attr_reader :font_family

      sig { params(font_family: String).void }
      attr_writer :font_family

      # Sets the font outline of the subtitle text. Requires the outline width (an
      # integer) and the outline color (as an RGB color code, RGBA color code, or
      # standard web color name) separated by an underscore. Example: `fol-2_blue`
      # (outline width of 2px and outline color blue), `fol-2_A1CCDD` (outline width of
      # 2px and outline color `#A1CCDD`) and `fol-2_A1CCDD50` (outline width of 2px and
      # outline color `#A1CCDD` at 50% opacity).
      #
      # [Subtitle styling options](https://imagekit.io/docs/add-overlays-on-videos#styling-controls-for-subtitles-layer)
      sig { returns(T.nilable(String)) }
      attr_reader :font_outline

      sig { params(font_outline: String).void }
      attr_writer :font_outline

      # Sets the font shadow for the subtitle text. Requires the shadow color (as an RGB
      # color code, RGBA color code, or standard web color name) and shadow indent (an
      # integer) separated by an underscore. Example: `fsh-blue_2` (shadow color blue,
      # indent of 2px), `fsh-A1CCDD_3` (shadow color `#A1CCDD`, indent of 3px),
      # `fsh-A1CCDD50_3` (shadow color `#A1CCDD` at 50% opacity, indent of 3px).
      #
      # [Subtitle styling options](https://imagekit.io/docs/add-overlays-on-videos#styling-controls-for-subtitles-layer)
      sig { returns(T.nilable(String)) }
      attr_reader :font_shadow

      sig { params(font_shadow: String).void }
      attr_writer :font_shadow

      # Sets the font size of subtitle text.
      #
      # [Subtitle styling options](https://imagekit.io/docs/add-overlays-on-videos#styling-controls-for-subtitles-layer)
      sig { returns(T.nilable(Float)) }
      attr_reader :font_size

      sig { params(font_size: Float).void }
      attr_writer :font_size

      # Sets the typography style of the subtitle text. Supports values are `b` for
      # bold, `i` for italics, and `b_i` for bold with italics.
      #
      # [Subtitle styling options](https://imagekit.io/docs/add-overlays-on-videos#styling-controls-for-subtitles-layer)
      sig do
        returns(
          T.nilable(
            Imagekitio::SubtitleOverlayTransformation::Typography::OrSymbol
          )
        )
      end
      attr_reader :typography

      sig do
        params(
          typography:
            Imagekitio::SubtitleOverlayTransformation::Typography::OrSymbol
        ).void
      end
      attr_writer :typography

      # Subtitle styling options.
      # [Learn more](https://imagekit.io/docs/add-overlays-on-videos#styling-controls-for-subtitles-layer)
      # from the docs.
      sig do
        params(
          background: String,
          color: String,
          font_family: String,
          font_outline: String,
          font_shadow: String,
          font_size: Float,
          typography:
            Imagekitio::SubtitleOverlayTransformation::Typography::OrSymbol
        ).returns(T.attached_class)
      end
      def self.new(
        # Specifies the subtitle background color using a standard color name, an RGB
        # color code (e.g., FF0000), or an RGBA color code (e.g., FFAABB50).
        #
        # [Subtitle styling options](https://imagekit.io/docs/add-overlays-on-videos#styling-controls-for-subtitles-layer)
        background: nil,
        # Sets the font color of the subtitle text using a standard color name, an RGB
        # color code (e.g., FF0000), or an RGBA color code (e.g., FFAABB50).
        #
        # [Subtitle styling options](https://imagekit.io/docs/add-overlays-on-videos#styling-controls-for-subtitles-layer)
        color: nil,
        # Sets the font family of subtitle text. Refer to the
        # [supported fonts documented](https://imagekit.io/docs/add-overlays-on-images#supported-text-font-list)
        # in the ImageKit transformations guide.
        font_family: nil,
        # Sets the font outline of the subtitle text. Requires the outline width (an
        # integer) and the outline color (as an RGB color code, RGBA color code, or
        # standard web color name) separated by an underscore. Example: `fol-2_blue`
        # (outline width of 2px and outline color blue), `fol-2_A1CCDD` (outline width of
        # 2px and outline color `#A1CCDD`) and `fol-2_A1CCDD50` (outline width of 2px and
        # outline color `#A1CCDD` at 50% opacity).
        #
        # [Subtitle styling options](https://imagekit.io/docs/add-overlays-on-videos#styling-controls-for-subtitles-layer)
        font_outline: nil,
        # Sets the font shadow for the subtitle text. Requires the shadow color (as an RGB
        # color code, RGBA color code, or standard web color name) and shadow indent (an
        # integer) separated by an underscore. Example: `fsh-blue_2` (shadow color blue,
        # indent of 2px), `fsh-A1CCDD_3` (shadow color `#A1CCDD`, indent of 3px),
        # `fsh-A1CCDD50_3` (shadow color `#A1CCDD` at 50% opacity, indent of 3px).
        #
        # [Subtitle styling options](https://imagekit.io/docs/add-overlays-on-videos#styling-controls-for-subtitles-layer)
        font_shadow: nil,
        # Sets the font size of subtitle text.
        #
        # [Subtitle styling options](https://imagekit.io/docs/add-overlays-on-videos#styling-controls-for-subtitles-layer)
        font_size: nil,
        # Sets the typography style of the subtitle text. Supports values are `b` for
        # bold, `i` for italics, and `b_i` for bold with italics.
        #
        # [Subtitle styling options](https://imagekit.io/docs/add-overlays-on-videos#styling-controls-for-subtitles-layer)
        typography: nil
      )
      end

      sig do
        override.returns(
          {
            background: String,
            color: String,
            font_family: String,
            font_outline: String,
            font_shadow: String,
            font_size: Float,
            typography:
              Imagekitio::SubtitleOverlayTransformation::Typography::OrSymbol
          }
        )
      end
      def to_hash
      end

      # Sets the typography style of the subtitle text. Supports values are `b` for
      # bold, `i` for italics, and `b_i` for bold with italics.
      #
      # [Subtitle styling options](https://imagekit.io/docs/add-overlays-on-videos#styling-controls-for-subtitles-layer)
      module Typography
        extend Imagekitio::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias do
            T.all(Symbol, Imagekitio::SubtitleOverlayTransformation::Typography)
          end
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        B =
          T.let(
            :b,
            Imagekitio::SubtitleOverlayTransformation::Typography::TaggedSymbol
          )
        I =
          T.let(
            :i,
            Imagekitio::SubtitleOverlayTransformation::Typography::TaggedSymbol
          )
        B_I =
          T.let(
            :b_i,
            Imagekitio::SubtitleOverlayTransformation::Typography::TaggedSymbol
          )

        sig do
          override.returns(
            T::Array[
              Imagekitio::SubtitleOverlayTransformation::Typography::TaggedSymbol
            ]
          )
        end
        def self.values
        end
      end
    end
  end
end
