# typed: strong

module Imagekit
  module Models
    module Accounts
      OriginListResponse =
        T.let(
          Imagekit::Internal::Type::ArrayOf[union: Imagekit::Accounts::Origin],
          Imagekit::Internal::Type::Converter
        )
    end
  end
end
