# typed: strong

module Imagekit
  module Models
    class SubtitleOverlay < Imagekit::Models::BaseOverlay
      OrHash =
        T.type_alias do
          T.any(Imagekit::SubtitleOverlay, Imagekit::Internal::AnyHash)
        end

      # Specifies the relative path to the subtitle file used as an overlay.
      sig { returns(String) }
      attr_accessor :input

      sig { returns(Symbol) }
      attr_accessor :type

      # The input path can be included in the layer as either `i-{input}` or
      # `ie-{base64_encoded_input}`. By default, the SDK determines the appropriate
      # format automatically. To always use base64 encoding (`ie-{base64}`), set this
      # parameter to `base64`. To always use plain text (`i-{input}`), set it to
      # `plain`.
      sig { returns(T.nilable(Imagekit::SubtitleOverlay::Encoding::OrSymbol)) }
      attr_reader :encoding

      sig do
        params(encoding: Imagekit::SubtitleOverlay::Encoding::OrSymbol).void
      end
      attr_writer :encoding

      # Control styling of the subtitle. See
      # [Styling subtitles](https://imagekit.io/docs/add-overlays-on-videos#styling-controls-for-subtitles-layer).
      sig do
        returns(T.nilable(T::Array[Imagekit::SubtitleOverlayTransformation]))
      end
      attr_reader :transformation

      sig do
        params(
          transformation:
            T::Array[Imagekit::SubtitleOverlayTransformation::OrHash]
        ).void
      end
      attr_writer :transformation

      sig do
        params(
          input: String,
          encoding: Imagekit::SubtitleOverlay::Encoding::OrSymbol,
          transformation:
            T::Array[Imagekit::SubtitleOverlayTransformation::OrHash],
          type: Symbol
        ).returns(T.attached_class)
      end
      def self.new(
        # Specifies the relative path to the subtitle file used as an overlay.
        input:,
        # The input path can be included in the layer as either `i-{input}` or
        # `ie-{base64_encoded_input}`. By default, the SDK determines the appropriate
        # format automatically. To always use base64 encoding (`ie-{base64}`), set this
        # parameter to `base64`. To always use plain text (`i-{input}`), set it to
        # `plain`.
        encoding: nil,
        # Control styling of the subtitle. See
        # [Styling subtitles](https://imagekit.io/docs/add-overlays-on-videos#styling-controls-for-subtitles-layer).
        transformation: nil,
        type: :subtitle
      )
      end

      sig do
        override.returns(
          {
            input: String,
            type: Symbol,
            encoding: Imagekit::SubtitleOverlay::Encoding::OrSymbol,
            transformation: T::Array[Imagekit::SubtitleOverlayTransformation]
          }
        )
      end
      def to_hash
      end

      # The input path can be included in the layer as either `i-{input}` or
      # `ie-{base64_encoded_input}`. By default, the SDK determines the appropriate
      # format automatically. To always use base64 encoding (`ie-{base64}`), set this
      # parameter to `base64`. To always use plain text (`i-{input}`), set it to
      # `plain`.
      module Encoding
        extend Imagekit::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias { T.all(Symbol, Imagekit::SubtitleOverlay::Encoding) }
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        AUTO = T.let(:auto, Imagekit::SubtitleOverlay::Encoding::TaggedSymbol)
        PLAIN = T.let(:plain, Imagekit::SubtitleOverlay::Encoding::TaggedSymbol)
        BASE64 =
          T.let(:base64, Imagekit::SubtitleOverlay::Encoding::TaggedSymbol)

        sig do
          override.returns(
            T::Array[Imagekit::SubtitleOverlay::Encoding::TaggedSymbol]
          )
        end
        def self.values
        end
      end
    end
  end
end
