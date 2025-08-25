# typed: strong

module Imagekit
  module Models
    module Files
      VersionListResponse =
        T.let(
          Imagekit::Internal::Type::ArrayOf[Imagekit::File],
          Imagekit::Internal::Type::Converter
        )
    end
  end
end
