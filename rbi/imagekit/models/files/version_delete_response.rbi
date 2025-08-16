# typed: strong

module Imagekit
  module Models
    module Files
      VersionDeleteResponse =
        T.let(T.anything, Imagekit::Internal::Type::Converter)
    end
  end
end
