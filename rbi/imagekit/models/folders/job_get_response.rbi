# typed: strong

module Imagekit
  module Models
    module Folders
      class JobGetResponse < Imagekit::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Imagekit::Models::Folders::JobGetResponse,
              Imagekit::Internal::AnyHash
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

        # Status of the bulk job. Possible values - `Pending`, `Completed`.
        sig { returns(T.nilable(String)) }
        attr_reader :status

        sig { params(status: String).void }
        attr_writer :status

        # Type of the bulk job. Possible values - `COPY_FOLDER`, `MOVE_FOLDER`,
        # `RENAME_FOLDER`.
        sig { returns(T.nilable(String)) }
        attr_reader :type

        sig { params(type: String).void }
        attr_writer :type

        sig do
          params(
            job_id: String,
            purge_request_id: String,
            status: String,
            type: String
          ).returns(T.attached_class)
        end
        def self.new(
          # Unique identifier of the bulk job.
          job_id: nil,
          # Unique identifier of the purge request. This will be present only if
          # `purgeCache` is set to `true` in the rename folder API request.
          purge_request_id: nil,
          # Status of the bulk job. Possible values - `Pending`, `Completed`.
          status: nil,
          # Type of the bulk job. Possible values - `COPY_FOLDER`, `MOVE_FOLDER`,
          # `RENAME_FOLDER`.
          type: nil
        )
        end

        sig do
          override.returns(
            {
              job_id: String,
              purge_request_id: String,
              status: String,
              type: String
            }
          )
        end
        def to_hash
        end
      end
    end
  end
end
