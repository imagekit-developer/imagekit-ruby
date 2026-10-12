# frozen_string_literal: true

module Imagekitio
  module Models
    class FolderCreateEvent < Imagekitio::Models::BaseWebhookEvent
      # @!attribute created_at
      #   Timestamp of when the event occurred in ISO8601 format.
      #
      #   @return [Time]
      required :created_at, Time

      # @!attribute data
      #
      #   @return [Imagekitio::Models::Folder]
      required :data, -> { Imagekitio::Folder }

      # @!attribute type
      #   Type of the webhook event.
      #
      #   @return [Symbol, :"folder.created"]
      required :type, const: :"folder.created"

      # @!method initialize(created_at:, data:, type: :"folder.created")
      #   Triggered when a folder is created.
      #
      #   @param created_at [Time] Timestamp of when the event occurred in ISO8601 format.
      #
      #   @param data [Imagekitio::Models::Folder]
      #
      #   @param type [Symbol, :"folder.created"] Type of the webhook event.
    end
  end
end
