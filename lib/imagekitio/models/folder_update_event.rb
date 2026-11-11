# frozen_string_literal: true

module Imagekitio
  module Models
    class FolderUpdateEvent < Imagekitio::Models::BaseWebhookEvent
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
      #   @return [Symbol, :"folder.updated"]
      required :type, const: :"folder.updated"

      # @!attribute previous
      #   Values the folder had before this update. Present only when the folder was
      #   renamed or its parent folder was renamed.
      #
      #   @return [Imagekitio::Models::FolderUpdateEvent::Previous, nil]
      optional :previous, -> { Imagekitio::FolderUpdateEvent::Previous }

      # @!method initialize(created_at:, data:, previous: nil, type: :"folder.updated")
      #   Some parameter documentations has been truncated, see
      #   {Imagekitio::Models::FolderUpdateEvent} for more details.
      #
      #   Triggered when a folder is updated, for example when its custom metadata changes
      #   or it is renamed. Renaming a folder sends one event per folder in the tree, each
      #   with its new `folderPath` in `data` and its old `folderPath` in `previous`.
      #
      #   @param created_at [Time] Timestamp of when the event occurred in ISO8601 format.
      #
      #   @param data [Imagekitio::Models::Folder]
      #
      #   @param previous [Imagekitio::Models::FolderUpdateEvent::Previous] Values the folder had before this update. Present only when the folder was renam
      #
      #   @param type [Symbol, :"folder.updated"] Type of the webhook event.

      class Previous < Imagekitio::Internal::Type::BaseModel
        # @!attribute folder_path
        #   Path of the folder before it was renamed.
        #
        #   @return [String, nil]
        optional :folder_path, String, api_name: :folderPath

        # @!method initialize(folder_path: nil)
        #   Values the folder had before this update. Present only when the folder was
        #   renamed or its parent folder was renamed.
        #
        #   @param folder_path [String] Path of the folder before it was renamed.
      end
    end
  end
end
