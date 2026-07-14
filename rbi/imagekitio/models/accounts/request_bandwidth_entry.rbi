# typed: strong

module Imagekitio
  module Models
    module Accounts
      class RequestBandwidthEntry < Imagekitio::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Imagekitio::Accounts::RequestBandwidthEntry,
              Imagekitio::Internal::AnyHash
            )
          end

        # Total bandwidth used in bytes.
        sig { returns(Float) }
        attr_accessor :bandwidth_bytes

        # Number of requests.
        sig { returns(Float) }
        attr_accessor :request_count

        sig do
          params(bandwidth_bytes: Float, request_count: Float).returns(
            T.attached_class
          )
        end
        def self.new(
          # Total bandwidth used in bytes.
          bandwidth_bytes:,
          # Number of requests.
          request_count:
        )
        end

        sig do
          override.returns({ bandwidth_bytes: Float, request_count: Float })
        end
        def to_hash
        end
      end
    end
  end
end
