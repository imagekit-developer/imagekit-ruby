# frozen_string_literal: true

module Imagekitio
  module Models
    # @see Imagekitio::Resources::Files#rename
    class FileRenameParams < Imagekitio::Internal::Type::BaseModel
      extend Imagekitio::Internal::Type::RequestParameters::Converter
      include Imagekitio::Internal::Type::RequestParameters

      # @!attribute file_path
      #   The full path of the file you want to rename.
      #
      #   @return [String]
      required :file_path, String, api_name: :filePath

      # @!attribute new_file_name
      #   The new name of the file. A filename can contain:
      #
      #   Alphanumeric Characters: `a-z`, `A-Z`, `0-9` (including Unicode letters, marks,
      #   and numerals in other languages). Special Characters: `.`, `_`, and `-`.
      #
      #   Any other character, including space, will be replaced by `_`.
      #
      #   @return [String]
      required :new_file_name, String, api_name: :newFileName

      # @!attribute purge_cache
      #   Option to purge cache for the old file and its versions' URLs.
      #
      #   When set to true, it will internally issue a purge cache request on CDN to
      #   remove cached content of old file and its versions. This purge request is
      #   counted against your monthly purge quota.
      #
      #   Note: If the old file were accessible at
      #   `https://ik.imagekit.io/demo/old-filename.jpg`, a purge cache request would be
      #   issued against `https://ik.imagekit.io/demo/old-filename.jpg*` (with a wildcard
      #   at the end). It will remove the file and its versions' URLs and any
      #   transformations made using query parameters on this file or its versions.
      #   However, the cache for file transformations made using path parameters will
      #   persist. You can purge them using the purge API. For more details, refer to the
      #   purge API documentation.
      #
      #   Default value - `false`
      #
      #   @return [Boolean, nil]
      optional :purge_cache, Imagekitio::Internal::Type::Boolean, api_name: :purgeCache

      # @!method initialize(file_path:, new_file_name:, purge_cache: nil, request_options: {})
      #   Some parameter documentations has been truncated, see
      #   {Imagekitio::Models::FileRenameParams} for more details.
      #
      #   @param file_path [String] The full path of the file you want to rename.
      #
      #   @param new_file_name [String] The new name of the file. A filename can contain:
      #
      #   @param purge_cache [Boolean] Option to purge cache for the old file and its versions' URLs.
      #
      #   @param request_options [Imagekitio::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
