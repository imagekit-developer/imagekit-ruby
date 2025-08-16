# typed: strong

module Imagekit
  module Models
    module Files
      class PurgeExecuteResponse < Imagekit::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Imagekit::Models::Files::PurgeExecuteResponse,
              Imagekit::Internal::AnyHash
            )
          end

        # Unique identifier of the purge request. This can be used to check the status of
        # the purge request.
        sig { returns(T.nilable(String)) }
        attr_reader :request_id

        sig { params(request_id: String).void }
        attr_writer :request_id

        sig { params(request_id: String).returns(T.attached_class) }
        def self.new(
          # Unique identifier of the purge request. This can be used to check the status of
          # the purge request.
          request_id: nil
        )
        end

        sig { override.returns({ request_id: String }) }
        def to_hash
        end
      end
    end
  end
end
