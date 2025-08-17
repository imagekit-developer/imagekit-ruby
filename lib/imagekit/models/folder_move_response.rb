# frozen_string_literal: true

module Imagekit
  module Models
    # @see Imagekit::Resources::Folders#move
    class FolderMoveResponse < Imagekit::Internal::Type::BaseModel
      # @!attribute job_id
      #   Unique identifier of the bulk job. This can be used to check the status of the
      #   bulk job.
      #
      #   @return [String, nil]
      optional :job_id, String, api_name: :jobId

      # @!method initialize(job_id: nil)
      #   Some parameter documentations has been truncated, see
      #   {Imagekit::Models::FolderMoveResponse} for more details.
      #
      #   @param job_id [String] Unique identifier of the bulk job. This can be used to check the status of the b
    end
  end
end
