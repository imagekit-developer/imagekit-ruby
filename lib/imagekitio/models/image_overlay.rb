# frozen_string_literal: true

module Imagekitio
  module Models
    class ImageOverlay < Imagekitio::Models::BaseOverlay
      # @!attribute input
      #   Specifies the relative path to the image used as an overlay.
      #
      #   @return [String]
      required :input, String

      # @!attribute type
      #
      #   @return [Symbol, :image]
      required :type, const: :image

      # @!attribute encoding
      #   The input path can be included in the layer as either `i-{input}` or
      #   `ie-{base64_encoded_input}`. By default, the SDK determines the appropriate
      #   format automatically. To always use base64 encoding (`ie-{base64}`), set this
      #   parameter to `base64`. To always use plain text (`i-{input}`), set it to
      #   `plain`.
      #
      #   @return [Symbol, Imagekitio::Models::ImageOverlay::Encoding, nil]
      optional :encoding, enum: -> { Imagekitio::ImageOverlay::Encoding }

      # @!attribute transformation
      #   Array of transformations to be applied to the overlay image. Supported
      #   transformations depends on the base/parent asset. See overlays on
      #   [Images](https://imagekit.io/docs/add-overlays-on-images#list-of-supported-image-transformations-in-image-layers)
      #   and
      #   [Videos](https://imagekit.io/docs/add-overlays-on-videos#list-of-transformations-supported-on-image-overlay).
      #
      #   @return [Array<Imagekitio::Models::Transformation>, nil]
      optional :transformation, -> { Imagekitio::Internal::Type::ArrayOf[Imagekitio::Transformation] }

      # @!method initialize(input:, encoding: nil, transformation: nil, type: :image)
      #   Some parameter documentations has been truncated, see
      #   {Imagekitio::Models::ImageOverlay} for more details.
      #
      #   @param input [String] Specifies the relative path to the image used as an overlay.
      #
      #   @param encoding [Symbol, Imagekitio::Models::ImageOverlay::Encoding] The input path can be included in the layer as either `i-{input}` or `ie-{base64
      #
      #   @param transformation [Array<Imagekitio::Models::Transformation>] Array of transformations to be applied to the overlay image. Supported transform
      #
      #   @param type [Symbol, :image]

      # The input path can be included in the layer as either `i-{input}` or
      # `ie-{base64_encoded_input}`. By default, the SDK determines the appropriate
      # format automatically. To always use base64 encoding (`ie-{base64}`), set this
      # parameter to `base64`. To always use plain text (`i-{input}`), set it to
      # `plain`.
      module Encoding
        extend Imagekitio::Internal::Type::Enum

        AUTO = :auto
        PLAIN = :plain
        BASE64 = :base64

        # @!method self.values
        #   @return [Array<Symbol>]
      end
    end
  end
end
