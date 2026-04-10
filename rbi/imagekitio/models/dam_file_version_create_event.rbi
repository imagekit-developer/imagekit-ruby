# typed: strong

module Imagekitio
  module Models
    class DamFileVersionCreateEvent < Imagekitio::Models::BaseWebhookEvent
      OrHash =
        T.type_alias do
          T.any(
            Imagekitio::DamFileVersionCreateEvent,
            Imagekitio::Internal::AnyHash
          )
        end

      # Timestamp of when the event occurred in ISO8601 format.
      sig { returns(Time) }
      attr_accessor :created_at

      sig { returns(T.anything) }
      attr_accessor :data

      # Type of the webhook event.
      sig { returns(Symbol) }
      attr_accessor :type

      # Triggered when a file version is created.
      sig do
        params(created_at: Time, data: T.anything, type: Symbol).returns(
          T.attached_class
        )
      end
      def self.new(
        # Timestamp of when the event occurred in ISO8601 format.
        created_at:,
        data:,
        # Type of the webhook event.
        type: :"file-version.created"
      )
      end

      sig do
        override.returns({ created_at: Time, data: T.anything, type: Symbol })
      end
      def to_hash
      end
    end
  end
end
