# frozen_string_literal: true

module Imagekitio
  module Models
    class OverlayPosition < Imagekitio::Internal::Type::BaseModel
      # @!attribute anchor_point
      #   Sets the anchor point on the base asset from which the overlay offset is
      #   calculated. The default value is `top_left`. Maps to `lap` in the URL. Can only
      #   be used with one or more of `x`, `y`, `xCenter`, or `yCenter`.
      #
      #   @return [Symbol, Imagekitio::Models::OverlayPosition::AnchorPoint, nil]
      optional :anchor_point, enum: -> { Imagekitio::OverlayPosition::AnchorPoint }, api_name: :anchorPoint

      # @!attribute focus
      #   Specifies the position of the overlay relative to the parent image or video. If
      #   one or more of `x`, `y`, `xCenter`, or `yCenter` parameters are specified, this
      #   parameter is ignored. Maps to `lfo` in the URL.
      #
      #   @return [Symbol, Imagekitio::Models::OverlayPosition::Focus, nil]
      optional :focus, enum: -> { Imagekitio::OverlayPosition::Focus }

      # @!attribute x
      #   Specifies the x-coordinate of the top-left corner of the base asset where the
      #   overlay's top-left corner will be positioned. It also accepts arithmetic
      #   expressions such as `bw_mul_0.4` or `bw_sub_cw`. Maps to `lx` in the URL. Learn
      #   about
      #   [Arithmetic expressions](https://imagekit.io/docs/arithmetic-expressions-in-transformations).
      #
      #   @return [Float, String, nil]
      optional :x, union: -> { Imagekitio::OverlayPosition::X }

      # @!attribute x_center
      #   Specifies the x-coordinate on the base asset where the overlay's center will be
      #   positioned. It also accepts arithmetic expressions such as `bw_mul_0.4` or
      #   `bw_sub_cw`. Maps to `lxc` in the URL. Cannot be used together with `x`, but can
      #   be used with `y`. Learn about
      #   [Arithmetic expressions](https://imagekit.io/docs/arithmetic-expressions-in-transformations).
      #
      #   @return [Float, String, nil]
      optional :x_center, union: -> { Imagekitio::OverlayPosition::XCenter }, api_name: :xCenter

      # @!attribute y_
      #   Specifies the y-coordinate of the top-left corner of the base asset where the
      #   overlay's top-left corner will be positioned. It also accepts arithmetic
      #   expressions such as `bh_mul_0.4` or `bh_sub_ch`. Maps to `ly` in the URL. Learn
      #   about
      #   [Arithmetic expressions](https://imagekit.io/docs/arithmetic-expressions-in-transformations).
      #
      #   @return [Float, String, nil]
      optional :y_, union: -> { Imagekitio::OverlayPosition::Y }, api_name: :y

      # @!attribute y_center
      #   Specifies the y-coordinate on the base asset where the overlay's center will be
      #   positioned. It also accepts arithmetic expressions such as `bh_mul_0.4` or
      #   `bh_sub_ch`. Maps to `lyc` in the URL. Cannot be used together with `y`, but can
      #   be used with `x`. Learn about
      #   [Arithmetic expressions](https://imagekit.io/docs/arithmetic-expressions-in-transformations).
      #
      #   @return [Float, String, nil]
      optional :y_center, union: -> { Imagekitio::OverlayPosition::YCenter }, api_name: :yCenter

      # @!method initialize(anchor_point: nil, focus: nil, x: nil, x_center: nil, y_: nil, y_center: nil)
      #   Some parameter documentations has been truncated, see
      #   {Imagekitio::Models::OverlayPosition} for more details.
      #
      #   @param anchor_point [Symbol, Imagekitio::Models::OverlayPosition::AnchorPoint] Sets the anchor point on the base asset from which the overlay offset is calcula
      #
      #   @param focus [Symbol, Imagekitio::Models::OverlayPosition::Focus] Specifies the position of the overlay relative to the parent image or video.
      #
      #   @param x [Float, String] Specifies the x-coordinate of the top-left corner of the base asset where the ov
      #
      #   @param x_center [Float, String] Specifies the x-coordinate on the base asset where the overlay's center will be
      #
      #   @param y_ [Float, String] Specifies the y-coordinate of the top-left corner of the base asset where the ov
      #
      #   @param y_center [Float, String] Specifies the y-coordinate on the base asset where the overlay's center will be

      # Sets the anchor point on the base asset from which the overlay offset is
      # calculated. The default value is `top_left`. Maps to `lap` in the URL. Can only
      # be used with one or more of `x`, `y`, `xCenter`, or `yCenter`.
      #
      # @see Imagekitio::Models::OverlayPosition#anchor_point
      module AnchorPoint
        extend Imagekitio::Internal::Type::Enum

        TOP = :top
        LEFT = :left
        RIGHT = :right
        BOTTOM = :bottom
        TOP_LEFT = :top_left
        TOP_RIGHT = :top_right
        BOTTOM_LEFT = :bottom_left
        BOTTOM_RIGHT = :bottom_right
        CENTER = :center

        # @!method self.values
        #   @return [Array<Symbol>]
      end

      # Specifies the position of the overlay relative to the parent image or video. If
      # one or more of `x`, `y`, `xCenter`, or `yCenter` parameters are specified, this
      # parameter is ignored. Maps to `lfo` in the URL.
      #
      # @see Imagekitio::Models::OverlayPosition#focus
      module Focus
        extend Imagekitio::Internal::Type::Enum

        CENTER = :center
        TOP = :top
        LEFT = :left
        BOTTOM = :bottom
        RIGHT = :right
        TOP_LEFT = :top_left
        TOP_RIGHT = :top_right
        BOTTOM_LEFT = :bottom_left
        BOTTOM_RIGHT = :bottom_right

        # @!method self.values
        #   @return [Array<Symbol>]
      end

      # Specifies the x-coordinate of the top-left corner of the base asset where the
      # overlay's top-left corner will be positioned. It also accepts arithmetic
      # expressions such as `bw_mul_0.4` or `bw_sub_cw`. Maps to `lx` in the URL. Learn
      # about
      # [Arithmetic expressions](https://imagekit.io/docs/arithmetic-expressions-in-transformations).
      #
      # @see Imagekitio::Models::OverlayPosition#x
      module X
        extend Imagekitio::Internal::Type::Union

        variant Float

        variant String

        # @!method self.variants
        #   @return [Array(Float, String)]
      end

      # Specifies the x-coordinate on the base asset where the overlay's center will be
      # positioned. It also accepts arithmetic expressions such as `bw_mul_0.4` or
      # `bw_sub_cw`. Maps to `lxc` in the URL. Cannot be used together with `x`, but can
      # be used with `y`. Learn about
      # [Arithmetic expressions](https://imagekit.io/docs/arithmetic-expressions-in-transformations).
      #
      # @see Imagekitio::Models::OverlayPosition#x_center
      module XCenter
        extend Imagekitio::Internal::Type::Union

        variant Float

        variant String

        # @!method self.variants
        #   @return [Array(Float, String)]
      end

      # Specifies the y-coordinate of the top-left corner of the base asset where the
      # overlay's top-left corner will be positioned. It also accepts arithmetic
      # expressions such as `bh_mul_0.4` or `bh_sub_ch`. Maps to `ly` in the URL. Learn
      # about
      # [Arithmetic expressions](https://imagekit.io/docs/arithmetic-expressions-in-transformations).
      #
      # @see Imagekitio::Models::OverlayPosition#y_
      module Y
        extend Imagekitio::Internal::Type::Union

        variant Float

        variant String

        # @!method self.variants
        #   @return [Array(Float, String)]
      end

      # Specifies the y-coordinate on the base asset where the overlay's center will be
      # positioned. It also accepts arithmetic expressions such as `bh_mul_0.4` or
      # `bh_sub_ch`. Maps to `lyc` in the URL. Cannot be used together with `y`, but can
      # be used with `x`. Learn about
      # [Arithmetic expressions](https://imagekit.io/docs/arithmetic-expressions-in-transformations).
      #
      # @see Imagekitio::Models::OverlayPosition#y_center
      module YCenter
        extend Imagekitio::Internal::Type::Union

        variant Float

        variant String

        # @!method self.variants
        #   @return [Array(Float, String)]
      end
    end
  end
end
