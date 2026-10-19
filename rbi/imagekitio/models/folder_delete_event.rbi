# typed: strong

module Imagekitio
  module Models
    class FolderDeleteEvent < Imagekitio::Models::BaseWebhookEvent
      OrHash =
        T.type_alias do
          T.any(Imagekitio::FolderDeleteEvent, Imagekitio::Internal::AnyHash)
        end

      # Timestamp of when the event occurred in ISO8601 format.
      sig { returns(Time) }
      attr_accessor :created_at

      sig { returns(Imagekitio::FolderDeleteEvent::Data) }
      attr_reader :data

      sig { params(data: Imagekitio::FolderDeleteEvent::Data::OrHash).void }
      attr_writer :data

      # Type of the webhook event.
      sig { returns(Symbol) }
      attr_accessor :type

      # Triggered when a folder is deleted. Deleting a folder tree sends one event per
      # folder in the tree; the files inside it send `file.deleted` events and their
      # versions send `file-version.deleted` events. Moving a folder sends this event
      # for the old `folderId` and `folder.created` for the new one.
      sig do
        params(
          created_at: Time,
          data: Imagekitio::FolderDeleteEvent::Data::OrHash,
          type: Symbol
        ).returns(T.attached_class)
      end
      def self.new(
        # Timestamp of when the event occurred in ISO8601 format.
        created_at:,
        data:,
        # Type of the webhook event.
        type: :"folder.deleted"
      )
      end

      sig do
        override.returns(
          {
            created_at: Time,
            data: Imagekitio::FolderDeleteEvent::Data,
            type: Symbol
          }
        )
      end
      def to_hash
      end

      class Data < Imagekitio::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Imagekitio::FolderDeleteEvent::Data,
              Imagekitio::Internal::AnyHash
            )
          end

        # The unique `folderId` of the deleted folder.
        sig { returns(String) }
        attr_accessor :folder_id

        sig { params(folder_id: String).returns(T.attached_class) }
        def self.new(
          # The unique `folderId` of the deleted folder.
          folder_id:
        )
        end

        sig { override.returns({ folder_id: String }) }
        def to_hash
        end
      end
    end
  end
end
