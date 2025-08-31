# typed: strong

module Imagekit
  module Models
    class SubtitleOverlayTransformation < Imagekit::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            Imagekit::SubtitleOverlayTransformation,
            Imagekit::Internal::AnyHash
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

      # Font family for subtitles. Refer to the
      # [supported fonts](https://imagekit.io/docs/add-overlays-on-images#supported-text-font-list).
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
            Imagekit::SubtitleOverlayTransformation::Typography::OrSymbol
          )
        )
      end
      attr_reader :typography

      sig do
        params(
          typography:
            Imagekit::SubtitleOverlayTransformation::Typography::OrSymbol
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
            Imagekit::SubtitleOverlayTransformation::Typography::OrSymbol
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
        # Font family for subtitles. Refer to the
        # [supported fonts](https://imagekit.io/docs/add-overlays-on-images#supported-text-font-list).
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
              Imagekit::SubtitleOverlayTransformation::Typography::OrSymbol
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
        extend Imagekit::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias do
            T.all(Symbol, Imagekit::SubtitleOverlayTransformation::Typography)
          end
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        B =
          T.let(
            :b,
            Imagekit::SubtitleOverlayTransformation::Typography::TaggedSymbol
          )
        I =
          T.let(
            :i,
            Imagekit::SubtitleOverlayTransformation::Typography::TaggedSymbol
          )
        B_I =
          T.let(
            :b_i,
            Imagekit::SubtitleOverlayTransformation::Typography::TaggedSymbol
          )

        sig do
          override.returns(
            T::Array[
              Imagekit::SubtitleOverlayTransformation::Typography::TaggedSymbol
            ]
          )
        end
        def self.values
        end
      end
    end
  end
end
