# typed: strong

module Imagekitio
  module Models
    module Cache
      class InvalidationGetResponse < Imagekitio::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Imagekitio::Models::Cache::InvalidationGetResponse,
              Imagekitio::Internal::AnyHash
            )
          end

        # Status of the purge request.
        sig do
          returns(
            T.nilable(
              Imagekitio::Models::Cache::InvalidationGetResponse::Status::TaggedSymbol
            )
          )
        end
        attr_reader :status

        sig do
          params(
            status:
              Imagekitio::Models::Cache::InvalidationGetResponse::Status::OrSymbol
          ).void
        end
        attr_writer :status

        sig do
          params(
            status:
              Imagekitio::Models::Cache::InvalidationGetResponse::Status::OrSymbol
          ).returns(T.attached_class)
        end
        def self.new(
          # Status of the purge request.
          status: nil
        )
        end

        sig do
          override.returns(
            {
              status:
                Imagekitio::Models::Cache::InvalidationGetResponse::Status::TaggedSymbol
            }
          )
        end
        def to_hash
        end

        # Status of the purge request.
        module Status
          extend Imagekitio::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(
                Symbol,
                Imagekitio::Models::Cache::InvalidationGetResponse::Status
              )
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          PENDING =
            T.let(
              :Pending,
              Imagekitio::Models::Cache::InvalidationGetResponse::Status::TaggedSymbol
            )
          COMPLETED =
            T.let(
              :Completed,
              Imagekitio::Models::Cache::InvalidationGetResponse::Status::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                Imagekitio::Models::Cache::InvalidationGetResponse::Status::TaggedSymbol
              ]
            )
          end
          def self.values
          end
        end
      end
    end
  end
end
