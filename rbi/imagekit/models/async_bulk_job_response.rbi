# typed: strong

module Imagekit
  module Models
    AsyncBulkJobResponse =
      T.let(T.anything, Imagekit::Internal::Type::Converter)
  end
end
