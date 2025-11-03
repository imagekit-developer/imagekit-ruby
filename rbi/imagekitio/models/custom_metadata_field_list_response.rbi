# typed: strong

module Imagekitio
  module Models
    CustomMetadataFieldListResponse =
      T.let(
        Imagekitio::Internal::Type::ArrayOf[Imagekitio::CustomMetadataField],
        Imagekitio::Internal::Type::Converter
      )
  end
end
