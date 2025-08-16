# typed: strong

module Imagekit
  module Resources
    class BulkJobs
      # This will copy one folder into another. The selected folder, its nested folders,
      # files, and their versions (in `includeVersions` is set to true) are copied in
      # this operation. Note: If any file at the destination has the same name as the
      # source file, then the source file and its versions will be appended to the
      # destination file version history.
      sig do
        params(
          destination_path: String,
          source_folder_path: String,
          include_versions: T::Boolean,
          request_options: Imagekit::RequestOptions::OrHash
        ).returns(Imagekit::Models::BulkJobCopyFolderResponse)
      end
      def copy_folder(
        # Full path to the destination folder where you want to copy the source folder
        # into.
        destination_path:,
        # The full path to the source folder you want to copy.
        source_folder_path:,
        # Option to copy all versions of files that are nested inside the selected folder.
        # By default, only the current version of each file will be copied. When set to
        # true, all versions of each file will be copied. Default value - `false`.
        include_versions: nil,
        request_options: {}
      )
      end

      # This will move one folder into another. The selected folder, its nested folders,
      # files, and their versions are moved in this operation. Note: If any file at the
      # destination has the same name as the source file, then the source file and its
      # versions will be appended to the destination file version history.
      sig do
        params(
          destination_path: String,
          source_folder_path: String,
          request_options: Imagekit::RequestOptions::OrHash
        ).returns(Imagekit::Models::BulkJobMoveFolderResponse)
      end
      def move_folder(
        # Full path to the destination folder where you want to move the source folder
        # into.
        destination_path:,
        # The full path to the source folder you want to move.
        source_folder_path:,
        request_options: {}
      )
      end

      # This API returns the status of a bulk job like copy and move folder operations.
      sig do
        params(
          job_id: String,
          request_options: Imagekit::RequestOptions::OrHash
        ).returns(Imagekit::Models::BulkJobRetrieveStatusResponse)
      end
      def retrieve_status(
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
