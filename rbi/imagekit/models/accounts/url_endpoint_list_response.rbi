# typed: strong

module Imagekit
  module Models
    module Accounts
      URLEndpointListResponse =
        T.let(
          Imagekit::Internal::Type::ArrayOf[
            Imagekit::Accounts::URLEndpointResponse
          ],
          Imagekit::Internal::Type::Converter
        )
    end
  end
end
