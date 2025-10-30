# frozen_string_literal: true

module Imagekitio
  module Models
    class GetImageAttributesOptions < Imagekitio::Models::SrcOptions
      # @!attribute device_breakpoints
      #   Custom list of **device-width breakpoints** in pixels. These define common
      #   screen widths for responsive image generation.
      #
      #   Defaults to `[640, 750, 828, 1080, 1200, 1920, 2048, 3840]`. Sorted
      #   automatically.
      #
      #   @return [Array<Float>, nil]
      optional :device_breakpoints, Imagekitio::Internal::Type::ArrayOf[Float], api_name: :deviceBreakpoints

      # @!attribute image_breakpoints
      #   Custom list of **image-specific breakpoints** in pixels. Useful for generating
      #   small variants (e.g., placeholders or thumbnails).
      #
      #   Merged with `deviceBreakpoints` before calculating `srcSet`. Defaults to
      #   `[16, 32, 48, 64, 96, 128, 256, 384]`. Sorted automatically.
      #
      #   @return [Array<Float>, nil]
      optional :image_breakpoints, Imagekitio::Internal::Type::ArrayOf[Float], api_name: :imageBreakpoints

      # @!attribute sizes
      #   The value for the HTML `sizes` attribute (e.g., `"100vw"` or
      #   `"(min-width:768px) 50vw, 100vw"`).
      #
      #   - If it includes one or more `vw` units, breakpoints smaller than the
      #     corresponding percentage of the smallest device width are excluded.
      #   - If it contains no `vw` units, the full breakpoint list is used.
      #
      #   Enables a width-based strategy and generates `w` descriptors in `srcSet`.
      #
      #   @return [String, nil]
      optional :sizes, String

      # @!attribute width
      #   The intended display width of the image in pixels, used **only when the `sizes`
      #   attribute is not provided**.
      #
      #   Triggers a DPR-based strategy (1x and 2x variants) and generates `x` descriptors
      #   in `srcSet`.
      #
      #   Ignored if `sizes` is present.
      #
      #   @return [Float, nil]
      optional :width, Float

      # @!method initialize(device_breakpoints: nil, image_breakpoints: nil, sizes: nil, width: nil)
      #   Some parameter documentations has been truncated, see
      #   {Imagekitio::Models::GetImageAttributesOptions} for more details.
      #
      #   Options for generating responsive image attributes including `src`, `srcSet`,
      #   and `sizes` for HTML `<img>` elements. This schema extends `SrcOptions` to add
      #   support for responsive image generation with breakpoints.
      #
      #   @param device_breakpoints [Array<Float>] Custom list of **device-width breakpoints** in pixels.
      #
      #   @param image_breakpoints [Array<Float>] Custom list of **image-specific breakpoints** in pixels.
      #
      #   @param sizes [String] The value for the HTML `sizes` attribute
      #
      #   @param width [Float] The intended display width of the image in pixels,
    end
  end
end
