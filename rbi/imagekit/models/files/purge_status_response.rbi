# typed: strong

module Imagekit
  module Models
    module Files
      class PurgeStatusResponse < Imagekit::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Imagekit::Models::Files::PurgeStatusResponse,
              Imagekit::Internal::AnyHash
            )
          end

        # Status of the purge request.
        sig do
          returns(
            T.nilable(
              Imagekit::Models::Files::PurgeStatusResponse::Status::TaggedSymbol
            )
          )
        end
        attr_reader :status

        sig do
          params(
            status:
              Imagekit::Models::Files::PurgeStatusResponse::Status::OrSymbol
          ).void
        end
        attr_writer :status

        sig do
          params(
            status:
              Imagekit::Models::Files::PurgeStatusResponse::Status::OrSymbol
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
                Imagekit::Models::Files::PurgeStatusResponse::Status::TaggedSymbol
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
                Imagekit::Models::Files::PurgeStatusResponse::Status
              )
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          PENDING =
            T.let(
              :Pending,
              Imagekit::Models::Files::PurgeStatusResponse::Status::TaggedSymbol
            )
          COMPLETED =
            T.let(
              :Completed,
              Imagekit::Models::Files::PurgeStatusResponse::Status::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                Imagekit::Models::Files::PurgeStatusResponse::Status::TaggedSymbol
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
