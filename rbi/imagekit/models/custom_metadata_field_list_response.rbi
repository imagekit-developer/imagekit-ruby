# typed: strong

module Imagekit
  module Models
    CustomMetadataFieldListResponse =
      T.let(
        Imagekit::Internal::Type::ArrayOf[Imagekit::CustomMetadataField],
        Imagekit::Internal::Type::Converter
      )
  end
end
