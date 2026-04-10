# typed: strong

module Imagekitio
  module Models
    class OverlayPosition < Imagekitio::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(Imagekitio::OverlayPosition, Imagekitio::Internal::AnyHash)
        end

      # Specifies the position of the overlay relative to the parent image or video.
      # Maps to `lfo` in the URL.
      sig { returns(T.nilable(Imagekitio::OverlayPosition::Focus::OrSymbol)) }
      attr_reader :focus

      sig { params(focus: Imagekitio::OverlayPosition::Focus::OrSymbol).void }
      attr_writer :focus

      # Specifies the x-coordinate of the top-left corner of the base asset where the
      # overlay's top-left corner will be positioned. It also accepts arithmetic
      # expressions such as `bw_mul_0.4` or `bw_sub_cw`. Maps to `lx` in the URL. Learn
      # about
      # [Arithmetic expressions](https://imagekit.io/docs/arithmetic-expressions-in-transformations).
      sig { returns(T.nilable(Imagekitio::OverlayPosition::X::Variants)) }
      attr_reader :x

      sig { params(x: Imagekitio::OverlayPosition::X::Variants).void }
      attr_writer :x

      # Specifies the y-coordinate of the top-left corner of the base asset where the
      # overlay's top-left corner will be positioned. It also accepts arithmetic
      # expressions such as `bh_mul_0.4` or `bh_sub_ch`. Maps to `ly` in the URL. Learn
      # about
      # [Arithmetic expressions](https://imagekit.io/docs/arithmetic-expressions-in-transformations).
      sig { returns(T.nilable(Imagekitio::OverlayPosition::Y::Variants)) }
      attr_reader :y_

      sig { params(y_: Imagekitio::OverlayPosition::Y::Variants).void }
      attr_writer :y_

      sig do
        params(
          focus: Imagekitio::OverlayPosition::Focus::OrSymbol,
          x: Imagekitio::OverlayPosition::X::Variants,
          y_: Imagekitio::OverlayPosition::Y::Variants
        ).returns(T.attached_class)
      end
      def self.new(
        # Specifies the position of the overlay relative to the parent image or video.
        # Maps to `lfo` in the URL.
        focus: nil,
        # Specifies the x-coordinate of the top-left corner of the base asset where the
        # overlay's top-left corner will be positioned. It also accepts arithmetic
        # expressions such as `bw_mul_0.4` or `bw_sub_cw`. Maps to `lx` in the URL. Learn
        # about
        # [Arithmetic expressions](https://imagekit.io/docs/arithmetic-expressions-in-transformations).
        x: nil,
        # Specifies the y-coordinate of the top-left corner of the base asset where the
        # overlay's top-left corner will be positioned. It also accepts arithmetic
        # expressions such as `bh_mul_0.4` or `bh_sub_ch`. Maps to `ly` in the URL. Learn
        # about
        # [Arithmetic expressions](https://imagekit.io/docs/arithmetic-expressions-in-transformations).
        y_: nil
      )
      end

      sig do
        override.returns(
          {
            focus: Imagekitio::OverlayPosition::Focus::OrSymbol,
            x: Imagekitio::OverlayPosition::X::Variants,
            y_: Imagekitio::OverlayPosition::Y::Variants
          }
        )
      end
      def to_hash
      end

      # Specifies the position of the overlay relative to the parent image or video.
      # Maps to `lfo` in the URL.
      module Focus
        extend Imagekitio::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias { T.all(Symbol, Imagekitio::OverlayPosition::Focus) }
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        CENTER =
          T.let(:center, Imagekitio::OverlayPosition::Focus::TaggedSymbol)
        TOP = T.let(:top, Imagekitio::OverlayPosition::Focus::TaggedSymbol)
        LEFT = T.let(:left, Imagekitio::OverlayPosition::Focus::TaggedSymbol)
        BOTTOM =
          T.let(:bottom, Imagekitio::OverlayPosition::Focus::TaggedSymbol)
        RIGHT = T.let(:right, Imagekitio::OverlayPosition::Focus::TaggedSymbol)
        TOP_LEFT =
          T.let(:top_left, Imagekitio::OverlayPosition::Focus::TaggedSymbol)
        TOP_RIGHT =
          T.let(:top_right, Imagekitio::OverlayPosition::Focus::TaggedSymbol)
        BOTTOM_LEFT =
          T.let(:bottom_left, Imagekitio::OverlayPosition::Focus::TaggedSymbol)
        BOTTOM_RIGHT =
          T.let(:bottom_right, Imagekitio::OverlayPosition::Focus::TaggedSymbol)

        sig do
          override.returns(
            T::Array[Imagekitio::OverlayPosition::Focus::TaggedSymbol]
          )
        end
        def self.values
        end
      end

      # Specifies the x-coordinate of the top-left corner of the base asset where the
      # overlay's top-left corner will be positioned. It also accepts arithmetic
      # expressions such as `bw_mul_0.4` or `bw_sub_cw`. Maps to `lx` in the URL. Learn
      # about
      # [Arithmetic expressions](https://imagekit.io/docs/arithmetic-expressions-in-transformations).
      module X
        extend Imagekitio::Internal::Type::Union

        Variants = T.type_alias { T.any(Float, String) }

        sig do
          override.returns(T::Array[Imagekitio::OverlayPosition::X::Variants])
        end
        def self.variants
        end
      end

      # Specifies the y-coordinate of the top-left corner of the base asset where the
      # overlay's top-left corner will be positioned. It also accepts arithmetic
      # expressions such as `bh_mul_0.4` or `bh_sub_ch`. Maps to `ly` in the URL. Learn
      # about
      # [Arithmetic expressions](https://imagekit.io/docs/arithmetic-expressions-in-transformations).
      module Y
        extend Imagekitio::Internal::Type::Union

        Variants = T.type_alias { T.any(Float, String) }

        sig do
          override.returns(T::Array[Imagekitio::OverlayPosition::Y::Variants])
        end
        def self.variants
        end
      end
    end
  end
end
