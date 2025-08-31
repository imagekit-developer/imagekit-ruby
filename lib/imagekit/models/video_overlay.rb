# frozen_string_literal: true

module Imagekit
  module Models
    class VideoOverlay < Imagekit::Models::BaseOverlay
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
      #   @return [Symbol, Imagekit::Models::VideoOverlay::Encoding, nil]
      optional :encoding, enum: -> { Imagekit::VideoOverlay::Encoding }

      # @!attribute transformation
      #   Array of transformation to be applied to the overlay video. Except
      #   `streamingResolutions`, all other video transformations are supported. See
      #   [Video transformations](https://imagekit.io/docs/video-transformation).
      #
      #   @return [Array<Imagekit::Models::Transformation>, nil]
      optional :transformation, -> { Imagekit::Internal::Type::ArrayOf[Imagekit::Transformation] }

      # @!method initialize(input:, encoding: nil, transformation: nil, type: :video)
      #   Some parameter documentations has been truncated, see
      #   {Imagekit::Models::VideoOverlay} for more details.
      #
      #   @param input [String] Specifies the relative path to the video used as an overlay.
      #
      #   @param encoding [Symbol, Imagekit::Models::VideoOverlay::Encoding] The input path can be included in the layer as either `i-{input}` or `ie-{base64
      #
      #   @param transformation [Array<Imagekit::Models::Transformation>] Array of transformation to be applied to the overlay video. Except `streamingRes
      #
      #   @param type [Symbol, :video]

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
