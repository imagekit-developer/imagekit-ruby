# frozen_string_literal: true

module Imagekitio
  module Models
    module Accounts
      # @type [Imagekitio::Internal::Type::Converter]
      OriginListResponse =
        Imagekitio::Internal::Type::ArrayOf[union: -> { Imagekitio::Accounts::OriginResponse }]
    end
  end
end
