# typed: strong

module Imagekit
  module Models
    class AsyncBulkJobResponse < Imagekit::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(Imagekit::AsyncBulkJobResponse, Imagekit::Internal::AnyHash)
        end

      # Unique identifier of the bulk job. This can be used to check the status of the
      # bulk job.
      sig { returns(String) }
      attr_accessor :job_id

      # Job submitted successfully. A `jobId` will be returned.
      sig { params(job_id: String).returns(T.attached_class) }
      def self.new(
        # Unique identifier of the bulk job. This can be used to check the status of the
        # bulk job.
        job_id:
      )
      end

      sig { override.returns({ job_id: String }) }
      def to_hash
      end
    end
  end
end
