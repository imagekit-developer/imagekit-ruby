# typed: strong

module Imagekitio
  module Models
    class FileVersionDeletedWebhookEvent < Imagekitio::Models::BaseWebhookEvent
      OrHash =
        T.type_alias do
          T.any(
            Imagekitio::FileVersionDeletedWebhookEvent,
            Imagekitio::Internal::AnyHash
          )
        end

      # Timestamp of when the event occurred in ISO8601 format.
      sig { returns(Time) }
      attr_accessor :created_at

      sig { returns(Imagekitio::FileVersionDeletedWebhookEvent::Data) }
      attr_reader :data

      sig do
        params(
          data: Imagekitio::FileVersionDeletedWebhookEvent::Data::OrHash
        ).void
      end
      attr_writer :data

      # Type of the webhook event.
      sig { returns(Symbol) }
      attr_accessor :type

      # Triggered when a file version is deleted.
      sig do
        params(
          created_at: Time,
          data: Imagekitio::FileVersionDeletedWebhookEvent::Data::OrHash,
          type: Symbol
        ).returns(T.attached_class)
      end
      def self.new(
        # Timestamp of when the event occurred in ISO8601 format.
        created_at:,
        data:,
        # Type of the webhook event.
        type: :"file-version.deleted"
      )
      end

      sig do
        override.returns(
          {
            created_at: Time,
            data: Imagekitio::FileVersionDeletedWebhookEvent::Data,
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
              Imagekitio::FileVersionDeletedWebhookEvent::Data,
              Imagekitio::Internal::AnyHash
            )
          end

        # The unique `fileId` of the deleted file.
        sig { returns(String) }
        attr_accessor :file_id

        # The unique `versionId` of the deleted file version.
        sig { returns(String) }
        attr_accessor :version_id

        sig do
          params(file_id: String, version_id: String).returns(T.attached_class)
        end
        def self.new(
          # The unique `fileId` of the deleted file.
          file_id:,
          # The unique `versionId` of the deleted file version.
          version_id:
        )
        end

        sig { override.returns({ file_id: String, version_id: String }) }
        def to_hash
        end
      end
    end
  end
end
