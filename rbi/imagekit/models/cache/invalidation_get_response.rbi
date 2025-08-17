# typed: strong

module Imagekit
  module Models
    module Cache
      class InvalidationGetResponse < Imagekit::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Imagekit::Models::Cache::InvalidationGetResponse,
              Imagekit::Internal::AnyHash
            )
          end

        # Status of the purge request.
        sig do
          returns(
            T.nilable(
              Imagekit::Models::Cache::InvalidationGetResponse::Status::TaggedSymbol
            )
          )
        end
        attr_reader :status

        sig do
          params(
            status:
              Imagekit::Models::Cache::InvalidationGetResponse::Status::OrSymbol
          ).void
        end
        attr_writer :status

        sig do
          params(
            status:
              Imagekit::Models::Cache::InvalidationGetResponse::Status::OrSymbol
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
                Imagekit::Models::Cache::InvalidationGetResponse::Status::TaggedSymbol
            }
          )
        end
        def to_hash
        end

        # Status of the purge request.
        module Status
          extend Imagekit::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(
                Symbol,
                Imagekit::Models::Cache::InvalidationGetResponse::Status
              )
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          PENDING =
            T.let(
              :Pending,
              Imagekit::Models::Cache::InvalidationGetResponse::Status::TaggedSymbol
            )
          COMPLETED =
            T.let(
              :Completed,
              Imagekit::Models::Cache::InvalidationGetResponse::Status::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                Imagekit::Models::Cache::InvalidationGetResponse::Status::TaggedSymbol
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
