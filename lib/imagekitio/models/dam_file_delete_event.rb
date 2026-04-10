# frozen_string_literal: true

module Imagekitio
  module Models
    class DamFileDeleteEvent < Imagekitio::Models::BaseWebhookEvent
      # @!attribute created_at
      #   Timestamp of when the event occurred in ISO8601 format.
      #
      #   @return [Time]
      required :created_at, Time

      # @!attribute data
      #
      #   @return [Imagekitio::Models::DamFileDeleteEvent::Data]
      required :data, -> { Imagekitio::DamFileDeleteEvent::Data }

      # @!attribute type
      #   Type of the webhook event.
      #
      #   @return [Symbol, :"file.deleted"]
      required :type, const: :"file.deleted"

      # @!method initialize(created_at:, data:, type: :"file.deleted")
      #   Triggered when a file is deleted.
      #
      #   @param created_at [Time] Timestamp of when the event occurred in ISO8601 format.
      #
      #   @param data [Imagekitio::Models::DamFileDeleteEvent::Data]
      #
      #   @param type [Symbol, :"file.deleted"] Type of the webhook event.

      class Data < Imagekitio::Internal::Type::BaseModel
        # @!attribute file_id
        #   The unique `fileId` of the deleted file.
        #
        #   @return [String]
        required :file_id, String, api_name: :fileId

        # @!method initialize(file_id:)
        #   @param file_id [String] The unique `fileId` of the deleted file.
      end
    end
  end
end
