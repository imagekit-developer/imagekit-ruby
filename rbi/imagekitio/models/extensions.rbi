# typed: strong

module Imagekitio
  module Models
    Extensions =
      T.let(
        Imagekitio::Internal::Type::ArrayOf[union: Imagekitio::ExtensionItem],
        Imagekitio::Internal::Type::Converter
      )
  end
end
