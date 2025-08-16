# typed: strong

module Imagekit
  module Models
    FolderCreateResponse =
      T.let(T.anything, Imagekit::Internal::Type::Converter)
  end
end
