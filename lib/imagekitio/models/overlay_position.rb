# frozen_string_literal: true

module Imagekitio
  module Models
    class OverlayPosition < Imagekitio::Internal::Type::BaseModel
      # @!attribute focus
      #   Specifies the position of the overlay relative to the parent image or video.
      #   Maps to `lfo` in the URL.
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

      # @!attribute y_
      #   Specifies the y-coordinate of the top-left corner of the base asset where the
      #   overlay's top-left corner will be positioned. It also accepts arithmetic
      #   expressions such as `bh_mul_0.4` or `bh_sub_ch`. Maps to `ly` in the URL. Learn
      #   about
      #   [Arithmetic expressions](https://imagekit.io/docs/arithmetic-expressions-in-transformations).
      #
      #   @return [Float, String, nil]
      optional :y_, union: -> { Imagekitio::OverlayPosition::Y }, api_name: :y

      # @!method initialize(focus: nil, x: nil, y_: nil)
      #   Some parameter documentations has been truncated, see
      #   {Imagekitio::Models::OverlayPosition} for more details.
      #
      #   @param focus [Symbol, Imagekitio::Models::OverlayPosition::Focus] Specifies the position of the overlay relative to the parent image or video.
      #
      #   @param x [Float, String] Specifies the x-coordinate of the top-left corner of the base asset where the ov
      #
      #   @param y_ [Float, String] Specifies the y-coordinate of the top-left corner of the base asset where the ov

      # Specifies the position of the overlay relative to the parent image or video.
      # Maps to `lfo` in the URL.
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
    end
  end
end
