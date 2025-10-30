# typed: strong

module Imagekitio
  module Models
    module Accounts
      URLEndpointListResponse =
        T.let(
          Imagekitio::Internal::Type::ArrayOf[
            Imagekitio::Accounts::URLEndpointResponse
          ],
          Imagekitio::Internal::Type::Converter
        )
    end
  end
end
