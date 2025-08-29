# frozen_string_literal: true

module Imagekit
  module Models
    class ImageOverlay < Imagekit::Models::BaseOverlay
      # @!attribute input
      #   Specifies the relative path to the image used as an overlay.
      #
      #   @return [String]
      required :input, String

      # @!attribute type
      #
      #   @return [Symbol, Imagekit::Models::ImageOverlay::Type]
      required :type, enum: -> { Imagekit::ImageOverlay::Type }

      # @!attribute encoding
      #   The input path can be included in the layer as either `i-{input}` or
      #   `ie-{base64_encoded_input}`. By default, the SDK determines the appropriate
      #   format automatically. To always use base64 encoding (`ie-{base64}`), set this
      #   parameter to `base64`. To always use plain text (`i-{input}`), set it to
      #   `plain`.
      #
      #   @return [Symbol, Imagekit::Models::ImageOverlay::Encoding, nil]
      optional :encoding, enum: -> { Imagekit::ImageOverlay::Encoding }

      # @!attribute transformation
      #   Array of transformations to be applied to the overlay image. Supported
      #   transformations depends on the base/parent asset.
      #
      #   @return [Array<Imagekit::Models::Transformation>, nil]
      optional :transformation, -> { Imagekit::Internal::Type::ArrayOf[Imagekit::Transformation] }

      # @!method initialize(input:, type:, encoding: nil, transformation: nil)
      #   Some parameter documentations has been truncated, see
      #   {Imagekit::Models::ImageOverlay} for more details.
      #
      #   @param input [String] Specifies the relative path to the image used as an overlay.
      #
      #   @param type [Symbol, Imagekit::Models::ImageOverlay::Type]
      #
      #   @param encoding [Symbol, Imagekit::Models::ImageOverlay::Encoding] The input path can be included in the layer as either `i-{input}` or `ie-{base64
      #
      #   @param transformation [Array<Imagekit::Models::Transformation>] Array of transformations to be applied to the overlay image. Supported transform

      module Type
        extend Imagekit::Internal::Type::Enum

        IMAGE = :image

        # @!method self.values
        #   @return [Array<Symbol>]
      end

      # The input path can be included in the layer as either `i-{input}` or
      # `ie-{base64_encoded_input}`. By default, the SDK determines the appropriate
      # format automatically. To always use base64 encoding (`ie-{base64}`), set this
      # parameter to `base64`. To always use plain text (`i-{input}`), set it to
      # `plain`.
      module Encoding
        extend Imagekit::Internal::Type::Enum

        AUTO = :auto
        PLAIN = :plain
        BASE64 = :base64

        # @!method self.values
        #   @return [Array<Symbol>]
      end
    end
  end
end
