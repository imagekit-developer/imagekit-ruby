# frozen_string_literal: true

module Imagekitio
  module Resources
    class Folders
      class Job
        # Some parameter documentations has been truncated, see
        # {Imagekitio::Models::Folders::JobGetParams} for more details.
        #
        # This API returns the status of a bulk job like copy and move folder operations.
        #
        # @overload get(job_id, request_options: {})
        #
        # @param job_id [String] The `jobId` is returned in the response of bulk job API e.g. copy folder or move
        #
        # @param request_options [Imagekitio::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [Imagekitio::Models::Folders::JobGetResponse]
        #
        # @see Imagekitio::Models::Folders::JobGetParams
        def get(job_id, params = {})
          @client.request(
            method: :get,
            path: ["v1/bulkJobs/%1$s", job_id],
            model: Imagekitio::Models::Folders::JobGetResponse,
            options: params[:request_options]
          )
        end

        # @api private
        #
        # @param client [Imagekitio::Client]
        def initialize(client:)
          @client = client
        end
      end
    end
  end
end
