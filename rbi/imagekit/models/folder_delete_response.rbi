# typed: strong

module Imagekit
  module Models
    FolderDeleteResponse =
      T.let(T.anything, Imagekit::Internal::Type::Converter)
  end
end
