# typed: strong

module Imagekitio
  module Models
    class DamFileDeleteEvent < Imagekitio::Models::BaseWebhookEvent
      OrHash =
        T.type_alias do
          T.any(Imagekitio::DamFileDeleteEvent, Imagekitio::Internal::AnyHash)
        end

      # Timestamp of when the event occurred in ISO8601 format.
      sig { returns(Time) }
      attr_accessor :created_at

      sig { returns(Imagekitio::DamFileDeleteEvent::Data) }
      attr_reader :data

      sig { params(data: Imagekitio::DamFileDeleteEvent::Data::OrHash).void }
      attr_writer :data

      # Type of the webhook event.
      sig { returns(Symbol) }
      attr_accessor :type

      # Triggered when a file is deleted.
      sig do
        params(
          created_at: Time,
          data: Imagekitio::DamFileDeleteEvent::Data::OrHash,
          type: Symbol
        ).returns(T.attached_class)
      end
      def self.new(
        # Timestamp of when the event occurred in ISO8601 format.
        created_at:,
        data:,
        # Type of the webhook event.
        type: :"file.deleted"
      )
      end

      sig do
        override.returns(
          {
            created_at: Time,
            data: Imagekitio::DamFileDeleteEvent::Data,
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
              Imagekitio::DamFileDeleteEvent::Data,
              Imagekitio::Internal::AnyHash
            )
          end

        # The unique `fileId` of the deleted file.
        sig { returns(String) }
        attr_accessor :file_id

        sig { params(file_id: String).returns(T.attached_class) }
        def self.new(
          # The unique `fileId` of the deleted file.
          file_id:
        )
        end

        sig { override.returns({ file_id: String }) }
        def to_hash
        end
      end
    end
  end
end
