# typed: strong

module Imagekitio
  module Models
    class FileVersionCreateEvent < Imagekitio::Models::BaseWebhookEvent
      OrHash =
        T.type_alias do
          T.any(
            Imagekitio::FileVersionCreateEvent,
            Imagekitio::Internal::AnyHash
          )
        end

      # Timestamp of when the event occurred in ISO8601 format.
      sig { returns(Time) }
      attr_accessor :created_at

      # Object containing details of a file or file version.
      sig { returns(Imagekitio::File) }
      attr_reader :data

      sig { params(data: Imagekitio::File::OrHash).void }
      attr_writer :data

      # Type of the webhook event.
      sig { returns(Symbol) }
      attr_accessor :type

      # Triggered when a file version is created.
      sig do
        params(
          created_at: Time,
          data: Imagekitio::File::OrHash,
          type: Symbol
        ).returns(T.attached_class)
      end
      def self.new(
        # Timestamp of when the event occurred in ISO8601 format.
        created_at:,
        # Object containing details of a file or file version.
        data:,
        # Type of the webhook event.
        type: :"file-version.created"
      )
      end

      sig do
        override.returns(
          { created_at: Time, data: Imagekitio::File, type: Symbol }
        )
      end
      def to_hash
      end
    end
  end
end
