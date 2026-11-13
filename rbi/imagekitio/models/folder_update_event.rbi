# typed: strong

module Imagekitio
  module Models
    class FolderUpdateEvent < Imagekitio::Models::BaseWebhookEvent
      OrHash =
        T.type_alias do
          T.any(Imagekitio::FolderUpdateEvent, Imagekitio::Internal::AnyHash)
        end

      # Timestamp of when the event occurred in ISO8601 format.
      sig { returns(Time) }
      attr_accessor :created_at

      sig { returns(Imagekitio::Folder) }
      attr_reader :data

      sig { params(data: Imagekitio::Folder::OrHash).void }
      attr_writer :data

      # Type of the webhook event.
      sig { returns(Symbol) }
      attr_accessor :type

      # Values the folder had before this update. Present only when the folder was
      # renamed or its parent folder was renamed.
      sig { returns(T.nilable(Imagekitio::FolderUpdateEvent::Previous)) }
      attr_reader :previous

      sig do
        params(previous: Imagekitio::FolderUpdateEvent::Previous::OrHash).void
      end
      attr_writer :previous

      # Triggered when a folder is updated, for example when its custom metadata changes
      # or it is renamed. Renaming a folder sends one event per folder in the tree, each
      # with its new `folderPath` in `data` and its old `folderPath` in `previous`.
      sig do
        params(
          created_at: Time,
          data: Imagekitio::Folder::OrHash,
          previous: Imagekitio::FolderUpdateEvent::Previous::OrHash,
          type: Symbol
        ).returns(T.attached_class)
      end
      def self.new(
        # Timestamp of when the event occurred in ISO8601 format.
        created_at:,
        data:,
        # Values the folder had before this update. Present only when the folder was
        # renamed or its parent folder was renamed.
        previous: nil,
        # Type of the webhook event.
        type: :"folder.updated"
      )
      end

      sig do
        override.returns(
          {
            created_at: Time,
            data: Imagekitio::Folder,
            type: Symbol,
            previous: Imagekitio::FolderUpdateEvent::Previous
          }
        )
      end
      def to_hash
      end

      class Previous < Imagekitio::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Imagekitio::FolderUpdateEvent::Previous,
              Imagekitio::Internal::AnyHash
            )
          end

        # Path of the folder before it was renamed.
        sig { returns(T.nilable(String)) }
        attr_reader :folder_path

        sig { params(folder_path: String).void }
        attr_writer :folder_path

        # Values the folder had before this update. Present only when the folder was
        # renamed or its parent folder was renamed.
        sig { params(folder_path: String).returns(T.attached_class) }
        def self.new(
          # Path of the folder before it was renamed.
          folder_path: nil
        )
        end

        sig { override.returns({ folder_path: String }) }
        def to_hash
        end
      end
    end
  end
end
