# typed: strong

module Imagekitio
  module Models
    EmbeddedMetadata =
      T.let(
        Imagekitio::Internal::Type::HashOf[Imagekitio::Internal::Type::Unknown],
        Imagekitio::Internal::Type::Converter
      )
  end
end
