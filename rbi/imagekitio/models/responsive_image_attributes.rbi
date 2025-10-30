# typed: strong

module Imagekitio
  module Models
    class ResponsiveImageAttributes < Imagekitio::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            Imagekitio::ResponsiveImageAttributes,
            Imagekitio::Internal::AnyHash
          )
        end

      # URL for the _largest_ candidate (assigned to plain `src`).
      sig { returns(String) }
      attr_accessor :src

      # `sizes` returned (or synthesised as `100vw`). The value for the HTML `sizes`
      # attribute.
      sig { returns(T.nilable(String)) }
      attr_reader :sizes

      sig { params(sizes: String).void }
      attr_writer :sizes

      # Candidate set with `w` or `x` descriptors. Multiple image URLs separated by
      # commas, each with a descriptor.
      sig { returns(T.nilable(String)) }
      attr_reader :src_set

      sig { params(src_set: String).void }
      attr_writer :src_set

      # Width as a number (if `width` was provided in the input options).
      sig { returns(T.nilable(Float)) }
      attr_reader :width

      sig { params(width: Float).void }
      attr_writer :width

      # Resulting set of attributes suitable for an HTML `<img>` element. Useful for
      # enabling responsive image loading with `srcSet` and `sizes`.
      sig do
        params(
          src: String,
          sizes: String,
          src_set: String,
          width: Float
        ).returns(T.attached_class)
      end
      def self.new(
        # URL for the _largest_ candidate (assigned to plain `src`).
        src:,
        # `sizes` returned (or synthesised as `100vw`). The value for the HTML `sizes`
        # attribute.
        sizes: nil,
        # Candidate set with `w` or `x` descriptors. Multiple image URLs separated by
        # commas, each with a descriptor.
        src_set: nil,
        # Width as a number (if `width` was provided in the input options).
        width: nil
      )
      end

      sig do
        override.returns(
          { src: String, sizes: String, src_set: String, width: Float }
        )
      end
      def to_hash
      end
    end
  end
end
