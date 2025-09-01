# frozen_string_literal: true

module Imagekit
  module Models
    class TextOverlay < Imagekit::Models::BaseOverlay
      # @!attribute text
      #   Specifies the text to be displayed in the overlay. The SDK automatically handles
      #   special characters and encoding.
      #
      #   @return [String]
      required :text, String

      # @!attribute type
      #
      #   @return [Symbol, :text]
      required :type, const: :text

      # @!attribute encoding
      #   Text can be included in the layer as either `i-{input}` (plain text) or
      #   `ie-{base64_encoded_input}` (base64). By default, the SDK selects the
      #   appropriate format based on the input text. To always use base64
      #   (`ie-{base64}`), set this parameter to `base64`. To always use plain text
      #   (`i-{input}`), set it to `plain`.
      #
      #   @return [Symbol, Imagekit::Models::TextOverlay::Encoding, nil]
      optional :encoding, enum: -> { Imagekit::TextOverlay::Encoding }

      # @!attribute transformation
      #   Control styling of the text overlay. See
      #   [Text overlays](https://imagekit.io/docs/add-overlays-on-images#text-overlay).
      #
      #   @return [Array<Imagekit::Models::TextOverlayTransformation>, nil]
      optional :transformation, -> { Imagekit::Internal::Type::ArrayOf[Imagekit::TextOverlayTransformation] }

      # @!method initialize(text:, encoding: nil, transformation: nil, type: :text)
      #   Some parameter documentations has been truncated, see
      #   {Imagekit::Models::TextOverlay} for more details.
      #
      #   @param text [String] Specifies the text to be displayed in the overlay. The SDK automatically handles
      #
      #   @param encoding [Symbol, Imagekit::Models::TextOverlay::Encoding] Text can be included in the layer as either `i-{input}` (plain text) or `ie-{bas
      #
      #   @param transformation [Array<Imagekit::Models::TextOverlayTransformation>] Control styling of the text overlay. See [Text overlays](https://imagekit.io/doc
      #
      #   @param type [Symbol, :text]

      # Text can be included in the layer as either `i-{input}` (plain text) or
      # `ie-{base64_encoded_input}` (base64). By default, the SDK selects the
      # appropriate format based on the input text. To always use base64
      # (`ie-{base64}`), set this parameter to `base64`. To always use plain text
      # (`i-{input}`), set it to `plain`.
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
