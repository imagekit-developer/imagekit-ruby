# typed: strong

module Imagekit
  module Models
    class ImageOverlay < Imagekit::Models::BaseOverlay
      OrHash =
        T.type_alias do
          T.any(Imagekit::ImageOverlay, Imagekit::Internal::AnyHash)
        end

      # Specifies the relative path to the image used as an overlay.
      sig { returns(String) }
      attr_accessor :input

      sig { returns(Symbol) }
      attr_accessor :type

      # The input path can be included in the layer as either `i-{input}` or
      # `ie-{base64_encoded_input}`. By default, the SDK determines the appropriate
      # format automatically. To always use base64 encoding (`ie-{base64}`), set this
      # parameter to `base64`. To always use plain text (`i-{input}`), set it to
      # `plain`.
      sig { returns(T.nilable(Imagekit::ImageOverlay::Encoding::OrSymbol)) }
      attr_reader :encoding

      sig { params(encoding: Imagekit::ImageOverlay::Encoding::OrSymbol).void }
      attr_writer :encoding

      # Array of transformations to be applied to the overlay image. Supported
      # transformations depends on the base/parent asset. See overlays on
      # [Images](https://imagekit.io/docs/add-overlays-on-images#list-of-supported-image-transformations-in-image-layers)
      # and
      # [Videos](https://imagekit.io/docs/add-overlays-on-videos#list-of-transformations-supported-on-image-overlay).
      sig { returns(T.nilable(T::Array[Imagekit::Transformation])) }
      attr_reader :transformation

      sig { params(transformation: T::Array[Imagekit::Transformation]).void }
      attr_writer :transformation

      sig do
        params(
          input: String,
          encoding: Imagekit::ImageOverlay::Encoding::OrSymbol,
          transformation: T::Array[Imagekit::Transformation],
          type: Symbol
        ).returns(T.attached_class)
      end
      def self.new(
        # Specifies the relative path to the image used as an overlay.
        input:,
        # The input path can be included in the layer as either `i-{input}` or
        # `ie-{base64_encoded_input}`. By default, the SDK determines the appropriate
        # format automatically. To always use base64 encoding (`ie-{base64}`), set this
        # parameter to `base64`. To always use plain text (`i-{input}`), set it to
        # `plain`.
        encoding: nil,
        # Array of transformations to be applied to the overlay image. Supported
        # transformations depends on the base/parent asset. See overlays on
        # [Images](https://imagekit.io/docs/add-overlays-on-images#list-of-supported-image-transformations-in-image-layers)
        # and
        # [Videos](https://imagekit.io/docs/add-overlays-on-videos#list-of-transformations-supported-on-image-overlay).
        transformation: nil,
        type: :image
      )
      end

      sig do
        override.returns(
          {
            input: String,
            type: Symbol,
            encoding: Imagekit::ImageOverlay::Encoding::OrSymbol,
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
          T.type_alias { T.all(Symbol, Imagekit::ImageOverlay::Encoding) }
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        AUTO = T.let(:auto, Imagekit::ImageOverlay::Encoding::TaggedSymbol)
        PLAIN = T.let(:plain, Imagekit::ImageOverlay::Encoding::TaggedSymbol)
        BASE64 = T.let(:base64, Imagekit::ImageOverlay::Encoding::TaggedSymbol)

        sig do
          override.returns(
            T::Array[Imagekit::ImageOverlay::Encoding::TaggedSymbol]
          )
        end
        def self.values
        end
      end
    end
  end
end
