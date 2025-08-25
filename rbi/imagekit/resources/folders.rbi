# typed: strong

module Imagekit
  module Resources
    class Folders
      sig { returns(Imagekit::Resources::Folders::Job) }
      attr_reader :job

      # This will create a new folder. You can specify the folder name and location of
      # the parent folder where this new folder should be created.
      sig do
        params(
          folder_name: String,
          parent_folder_path: String,
          request_options: Imagekit::RequestOptions::OrHash
        ).returns(Imagekit::Models::FolderCreateResponse)
      end
      def create(
        # The folder will be created with this name.
        #
        # All characters except alphabets and numbers (inclusive of unicode letters,
        # marks, and numerals in other languages) will be replaced by an underscore i.e.
        # `_`.
        folder_name:,
        # The folder where the new folder should be created, for root use `/` else the
        # path e.g. `containing/folder/`.
        #
        # Note: If any folder(s) is not present in the parentFolderPath parameter, it will
        # be automatically created. For example, if you pass `/product/images/summer`,
        # then `product`, `images`, and `summer` folders will be created if they don't
        # already exist.
        parent_folder_path:,
        request_options: {}
      )
      end

      # This will delete a folder and all its contents permanently. The API returns an
      # empty response.
      sig do
        params(
          folder_path: String,
          request_options: Imagekit::RequestOptions::OrHash
        ).returns(Imagekit::Models::FolderDeleteResponse)
      end
      def delete(
        # Full path to the folder you want to delete. For example `/folder/to/delete/`.
        folder_path:,
        request_options: {}
      )
      end

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
        ).returns(Imagekit::JobResponse)
      end
      def copy(
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
        ).returns(Imagekit::JobResponse)
      end
      def move(
        # Full path to the destination folder where you want to move the source folder
        # into.
        destination_path:,
        # The full path to the source folder you want to move.
        source_folder_path:,
        request_options: {}
      )
      end

      # This API allows you to rename an existing folder. The folder and all its nested
      # assets and sub-folders will remain unchanged, but their paths will be updated to
      # reflect the new folder name.
      sig do
        params(
          folder_path: String,
          new_folder_name: String,
          purge_cache: T::Boolean,
          request_options: Imagekit::RequestOptions::OrHash
        ).returns(Imagekit::JobResponse)
      end
      def rename(
        # The full path to the folder you want to rename.
        folder_path:,
        # The new name for the folder.
        #
        # All characters except alphabets and numbers (inclusive of unicode letters,
        # marks, and numerals in other languages) and `-` will be replaced by an
        # underscore i.e. `_`.
        new_folder_name:,
        # Option to purge cache for the old nested files and their versions' URLs.
        #
        # When set to true, it will internally issue a purge cache request on CDN to
        # remove the cached content of the old nested files and their versions. There will
        # only be one purge request for all the nested files, which will be counted
        # against your monthly purge quota.
        #
        # Note: A purge cache request will be issued against
        # `https://ik.imagekit.io/old/folder/path*` (with a wildcard at the end). This
        # will remove all nested files, their versions' URLs, and any transformations made
        # using query parameters on these files or their versions. However, the cache for
        # file transformations made using path parameters will persist. You can purge them
        # using the purge API. For more details, refer to the purge API documentation.
        #
        # Default value - `false`
        purge_cache: nil,
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
