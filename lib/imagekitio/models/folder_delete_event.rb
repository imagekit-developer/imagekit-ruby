# frozen_string_literal: true

module Imagekitio
  module Models
    class FolderDeleteEvent < Imagekitio::Models::BaseWebhookEvent
      # @!attribute created_at
      #   Timestamp of when the event occurred in ISO8601 format.
      #
      #   @return [Time]
      required :created_at, Time

      # @!attribute data
      #
      #   @return [Imagekitio::Models::FolderDeleteEvent::Data]
      required :data, -> { Imagekitio::FolderDeleteEvent::Data }

      # @!attribute type
      #   Type of the webhook event.
      #
      #   @return [Symbol, :"folder.deleted"]
      required :type, const: :"folder.deleted"

      # @!method initialize(created_at:, data:, type: :"folder.deleted")
      #   Triggered when a folder is deleted.
      #
      #   @param created_at [Time] Timestamp of when the event occurred in ISO8601 format.
      #
      #   @param data [Imagekitio::Models::FolderDeleteEvent::Data]
      #
      #   @param type [Symbol, :"folder.deleted"] Type of the webhook event.

      class Data < Imagekitio::Internal::Type::BaseModel
        # @!attribute folder_id
        #   The unique `folderId` of the deleted folder.
        #
        #   @return [String]
        required :folder_id, String, api_name: :folderId

        # @!method initialize(folder_id:)
        #   @param folder_id [String] The unique `folderId` of the deleted folder.
      end
    end
  end
end
