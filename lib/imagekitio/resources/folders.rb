# frozen_string_literal: true

module Imagekitio
  module Resources
    class Folders
      # @return [Imagekitio::Resources::Folders::Job]
      attr_reader :job

      # Some parameter documentations has been truncated, see
      # {Imagekitio::Models::FolderCreateParams} for more details.
      #
      # This will create a new folder. You can specify the folder name and location of
      # the parent folder where this new folder should be created.
      #
      # @overload create(folder_name:, parent_folder_path:, request_options: {})
      #
      # @param folder_name [String] The folder will be created with this name.
      #
      # @param parent_folder_path [String] The folder where the new folder should be created, for root use `/` else the pat
      #
      # @param request_options [Imagekitio::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Imagekitio::Models::FolderCreateResponse]
      #
      # @see Imagekitio::Models::FolderCreateParams
      def create(params)
        parsed, options = Imagekitio::FolderCreateParams.dump_request(params)
        @client.request(
          method: :post,
          path: "v1/folder",
          body: parsed,
          model: Imagekitio::Models::FolderCreateResponse,
          options: options
        )
      end

      # Some parameter documentations has been truncated, see
      # {Imagekitio::Models::FolderDeleteParams} for more details.
      #
      # This will delete a folder and all its contents permanently. The API returns an
      # empty response.
      #
      # @overload delete(folder_path:, request_options: {})
      #
      # @param folder_path [String] Full path to the folder you want to delete. For example `/folder/to/delete/`.
      #
      # @param request_options [Imagekitio::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Imagekitio::Models::FolderDeleteResponse]
      #
      # @see Imagekitio::Models::FolderDeleteParams
      def delete(params)
        parsed, options = Imagekitio::FolderDeleteParams.dump_request(params)
        @client.request(
          method: :delete,
          path: "v1/folder",
          body: parsed,
          model: Imagekitio::Models::FolderDeleteResponse,
          options: options
        )
      end

      # Some parameter documentations has been truncated, see
      # {Imagekitio::Models::FolderCopyParams} for more details.
      #
      # This will copy one folder into another. The selected folder, its nested folders,
      # files, and their versions (in `includeVersions` is set to true) are copied in
      # this operation. Note: If any file at the destination has the same name as the
      # source file, then the source file and its versions will be appended to the
      # destination file version history.
      #
      # @overload copy(destination_path:, source_folder_path:, include_versions: nil, request_options: {})
      #
      # @param destination_path [String] Full path to the destination folder where you want to copy the source folder int
      #
      # @param source_folder_path [String] The full path to the source folder you want to copy.
      #
      # @param include_versions [Boolean] Option to copy all versions of files that are nested inside the selected folder.
      #
      # @param request_options [Imagekitio::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Imagekitio::Models::FolderCopyResponse]
      #
      # @see Imagekitio::Models::FolderCopyParams
      def copy(params)
        parsed, options = Imagekitio::FolderCopyParams.dump_request(params)
        @client.request(
          method: :post,
          path: "v1/bulkJobs/copyFolder",
          body: parsed,
          model: Imagekitio::Models::FolderCopyResponse,
          options: options
        )
      end

      # Some parameter documentations has been truncated, see
      # {Imagekitio::Models::FolderMoveParams} for more details.
      #
      # This will move one folder into another. The selected folder, its nested folders,
      # files, and their versions are moved in this operation. Note: If any file at the
      # destination has the same name as the source file, then the source file and its
      # versions will be appended to the destination file version history.
      #
      # @overload move(destination_path:, source_folder_path:, request_options: {})
      #
      # @param destination_path [String] Full path to the destination folder where you want to move the source folder int
      #
      # @param source_folder_path [String] The full path to the source folder you want to move.
      #
      # @param request_options [Imagekitio::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Imagekitio::Models::FolderMoveResponse]
      #
      # @see Imagekitio::Models::FolderMoveParams
      def move(params)
        parsed, options = Imagekitio::FolderMoveParams.dump_request(params)
        @client.request(
          method: :post,
          path: "v1/bulkJobs/moveFolder",
          body: parsed,
          model: Imagekitio::Models::FolderMoveResponse,
          options: options
        )
      end

      # Some parameter documentations has been truncated, see
      # {Imagekitio::Models::FolderRenameParams} for more details.
      #
      # This API allows you to rename an existing folder. The folder and all its nested
      # assets and sub-folders will remain unchanged, but their paths will be updated to
      # reflect the new folder name.
      #
      # @overload rename(folder_path:, new_folder_name:, purge_cache: nil, request_options: {})
      #
      # @param folder_path [String] The full path to the folder you want to rename.
      #
      # @param new_folder_name [String] The new name for the folder.
      #
      # @param purge_cache [Boolean] Option to purge cache for the old nested files and their versions' URLs.
      #
      # @param request_options [Imagekitio::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Imagekitio::Models::FolderRenameResponse]
      #
      # @see Imagekitio::Models::FolderRenameParams
      def rename(params)
        parsed, options = Imagekitio::FolderRenameParams.dump_request(params)
        @client.request(
          method: :post,
          path: "v1/bulkJobs/renameFolder",
          body: parsed,
          model: Imagekitio::Models::FolderRenameResponse,
          options: options
        )
      end

      # @api private
      #
      # @param client [Imagekitio::Client]
      def initialize(client:)
        @client = client
        @job = Imagekitio::Resources::Folders::Job.new(client: client)
      end
    end
  end
end
