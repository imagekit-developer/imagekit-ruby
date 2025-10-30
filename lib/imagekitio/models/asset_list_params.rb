# frozen_string_literal: true

module Imagekitio
  module Models
    # @see Imagekitio::Resources::Assets#list
    class AssetListParams < Imagekitio::Internal::Type::BaseModel
      extend Imagekitio::Internal::Type::RequestParameters::Converter
      include Imagekitio::Internal::Type::RequestParameters

      # @!attribute file_type
      #   Filter results by file type.
      #
      #   - `all` — include all file types
      #   - `image` — include only image files
      #   - `non-image` — include only non-image files (e.g., JS, CSS, video)
      #
      #   @return [Symbol, Imagekitio::Models::AssetListParams::FileType, nil]
      optional :file_type, enum: -> { Imagekitio::AssetListParams::FileType }

      # @!attribute limit
      #   The maximum number of results to return in response.
      #
      #   @return [Integer, nil]
      optional :limit, Integer

      # @!attribute path
      #   Folder path if you want to limit the search within a specific folder. For
      #   example, `/sales-banner/` will only search in folder sales-banner.
      #
      #   Note : If your use case involves searching within a folder as well as its
      #   subfolders, you can use `path` parameter in `searchQuery` with appropriate
      #   operator. Checkout
      #   [Supported parameters](/docs/api-reference/digital-asset-management-dam/list-and-search-assets#supported-parameters)
      #   for more information.
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
      #   The number of results to skip before returning results.
      #
      #   @return [Integer, nil]
      optional :skip, Integer

      # @!attribute sort
      #   Sort the results by one of the supported fields in ascending or descending
      #   order.
      #
      #   @return [Symbol, Imagekitio::Models::AssetListParams::Sort, nil]
      optional :sort, enum: -> { Imagekitio::AssetListParams::Sort }

      # @!attribute type
      #   Filter results by asset type.
      #
      #   - `file` — returns only files
      #   - `file-version` — returns specific file versions
      #   - `folder` — returns only folders
      #   - `all` — returns both files and folders (excludes `file-version`)
      #
      #   @return [Symbol, Imagekitio::Models::AssetListParams::Type, nil]
      optional :type, enum: -> { Imagekitio::AssetListParams::Type }

      # @!method initialize(file_type: nil, limit: nil, path: nil, search_query: nil, skip: nil, sort: nil, type: nil, request_options: {})
      #   Some parameter documentations has been truncated, see
      #   {Imagekitio::Models::AssetListParams} for more details.
      #
      #   @param file_type [Symbol, Imagekitio::Models::AssetListParams::FileType] Filter results by file type.
      #
      #   @param limit [Integer] The maximum number of results to return in response.
      #
      #   @param path [String] Folder path if you want to limit the search within a specific folder. For exampl
      #
      #   @param search_query [String] Query string in a Lucene-like query language e.g. `createdAt > "7d"`.
      #
      #   @param skip [Integer] The number of results to skip before returning results.
      #
      #   @param sort [Symbol, Imagekitio::Models::AssetListParams::Sort] Sort the results by one of the supported fields in ascending or descending order
      #
      #   @param type [Symbol, Imagekitio::Models::AssetListParams::Type] Filter results by asset type.
      #
      #   @param request_options [Imagekitio::RequestOptions, Hash{Symbol=>Object}]

      # Filter results by file type.
      #
      # - `all` — include all file types
      # - `image` — include only image files
      # - `non-image` — include only non-image files (e.g., JS, CSS, video)
      module FileType
        extend Imagekitio::Internal::Type::Enum

        ALL = :all
        IMAGE = :image
        NON_IMAGE = :"non-image"

        # @!method self.values
        #   @return [Array<Symbol>]
      end

      # Sort the results by one of the supported fields in ascending or descending
      # order.
      module Sort
        extend Imagekitio::Internal::Type::Enum

        ASC_NAME = :ASC_NAME
        DESC_NAME = :DESC_NAME
        ASC_CREATED = :ASC_CREATED
        DESC_CREATED = :DESC_CREATED
        ASC_UPDATED = :ASC_UPDATED
        DESC_UPDATED = :DESC_UPDATED
        ASC_HEIGHT = :ASC_HEIGHT
        DESC_HEIGHT = :DESC_HEIGHT
        ASC_WIDTH = :ASC_WIDTH
        DESC_WIDTH = :DESC_WIDTH
        ASC_SIZE = :ASC_SIZE
        DESC_SIZE = :DESC_SIZE
        ASC_RELEVANCE = :ASC_RELEVANCE
        DESC_RELEVANCE = :DESC_RELEVANCE

        # @!method self.values
        #   @return [Array<Symbol>]
      end

      # Filter results by asset type.
      #
      # - `file` — returns only files
      # - `file-version` — returns specific file versions
      # - `folder` — returns only folders
      # - `all` — returns both files and folders (excludes `file-version`)
      module Type
        extend Imagekitio::Internal::Type::Enum

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
