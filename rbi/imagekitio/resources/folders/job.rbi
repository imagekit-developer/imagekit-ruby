# typed: strong

module Imagekitio
  module Resources
    class Folders
      class Job
        # This API returns the status of a bulk job like copy and move folder operations.
        sig do
          params(
            job_id: String,
            request_options: Imagekitio::RequestOptions::OrHash
          ).returns(Imagekitio::Models::Folders::JobGetResponse)
        end
        def get(
          # The `jobId` is returned in the response of bulk job API e.g. copy folder or move
          # folder API.
          job_id,
          request_options: {}
        )
        end

        # @api private
        sig { params(client: Imagekitio::Client).returns(T.attached_class) }
        def self.new(client:)
        end
      end
    end
  end
end
