# typed: strong

module Imagekit
  module Models
    class BulkJobCopyFolderResponse < Imagekit::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            Imagekit::Models::BulkJobCopyFolderResponse,
            Imagekit::Internal::AnyHash
          )
        end

      # Unique identifier of the bulk job. This can be used to check the status of the
      # bulk job.
      sig { returns(T.nilable(String)) }
      attr_reader :job_id

      sig { params(job_id: String).void }
      attr_writer :job_id

      sig { params(job_id: String).returns(T.attached_class) }
      def self.new(
        # Unique identifier of the bulk job. This can be used to check the status of the
        # bulk job.
        job_id: nil
      )
      end

      sig { override.returns({ job_id: String }) }
      def to_hash
      end
    end
  end
end
