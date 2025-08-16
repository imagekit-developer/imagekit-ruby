# typed: strong

module Imagekit
  module Models
    class BulkJobRetrieveStatusResponse < Imagekit::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            Imagekit::Models::BulkJobRetrieveStatusResponse,
            Imagekit::Internal::AnyHash
          )
        end

      # Unique identifier of the bulk job.
      sig { returns(T.nilable(String)) }
      attr_reader :job_id

      sig { params(job_id: String).void }
      attr_writer :job_id

      # Status of the bulk job. Possible values - `Pending`, `Completed`.
      sig { returns(T.nilable(String)) }
      attr_reader :status

      sig { params(status: String).void }
      attr_writer :status

      # Type of the bulk job. Possible values - `COPY_FOLDER`, `MOVE_FOLDER`.
      sig { returns(T.nilable(String)) }
      attr_reader :type

      sig { params(type: String).void }
      attr_writer :type

      sig do
        params(job_id: String, status: String, type: String).returns(
          T.attached_class
        )
      end
      def self.new(
        # Unique identifier of the bulk job.
        job_id: nil,
        # Status of the bulk job. Possible values - `Pending`, `Completed`.
        status: nil,
        # Type of the bulk job. Possible values - `COPY_FOLDER`, `MOVE_FOLDER`.
        type: nil
      )
      end

      sig { override.returns({ job_id: String, status: String, type: String }) }
      def to_hash
      end
    end
  end
end
