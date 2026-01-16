# typed: strong

module Imagekitio
  module Models
    class BaseOverlay < Imagekitio::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(Imagekitio::BaseOverlay, Imagekitio::Internal::AnyHash)
        end

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
      sig { returns(T.nilable(Imagekitio::BaseOverlay::LayerMode::OrSymbol)) }
      attr_reader :layer_mode

      sig do
        params(layer_mode: Imagekitio::BaseOverlay::LayerMode::OrSymbol).void
      end
      attr_writer :layer_mode

      # Specifies the overlay's position relative to the parent asset. See
      # [Position of Layer](https://imagekit.io/docs/transformations#position-of-layer).
      sig { returns(T.nilable(Imagekitio::OverlayPosition)) }
      attr_reader :position

      sig { params(position: Imagekitio::OverlayPosition::OrHash).void }
      attr_writer :position

      # Specifies timing information for the overlay (only applicable if the base asset
      # is a video). See
      # [Position of Layer](https://imagekit.io/docs/transformations#position-of-layer).
      sig { returns(T.nilable(Imagekitio::OverlayTiming)) }
      attr_reader :timing

      sig { params(timing: Imagekitio::OverlayTiming::OrHash).void }
      attr_writer :timing

      sig do
        params(
          layer_mode: Imagekitio::BaseOverlay::LayerMode::OrSymbol,
          position: Imagekitio::OverlayPosition::OrHash,
          timing: Imagekitio::OverlayTiming::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
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
        layer_mode: nil,
        # Specifies the overlay's position relative to the parent asset. See
        # [Position of Layer](https://imagekit.io/docs/transformations#position-of-layer).
        position: nil,
        # Specifies timing information for the overlay (only applicable if the base asset
        # is a video). See
        # [Position of Layer](https://imagekit.io/docs/transformations#position-of-layer).
        timing: nil
      )
      end

      sig do
        override.returns(
          {
            layer_mode: Imagekitio::BaseOverlay::LayerMode::OrSymbol,
            position: Imagekitio::OverlayPosition,
            timing: Imagekitio::OverlayTiming
          }
        )
      end
      def to_hash
      end

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
      module LayerMode
        extend Imagekitio::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias { T.all(Symbol, Imagekitio::BaseOverlay::LayerMode) }
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        MULTIPLY =
          T.let(:multiply, Imagekitio::BaseOverlay::LayerMode::TaggedSymbol)
        CUTTER =
          T.let(:cutter, Imagekitio::BaseOverlay::LayerMode::TaggedSymbol)
        CUTOUT =
          T.let(:cutout, Imagekitio::BaseOverlay::LayerMode::TaggedSymbol)
        DISPLACE =
          T.let(:displace, Imagekitio::BaseOverlay::LayerMode::TaggedSymbol)

        sig do
          override.returns(
            T::Array[Imagekitio::BaseOverlay::LayerMode::TaggedSymbol]
          )
        end
        def self.values
        end
      end
    end
  end
end
