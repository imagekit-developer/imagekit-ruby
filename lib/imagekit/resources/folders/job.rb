# frozen_string_literal: true

module Imagekit
  module Resources
    class Folders
      class Job
        # Some parameter documentations has been truncated, see
        # {Imagekit::Models::Folders::JobGetParams} for more details.
        #
        # This API returns the status of a bulk job like copy and move folder operations.
        #
        # @overload get(job_id, request_options: {})
        #
        # @param job_id [String] The `jobId` is returned in the response of bulk job API e.g. copy folder or move
        #
        # @param request_options [Imagekit::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [Imagekit::Models::Folders::JobGetResponse]
        #
        # @see Imagekit::Models::Folders::JobGetParams
        def get(job_id, params = {})
          @client.request(
            method: :get,
            path: ["v1/bulkJobs/%1$s", job_id],
            model: Imagekit::Models::Folders::JobGetResponse,
            options: params[:request_options]
          )
        end

        # @api private
        #
        # @param client [Imagekit::Client]
        def initialize(client:)
          @client = client
        end
      end
    end
  end
end
