# frozen_string_literal: true

module Imagekit
  module Models
    # @see Imagekit::Resources::Folders#copy
    class FolderCopyResponse < Imagekit::Internal::Type::BaseModel
      # @!attribute job_id
      #   Unique identifier of the bulk job. This can be used to check the status of the
      #   bulk job.
      #
      #   @return [String]
      required :job_id, String, api_name: :jobId

      # @!method initialize(job_id:)
      #   Some parameter documentations has been truncated, see
      #   {Imagekit::Models::FolderCopyResponse} for more details.
      #
      #   Job submitted successfully. A `jobId` will be returned.
      #
      #   @param job_id [String] Unique identifier of the bulk job. This can be used to check the status of the b
    end
  end
end
