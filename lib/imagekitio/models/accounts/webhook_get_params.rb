# frozen_string_literal: true

module Imagekitio
  module Models
    module Accounts
      # @see Imagekitio::Resources::Accounts::Webhooks#get
      class WebhookGetParams < Imagekitio::Internal::Type::BaseModel
        extend Imagekitio::Internal::Type::RequestParameters::Converter
        include Imagekitio::Internal::Type::RequestParameters

        # @!attribute id
        #   Unique identifier for a webhook.
        #
        #   @return [String]
        required :id, String

        # @!method initialize(id:, request_options: {})
        #   @param id [String] Unique identifier for a webhook.
        #
        #   @param request_options [Imagekitio::RequestOptions, Hash{Symbol=>Object}]
      end
    end
  end
end
