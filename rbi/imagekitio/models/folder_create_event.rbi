# typed: strong

module Imagekitio
  module Models
    class FolderCreateEvent < Imagekitio::Models::BaseWebhookEvent
      OrHash =
        T.type_alias do
          T.any(Imagekitio::FolderCreateEvent, Imagekitio::Internal::AnyHash)
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

      # Triggered when a folder is created.
      sig do
        params(
          created_at: Time,
          data: Imagekitio::Folder::OrHash,
          type: Symbol
        ).returns(T.attached_class)
      end
      def self.new(
        # Timestamp of when the event occurred in ISO8601 format.
        created_at:,
        data:,
        # Type of the webhook event.
        type: :"folder.created"
      )
      end

      sig do
        override.returns(
          { created_at: Time, data: Imagekitio::Folder, type: Symbol }
        )
      end
      def to_hash
      end
    end
  end
end
