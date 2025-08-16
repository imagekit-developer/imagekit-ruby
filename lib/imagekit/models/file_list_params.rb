# frozen_string_literal: true

module Imagekit
  module Models
    # @see Imagekit::Resources::Files#list
    class FileListParams < Imagekit::Internal::Type::BaseModel
      extend Imagekit::Internal::Type::RequestParameters::Converter
      include Imagekit::Internal::Type::RequestParameters

      # @!attribute file_type
      #   Type of files to include in the result set. Accepts three values:
      #
      #   `all` - include all types of files in the result set. `image` - only search in
      #   image type files. `non-image` - only search in files that are not images, e.g.,
      #   JS or CSS or video files.
      #
      #   Default value - `all`
      #
      #   @return [String, nil]
      optional :file_type, String

      # @!attribute limit
      #   The maximum number of results to return in response:
      #
      #   Minimum value - 1
      #
      #   Maximum value - 1000
      #
      #   Default value - 1000
      #
      #   @return [String, nil]
      optional :limit, String

      # @!attribute path
      #   Folder path if you want to limit the search within a specific folder. For
      #   example, `/sales-banner/` will only search in folder sales-banner.
      #
      #   @return [String, nil]
      optional :path, String

      # @!attribute search_query
      #   Query string in a Lucene-like query language e.g. `createdAt > "7d"`.
      #
      #   Note : When the searchQuery parameter is present, the following query parameters
      #   will have no effect on the result:
      #
      #   1. `tags`
      #   2. `type`
      #   3. `name`
      #
      #   [Learn more](/docs/api-reference/digital-asset-management-dam/list-and-search-assets#advanced-search-queries)
      #   from examples.
      #
      #   @return [String, nil]
      optional :search_query, String

      # @!attribute skip
      #   The number of results to skip before returning results:
      #
      #   Minimum value - 0
      #
      #   Default value - 0
      #
      #   @return [String, nil]
      optional :skip, String

      # @!attribute sort
      #   You can sort based on the following fields:
      #
      #   1. name - `ASC_NAME` or `DESC_NAME`
      #   2. createdAt - `ASC_CREATED` or `DESC_CREATED`
      #   3. updatedAt - `ASC_UPDATED` or `DESC_UPDATED`
      #   4. height - `ASC_HEIGHT` or `DESC_HEIGHT`
      #   5. width - `ASC_WIDTH` or `DESC_WIDTH`
      #   6. size - `ASC_SIZE` or `DESC_SIZE`
      #
      #   Default value - `ASC_CREATED`
      #
      #   @return [String, nil]
      optional :sort, String

      # @!attribute type
      #   Limit search to one of `file`, `file-version`, or `folder`. Pass `all` to
      #   include `files` and `folders` in search results (`file-version` will not be
      #   included in this case).
      #
      #   Default value - `file`
      #
      #   @return [Symbol, Imagekit::Models::FileListParams::Type, nil]
      optional :type, enum: -> { Imagekit::FileListParams::Type }

      # @!method initialize(file_type: nil, limit: nil, path: nil, search_query: nil, skip: nil, sort: nil, type: nil, request_options: {})
      #   Some parameter documentations has been truncated, see
      #   {Imagekit::Models::FileListParams} for more details.
      #
      #   @param file_type [String] Type of files to include in the result set. Accepts three values:
      #
      #   @param limit [String] The maximum number of results to return in response:
      #
      #   @param path [String] Folder path if you want to limit the search within a specific folder. For exampl
      #
      #   @param search_query [String] Query string in a Lucene-like query language e.g. `createdAt > "7d"`.
      #
      #   @param skip [String] The number of results to skip before returning results:
      #
      #   @param sort [String] You can sort based on the following fields:
      #
      #   @param type [Symbol, Imagekit::Models::FileListParams::Type] Limit search to one of `file`, `file-version`, or `folder`. Pass `all` to includ
      #
      #   @param request_options [Imagekit::RequestOptions, Hash{Symbol=>Object}]

      # Limit search to one of `file`, `file-version`, or `folder`. Pass `all` to
      # include `files` and `folders` in search results (`file-version` will not be
      # included in this case).
      #
      # Default value - `file`
      module Type
        extend Imagekit::Internal::Type::Enum

        FILE = :file
        FILE_VERSION = :"file-version"
        FOLDER = :folder
        ALL = :all

        # @!method self.values
        #   @return [Array<Symbol>]
      end
    end
  end
end
