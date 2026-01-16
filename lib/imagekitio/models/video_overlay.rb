# frozen_string_literal: true

module Imagekitio
  module Models
    class VideoOverlay < Imagekitio::Models::BaseOverlay
      # @!attribute input
      #   Specifies the relative path to the video used as an overlay.
      #
      #   @return [String]
      required :input, String

      # @!attribute type
      #
      #   @return [Symbol, :video]
      required :type, const: :video

      # @!attribute encoding
      #   The input path can be included in the layer as either `i-{input}` or
      #   `ie-{base64_encoded_input}`. By default, the SDK determines the appropriate
      #   format automatically. To always use base64 encoding (`ie-{base64}`), set this
      #   parameter to `base64`. To always use plain text (`i-{input}`), set it to
      #   `plain`.
      #
      #   Regardless of the encoding method:
      #
      #   - Leading and trailing slashes are removed.
      #   - Remaining slashes within the path are replaced with `@@` when using plain
      #     text.
      #
      #   @return [Symbol, Imagekitio::Models::VideoOverlay::Encoding, nil]
      optional :encoding, enum: -> { Imagekitio::VideoOverlay::Encoding }

      # @!attribute transformation
      #   Array of transformation to be applied to the overlay video. Except
      #   `streamingResolutions`, all other video transformations are supported. See
      #   [Video transformations](https://imagekit.io/docs/video-transformation).
      #
      #   @return [Array<Imagekitio::Models::Transformation>, nil]
      optional :transformation, -> { Imagekitio::Internal::Type::ArrayOf[Imagekitio::Transformation] }

      # @!method initialize(input:, encoding: nil, transformation: nil, type: :video)
      #   Some parameter documentations has been truncated, see
      #   {Imagekitio::Models::VideoOverlay} for more details.
      #
      #   @param input [String] Specifies the relative path to the video used as an overlay.
      #
      #   @param encoding [Symbol, Imagekitio::Models::VideoOverlay::Encoding] The input path can be included in the layer as either `i-{input}` or `ie-{base64
      #
      #   @param transformation [Array<Imagekitio::Models::Transformation>] Array of transformation to be applied to the overlay video. Except `streamingRes
      #
      #   @param type [Symbol, :video]

      # The input path can be included in the layer as either `i-{input}` or
      # `ie-{base64_encoded_input}`. By default, the SDK determines the appropriate
      # format automatically. To always use base64 encoding (`ie-{base64}`), set this
      # parameter to `base64`. To always use plain text (`i-{input}`), set it to
      # `plain`.
      #
      # Regardless of the encoding method:
      #
      # - Leading and trailing slashes are removed.
      # - Remaining slashes within the path are replaced with `@@` when using plain
      #   text.
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
