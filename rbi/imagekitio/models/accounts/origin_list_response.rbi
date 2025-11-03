# typed: strong

module Imagekitio
  module Models
    module Accounts
      OriginListResponse =
        T.let(
          Imagekitio::Internal::Type::ArrayOf[
            union: Imagekitio::Accounts::OriginResponse
          ],
          Imagekitio::Internal::Type::Converter
        )
    end
  end
end
