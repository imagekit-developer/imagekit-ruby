# frozen_string_literal: true

module Imagekitio
  module Models
    class FileVersionCreateEvent < Imagekitio::Models::BaseWebhookEvent
      # @!attribute created_at
      #   Timestamp of when the event occurred in ISO8601 format.
      #
      #   @return [Time]
      required :created_at, Time

      # @!attribute data
      #   Object containing details of a file or file version.
      #
      #   @return [Imagekitio::Models::File]
      required :data, -> { Imagekitio::File }

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
      #   @param data [Imagekitio::Models::File] Object containing details of a file or file version.
      #
      #   @param type [Symbol, :"file-version.created"] Type of the webhook event.
    end
  end
end
