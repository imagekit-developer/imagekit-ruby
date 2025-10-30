# frozen_string_literal: true

module Imagekitio
  module Models
    module Accounts
      # @type [Imagekitio::Internal::Type::Converter]
      URLEndpointListResponse =
        Imagekitio::Internal::Type::ArrayOf[-> { Imagekitio::Accounts::URLEndpointResponse }]
    end
  end
end
