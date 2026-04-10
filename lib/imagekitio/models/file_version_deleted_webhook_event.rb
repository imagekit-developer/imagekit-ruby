# frozen_string_literal: true

module Imagekitio
  module Models
    class FileVersionDeletedWebhookEvent < Imagekitio::Models::BaseWebhookEvent
      # @!attribute created_at
      #   Timestamp of when the event occurred in ISO8601 format.
      #
      #   @return [Time]
      required :created_at, Time

      # @!attribute data
      #
      #   @return [Imagekitio::Models::FileVersionDeletedWebhookEvent::Data]
      required :data, -> { Imagekitio::FileVersionDeletedWebhookEvent::Data }

      # @!attribute type
      #   Type of the webhook event.
      #
      #   @return [Symbol, :"file-version.deleted"]
      required :type, const: :"file-version.deleted"

      # @!method initialize(created_at:, data:, type: :"file-version.deleted")
      #   Triggered when a file version is deleted.
      #
      #   @param created_at [Time] Timestamp of when the event occurred in ISO8601 format.
      #
      #   @param data [Imagekitio::Models::FileVersionDeletedWebhookEvent::Data]
      #
      #   @param type [Symbol, :"file-version.deleted"] Type of the webhook event.

      class Data < Imagekitio::Internal::Type::BaseModel
        # @!attribute file_id
        #   The unique `fileId` of the deleted file.
        #
        #   @return [String]
        required :file_id, String, api_name: :fileId

        # @!attribute version_id
        #   The unique `versionId` of the deleted file version.
        #
        #   @return [String]
        required :version_id, String, api_name: :versionId

        # @!method initialize(file_id:, version_id:)
        #   @param file_id [String] The unique `fileId` of the deleted file.
        #
        #   @param version_id [String] The unique `versionId` of the deleted file version.
      end
    end
  end
end
