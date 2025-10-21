# frozen_string_literal: true

module Imagekit
  module Models
    class ResponsiveImageAttributes < Imagekit::Internal::Type::BaseModel
      # @!attribute src
      #   URL for the _largest_ candidate (assigned to plain `src`).
      #
      #   @return [String]
      required :src, String

      # @!attribute sizes
      #   `sizes` returned (or synthesised as `100vw`). The value for the HTML `sizes`
      #   attribute.
      #
      #   @return [String, nil]
      optional :sizes, String

      # @!attribute src_set
      #   Candidate set with `w` or `x` descriptors. Multiple image URLs separated by
      #   commas, each with a descriptor.
      #
      #   @return [String, nil]
      optional :src_set, String, api_name: :srcSet

      # @!attribute width
      #   Width as a number (if `width` was provided in the input options).
      #
      #   @return [Float, nil]
      optional :width, Float

      # @!method initialize(src:, sizes: nil, src_set: nil, width: nil)
      #   Some parameter documentations has been truncated, see
      #   {Imagekit::Models::ResponsiveImageAttributes} for more details.
      #
      #   Resulting set of attributes suitable for an HTML `<img>` element. Useful for
      #   enabling responsive image loading with `srcSet` and `sizes`.
      #
      #   @param src [String] URL for the _largest_ candidate (assigned to plain `src`).
      #
      #   @param sizes [String] `sizes` returned (or synthesised as `100vw`).
      #
      #   @param src_set [String] Candidate set with `w` or `x` descriptors.
      #
      #   @param width [Float] Width as a number (if `width` was provided in the input options).
    end
  end
end
