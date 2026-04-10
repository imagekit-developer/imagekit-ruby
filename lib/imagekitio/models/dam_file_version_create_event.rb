# frozen_string_literal: true

module Imagekitio
  module Models
    class DamFileVersionCreateEvent < Imagekitio::Models::BaseWebhookEvent
      # @!attribute created_at
      #   Timestamp of when the event occurred in ISO8601 format.
      #
      #   @return [Time]
      required :created_at, Time

      # @!attribute data
      #
      #   @return [Object]
      required :data, Imagekitio::Internal::Type::Unknown

      # @!attribute type
      #   Type of the webhook event.
      #
      #   @return [Symbol, :"file-version.created"]
      required :type, const: :"file-version.created"

      # @!method initialize(created_at:, data:, type: :"file-version.created")
      #   Triggered when a file version is created.
      #
      #   @param created_at [Time] Timestamp of when the event occurred in ISO8601 format.
      #
      #   @param data [Object]
      #
      #   @param type [Symbol, :"file-version.created"] Type of the webhook event.
    end
  end
end
