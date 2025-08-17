# typed: strong

module Imagekit
  module Resources
    class Folders
      class Job
        # This API returns the status of a bulk job like copy and move folder operations.
        sig do
          params(
            job_id: String,
            request_options: Imagekit::RequestOptions::OrHash
          ).returns(Imagekit::Models::Folders::JobGetResponse)
        end
        def get(
          # The `jobId` is returned in the response of bulk job API e.g. copy folder or move
          # folder API.
          job_id,
          request_options: {}
        )
        end

        # @api private
        sig { params(client: Imagekit::Client).returns(T.attached_class) }
        def self.new(client:)
        end
      end
    end
  end
end
