# frozen_string_literal: true

module Imagekitio
  module Models
    class BaseOverlay < Imagekitio::Internal::Type::BaseModel
      # @!attribute layer_mode
      #   Controls how the layer blends with the base image or underlying content. Maps to
      #   `lm` in the URL. By default, layers completely cover the base image beneath
      #   them. Layer modes change this behavior:
      #
      #   - `multiply`: Multiplies the pixel values of the layer with the base image. The
      #     result is always darker than the original images. This is ideal for applying
      #     shadows or color tints.
      #   - `displace`: Uses the layer as a displacement map to distort pixels in the base
      #     image. The red channel controls horizontal displacement, and the green channel
      #     controls vertical displacement. Requires `x` or `y` parameter to control
      #     displacement magnitude.
      #   - `cutout`: Acts as an inverse mask where opaque areas of the layer turn the
      #     base image transparent, while transparent areas leave the base image
      #     unchanged. This mode functions like a hole-punch, effectively cutting the
      #     shape of the layer out of the underlying image.
      #   - `cutter`: Acts as a shape mask where only the parts of the base image that
      #     fall inside the opaque area of the layer are preserved. This mode functions
      #     like a cookie-cutter, trimming the base image to match the specific dimensions
      #     and shape of the layer. See
      #     [Layer modes](https://imagekit.io/docs/add-overlays-on-images#layer-modes).
      #
      #   @return [Symbol, Imagekitio::Models::BaseOverlay::LayerMode, nil]
      optional :layer_mode, enum: -> { Imagekitio::BaseOverlay::LayerMode }, api_name: :layerMode

      # @!attribute position
      #   Specifies the overlay's position relative to the parent asset. See
      #   [Position of Layer](https://imagekit.io/docs/transformations#position-of-layer).
      #
      #   @return [Imagekitio::Models::OverlayPosition, nil]
      optional :position, -> { Imagekitio::OverlayPosition }

      # @!attribute timing
      #   Specifies timing information for the overlay (only applicable if the base asset
      #   is a video). See
      #   [Position of Layer](https://imagekit.io/docs/transformations#position-of-layer).
      #
      #   @return [Imagekitio::Models::OverlayTiming, nil]
      optional :timing, -> { Imagekitio::OverlayTiming }

      # @!method initialize(layer_mode: nil, position: nil, timing: nil)
      #   Some parameter documentations has been truncated, see
      #   {Imagekitio::Models::BaseOverlay} for more details.
      #
      #   @param layer_mode [Symbol, Imagekitio::Models::BaseOverlay::LayerMode] Controls how the layer blends with the base image or underlying content. Maps to
      #
      #   @param position [Imagekitio::Models::OverlayPosition] Specifies the overlay's position relative to the parent asset.
      #
      #   @param timing [Imagekitio::Models::OverlayTiming] Specifies timing information for the overlay (only applicable if the base asset

      # Controls how the layer blends with the base image or underlying content. Maps to
      # `lm` in the URL. By default, layers completely cover the base image beneath
      # them. Layer modes change this behavior:
      #
      # - `multiply`: Multiplies the pixel values of the layer with the base image. The
      #   result is always darker than the original images. This is ideal for applying
      #   shadows or color tints.
      # - `displace`: Uses the layer as a displacement map to distort pixels in the base
      #   image. The red channel controls horizontal displacement, and the green channel
      #   controls vertical displacement. Requires `x` or `y` parameter to control
      #   displacement magnitude.
      # - `cutout`: Acts as an inverse mask where opaque areas of the layer turn the
      #   base image transparent, while transparent areas leave the base image
      #   unchanged. This mode functions like a hole-punch, effectively cutting the
      #   shape of the layer out of the underlying image.
      # - `cutter`: Acts as a shape mask where only the parts of the base image that
      #   fall inside the opaque area of the layer are preserved. This mode functions
      #   like a cookie-cutter, trimming the base image to match the specific dimensions
      #   and shape of the layer. See
      #   [Layer modes](https://imagekit.io/docs/add-overlays-on-images#layer-modes).
      #
      # @see Imagekitio::Models::BaseOverlay#layer_mode
      module LayerMode
        extend Imagekitio::Internal::Type::Enum

        MULTIPLY = :multiply
        CUTTER = :cutter
        CUTOUT = :cutout
        DISPLACE = :displace

        # @!method self.values
        #   @return [Array<Symbol>]
      end
    end
  end
end
