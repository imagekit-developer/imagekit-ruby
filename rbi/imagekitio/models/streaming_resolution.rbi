# typed: strong

module Imagekitio
  module Models
    # Available streaming resolutions for
    # [adaptive bitrate streaming](https://imagekit.io/docs/adaptive-bitrate-streaming)
    module StreamingResolution
      extend Imagekitio::Internal::Type::Enum

      TaggedSymbol =
        T.type_alias { T.all(Symbol, Imagekitio::StreamingResolution) }
      OrSymbol = T.type_alias { T.any(Symbol, String) }

      STREAMING_RESOLUTION_240 =
        T.let(:"240", Imagekitio::StreamingResolution::TaggedSymbol)
      STREAMING_RESOLUTION_360 =
        T.let(:"360", Imagekitio::StreamingResolution::TaggedSymbol)
      STREAMING_RESOLUTION_480 =
        T.let(:"480", Imagekitio::StreamingResolution::TaggedSymbol)
      STREAMING_RESOLUTION_720 =
        T.let(:"720", Imagekitio::StreamingResolution::TaggedSymbol)
      STREAMING_RESOLUTION_1080 =
        T.let(:"1080", Imagekitio::StreamingResolution::TaggedSymbol)
      STREAMING_RESOLUTION_1440 =
        T.let(:"1440", Imagekitio::StreamingResolution::TaggedSymbol)
      STREAMING_RESOLUTION_2160 =
        T.let(:"2160", Imagekitio::StreamingResolution::TaggedSymbol)

      sig do
        override.returns(
          T::Array[Imagekitio::StreamingResolution::TaggedSymbol]
        )
      end
      def self.values
      end
    end
  end
end
