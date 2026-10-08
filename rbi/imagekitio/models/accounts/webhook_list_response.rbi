# typed: strong

module Imagekitio
  module Models
    module Accounts
      WebhookListResponse =
        T.let(
          Imagekitio::Internal::Type::ArrayOf[Imagekitio::Accounts::Webhook],
          Imagekitio::Internal::Type::Converter
        )
    end
  end
end
