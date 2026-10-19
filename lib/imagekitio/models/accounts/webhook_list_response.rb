# frozen_string_literal: true

module Imagekitio
  module Models
    module Accounts
      # @type [Imagekitio::Internal::Type::Converter]
      WebhookListResponse = Imagekitio::Internal::Type::ArrayOf[-> { Imagekitio::Accounts::Webhook }]
    end
  end
end
