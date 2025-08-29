# frozen_string_literal: true

module Imagekit
  module Models
    class SolidColorOverlayTransformation < Imagekit::Internal::Type::BaseModel
      # @!attribute alpha
      #   Alpha transparency level
      #
      #   @return [Float, nil]
      optional :alpha, Float

      # @!attribute background
      #   Background color
      #
      #   @return [String, nil]
      optional :background, String

      # @!attribute gradient
      #   Gradient effect for the overlay
      #
      #   @return [Boolean, String, Imagekit::Models::SolidColorOverlayTransformation::Gradient, nil]
      optional :gradient, union: -> { Imagekit::SolidColorOverlayTransformation::Gradient }

      # @!attribute height
      #   Height of the solid color overlay
      #
      #   @return [Float, String, nil]
      optional :height, union: -> { Imagekit::SolidColorOverlayTransformation::Height }

      # @!attribute radius
      #   Corner radius of the solid color overlay
      #
      #   @return [Float, Symbol, Imagekit::Models::SolidColorOverlayTransformation::Radius, nil]
      optional :radius, union: -> { Imagekit::SolidColorOverlayTransformation::Radius }

      # @!attribute width
      #   Width of the solid color overlay
      #
      #   @return [Float, String, nil]
      optional :width, union: -> { Imagekit::SolidColorOverlayTransformation::Width }

      # @!method initialize(alpha: nil, background: nil, gradient: nil, height: nil, radius: nil, width: nil)
      #   @param alpha [Float] Alpha transparency level
      #
      #   @param background [String] Background color
      #
      #   @param gradient [Boolean, String, Imagekit::Models::SolidColorOverlayTransformation::Gradient] Gradient effect for the overlay
      #
      #   @param height [Float, String] Height of the solid color overlay
      #
      #   @param radius [Float, Symbol, Imagekit::Models::SolidColorOverlayTransformation::Radius] Corner radius of the solid color overlay
      #
      #   @param width [Float, String] Width of the solid color overlay

      # Gradient effect for the overlay
      #
      # @see Imagekit::Models::SolidColorOverlayTransformation#gradient
      module Gradient
        extend Imagekit::Internal::Type::Union

        variant const: -> { Imagekit::Models::SolidColorOverlayTransformation::Gradient::TRUE }

        variant String

        # @!method self.variants
        #   @return [Array(Boolean, String)]

        define_sorbet_constant!(:Variants) do
          T.type_alias { T.any(Imagekit::SolidColorOverlayTransformation::Gradient::TaggedBoolean, String) }
        end

        # @!group

        TRUE = true

        # @!endgroup
      end

      # Height of the solid color overlay
      #
      # @see Imagekit::Models::SolidColorOverlayTransformation#height
      module Height
        extend Imagekit::Internal::Type::Union

        variant Float

        variant String

        # @!method self.variants
        #   @return [Array(Float, String)]
      end

      # Corner radius of the solid color overlay
      #
      # @see Imagekit::Models::SolidColorOverlayTransformation#radius
      module Radius
        extend Imagekit::Internal::Type::Union

        variant Float

        variant const: -> { Imagekit::Models::SolidColorOverlayTransformation::Radius::MAX }

        # @!method self.variants
        #   @return [Array(Float, Symbol)]

        define_sorbet_constant!(:Variants) do
          T.type_alias { T.any(Float, Imagekit::SolidColorOverlayTransformation::Radius::TaggedSymbol) }
        end

        # @!group

        MAX = :max

        # @!endgroup
      end

      # Width of the solid color overlay
      #
      # @see Imagekit::Models::SolidColorOverlayTransformation#width
      module Width
        extend Imagekit::Internal::Type::Union

        variant Float

        variant String

        # @!method self.variants
        #   @return [Array(Float, String)]
      end
    end
  end
end
