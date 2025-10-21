# typed: strong

module Imagekit
  module Models
    class GetImageAttributesOptions < Imagekit::Models::SrcOptions
      OrHash =
        T.type_alias do
          T.any(
            Imagekit::GetImageAttributesOptions,
            Imagekit::Internal::AnyHash
          )
        end

      # Custom list of **device-width breakpoints** in pixels. These define common
      # screen widths for responsive image generation.
      #
      # Defaults to `[640, 750, 828, 1080, 1200, 1920, 2048, 3840]`. Sorted
      # automatically.
      sig { returns(T.nilable(T::Array[Float])) }
      attr_reader :device_breakpoints

      sig { params(device_breakpoints: T::Array[Float]).void }
      attr_writer :device_breakpoints

      # Custom list of **image-specific breakpoints** in pixels. Useful for generating
      # small variants (e.g., placeholders or thumbnails).
      #
      # Merged with `deviceBreakpoints` before calculating `srcSet`. Defaults to
      # `[16, 32, 48, 64, 96, 128, 256, 384]`. Sorted automatically.
      sig { returns(T.nilable(T::Array[Float])) }
      attr_reader :image_breakpoints

      sig { params(image_breakpoints: T::Array[Float]).void }
      attr_writer :image_breakpoints

      # The value for the HTML `sizes` attribute (e.g., `"100vw"` or
      # `"(min-width:768px) 50vw, 100vw"`).
      #
      # - If it includes one or more `vw` units, breakpoints smaller than the
      #   corresponding percentage of the smallest device width are excluded.
      # - If it contains no `vw` units, the full breakpoint list is used.
      #
      # Enables a width-based strategy and generates `w` descriptors in `srcSet`.
      sig { returns(T.nilable(String)) }
      attr_reader :sizes

      sig { params(sizes: String).void }
      attr_writer :sizes

      # The intended display width of the image in pixels, used **only when the `sizes`
      # attribute is not provided**.
      #
      # Triggers a DPR-based strategy (1x and 2x variants) and generates `x` descriptors
      # in `srcSet`.
      #
      # Ignored if `sizes` is present.
      sig { returns(T.nilable(Float)) }
      attr_reader :width

      sig { params(width: Float).void }
      attr_writer :width

      # Options for generating responsive image attributes including `src`, `srcSet`,
      # and `sizes` for HTML `<img>` elements. This schema extends `SrcOptions` to add
      # support for responsive image generation with breakpoints.
      sig do
        params(
          device_breakpoints: T::Array[Float],
          image_breakpoints: T::Array[Float],
          sizes: String,
          width: Float
        ).returns(T.attached_class)
      end
      def self.new(
        # Custom list of **device-width breakpoints** in pixels. These define common
        # screen widths for responsive image generation.
        #
        # Defaults to `[640, 750, 828, 1080, 1200, 1920, 2048, 3840]`. Sorted
        # automatically.
        device_breakpoints: nil,
        # Custom list of **image-specific breakpoints** in pixels. Useful for generating
        # small variants (e.g., placeholders or thumbnails).
        #
        # Merged with `deviceBreakpoints` before calculating `srcSet`. Defaults to
        # `[16, 32, 48, 64, 96, 128, 256, 384]`. Sorted automatically.
        image_breakpoints: nil,
        # The value for the HTML `sizes` attribute (e.g., `"100vw"` or
        # `"(min-width:768px) 50vw, 100vw"`).
        #
        # - If it includes one or more `vw` units, breakpoints smaller than the
        #   corresponding percentage of the smallest device width are excluded.
        # - If it contains no `vw` units, the full breakpoint list is used.
        #
        # Enables a width-based strategy and generates `w` descriptors in `srcSet`.
        sizes: nil,
        # The intended display width of the image in pixels, used **only when the `sizes`
        # attribute is not provided**.
        #
        # Triggers a DPR-based strategy (1x and 2x variants) and generates `x` descriptors
        # in `srcSet`.
        #
        # Ignored if `sizes` is present.
        width: nil
      )
      end

      sig do
        override.returns(
          {
            device_breakpoints: T::Array[Float],
            image_breakpoints: T::Array[Float],
            sizes: String,
            width: Float
          }
        )
      end
      def to_hash
      end
    end
  end
end
