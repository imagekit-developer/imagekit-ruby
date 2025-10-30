# typed: strong

module Imagekitio
  module Models
    class FileRenameResponse < Imagekitio::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            Imagekitio::Models::FileRenameResponse,
            Imagekitio::Internal::AnyHash
          )
        end

      # Unique identifier of the purge request. This can be used to check the status of
      # the purge request.
      sig { returns(T.nilable(String)) }
      attr_reader :purge_request_id

      sig { params(purge_request_id: String).void }
      attr_writer :purge_request_id

      sig { params(purge_request_id: String).returns(T.attached_class) }
      def self.new(
        # Unique identifier of the purge request. This can be used to check the status of
        # the purge request.
        purge_request_id: nil
      )
      end

      sig { override.returns({ purge_request_id: String }) }
      def to_hash
      end
    end
  end
end
