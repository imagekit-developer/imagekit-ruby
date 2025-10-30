# typed: strong

module Imagekitio
  module Models
    module Folders
      class JobGetResponse < Imagekitio::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Imagekitio::Models::Folders::JobGetResponse,
              Imagekitio::Internal::AnyHash
            )
          end

        # Unique identifier of the bulk job.
        sig { returns(T.nilable(String)) }
        attr_reader :job_id

        sig { params(job_id: String).void }
        attr_writer :job_id

        # Unique identifier of the purge request. This will be present only if
        # `purgeCache` is set to `true` in the rename folder API request.
        sig { returns(T.nilable(String)) }
        attr_reader :purge_request_id

        sig { params(purge_request_id: String).void }
        attr_writer :purge_request_id

        # Status of the bulk job.
        sig do
          returns(
            T.nilable(
              Imagekitio::Models::Folders::JobGetResponse::Status::TaggedSymbol
            )
          )
        end
        attr_reader :status

        sig do
          params(
            status:
              Imagekitio::Models::Folders::JobGetResponse::Status::OrSymbol
          ).void
        end
        attr_writer :status

        # Type of the bulk job.
        sig do
          returns(
            T.nilable(
              Imagekitio::Models::Folders::JobGetResponse::Type::TaggedSymbol
            )
          )
        end
        attr_reader :type

        sig do
          params(
            type: Imagekitio::Models::Folders::JobGetResponse::Type::OrSymbol
          ).void
        end
        attr_writer :type

        sig do
          params(
            job_id: String,
            purge_request_id: String,
            status:
              Imagekitio::Models::Folders::JobGetResponse::Status::OrSymbol,
            type: Imagekitio::Models::Folders::JobGetResponse::Type::OrSymbol
          ).returns(T.attached_class)
        end
        def self.new(
          # Unique identifier of the bulk job.
          job_id: nil,
          # Unique identifier of the purge request. This will be present only if
          # `purgeCache` is set to `true` in the rename folder API request.
          purge_request_id: nil,
          # Status of the bulk job.
          status: nil,
          # Type of the bulk job.
          type: nil
        )
        end

        sig do
          override.returns(
            {
              job_id: String,
              purge_request_id: String,
              status:
                Imagekitio::Models::Folders::JobGetResponse::Status::TaggedSymbol,
              type:
                Imagekitio::Models::Folders::JobGetResponse::Type::TaggedSymbol
            }
          )
        end
        def to_hash
        end

        # Status of the bulk job.
        module Status
          extend Imagekitio::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(Symbol, Imagekitio::Models::Folders::JobGetResponse::Status)
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          PENDING =
            T.let(
              :Pending,
              Imagekitio::Models::Folders::JobGetResponse::Status::TaggedSymbol
            )
          COMPLETED =
            T.let(
              :Completed,
              Imagekitio::Models::Folders::JobGetResponse::Status::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                Imagekitio::Models::Folders::JobGetResponse::Status::TaggedSymbol
              ]
            )
          end
          def self.values
          end
        end

        # Type of the bulk job.
        module Type
          extend Imagekitio::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(Symbol, Imagekitio::Models::Folders::JobGetResponse::Type)
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          COPY_FOLDER =
            T.let(
              :COPY_FOLDER,
              Imagekitio::Models::Folders::JobGetResponse::Type::TaggedSymbol
            )
          MOVE_FOLDER =
            T.let(
              :MOVE_FOLDER,
              Imagekitio::Models::Folders::JobGetResponse::Type::TaggedSymbol
            )
          RENAME_FOLDER =
            T.let(
              :RENAME_FOLDER,
              Imagekitio::Models::Folders::JobGetResponse::Type::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                Imagekitio::Models::Folders::JobGetResponse::Type::TaggedSymbol
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
