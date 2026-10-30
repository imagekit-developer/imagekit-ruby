# typed: strong

module Imagekitio
  module Models
    module Accounts
      class ContractUnits < Imagekitio::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Imagekitio::Accounts::ContractUnits,
              Imagekitio::Internal::AnyHash
            )
          end

        # Bandwidth in bytes.
        sig { returns(Integer) }
        attr_accessor :bandwidth_bytes

        # Number of extension units.
        sig { returns(Integer) }
        attr_accessor :extension_units_count

        # Number of purge cache requests.
        sig { returns(Integer) }
        attr_accessor :purge_cache_requests

        # Number of video processing units.
        sig { returns(Integer) }
        attr_accessor :video_processing_units_count

        sig do
          params(
            bandwidth_bytes: Integer,
            extension_units_count: Integer,
            purge_cache_requests: Integer,
            video_processing_units_count: Integer
          ).returns(T.attached_class)
        end
        def self.new(
          # Bandwidth in bytes.
          bandwidth_bytes:,
          # Number of extension units.
          extension_units_count:,
          # Number of purge cache requests.
          purge_cache_requests:,
          # Number of video processing units.
          video_processing_units_count:
        )
        end

        sig do
          override.returns(
            {
              bandwidth_bytes: Integer,
              extension_units_count: Integer,
              purge_cache_requests: Integer,
              video_processing_units_count: Integer
            }
          )
        end
        def to_hash
        end
      end
    end
  end
end
