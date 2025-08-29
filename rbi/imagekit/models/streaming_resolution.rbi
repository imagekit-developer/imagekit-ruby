# typed: strong

module Imagekit
  module Models
    # Available streaming resolutions for adaptive bitrate streaming
    module StreamingResolution
      extend Imagekit::Internal::Type::Enum

      TaggedSymbol =
        T.type_alias { T.all(Symbol, Imagekit::StreamingResolution) }
      OrSymbol = T.type_alias { T.any(Symbol, String) }

      STREAMING_RESOLUTION_240 =
        T.let(:"240", Imagekit::StreamingResolution::TaggedSymbol)
      STREAMING_RESOLUTION_360 =
        T.let(:"360", Imagekit::StreamingResolution::TaggedSymbol)
      STREAMING_RESOLUTION_480 =
        T.let(:"480", Imagekit::StreamingResolution::TaggedSymbol)
      STREAMING_RESOLUTION_720 =
        T.let(:"720", Imagekit::StreamingResolution::TaggedSymbol)
      STREAMING_RESOLUTION_1080 =
        T.let(:"1080", Imagekit::StreamingResolution::TaggedSymbol)
      STREAMING_RESOLUTION_1440 =
        T.let(:"1440", Imagekit::StreamingResolution::TaggedSymbol)
      STREAMING_RESOLUTION_2160 =
        T.let(:"2160", Imagekit::StreamingResolution::TaggedSymbol)

      sig do
        override.returns(T::Array[Imagekit::StreamingResolution::TaggedSymbol])
      end
      def self.values
      end
    end
  end
end
