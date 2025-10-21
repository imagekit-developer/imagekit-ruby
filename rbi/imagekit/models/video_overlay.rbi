# typed: strong

module Imagekit
  module Models
    class VideoOverlay < Imagekit::Models::BaseOverlay
      OrHash =
        T.type_alias do
          T.any(Imagekit::VideoOverlay, Imagekit::Internal::AnyHash)
        end

      # Specifies the relative path to the video used as an overlay.
      sig { returns(String) }
      attr_accessor :input

      sig { returns(Symbol) }
      attr_accessor :type

      # The input path can be included in the layer as either `i-{input}` or
      # `ie-{base64_encoded_input}`. By default, the SDK determines the appropriate
      # format automatically. To always use base64 encoding (`ie-{base64}`), set this
      # parameter to `base64`. To always use plain text (`i-{input}`), set it to
      # `plain`.
      sig { returns(T.nilable(Imagekit::VideoOverlay::Encoding::OrSymbol)) }
      attr_reader :encoding

      sig { params(encoding: Imagekit::VideoOverlay::Encoding::OrSymbol).void }
      attr_writer :encoding

      # Array of transformation to be applied to the overlay video. Except
      # `streamingResolutions`, all other video transformations are supported. See
      # [Video transformations](https://imagekit.io/docs/video-transformation).
      sig { returns(T.nilable(T::Array[Imagekit::Transformation])) }
      attr_reader :transformation

      sig { params(transformation: T::Array[Imagekit::Transformation]).void }
      attr_writer :transformation

      sig do
        params(
          input: String,
          encoding: Imagekit::VideoOverlay::Encoding::OrSymbol,
          transformation: T::Array[Imagekit::Transformation],
          type: Symbol
        ).returns(T.attached_class)
      end
      def self.new(
        # Specifies the relative path to the video used as an overlay.
        input:,
        # The input path can be included in the layer as either `i-{input}` or
        # `ie-{base64_encoded_input}`. By default, the SDK determines the appropriate
        # format automatically. To always use base64 encoding (`ie-{base64}`), set this
        # parameter to `base64`. To always use plain text (`i-{input}`), set it to
        # `plain`.
        encoding: nil,
        # Array of transformation to be applied to the overlay video. Except
        # `streamingResolutions`, all other video transformations are supported. See
        # [Video transformations](https://imagekit.io/docs/video-transformation).
        transformation: nil,
        type: :video
      )
      end

      sig do
        override.returns(
          {
            input: String,
            type: Symbol,
            encoding: Imagekit::VideoOverlay::Encoding::OrSymbol,
            transformation: T::Array[Imagekit::Transformation]
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
          T.type_alias { T.all(Symbol, Imagekit::VideoOverlay::Encoding) }
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        AUTO = T.let(:auto, Imagekit::VideoOverlay::Encoding::TaggedSymbol)
        PLAIN = T.let(:plain, Imagekit::VideoOverlay::Encoding::TaggedSymbol)
        BASE64 = T.let(:base64, Imagekit::VideoOverlay::Encoding::TaggedSymbol)

        sig do
          override.returns(
            T::Array[Imagekit::VideoOverlay::Encoding::TaggedSymbol]
          )
        end
        def self.values
        end
      end
    end
  end
end
