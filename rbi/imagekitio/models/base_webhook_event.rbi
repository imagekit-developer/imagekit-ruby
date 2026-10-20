# typed: strong

module Imagekitio
  module Models
    class BaseWebhookEvent < Imagekitio::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(Imagekitio::BaseWebhookEvent, Imagekitio::Internal::AnyHash)
        end

      # Unique identifier for the event.
      sig { returns(String) }
      attr_accessor :id

      sig { params(id: String).returns(T.attached_class) }
      def self.new(
        # Unique identifier for the event.
        id:
      )
      end

      sig { override.returns({ id: String }) }
      def to_hash
      end
    end
  end
end
