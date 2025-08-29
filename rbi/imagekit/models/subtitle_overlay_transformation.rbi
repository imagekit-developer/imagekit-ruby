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

      # Background color for subtitles
      sig { returns(T.nilable(String)) }
      attr_reader :background

      sig { params(background: String).void }
      attr_writer :background

      # Text color for subtitles
      sig { returns(T.nilable(String)) }
      attr_reader :color

      sig { params(color: String).void }
      attr_writer :color

      # Font family for subtitles
      sig { returns(T.nilable(String)) }
      attr_reader :font_family

      sig { params(font_family: String).void }
      attr_writer :font_family

      # Font outline for subtitles
      sig { returns(T.nilable(String)) }
      attr_reader :font_outline

      sig { params(font_outline: String).void }
      attr_writer :font_outline

      # Font shadow for subtitles
      sig { returns(T.nilable(String)) }
      attr_reader :font_shadow

      sig { params(font_shadow: String).void }
      attr_writer :font_shadow

      # Font size for subtitles
      sig do
        returns(
          T.nilable(Imagekit::SubtitleOverlayTransformation::FontSize::Variants)
        )
      end
      attr_reader :font_size

      sig do
        params(
          font_size: Imagekit::SubtitleOverlayTransformation::FontSize::Variants
        ).void
      end
      attr_writer :font_size

      # Typography style for subtitles
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

      sig do
        params(
          background: String,
          color: String,
          font_family: String,
          font_outline: String,
          font_shadow: String,
          font_size:
            Imagekit::SubtitleOverlayTransformation::FontSize::Variants,
          typography:
            Imagekit::SubtitleOverlayTransformation::Typography::OrSymbol
        ).returns(T.attached_class)
      end
      def self.new(
        # Background color for subtitles
        background: nil,
        # Text color for subtitles
        color: nil,
        # Font family for subtitles
        font_family: nil,
        # Font outline for subtitles
        font_outline: nil,
        # Font shadow for subtitles
        font_shadow: nil,
        # Font size for subtitles
        font_size: nil,
        # Typography style for subtitles
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
            font_size:
              Imagekit::SubtitleOverlayTransformation::FontSize::Variants,
            typography:
              Imagekit::SubtitleOverlayTransformation::Typography::OrSymbol
          }
        )
      end
      def to_hash
      end

      # Font size for subtitles
      module FontSize
        extend Imagekit::Internal::Type::Union

        Variants = T.type_alias { T.any(Float, String) }

        sig do
          override.returns(
            T::Array[
              Imagekit::SubtitleOverlayTransformation::FontSize::Variants
            ]
          )
        end
        def self.variants
        end
      end

      # Typography style for subtitles
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
