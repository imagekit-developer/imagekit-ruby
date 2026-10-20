# frozen_string_literal: true

module Imagekitio
  module Models
    class BaseWebhookEvent < Imagekitio::Internal::Type::BaseModel
      # @!attribute id
      #   Unique identifier for the event.
      #
      #   @return [String]
      required :id, String

      # @!method initialize(id:)
      #   @param id [String] Unique identifier for the event.
    end
  end
end
