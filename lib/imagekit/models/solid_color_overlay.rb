# frozen_string_literal: true

module Imagekit
  module Models
    class SolidColorOverlay < Imagekit::Models::BaseOverlay
      # @!attribute color
      #   Specifies the color of the block using an RGB hex code (e.g., `FF0000`), an RGBA
      #   code (e.g., `FFAABB50`), or a color name (e.g., `red`). If an 8-character value
      #   is provided, the last two characters represent the opacity level (from `00` for
      #   0.00 to `99` for 0.99).
      #
      #   @return [String]
      required :color, String

      # @!attribute type
      #
      #   @return [Symbol, Imagekit::Models::SolidColorOverlay::Type]
      required :type, enum: -> { Imagekit::SolidColorOverlay::Type }

      # @!attribute transformation
      #   Control width and height of the solid color overlay. Supported transformations
      #   depend on the base/parent asset.
      #
      #   @return [Array<Imagekit::Models::SolidColorOverlayTransformation>, nil]
      optional :transformation,
               -> { Imagekit::Internal::Type::ArrayOf[Imagekit::SolidColorOverlayTransformation] }

      # @!method initialize(color:, type:, transformation: nil)
      #   Some parameter documentations has been truncated, see
      #   {Imagekit::Models::SolidColorOverlay} for more details.
      #
      #   @param color [String] Specifies the color of the block using an RGB hex code (e.g., `FF0000`), an RGBA
      #
      #   @param type [Symbol, Imagekit::Models::SolidColorOverlay::Type]
      #
      #   @param transformation [Array<Imagekit::Models::SolidColorOverlayTransformation>] Control width and height of the solid color overlay. Supported transformations d

      module Type
        extend Imagekit::Internal::Type::Enum

        SOLID_COLOR = :solidColor

        # @!method self.values
        #   @return [Array<Symbol>]
      end
    end
  end
end
