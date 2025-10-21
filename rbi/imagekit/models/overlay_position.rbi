# typed: strong

module Imagekit
  module Models
    class OverlayPosition < Imagekit::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(Imagekit::OverlayPosition, Imagekit::Internal::AnyHash)
        end

      # Specifies the position of the overlay relative to the parent image or video.
      # Maps to `lfo` in the URL.
      sig { returns(T.nilable(Imagekit::OverlayPosition::Focus::TaggedSymbol)) }
      attr_reader :focus

      sig { params(focus: Imagekit::OverlayPosition::Focus::OrSymbol).void }
      attr_writer :focus

      # Specifies the x-coordinate of the top-left corner of the base asset where the
      # overlay's top-left corner will be positioned. It also accepts arithmetic
      # expressions such as `bw_mul_0.4` or `bw_sub_cw`. Maps to `lx` in the URL. Learn
      # about
      # [Arithmetic expressions](https://imagekit.io/docs/arithmetic-expressions-in-transformations).
      sig { returns(T.nilable(Imagekit::OverlayPosition::X::Variants)) }
      attr_reader :x

      sig { params(x: Imagekit::OverlayPosition::X::Variants).void }
      attr_writer :x

      # Specifies the y-coordinate of the top-left corner of the base asset where the
      # overlay's top-left corner will be positioned. It also accepts arithmetic
      # expressions such as `bh_mul_0.4` or `bh_sub_ch`. Maps to `ly` in the URL. Learn
      # about
      # [Arithmetic expressions](https://imagekit.io/docs/arithmetic-expressions-in-transformations).
      sig { returns(T.nilable(Imagekit::OverlayPosition::Y::Variants)) }
      attr_reader :y_

      sig { params(y_: Imagekit::OverlayPosition::Y::Variants).void }
      attr_writer :y_

      sig do
        params(
          focus: Imagekit::OverlayPosition::Focus::OrSymbol,
          x: Imagekit::OverlayPosition::X::Variants,
          y_: Imagekit::OverlayPosition::Y::Variants
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
            focus: Imagekit::OverlayPosition::Focus::TaggedSymbol,
            x: Imagekit::OverlayPosition::X::Variants,
            y_: Imagekit::OverlayPosition::Y::Variants
          }
        )
      end
      def to_hash
      end

      # Specifies the position of the overlay relative to the parent image or video.
      # Maps to `lfo` in the URL.
      module Focus
        extend Imagekit::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias { T.all(Symbol, Imagekit::OverlayPosition::Focus) }
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        CENTER = T.let(:center, Imagekit::OverlayPosition::Focus::TaggedSymbol)
        TOP = T.let(:top, Imagekit::OverlayPosition::Focus::TaggedSymbol)
        LEFT = T.let(:left, Imagekit::OverlayPosition::Focus::TaggedSymbol)
        BOTTOM = T.let(:bottom, Imagekit::OverlayPosition::Focus::TaggedSymbol)
        RIGHT = T.let(:right, Imagekit::OverlayPosition::Focus::TaggedSymbol)
        TOP_LEFT =
          T.let(:top_left, Imagekit::OverlayPosition::Focus::TaggedSymbol)
        TOP_RIGHT =
          T.let(:top_right, Imagekit::OverlayPosition::Focus::TaggedSymbol)
        BOTTOM_LEFT =
          T.let(:bottom_left, Imagekit::OverlayPosition::Focus::TaggedSymbol)
        BOTTOM_RIGHT =
          T.let(:bottom_right, Imagekit::OverlayPosition::Focus::TaggedSymbol)

        sig do
          override.returns(
            T::Array[Imagekit::OverlayPosition::Focus::TaggedSymbol]
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
        extend Imagekit::Internal::Type::Union

        Variants = T.type_alias { T.any(Float, String) }

        sig do
          override.returns(T::Array[Imagekit::OverlayPosition::X::Variants])
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
        extend Imagekit::Internal::Type::Union

        Variants = T.type_alias { T.any(Float, String) }

        sig do
          override.returns(T::Array[Imagekit::OverlayPosition::Y::Variants])
        end
        def self.variants
        end
      end
    end
  end
end
