# typed: strong

module Imagekit
  module Models
    class FileListParams < Imagekit::Internal::Type::BaseModel
      extend Imagekit::Internal::Type::RequestParameters::Converter
      include Imagekit::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(Imagekit::FileListParams, Imagekit::Internal::AnyHash)
        end

      # Type of files to include in the result set. Accepts three values:
      #
      # `all` - include all types of files in the result set. `image` - only search in
      # image type files. `non-image` - only search in files that are not images, e.g.,
      # JS or CSS or video files.
      #
      # Default value - `all`
      sig { returns(T.nilable(String)) }
      attr_reader :file_type

      sig { params(file_type: String).void }
      attr_writer :file_type

      # The maximum number of results to return in response:
      #
      # Minimum value - 1
      #
      # Maximum value - 1000
      #
      # Default value - 1000
      sig { returns(T.nilable(String)) }
      attr_reader :limit

      sig { params(limit: String).void }
      attr_writer :limit

      # Folder path if you want to limit the search within a specific folder. For
      # example, `/sales-banner/` will only search in folder sales-banner.
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

      # The number of results to skip before returning results:
      #
      # Minimum value - 0
      #
      # Default value - 0
      sig { returns(T.nilable(String)) }
      attr_reader :skip

      sig { params(skip: String).void }
      attr_writer :skip

      # You can sort based on the following fields:
      #
      # 1. name - `ASC_NAME` or `DESC_NAME`
      # 2. createdAt - `ASC_CREATED` or `DESC_CREATED`
      # 3. updatedAt - `ASC_UPDATED` or `DESC_UPDATED`
      # 4. height - `ASC_HEIGHT` or `DESC_HEIGHT`
      # 5. width - `ASC_WIDTH` or `DESC_WIDTH`
      # 6. size - `ASC_SIZE` or `DESC_SIZE`
      #
      # Default value - `ASC_CREATED`
      sig { returns(T.nilable(String)) }
      attr_reader :sort

      sig { params(sort: String).void }
      attr_writer :sort

      # Limit search to one of `file`, `file-version`, or `folder`. Pass `all` to
      # include `files` and `folders` in search results (`file-version` will not be
      # included in this case).
      #
      # Default value - `file`
      sig { returns(T.nilable(Imagekit::FileListParams::Type::OrSymbol)) }
      attr_reader :type

      sig { params(type: Imagekit::FileListParams::Type::OrSymbol).void }
      attr_writer :type

      sig do
        params(
          file_type: String,
          limit: String,
          path: String,
          search_query: String,
          skip: String,
          sort: String,
          type: Imagekit::FileListParams::Type::OrSymbol,
          request_options: Imagekit::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        # Type of files to include in the result set. Accepts three values:
        #
        # `all` - include all types of files in the result set. `image` - only search in
        # image type files. `non-image` - only search in files that are not images, e.g.,
        # JS or CSS or video files.
        #
        # Default value - `all`
        file_type: nil,
        # The maximum number of results to return in response:
        #
        # Minimum value - 1
        #
        # Maximum value - 1000
        #
        # Default value - 1000
        limit: nil,
        # Folder path if you want to limit the search within a specific folder. For
        # example, `/sales-banner/` will only search in folder sales-banner.
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
        # The number of results to skip before returning results:
        #
        # Minimum value - 0
        #
        # Default value - 0
        skip: nil,
        # You can sort based on the following fields:
        #
        # 1. name - `ASC_NAME` or `DESC_NAME`
        # 2. createdAt - `ASC_CREATED` or `DESC_CREATED`
        # 3. updatedAt - `ASC_UPDATED` or `DESC_UPDATED`
        # 4. height - `ASC_HEIGHT` or `DESC_HEIGHT`
        # 5. width - `ASC_WIDTH` or `DESC_WIDTH`
        # 6. size - `ASC_SIZE` or `DESC_SIZE`
        #
        # Default value - `ASC_CREATED`
        sort: nil,
        # Limit search to one of `file`, `file-version`, or `folder`. Pass `all` to
        # include `files` and `folders` in search results (`file-version` will not be
        # included in this case).
        #
        # Default value - `file`
        type: nil,
        request_options: {}
      )
      end

      sig do
        override.returns(
          {
            file_type: String,
            limit: String,
            path: String,
            search_query: String,
            skip: String,
            sort: String,
            type: Imagekit::FileListParams::Type::OrSymbol,
            request_options: Imagekit::RequestOptions
          }
        )
      end
      def to_hash
      end

      # Limit search to one of `file`, `file-version`, or `folder`. Pass `all` to
      # include `files` and `folders` in search results (`file-version` will not be
      # included in this case).
      #
      # Default value - `file`
      module Type
        extend Imagekit::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias { T.all(Symbol, Imagekit::FileListParams::Type) }
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        FILE = T.let(:file, Imagekit::FileListParams::Type::TaggedSymbol)
        FILE_VERSION =
          T.let(:"file-version", Imagekit::FileListParams::Type::TaggedSymbol)
        FOLDER = T.let(:folder, Imagekit::FileListParams::Type::TaggedSymbol)
        ALL = T.let(:all, Imagekit::FileListParams::Type::TaggedSymbol)

        sig do
          override.returns(
            T::Array[Imagekit::FileListParams::Type::TaggedSymbol]
          )
        end
        def self.values
        end
      end
    end
  end
end
