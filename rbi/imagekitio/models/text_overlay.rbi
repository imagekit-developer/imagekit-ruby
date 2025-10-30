# typed: strong

module Imagekitio
  module Models
    class TextOverlay < Imagekitio::Models::BaseOverlay
      OrHash =
        T.type_alias do
          T.any(Imagekitio::TextOverlay, Imagekitio::Internal::AnyHash)
        end

      # Specifies the text to be displayed in the overlay. The SDK automatically handles
      # special characters and encoding.
      sig { returns(String) }
      attr_accessor :text

      sig { returns(Symbol) }
      attr_accessor :type

      # Text can be included in the layer as either `i-{input}` (plain text) or
      # `ie-{base64_encoded_input}` (base64). By default, the SDK selects the
      # appropriate format based on the input text. To always use base64
      # (`ie-{base64}`), set this parameter to `base64`. To always use plain text
      # (`i-{input}`), set it to `plain`.
      sig { returns(T.nilable(Imagekitio::TextOverlay::Encoding::OrSymbol)) }
      attr_reader :encoding

      sig { params(encoding: Imagekitio::TextOverlay::Encoding::OrSymbol).void }
      attr_writer :encoding

      # Control styling of the text overlay. See
      # [Text overlays](https://imagekit.io/docs/add-overlays-on-images#text-overlay).
      sig do
        returns(T.nilable(T::Array[Imagekitio::TextOverlayTransformation]))
      end
      attr_reader :transformation

      sig do
        params(
          transformation:
            T::Array[Imagekitio::TextOverlayTransformation::OrHash]
        ).void
      end
      attr_writer :transformation

      sig do
        params(
          text: String,
          encoding: Imagekitio::TextOverlay::Encoding::OrSymbol,
          transformation:
            T::Array[Imagekitio::TextOverlayTransformation::OrHash],
          type: Symbol
        ).returns(T.attached_class)
      end
      def self.new(
        # Specifies the text to be displayed in the overlay. The SDK automatically handles
        # special characters and encoding.
        text:,
        # Text can be included in the layer as either `i-{input}` (plain text) or
        # `ie-{base64_encoded_input}` (base64). By default, the SDK selects the
        # appropriate format based on the input text. To always use base64
        # (`ie-{base64}`), set this parameter to `base64`. To always use plain text
        # (`i-{input}`), set it to `plain`.
        encoding: nil,
        # Control styling of the text overlay. See
        # [Text overlays](https://imagekit.io/docs/add-overlays-on-images#text-overlay).
        transformation: nil,
        type: :text
      )
      end

      sig do
        override.returns(
          {
            text: String,
            type: Symbol,
            encoding: Imagekitio::TextOverlay::Encoding::OrSymbol,
            transformation: T::Array[Imagekitio::TextOverlayTransformation]
          }
        )
      end
      def to_hash
      end

      # Text can be included in the layer as either `i-{input}` (plain text) or
      # `ie-{base64_encoded_input}` (base64). By default, the SDK selects the
      # appropriate format based on the input text. To always use base64
      # (`ie-{base64}`), set this parameter to `base64`. To always use plain text
      # (`i-{input}`), set it to `plain`.
      module Encoding
        extend Imagekitio::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias { T.all(Symbol, Imagekitio::TextOverlay::Encoding) }
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        AUTO = T.let(:auto, Imagekitio::TextOverlay::Encoding::TaggedSymbol)
        PLAIN = T.let(:plain, Imagekitio::TextOverlay::Encoding::TaggedSymbol)
        BASE64 = T.let(:base64, Imagekitio::TextOverlay::Encoding::TaggedSymbol)

        sig do
          override.returns(
            T::Array[Imagekitio::TextOverlay::Encoding::TaggedSymbol]
          )
        end
        def self.values
        end
      end
    end
  end
end
