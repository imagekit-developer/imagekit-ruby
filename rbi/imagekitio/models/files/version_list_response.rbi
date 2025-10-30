# typed: strong

module Imagekitio
  module Models
    module Files
      VersionListResponse =
        T.let(
          Imagekitio::Internal::Type::ArrayOf[Imagekitio::File],
          Imagekitio::Internal::Type::Converter
        )
    end
  end
end
