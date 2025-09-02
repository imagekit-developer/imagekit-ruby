# typed: strong

module Imagekit
  module Models
    class BaseWebhookEvent < Imagekit::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(Imagekit::BaseWebhookEvent, Imagekit::Internal::AnyHash)
        end

      # Unique identifier for the event.
      sig { returns(String) }
      attr_accessor :id

      # The type of webhook event.
      sig { returns(String) }
      attr_accessor :type

      sig { params(id: String, type: String).returns(T.attached_class) }
      def self.new(
        # Unique identifier for the event.
        id:,
        # The type of webhook event.
        type:
      )
      end

      sig { override.returns({ id: String, type: String }) }
      def to_hash
      end
    end
  end
end
