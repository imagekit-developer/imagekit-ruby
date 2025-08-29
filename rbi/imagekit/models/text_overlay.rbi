# typed: strong

module Imagekit
  module Models
    class TextOverlay < Imagekit::Models::BaseOverlay
      OrHash =
        T.type_alias do
          T.any(Imagekit::TextOverlay, Imagekit::Internal::AnyHash)
        end

      # Specifies the text to be displayed in the overlay. The SDK automatically handles
      # special characters and encoding.
      sig { returns(String) }
      attr_accessor :text

      sig { returns(Imagekit::TextOverlay::Type::OrSymbol) }
      attr_accessor :type

      # Text can be included in the layer as either `i-{input}` (plain text) or
      # `ie-{base64_encoded_input}` (base64). By default, the SDK selects the
      # appropriate format based on the input text. To always use base64
      # (`ie-{base64}`), set this parameter to `base64`. To always use plain text
      # (`i-{input}`), set it to `plain`.
      sig { returns(T.nilable(Imagekit::TextOverlay::Encoding::OrSymbol)) }
      attr_reader :encoding

      sig { params(encoding: Imagekit::TextOverlay::Encoding::OrSymbol).void }
      attr_writer :encoding

      # Control styling of the text overlay.
      sig { returns(T.nilable(T::Array[Imagekit::TextOverlayTransformation])) }
      attr_reader :transformation

      sig do
        params(
          transformation: T::Array[Imagekit::TextOverlayTransformation::OrHash]
        ).void
      end
      attr_writer :transformation

      sig do
        params(
          text: String,
          type: Imagekit::TextOverlay::Type::OrSymbol,
          encoding: Imagekit::TextOverlay::Encoding::OrSymbol,
          transformation: T::Array[Imagekit::TextOverlayTransformation::OrHash]
        ).returns(T.attached_class)
      end
      def self.new(
        # Specifies the text to be displayed in the overlay. The SDK automatically handles
        # special characters and encoding.
        text:,
        type:,
        # Text can be included in the layer as either `i-{input}` (plain text) or
        # `ie-{base64_encoded_input}` (base64). By default, the SDK selects the
        # appropriate format based on the input text. To always use base64
        # (`ie-{base64}`), set this parameter to `base64`. To always use plain text
        # (`i-{input}`), set it to `plain`.
        encoding: nil,
        # Control styling of the text overlay.
        transformation: nil
      )
      end

      sig do
        override.returns(
          {
            text: String,
            type: Imagekit::TextOverlay::Type::OrSymbol,
            encoding: Imagekit::TextOverlay::Encoding::OrSymbol,
            transformation: T::Array[Imagekit::TextOverlayTransformation]
          }
        )
      end
      def to_hash
      end

      module Type
        extend Imagekit::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias { T.all(Symbol, Imagekit::TextOverlay::Type) }
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        TEXT = T.let(:text, Imagekit::TextOverlay::Type::TaggedSymbol)

        sig do
          override.returns(T::Array[Imagekit::TextOverlay::Type::TaggedSymbol])
        end
        def self.values
        end
      end

      # Text can be included in the layer as either `i-{input}` (plain text) or
      # `ie-{base64_encoded_input}` (base64). By default, the SDK selects the
      # appropriate format based on the input text. To always use base64
      # (`ie-{base64}`), set this parameter to `base64`. To always use plain text
      # (`i-{input}`), set it to `plain`.
      module Encoding
        extend Imagekit::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias { T.all(Symbol, Imagekit::TextOverlay::Encoding) }
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        AUTO = T.let(:auto, Imagekit::TextOverlay::Encoding::TaggedSymbol)
        PLAIN = T.let(:plain, Imagekit::TextOverlay::Encoding::TaggedSymbol)
        BASE64 = T.let(:base64, Imagekit::TextOverlay::Encoding::TaggedSymbol)

        sig do
          override.returns(
            T::Array[Imagekit::TextOverlay::Encoding::TaggedSymbol]
          )
        end
        def self.values
        end
      end
    end
  end
end
