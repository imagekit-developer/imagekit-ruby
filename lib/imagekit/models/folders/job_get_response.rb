# frozen_string_literal: true

module Imagekit
  module Models
    module Folders
      # @see Imagekit::Resources::Folders::Job#get
      class JobGetResponse < Imagekit::Internal::Type::BaseModel
        # @!attribute job_id
        #   Unique identifier of the bulk job.
        #
        #   @return [String, nil]
        optional :job_id, String, api_name: :jobId

        # @!attribute purge_request_id
        #   Unique identifier of the purge request. This will be present only if
        #   `purgeCache` is set to `true` in the rename folder API request.
        #
        #   @return [String, nil]
        optional :purge_request_id, String, api_name: :purgeRequestId

        # @!attribute status
        #   Status of the bulk job. Possible values - `Pending`, `Completed`.
        #
        #   @return [String, nil]
        optional :status, String

        # @!attribute type
        #   Type of the bulk job. Possible values - `COPY_FOLDER`, `MOVE_FOLDER`,
        #   `RENAME_FOLDER`.
        #
        #   @return [String, nil]
        optional :type, String

        # @!method initialize(job_id: nil, purge_request_id: nil, status: nil, type: nil)
        #   Some parameter documentations has been truncated, see
        #   {Imagekit::Models::Folders::JobGetResponse} for more details.
        #
        #   @param job_id [String] Unique identifier of the bulk job.
        #
        #   @param purge_request_id [String] Unique identifier of the purge request. This will be present only if `purgeCache
        #
        #   @param status [String] Status of the bulk job. Possible values - `Pending`, `Completed`.
        #
        #   @param type [String] Type of the bulk job. Possible values - `COPY_FOLDER`, `MOVE_FOLDER`, `RENAME_FO
      end
    end
  end
end
