# frozen_string_literal: true

module Imagekit
  module Models
    # @see Imagekit::Resources::Folders#rename
    class FolderRenameParams < Imagekit::Internal::Type::BaseModel
      extend Imagekit::Internal::Type::RequestParameters::Converter
      include Imagekit::Internal::Type::RequestParameters

      # @!attribute folder_path
      #   The full path to the folder you want to rename.
      #
      #   @return [String]
      required :folder_path, String, api_name: :folderPath

      # @!attribute new_folder_name
      #   The new name for the folder.
      #
      #   All characters except alphabets and numbers (inclusive of unicode letters,
      #   marks, and numerals in other languages) and `-` will be replaced by an
      #   underscore i.e. `_`.
      #
      #   @return [String]
      required :new_folder_name, String, api_name: :newFolderName

      # @!attribute purge_cache
      #   Option to purge cache for the old nested files and their versions' URLs.
      #
      #   When set to true, it will internally issue a purge cache request on CDN to
      #   remove the cached content of the old nested files and their versions. There will
      #   only be one purge request for all the nested files, which will be counted
      #   against your monthly purge quota.
      #
      #   Note: A purge cache request will be issued against
      #   `https://ik.imagekit.io/old/folder/path*` (with a wildcard at the end). This
      #   will remove all nested files, their versions' URLs, and any transformations made
      #   using query parameters on these files or their versions. However, the cache for
      #   file transformations made using path parameters will persist. You can purge them
      #   using the purge API. For more details, refer to the purge API documentation.
      #
      #   Default value - `false`
      #
      #   @return [Boolean, nil]
      optional :purge_cache, Imagekit::Internal::Type::Boolean, api_name: :purgeCache

      # @!method initialize(folder_path:, new_folder_name:, purge_cache: nil, request_options: {})
      #   Some parameter documentations has been truncated, see
      #   {Imagekit::Models::FolderRenameParams} for more details.
      #
      #   @param folder_path [String] The full path to the folder you want to rename.
      #
      #   @param new_folder_name [String] The new name for the folder.
      #
      #   @param purge_cache [Boolean] Option to purge cache for the old nested files and their versions' URLs.
      #
      #   @param request_options [Imagekit::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
