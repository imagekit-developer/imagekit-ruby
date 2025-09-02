# frozen_string_literal: true

module Imagekit
  module Models
    class BaseWebhookEvent < Imagekit::Internal::Type::BaseModel
      # @!attribute id
      #   Unique identifier for the event.
      #
      #   @return [String]
      required :id, String

      # @!attribute type
      #   The type of webhook event.
      #
      #   @return [String]
      required :type, String

      # @!method initialize(id:, type:)
      #   @param id [String] Unique identifier for the event.
      #
      #   @param type [String] The type of webhook event.
    end
  end
end
