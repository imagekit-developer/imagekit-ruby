# typed: strong

module Imagekit
  module Models
    class TextOverlayTransformation < Imagekit::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            Imagekit::TextOverlayTransformation,
            Imagekit::Internal::AnyHash
          )
        end

      # Specifies the transparency level of the text overlay. Accepts integers from `1`
      # to `9`.
      sig { returns(T.nilable(Float)) }
      attr_reader :alpha

      sig { params(alpha: Float).void }
      attr_writer :alpha

      # Specifies the background color of the text overlay. Accepts an RGB hex code, an
      # RGBA code, or a color name.
      sig { returns(T.nilable(String)) }
      attr_reader :background

      sig { params(background: String).void }
      attr_writer :background

      # Flip the text overlay horizontally, vertically, or both.
      sig do
        returns(
          T.nilable(Imagekit::TextOverlayTransformation::Flip::TaggedSymbol)
        )
      end
      attr_reader :flip

      sig do
        params(flip: Imagekit::TextOverlayTransformation::Flip::OrSymbol).void
      end
      attr_writer :flip

      # Specifies the font color of the overlaid text. Accepts an RGB hex code (e.g.,
      # `FF0000`), an RGBA code (e.g., `FFAABB50`), or a color name.
      sig { returns(T.nilable(String)) }
      attr_reader :font_color

      sig { params(font_color: String).void }
      attr_writer :font_color

      # Specifies the font family of the overlaid text. Choose from the supported fonts
      # list or use a custom font. See
      # [Supported fonts](https://imagekit.io/docs/add-overlays-on-images#supported-text-font-list)
      # and
      # [Custom font](https://imagekit.io/docs/add-overlays-on-images#change-font-family-in-text-overlay).
      sig { returns(T.nilable(String)) }
      attr_reader :font_family

      sig { params(font_family: String).void }
      attr_writer :font_family

      # Specifies the font size of the overlaid text. Accepts a numeric value or an
      # arithmetic expression.
      sig do
        returns(
          T.nilable(Imagekit::TextOverlayTransformation::FontSize::Variants)
        )
      end
      attr_reader :font_size

      sig do
        params(
          font_size: Imagekit::TextOverlayTransformation::FontSize::Variants
        ).void
      end
      attr_writer :font_size

      # Specifies the inner alignment of the text when width is more than the text
      # length.
      sig do
        returns(
          T.nilable(
            Imagekit::TextOverlayTransformation::InnerAlignment::TaggedSymbol
          )
        )
      end
      attr_reader :inner_alignment

      sig do
        params(
          inner_alignment:
            Imagekit::TextOverlayTransformation::InnerAlignment::OrSymbol
        ).void
      end
      attr_writer :inner_alignment

      # Specifies the line height of the text overlay. Accepts integer values
      # representing line height in points. It can also accept
      # [arithmetic expressions](https://imagekit.io/docs/arithmetic-expressions-in-transformations)
      # such as `bw_mul_0.2`, or `bh_div_20`.
      sig do
        returns(
          T.nilable(Imagekit::TextOverlayTransformation::LineHeight::Variants)
        )
      end
      attr_reader :line_height

      sig do
        params(
          line_height: Imagekit::TextOverlayTransformation::LineHeight::Variants
        ).void
      end
      attr_writer :line_height

      # Specifies the padding around the overlaid text. Can be provided as a single
      # positive integer or multiple values separated by underscores (following CSS
      # shorthand order). Arithmetic expressions are also accepted.
      sig do
        returns(
          T.nilable(Imagekit::TextOverlayTransformation::Padding::Variants)
        )
      end
      attr_reader :padding

      sig do
        params(
          padding: Imagekit::TextOverlayTransformation::Padding::Variants
        ).void
      end
      attr_writer :padding

      # Specifies the corner radius of the text overlay. Set to `max` to achieve a
      # circular or oval shape.
      sig do
        returns(
          T.nilable(Imagekit::TextOverlayTransformation::Radius::Variants)
        )
      end
      attr_reader :radius

      sig { params(radius: T.any(Float, Symbol)).void }
      attr_writer :radius

      # Specifies the rotation angle of the text overlay. Accepts a numeric value for
      # clockwise rotation or a string prefixed with "N" for counter-clockwise rotation.
      sig do
        returns(
          T.nilable(Imagekit::TextOverlayTransformation::Rotation::Variants)
        )
      end
      attr_reader :rotation

      sig do
        params(
          rotation: Imagekit::TextOverlayTransformation::Rotation::Variants
        ).void
      end
      attr_writer :rotation

      # Specifies the typography style of the text. Supported values:
      #
      # - Single styles: `b` (bold), `i` (italic), `strikethrough`.
      # - Combinations: Any combination separated by underscores, e.g., `b_i`,
      #   `b_i_strikethrough`.
      sig { returns(T.nilable(String)) }
      attr_reader :typography

      sig { params(typography: String).void }
      attr_writer :typography

      # Specifies the maximum width (in pixels) of the overlaid text. The text wraps
      # automatically, and arithmetic expressions (e.g., `bw_mul_0.2` or `bh_div_2`) are
      # supported. Useful when used in conjunction with the `background`. Learn about
      # [Arithmetic expressions](https://imagekit.io/docs/arithmetic-expressions-in-transformations).
      sig do
        returns(T.nilable(Imagekit::TextOverlayTransformation::Width::Variants))
      end
      attr_reader :width

      sig do
        params(width: Imagekit::TextOverlayTransformation::Width::Variants).void
      end
      attr_writer :width

      sig do
        params(
          alpha: Float,
          background: String,
          flip: Imagekit::TextOverlayTransformation::Flip::OrSymbol,
          font_color: String,
          font_family: String,
          font_size: Imagekit::TextOverlayTransformation::FontSize::Variants,
          inner_alignment:
            Imagekit::TextOverlayTransformation::InnerAlignment::OrSymbol,
          line_height:
            Imagekit::TextOverlayTransformation::LineHeight::Variants,
          padding: Imagekit::TextOverlayTransformation::Padding::Variants,
          radius: T.any(Float, Symbol),
          rotation: Imagekit::TextOverlayTransformation::Rotation::Variants,
          typography: String,
          width: Imagekit::TextOverlayTransformation::Width::Variants
        ).returns(T.attached_class)
      end
      def self.new(
        # Specifies the transparency level of the text overlay. Accepts integers from `1`
        # to `9`.
        alpha: nil,
        # Specifies the background color of the text overlay. Accepts an RGB hex code, an
        # RGBA code, or a color name.
        background: nil,
        # Flip the text overlay horizontally, vertically, or both.
        flip: nil,
        # Specifies the font color of the overlaid text. Accepts an RGB hex code (e.g.,
        # `FF0000`), an RGBA code (e.g., `FFAABB50`), or a color name.
        font_color: nil,
        # Specifies the font family of the overlaid text. Choose from the supported fonts
        # list or use a custom font. See
        # [Supported fonts](https://imagekit.io/docs/add-overlays-on-images#supported-text-font-list)
        # and
        # [Custom font](https://imagekit.io/docs/add-overlays-on-images#change-font-family-in-text-overlay).
        font_family: nil,
        # Specifies the font size of the overlaid text. Accepts a numeric value or an
        # arithmetic expression.
        font_size: nil,
        # Specifies the inner alignment of the text when width is more than the text
        # length.
        inner_alignment: nil,
        # Specifies the line height of the text overlay. Accepts integer values
        # representing line height in points. It can also accept
        # [arithmetic expressions](https://imagekit.io/docs/arithmetic-expressions-in-transformations)
        # such as `bw_mul_0.2`, or `bh_div_20`.
        line_height: nil,
        # Specifies the padding around the overlaid text. Can be provided as a single
        # positive integer or multiple values separated by underscores (following CSS
        # shorthand order). Arithmetic expressions are also accepted.
        padding: nil,
        # Specifies the corner radius of the text overlay. Set to `max` to achieve a
        # circular or oval shape.
        radius: nil,
        # Specifies the rotation angle of the text overlay. Accepts a numeric value for
        # clockwise rotation or a string prefixed with "N" for counter-clockwise rotation.
        rotation: nil,
        # Specifies the typography style of the text. Supported values:
        #
        # - Single styles: `b` (bold), `i` (italic), `strikethrough`.
        # - Combinations: Any combination separated by underscores, e.g., `b_i`,
        #   `b_i_strikethrough`.
        typography: nil,
        # Specifies the maximum width (in pixels) of the overlaid text. The text wraps
        # automatically, and arithmetic expressions (e.g., `bw_mul_0.2` or `bh_div_2`) are
        # supported. Useful when used in conjunction with the `background`. Learn about
        # [Arithmetic expressions](https://imagekit.io/docs/arithmetic-expressions-in-transformations).
        width: nil
      )
      end

      sig do
        override.returns(
          {
            alpha: Float,
            background: String,
            flip: Imagekit::TextOverlayTransformation::Flip::TaggedSymbol,
            font_color: String,
            font_family: String,
            font_size: Imagekit::TextOverlayTransformation::FontSize::Variants,
            inner_alignment:
              Imagekit::TextOverlayTransformation::InnerAlignment::TaggedSymbol,
            line_height:
              Imagekit::TextOverlayTransformation::LineHeight::Variants,
            padding: Imagekit::TextOverlayTransformation::Padding::Variants,
            radius: Imagekit::TextOverlayTransformation::Radius::Variants,
            rotation: Imagekit::TextOverlayTransformation::Rotation::Variants,
            typography: String,
            width: Imagekit::TextOverlayTransformation::Width::Variants
          }
        )
      end
      def to_hash
      end

      # Flip the text overlay horizontally, vertically, or both.
      module Flip
        extend Imagekit::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias do
            T.all(Symbol, Imagekit::TextOverlayTransformation::Flip)
          end
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        H = T.let(:h, Imagekit::TextOverlayTransformation::Flip::TaggedSymbol)
        V = T.let(:v, Imagekit::TextOverlayTransformation::Flip::TaggedSymbol)
        H_V =
          T.let(:h_v, Imagekit::TextOverlayTransformation::Flip::TaggedSymbol)
        V_H =
          T.let(:v_h, Imagekit::TextOverlayTransformation::Flip::TaggedSymbol)

        sig do
          override.returns(
            T::Array[Imagekit::TextOverlayTransformation::Flip::TaggedSymbol]
          )
        end
        def self.values
        end
      end

      # Specifies the font size of the overlaid text. Accepts a numeric value or an
      # arithmetic expression.
      module FontSize
        extend Imagekit::Internal::Type::Union

        Variants = T.type_alias { T.any(Float, String) }

        sig do
          override.returns(
            T::Array[Imagekit::TextOverlayTransformation::FontSize::Variants]
          )
        end
        def self.variants
        end
      end

      # Specifies the inner alignment of the text when width is more than the text
      # length.
      module InnerAlignment
        extend Imagekit::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias do
            T.all(Symbol, Imagekit::TextOverlayTransformation::InnerAlignment)
          end
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        LEFT =
          T.let(
            :left,
            Imagekit::TextOverlayTransformation::InnerAlignment::TaggedSymbol
          )
        RIGHT =
          T.let(
            :right,
            Imagekit::TextOverlayTransformation::InnerAlignment::TaggedSymbol
          )
        CENTER =
          T.let(
            :center,
            Imagekit::TextOverlayTransformation::InnerAlignment::TaggedSymbol
          )

        sig do
          override.returns(
            T::Array[
              Imagekit::TextOverlayTransformation::InnerAlignment::TaggedSymbol
            ]
          )
        end
        def self.values
        end
      end

      # Specifies the line height of the text overlay. Accepts integer values
      # representing line height in points. It can also accept
      # [arithmetic expressions](https://imagekit.io/docs/arithmetic-expressions-in-transformations)
      # such as `bw_mul_0.2`, or `bh_div_20`.
      module LineHeight
        extend Imagekit::Internal::Type::Union

        Variants = T.type_alias { T.any(Float, String) }

        sig do
          override.returns(
            T::Array[Imagekit::TextOverlayTransformation::LineHeight::Variants]
          )
        end
        def self.variants
        end
      end

      # Specifies the padding around the overlaid text. Can be provided as a single
      # positive integer or multiple values separated by underscores (following CSS
      # shorthand order). Arithmetic expressions are also accepted.
      module Padding
        extend Imagekit::Internal::Type::Union

        Variants = T.type_alias { T.any(Float, String) }

        sig do
          override.returns(
            T::Array[Imagekit::TextOverlayTransformation::Padding::Variants]
          )
        end
        def self.variants
        end
      end

      # Specifies the corner radius of the text overlay. Set to `max` to achieve a
      # circular or oval shape.
      module Radius
        extend Imagekit::Internal::Type::Union

        Variants = T.type_alias { T.any(Float, Symbol) }

        sig do
          override.returns(
            T::Array[Imagekit::TextOverlayTransformation::Radius::Variants]
          )
        end
        def self.variants
        end
      end

      # Specifies the rotation angle of the text overlay. Accepts a numeric value for
      # clockwise rotation or a string prefixed with "N" for counter-clockwise rotation.
      module Rotation
        extend Imagekit::Internal::Type::Union

        Variants = T.type_alias { T.any(Float, String) }

        sig do
          override.returns(
            T::Array[Imagekit::TextOverlayTransformation::Rotation::Variants]
          )
        end
        def self.variants
        end
      end

      # Specifies the maximum width (in pixels) of the overlaid text. The text wraps
      # automatically, and arithmetic expressions (e.g., `bw_mul_0.2` or `bh_div_2`) are
      # supported. Useful when used in conjunction with the `background`. Learn about
      # [Arithmetic expressions](https://imagekit.io/docs/arithmetic-expressions-in-transformations).
      module Width
        extend Imagekit::Internal::Type::Union

        Variants = T.type_alias { T.any(Float, String) }

        sig do
          override.returns(
            T::Array[Imagekit::TextOverlayTransformation::Width::Variants]
          )
        end
        def self.variants
        end
      end
    end
  end
end
