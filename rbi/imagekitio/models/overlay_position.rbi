# typed: strong

module Imagekitio
  module Models
    class OverlayPosition < Imagekitio::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(Imagekitio::OverlayPosition, Imagekitio::Internal::AnyHash)
        end

      # Sets the anchor point on the base asset from which the overlay offset is
      # calculated. The default value is `top_left`. Maps to `lap` in the URL. Can only
      # be used with one or more of `x`, `y`, `xCenter`, or `yCenter`.
      sig do
        returns(T.nilable(Imagekitio::OverlayPosition::AnchorPoint::OrSymbol))
      end
      attr_reader :anchor_point

      sig do
        params(
          anchor_point: Imagekitio::OverlayPosition::AnchorPoint::OrSymbol
        ).void
      end
      attr_writer :anchor_point

      # Specifies the position of the overlay relative to the parent image or video. If
      # one or more of `x`, `y`, `xCenter`, or `yCenter` parameters are specified, this
      # parameter is ignored. Maps to `lfo` in the URL.
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

      # Specifies the x-coordinate on the base asset where the overlay's center will be
      # positioned. It also accepts arithmetic expressions such as `bw_mul_0.4` or
      # `bw_sub_cw`. Maps to `lxc` in the URL. Cannot be used together with `x`, but can
      # be used with `y`. Learn about
      # [Arithmetic expressions](https://imagekit.io/docs/arithmetic-expressions-in-transformations).
      sig { returns(T.nilable(Imagekitio::OverlayPosition::XCenter::Variants)) }
      attr_reader :x_center

      sig do
        params(x_center: Imagekitio::OverlayPosition::XCenter::Variants).void
      end
      attr_writer :x_center

      # Specifies the y-coordinate of the top-left corner of the base asset where the
      # overlay's top-left corner will be positioned. It also accepts arithmetic
      # expressions such as `bh_mul_0.4` or `bh_sub_ch`. Maps to `ly` in the URL. Learn
      # about
      # [Arithmetic expressions](https://imagekit.io/docs/arithmetic-expressions-in-transformations).
      sig { returns(T.nilable(Imagekitio::OverlayPosition::Y::Variants)) }
      attr_reader :y_

      sig { params(y_: Imagekitio::OverlayPosition::Y::Variants).void }
      attr_writer :y_

      # Specifies the y-coordinate on the base asset where the overlay's center will be
      # positioned. It also accepts arithmetic expressions such as `bh_mul_0.4` or
      # `bh_sub_ch`. Maps to `lyc` in the URL. Cannot be used together with `y`, but can
      # be used with `x`. Learn about
      # [Arithmetic expressions](https://imagekit.io/docs/arithmetic-expressions-in-transformations).
      sig { returns(T.nilable(Imagekitio::OverlayPosition::YCenter::Variants)) }
      attr_reader :y_center

      sig do
        params(y_center: Imagekitio::OverlayPosition::YCenter::Variants).void
      end
      attr_writer :y_center

      sig do
        params(
          anchor_point: Imagekitio::OverlayPosition::AnchorPoint::OrSymbol,
          focus: Imagekitio::OverlayPosition::Focus::OrSymbol,
          x: Imagekitio::OverlayPosition::X::Variants,
          x_center: Imagekitio::OverlayPosition::XCenter::Variants,
          y_: Imagekitio::OverlayPosition::Y::Variants,
          y_center: Imagekitio::OverlayPosition::YCenter::Variants
        ).returns(T.attached_class)
      end
      def self.new(
        # Sets the anchor point on the base asset from which the overlay offset is
        # calculated. The default value is `top_left`. Maps to `lap` in the URL. Can only
        # be used with one or more of `x`, `y`, `xCenter`, or `yCenter`.
        anchor_point: nil,
        # Specifies the position of the overlay relative to the parent image or video. If
        # one or more of `x`, `y`, `xCenter`, or `yCenter` parameters are specified, this
        # parameter is ignored. Maps to `lfo` in the URL.
        focus: nil,
        # Specifies the x-coordinate of the top-left corner of the base asset where the
        # overlay's top-left corner will be positioned. It also accepts arithmetic
        # expressions such as `bw_mul_0.4` or `bw_sub_cw`. Maps to `lx` in the URL. Learn
        # about
        # [Arithmetic expressions](https://imagekit.io/docs/arithmetic-expressions-in-transformations).
        x: nil,
        # Specifies the x-coordinate on the base asset where the overlay's center will be
        # positioned. It also accepts arithmetic expressions such as `bw_mul_0.4` or
        # `bw_sub_cw`. Maps to `lxc` in the URL. Cannot be used together with `x`, but can
        # be used with `y`. Learn about
        # [Arithmetic expressions](https://imagekit.io/docs/arithmetic-expressions-in-transformations).
        x_center: nil,
        # Specifies the y-coordinate of the top-left corner of the base asset where the
        # overlay's top-left corner will be positioned. It also accepts arithmetic
        # expressions such as `bh_mul_0.4` or `bh_sub_ch`. Maps to `ly` in the URL. Learn
        # about
        # [Arithmetic expressions](https://imagekit.io/docs/arithmetic-expressions-in-transformations).
        y_: nil,
        # Specifies the y-coordinate on the base asset where the overlay's center will be
        # positioned. It also accepts arithmetic expressions such as `bh_mul_0.4` or
        # `bh_sub_ch`. Maps to `lyc` in the URL. Cannot be used together with `y`, but can
        # be used with `x`. Learn about
        # [Arithmetic expressions](https://imagekit.io/docs/arithmetic-expressions-in-transformations).
        y_center: nil
      )
      end

      sig do
        override.returns(
          {
            anchor_point: Imagekitio::OverlayPosition::AnchorPoint::OrSymbol,
            focus: Imagekitio::OverlayPosition::Focus::OrSymbol,
            x: Imagekitio::OverlayPosition::X::Variants,
            x_center: Imagekitio::OverlayPosition::XCenter::Variants,
            y_: Imagekitio::OverlayPosition::Y::Variants,
            y_center: Imagekitio::OverlayPosition::YCenter::Variants
          }
        )
      end
      def to_hash
      end

      # Sets the anchor point on the base asset from which the overlay offset is
      # calculated. The default value is `top_left`. Maps to `lap` in the URL. Can only
      # be used with one or more of `x`, `y`, `xCenter`, or `yCenter`.
      module AnchorPoint
        extend Imagekitio::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias do
            T.all(Symbol, Imagekitio::OverlayPosition::AnchorPoint)
          end
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        TOP =
          T.let(:top, Imagekitio::OverlayPosition::AnchorPoint::TaggedSymbol)
        LEFT =
          T.let(:left, Imagekitio::OverlayPosition::AnchorPoint::TaggedSymbol)
        RIGHT =
          T.let(:right, Imagekitio::OverlayPosition::AnchorPoint::TaggedSymbol)
        BOTTOM =
          T.let(:bottom, Imagekitio::OverlayPosition::AnchorPoint::TaggedSymbol)
        TOP_LEFT =
          T.let(
            :top_left,
            Imagekitio::OverlayPosition::AnchorPoint::TaggedSymbol
          )
        TOP_RIGHT =
          T.let(
            :top_right,
            Imagekitio::OverlayPosition::AnchorPoint::TaggedSymbol
          )
        BOTTOM_LEFT =
          T.let(
            :bottom_left,
            Imagekitio::OverlayPosition::AnchorPoint::TaggedSymbol
          )
        BOTTOM_RIGHT =
          T.let(
            :bottom_right,
            Imagekitio::OverlayPosition::AnchorPoint::TaggedSymbol
          )
        CENTER =
          T.let(:center, Imagekitio::OverlayPosition::AnchorPoint::TaggedSymbol)

        sig do
          override.returns(
            T::Array[Imagekitio::OverlayPosition::AnchorPoint::TaggedSymbol]
          )
        end
        def self.values
        end
      end

      # Specifies the position of the overlay relative to the parent image or video. If
      # one or more of `x`, `y`, `xCenter`, or `yCenter` parameters are specified, this
      # parameter is ignored. Maps to `lfo` in the URL.
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

      # Specifies the x-coordinate on the base asset where the overlay's center will be
      # positioned. It also accepts arithmetic expressions such as `bw_mul_0.4` or
      # `bw_sub_cw`. Maps to `lxc` in the URL. Cannot be used together with `x`, but can
      # be used with `y`. Learn about
      # [Arithmetic expressions](https://imagekit.io/docs/arithmetic-expressions-in-transformations).
      module XCenter
        extend Imagekitio::Internal::Type::Union

        Variants = T.type_alias { T.any(Float, String) }

        sig do
          override.returns(
            T::Array[Imagekitio::OverlayPosition::XCenter::Variants]
          )
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

      # Specifies the y-coordinate on the base asset where the overlay's center will be
      # positioned. It also accepts arithmetic expressions such as `bh_mul_0.4` or
      # `bh_sub_ch`. Maps to `lyc` in the URL. Cannot be used together with `y`, but can
      # be used with `x`. Learn about
      # [Arithmetic expressions](https://imagekit.io/docs/arithmetic-expressions-in-transformations).
      module YCenter
        extend Imagekitio::Internal::Type::Union

        Variants = T.type_alias { T.any(Float, String) }

        sig do
          override.returns(
            T::Array[Imagekitio::OverlayPosition::YCenter::Variants]
          )
        end
        def self.variants
        end
      end
    end
  end
end
