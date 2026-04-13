# typed: strong

module Imagekitio
  module Models
    CustomMetadata =
      T.let(
        Imagekitio::Internal::Type::HashOf[Imagekitio::Internal::Type::Unknown],
        Imagekitio::Internal::Type::Converter
      )
  end
end
