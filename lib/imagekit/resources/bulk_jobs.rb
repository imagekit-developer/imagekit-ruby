# frozen_string_literal: true

module Imagekit
  module Resources
    class BulkJobs
      # Some parameter documentations has been truncated, see
      # {Imagekit::Models::BulkJobCopyFolderParams} for more details.
      #
      # This will copy one folder into another. The selected folder, its nested folders,
      # files, and their versions (in `includeVersions` is set to true) are copied in
      # this operation. Note: If any file at the destination has the same name as the
      # source file, then the source file and its versions will be appended to the
      # destination file version history.
      #
      # @overload copy_folder(destination_path:, source_folder_path:, include_versions: nil, request_options: {})
      #
      # @param destination_path [String] Full path to the destination folder where you want to copy the source folder int
      #
      # @param source_folder_path [String] The full path to the source folder you want to copy.
      #
      # @param include_versions [Boolean] Option to copy all versions of files that are nested inside the selected folder.
      #
      # @param request_options [Imagekit::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Imagekit::Models::BulkJobCopyFolderResponse]
      #
      # @see Imagekit::Models::BulkJobCopyFolderParams
      def copy_folder(params)
        parsed, options = Imagekit::BulkJobCopyFolderParams.dump_request(params)
        @client.request(
          method: :post,
          path: "v1/bulkJobs/copyFolder",
          body: parsed,
          model: Imagekit::Models::BulkJobCopyFolderResponse,
          options: options
        )
      end

      # Some parameter documentations has been truncated, see
      # {Imagekit::Models::BulkJobMoveFolderParams} for more details.
      #
      # This will move one folder into another. The selected folder, its nested folders,
      # files, and their versions are moved in this operation. Note: If any file at the
      # destination has the same name as the source file, then the source file and its
      # versions will be appended to the destination file version history.
      #
      # @overload move_folder(destination_path:, source_folder_path:, request_options: {})
      #
      # @param destination_path [String] Full path to the destination folder where you want to move the source folder int
      #
      # @param source_folder_path [String] The full path to the source folder you want to move.
      #
      # @param request_options [Imagekit::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Imagekit::Models::BulkJobMoveFolderResponse]
      #
      # @see Imagekit::Models::BulkJobMoveFolderParams
      def move_folder(params)
        parsed, options = Imagekit::BulkJobMoveFolderParams.dump_request(params)
        @client.request(
          method: :post,
          path: "v1/bulkJobs/moveFolder",
          body: parsed,
          model: Imagekit::Models::BulkJobMoveFolderResponse,
          options: options
        )
      end

      # Some parameter documentations has been truncated, see
      # {Imagekit::Models::BulkJobRetrieveStatusParams} for more details.
      #
      # This API returns the status of a bulk job like copy and move folder operations.
      #
      # @overload retrieve_status(job_id, request_options: {})
      #
      # @param job_id [String] The `jobId` is returned in the response of bulk job API e.g. copy folder or move
      #
      # @param request_options [Imagekit::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Imagekit::Models::BulkJobRetrieveStatusResponse]
      #
      # @see Imagekit::Models::BulkJobRetrieveStatusParams
      def retrieve_status(job_id, params = {})
        @client.request(
          method: :get,
          path: ["v1/bulkJobs/%1$s", job_id],
          model: Imagekit::Models::BulkJobRetrieveStatusResponse,
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
