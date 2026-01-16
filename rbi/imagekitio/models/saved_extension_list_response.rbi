# typed: strong

module Imagekitio
  module Models
    SavedExtensionListResponse =
      T.let(
        Imagekitio::Internal::Type::ArrayOf[Imagekitio::SavedExtension],
        Imagekitio::Internal::Type::Converter
      )
  end
end
