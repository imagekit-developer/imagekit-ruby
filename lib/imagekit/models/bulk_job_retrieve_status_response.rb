# frozen_string_literal: true

module Imagekit
  module Models
    # @see Imagekit::Resources::BulkJobs#retrieve_status
    class BulkJobRetrieveStatusResponse < Imagekit::Internal::Type::BaseModel
      # @!attribute job_id
      #   Unique identifier of the bulk job.
      #
      #   @return [String, nil]
      optional :job_id, String, api_name: :jobId

      # @!attribute status
      #   Status of the bulk job. Possible values - `Pending`, `Completed`.
      #
      #   @return [String, nil]
      optional :status, String

      # @!attribute type
      #   Type of the bulk job. Possible values - `COPY_FOLDER`, `MOVE_FOLDER`.
      #
      #   @return [String, nil]
      optional :type, String

      # @!method initialize(job_id: nil, status: nil, type: nil)
      #   Some parameter documentations has been truncated, see
      #   {Imagekit::Models::BulkJobRetrieveStatusResponse} for more details.
      #
      #   @param job_id [String] Unique identifier of the bulk job.
      #
      #   @param status [String] Status of the bulk job. Possible values - `Pending`, `Completed`.
      #
      #   @param type [String] Type of the bulk job. Possible values - `COPY_FOLDER`, `MOVE_FOLDER`.
    end
  end
end
