# frozen_string_literal: true

module Imagekit
  module Models
    class SubtitleOverlay < Imagekit::Models::BaseOverlay
      # @!attribute input
      #   Specifies the relative path to the subtitle file used as an overlay.
      #
      #   @return [String]
      required :input, String

      # @!attribute type
      #
      #   @return [Symbol, Imagekit::Models::SubtitleOverlay::Type]
      required :type, enum: -> { Imagekit::SubtitleOverlay::Type }

      # @!attribute encoding
      #   The input path can be included in the layer as either `i-{input}` or
      #   `ie-{base64_encoded_input}`. By default, the SDK determines the appropriate
      #   format automatically. To always use base64 encoding (`ie-{base64}`), set this
      #   parameter to `base64`. To always use plain text (`i-{input}`), set it to
      #   `plain`.
      #
      #   @return [Symbol, Imagekit::Models::SubtitleOverlay::Encoding, nil]
      optional :encoding, enum: -> { Imagekit::SubtitleOverlay::Encoding }

      # @!attribute transformation
      #   Control styling of the subtitle.
      #
      #   @return [Array<Imagekit::Models::SubtitleOverlayTransformation>, nil]
      optional :transformation,
               -> { Imagekit::Internal::Type::ArrayOf[Imagekit::SubtitleOverlayTransformation] }

      # @!method initialize(input:, type:, encoding: nil, transformation: nil)
      #   Some parameter documentations has been truncated, see
      #   {Imagekit::Models::SubtitleOverlay} for more details.
      #
      #   @param input [String] Specifies the relative path to the subtitle file used as an overlay.
      #
      #   @param type [Symbol, Imagekit::Models::SubtitleOverlay::Type]
      #
      #   @param encoding [Symbol, Imagekit::Models::SubtitleOverlay::Encoding] The input path can be included in the layer as either `i-{input}` or `ie-{base64
      #
      #   @param transformation [Array<Imagekit::Models::SubtitleOverlayTransformation>] Control styling of the subtitle.

      module Type
        extend Imagekit::Internal::Type::Enum

        SUBTITLE = :subtitle

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
