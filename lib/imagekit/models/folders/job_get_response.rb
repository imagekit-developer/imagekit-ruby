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
        #   Status of the bulk job.
        #
        #   @return [Symbol, Imagekit::Models::Folders::JobGetResponse::Status, nil]
        optional :status, enum: -> { Imagekit::Models::Folders::JobGetResponse::Status }

        # @!attribute type
        #   Type of the bulk job.
        #
        #   @return [Symbol, Imagekit::Models::Folders::JobGetResponse::Type, nil]
        optional :type, enum: -> { Imagekit::Models::Folders::JobGetResponse::Type }

        # @!method initialize(job_id: nil, purge_request_id: nil, status: nil, type: nil)
        #   Some parameter documentations has been truncated, see
        #   {Imagekit::Models::Folders::JobGetResponse} for more details.
        #
        #   @param job_id [String] Unique identifier of the bulk job.
        #
        #   @param purge_request_id [String] Unique identifier of the purge request. This will be present only if `purgeCache
        #
        #   @param status [Symbol, Imagekit::Models::Folders::JobGetResponse::Status] Status of the bulk job.
        #
        #   @param type [Symbol, Imagekit::Models::Folders::JobGetResponse::Type] Type of the bulk job.

        # Status of the bulk job.
        #
        # @see Imagekit::Models::Folders::JobGetResponse#status
        module Status
          extend Imagekit::Internal::Type::Enum

          PENDING = :Pending
          COMPLETED = :Completed

          # @!method self.values
          #   @return [Array<Symbol>]
        end

        # Type of the bulk job.
        #
        # @see Imagekit::Models::Folders::JobGetResponse#type
        module Type
          extend Imagekit::Internal::Type::Enum

          COPY_FOLDER = :COPY_FOLDER
          MOVE_FOLDER = :MOVE_FOLDER
          RENAME_FOLDER = :RENAME_FOLDER

          # @!method self.values
          #   @return [Array<Symbol>]
        end
      end
    end
  end
end
