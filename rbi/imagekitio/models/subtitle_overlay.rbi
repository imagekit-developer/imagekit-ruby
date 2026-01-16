# typed: strong

module Imagekitio
  module Models
    class SubtitleOverlay < Imagekitio::Models::BaseOverlay
      OrHash =
        T.type_alias do
          T.any(Imagekitio::SubtitleOverlay, Imagekitio::Internal::AnyHash)
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
      #
      # Regardless of the encoding method:
      #
      # - Leading and trailing slashes are removed.
      # - Remaining slashes within the path are replaced with `@@` when using plain
      #   text.
      sig do
        returns(T.nilable(Imagekitio::SubtitleOverlay::Encoding::OrSymbol))
      end
      attr_reader :encoding

      sig do
        params(encoding: Imagekitio::SubtitleOverlay::Encoding::OrSymbol).void
      end
      attr_writer :encoding

      # Control styling of the subtitle. See
      # [Styling subtitles](https://imagekit.io/docs/add-overlays-on-videos#styling-controls-for-subtitles-layer).
      sig do
        returns(T.nilable(T::Array[Imagekitio::SubtitleOverlayTransformation]))
      end
      attr_reader :transformation

      sig do
        params(
          transformation:
            T::Array[Imagekitio::SubtitleOverlayTransformation::OrHash]
        ).void
      end
      attr_writer :transformation

      sig do
        params(
          input: String,
          encoding: Imagekitio::SubtitleOverlay::Encoding::OrSymbol,
          transformation:
            T::Array[Imagekitio::SubtitleOverlayTransformation::OrHash],
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
        #
        # Regardless of the encoding method:
        #
        # - Leading and trailing slashes are removed.
        # - Remaining slashes within the path are replaced with `@@` when using plain
        #   text.
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
            encoding: Imagekitio::SubtitleOverlay::Encoding::OrSymbol,
            transformation: T::Array[Imagekitio::SubtitleOverlayTransformation]
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
      #
      # Regardless of the encoding method:
      #
      # - Leading and trailing slashes are removed.
      # - Remaining slashes within the path are replaced with `@@` when using plain
      #   text.
      module Encoding
        extend Imagekitio::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias { T.all(Symbol, Imagekitio::SubtitleOverlay::Encoding) }
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        AUTO = T.let(:auto, Imagekitio::SubtitleOverlay::Encoding::TaggedSymbol)
        PLAIN =
          T.let(:plain, Imagekitio::SubtitleOverlay::Encoding::TaggedSymbol)
        BASE64 =
          T.let(:base64, Imagekitio::SubtitleOverlay::Encoding::TaggedSymbol)

        sig do
          override.returns(
            T::Array[Imagekitio::SubtitleOverlay::Encoding::TaggedSymbol]
          )
        end
        def self.values
        end
      end
    end
  end
end
