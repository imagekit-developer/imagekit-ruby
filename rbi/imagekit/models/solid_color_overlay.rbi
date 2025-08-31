# typed: strong

module Imagekit
  module Models
    class SolidColorOverlay < Imagekit::Models::BaseOverlay
      OrHash =
        T.type_alias do
          T.any(Imagekit::SolidColorOverlay, Imagekit::Internal::AnyHash)
        end

      # Specifies the color of the block using an RGB hex code (e.g., `FF0000`), an RGBA
      # code (e.g., `FFAABB50`), or a color name (e.g., `red`). If an 8-character value
      # is provided, the last two characters represent the opacity level (from `00` for
      # 0.00 to `99` for 0.99).
      sig { returns(String) }
      attr_accessor :color

      sig { returns(Symbol) }
      attr_accessor :type

      # Control width and height of the solid color overlay. Supported transformations
      # depend on the base/parent asset. See overlays on
      # [Images](https://imagekit.io/docs/add-overlays-on-images#apply-transformation-on-solid-color-overlay)
      # and
      # [Videos](https://imagekit.io/docs/add-overlays-on-videos#apply-transformations-on-solid-color-block-overlay).
      sig do
        returns(T.nilable(T::Array[Imagekit::SolidColorOverlayTransformation]))
      end
      attr_reader :transformation

      sig do
        params(
          transformation:
            T::Array[Imagekit::SolidColorOverlayTransformation::OrHash]
        ).void
      end
      attr_writer :transformation

      sig do
        params(
          color: String,
          transformation:
            T::Array[Imagekit::SolidColorOverlayTransformation::OrHash],
          type: Symbol
        ).returns(T.attached_class)
      end
      def self.new(
        # Specifies the color of the block using an RGB hex code (e.g., `FF0000`), an RGBA
        # code (e.g., `FFAABB50`), or a color name (e.g., `red`). If an 8-character value
        # is provided, the last two characters represent the opacity level (from `00` for
        # 0.00 to `99` for 0.99).
        color:,
        # Control width and height of the solid color overlay. Supported transformations
        # depend on the base/parent asset. See overlays on
        # [Images](https://imagekit.io/docs/add-overlays-on-images#apply-transformation-on-solid-color-overlay)
        # and
        # [Videos](https://imagekit.io/docs/add-overlays-on-videos#apply-transformations-on-solid-color-block-overlay).
        transformation: nil,
        type: :solidColor
      )
      end

      sig do
        override.returns(
          {
            color: String,
            type: Symbol,
            transformation: T::Array[Imagekit::SolidColorOverlayTransformation]
          }
        )
      end
      def to_hash
      end
    end
  end
end
