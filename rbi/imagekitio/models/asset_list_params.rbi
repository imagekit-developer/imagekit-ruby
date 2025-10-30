# typed: strong

module Imagekitio
  module Models
    class AssetListParams < Imagekitio::Internal::Type::BaseModel
      extend Imagekitio::Internal::Type::RequestParameters::Converter
      include Imagekitio::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(Imagekitio::AssetListParams, Imagekitio::Internal::AnyHash)
        end

      # Filter results by file type.
      #
      # - `all` — include all file types
      # - `image` — include only image files
      # - `non-image` — include only non-image files (e.g., JS, CSS, video)
      sig do
        returns(T.nilable(Imagekitio::AssetListParams::FileType::OrSymbol))
      end
      attr_reader :file_type

      sig do
        params(file_type: Imagekitio::AssetListParams::FileType::OrSymbol).void
      end
      attr_writer :file_type

      # The maximum number of results to return in response.
      sig { returns(T.nilable(Integer)) }
      attr_reader :limit

      sig { params(limit: Integer).void }
      attr_writer :limit

      # Folder path if you want to limit the search within a specific folder. For
      # example, `/sales-banner/` will only search in folder sales-banner.
      #
      # Note : If your use case involves searching within a folder as well as its
      # subfolders, you can use `path` parameter in `searchQuery` with appropriate
      # operator. Checkout
      # [Supported parameters](/docs/api-reference/digital-asset-management-dam/list-and-search-assets#supported-parameters)
      # for more information.
      sig { returns(T.nilable(String)) }
      attr_reader :path

      sig { params(path: String).void }
      attr_writer :path

      # Query string in a Lucene-like query language e.g. `createdAt > "7d"`.
      #
      # Note : When the searchQuery parameter is present, the following query parameters
      # will have no effect on the result:
      #
      # 1. `tags`
      # 2. `type`
      # 3. `name`
      #
      # [Learn more](/docs/api-reference/digital-asset-management-dam/list-and-search-assets#advanced-search-queries)
      # from examples.
      sig { returns(T.nilable(String)) }
      attr_reader :search_query

      sig { params(search_query: String).void }
      attr_writer :search_query

      # The number of results to skip before returning results.
      sig { returns(T.nilable(Integer)) }
      attr_reader :skip

      sig { params(skip: Integer).void }
      attr_writer :skip

      # Sort the results by one of the supported fields in ascending or descending
      # order.
      sig { returns(T.nilable(Imagekitio::AssetListParams::Sort::OrSymbol)) }
      attr_reader :sort

      sig { params(sort: Imagekitio::AssetListParams::Sort::OrSymbol).void }
      attr_writer :sort

      # Filter results by asset type.
      #
      # - `file` — returns only files
      # - `file-version` — returns specific file versions
      # - `folder` — returns only folders
      # - `all` — returns both files and folders (excludes `file-version`)
      sig { returns(T.nilable(Imagekitio::AssetListParams::Type::OrSymbol)) }
      attr_reader :type

      sig { params(type: Imagekitio::AssetListParams::Type::OrSymbol).void }
      attr_writer :type

      sig do
        params(
          file_type: Imagekitio::AssetListParams::FileType::OrSymbol,
          limit: Integer,
          path: String,
          search_query: String,
          skip: Integer,
          sort: Imagekitio::AssetListParams::Sort::OrSymbol,
          type: Imagekitio::AssetListParams::Type::OrSymbol,
          request_options: Imagekitio::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        # Filter results by file type.
        #
        # - `all` — include all file types
        # - `image` — include only image files
        # - `non-image` — include only non-image files (e.g., JS, CSS, video)
        file_type: nil,
        # The maximum number of results to return in response.
        limit: nil,
        # Folder path if you want to limit the search within a specific folder. For
        # example, `/sales-banner/` will only search in folder sales-banner.
        #
        # Note : If your use case involves searching within a folder as well as its
        # subfolders, you can use `path` parameter in `searchQuery` with appropriate
        # operator. Checkout
        # [Supported parameters](/docs/api-reference/digital-asset-management-dam/list-and-search-assets#supported-parameters)
        # for more information.
        path: nil,
        # Query string in a Lucene-like query language e.g. `createdAt > "7d"`.
        #
        # Note : When the searchQuery parameter is present, the following query parameters
        # will have no effect on the result:
        #
        # 1. `tags`
        # 2. `type`
        # 3. `name`
        #
        # [Learn more](/docs/api-reference/digital-asset-management-dam/list-and-search-assets#advanced-search-queries)
        # from examples.
        search_query: nil,
        # The number of results to skip before returning results.
        skip: nil,
        # Sort the results by one of the supported fields in ascending or descending
        # order.
        sort: nil,
        # Filter results by asset type.
        #
        # - `file` — returns only files
        # - `file-version` — returns specific file versions
        # - `folder` — returns only folders
        # - `all` — returns both files and folders (excludes `file-version`)
        type: nil,
        request_options: {}
      )
      end

      sig do
        override.returns(
          {
            file_type: Imagekitio::AssetListParams::FileType::OrSymbol,
            limit: Integer,
            path: String,
            search_query: String,
            skip: Integer,
            sort: Imagekitio::AssetListParams::Sort::OrSymbol,
            type: Imagekitio::AssetListParams::Type::OrSymbol,
            request_options: Imagekitio::RequestOptions
          }
        )
      end
      def to_hash
      end

      # Filter results by file type.
      #
      # - `all` — include all file types
      # - `image` — include only image files
      # - `non-image` — include only non-image files (e.g., JS, CSS, video)
      module FileType
        extend Imagekitio::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias { T.all(Symbol, Imagekitio::AssetListParams::FileType) }
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        ALL = T.let(:all, Imagekitio::AssetListParams::FileType::TaggedSymbol)
        IMAGE =
          T.let(:image, Imagekitio::AssetListParams::FileType::TaggedSymbol)
        NON_IMAGE =
          T.let(
            :"non-image",
            Imagekitio::AssetListParams::FileType::TaggedSymbol
          )

        sig do
          override.returns(
            T::Array[Imagekitio::AssetListParams::FileType::TaggedSymbol]
          )
        end
        def self.values
        end
      end

      # Sort the results by one of the supported fields in ascending or descending
      # order.
      module Sort
        extend Imagekitio::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias { T.all(Symbol, Imagekitio::AssetListParams::Sort) }
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        ASC_NAME =
          T.let(:ASC_NAME, Imagekitio::AssetListParams::Sort::TaggedSymbol)
        DESC_NAME =
          T.let(:DESC_NAME, Imagekitio::AssetListParams::Sort::TaggedSymbol)
        ASC_CREATED =
          T.let(:ASC_CREATED, Imagekitio::AssetListParams::Sort::TaggedSymbol)
        DESC_CREATED =
          T.let(:DESC_CREATED, Imagekitio::AssetListParams::Sort::TaggedSymbol)
        ASC_UPDATED =
          T.let(:ASC_UPDATED, Imagekitio::AssetListParams::Sort::TaggedSymbol)
        DESC_UPDATED =
          T.let(:DESC_UPDATED, Imagekitio::AssetListParams::Sort::TaggedSymbol)
        ASC_HEIGHT =
          T.let(:ASC_HEIGHT, Imagekitio::AssetListParams::Sort::TaggedSymbol)
        DESC_HEIGHT =
          T.let(:DESC_HEIGHT, Imagekitio::AssetListParams::Sort::TaggedSymbol)
        ASC_WIDTH =
          T.let(:ASC_WIDTH, Imagekitio::AssetListParams::Sort::TaggedSymbol)
        DESC_WIDTH =
          T.let(:DESC_WIDTH, Imagekitio::AssetListParams::Sort::TaggedSymbol)
        ASC_SIZE =
          T.let(:ASC_SIZE, Imagekitio::AssetListParams::Sort::TaggedSymbol)
        DESC_SIZE =
          T.let(:DESC_SIZE, Imagekitio::AssetListParams::Sort::TaggedSymbol)
        ASC_RELEVANCE =
          T.let(:ASC_RELEVANCE, Imagekitio::AssetListParams::Sort::TaggedSymbol)
        DESC_RELEVANCE =
          T.let(
            :DESC_RELEVANCE,
            Imagekitio::AssetListParams::Sort::TaggedSymbol
          )

        sig do
          override.returns(
            T::Array[Imagekitio::AssetListParams::Sort::TaggedSymbol]
          )
        end
        def self.values
        end
      end

      # Filter results by asset type.
      #
      # - `file` — returns only files
      # - `file-version` — returns specific file versions
      # - `folder` — returns only folders
      # - `all` — returns both files and folders (excludes `file-version`)
      module Type
        extend Imagekitio::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias { T.all(Symbol, Imagekitio::AssetListParams::Type) }
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        FILE = T.let(:file, Imagekitio::AssetListParams::Type::TaggedSymbol)
        FILE_VERSION =
          T.let(
            :"file-version",
            Imagekitio::AssetListParams::Type::TaggedSymbol
          )
        FOLDER = T.let(:folder, Imagekitio::AssetListParams::Type::TaggedSymbol)
        ALL = T.let(:all, Imagekitio::AssetListParams::Type::TaggedSymbol)

        sig do
          override.returns(
            T::Array[Imagekitio::AssetListParams::Type::TaggedSymbol]
          )
        end
        def self.values
        end
      end
    end
  end
end
