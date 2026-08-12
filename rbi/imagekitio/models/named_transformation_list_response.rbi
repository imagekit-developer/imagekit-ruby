# typed: strong

module Imagekitio
  module Models
    NamedTransformationListResponse =
      T.let(
        Imagekitio::Internal::Type::ArrayOf[Imagekitio::NamedTransformation],
        Imagekitio::Internal::Type::Converter
      )
  end
end
