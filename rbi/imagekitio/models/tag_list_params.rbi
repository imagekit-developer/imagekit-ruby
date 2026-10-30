# typed: strong

module Imagekitio
  module Models
    class TagListParams < Imagekitio::Internal::Type::BaseModel
      extend Imagekitio::Internal::Type::RequestParameters::Converter
      include Imagekitio::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(Imagekitio::TagListParams, Imagekitio::Internal::AnyHash)
        end

      # The `nextCursor` value from the previous response, to fetch the next page. A
      # cursor is bound to the `tagSource`, `fileType`, `sort`, `search` and `prefix` it
      # was issued with; sending it with different values returns a 400.
      sig { returns(T.nilable(String)) }
      attr_reader :cursor

      sig { params(cursor: String).void }
      attr_writer :cursor

      # Filter tags by the type of asset they are applied to.
      #
      # - `image` — tags in use on images
      # - `video` — tags in use on videos
      # - `static` — tags in use on any other file, such as documents, scripts and
      #   stylesheets
      # - `all` — tags in use on any asset
      sig { returns(T.nilable(Imagekitio::TagListParams::FileType::OrSymbol)) }
      attr_reader :file_type

      sig do
        params(file_type: Imagekitio::TagListParams::FileType::OrSymbol).void
      end
      attr_writer :file_type

      # The maximum number of tags to return in response.
      sig { returns(T.nilable(Integer)) }
      attr_reader :limit

      sig { params(limit: Integer).void }
      attr_writer :limit

      # Only return tags that begin with this value. Matching is case-insensitive.
      sig { returns(T.nilable(String)) }
      attr_reader :prefix

      sig { params(prefix: String).void }
      attr_writer :prefix

      # Only return tags that contain this text. Every word in the value must appear in
      # the tag and the last word may be incomplete, which suits search-as-you-type.
      # Matching is case-insensitive.
      sig { returns(T.nilable(String)) }
      attr_reader :search

      sig { params(search: String).void }
      attr_writer :search

      # Sort the results.
      #
      # - `ASC_NAME` / `DESC_NAME` — by `name`
      # - `ASC_LAST_USED` / `DESC_LAST_USED` — by `lastUsedAt` within the requested
      #   `tagSource` and `fileType`, ties broken by `name`
      sig { returns(T.nilable(Imagekitio::TagListParams::Sort::OrSymbol)) }
      attr_reader :sort

      sig { params(sort: Imagekitio::TagListParams::Sort::OrSymbol).void }
      attr_writer :sort

      # Filter tags by who added them.
      #
      # - `user` — tags added by users through the dashboard or the API
      # - `ai` — tags added by AI auto-tagging extensions
      # - `all` — both
      sig { returns(T.nilable(Imagekitio::TagListParams::TagSource::OrSymbol)) }
      attr_reader :tag_source

      sig do
        params(tag_source: Imagekitio::TagListParams::TagSource::OrSymbol).void
      end
      attr_writer :tag_source

      sig do
        params(
          cursor: String,
          file_type: Imagekitio::TagListParams::FileType::OrSymbol,
          limit: Integer,
          prefix: String,
          search: String,
          sort: Imagekitio::TagListParams::Sort::OrSymbol,
          tag_source: Imagekitio::TagListParams::TagSource::OrSymbol,
          request_options: Imagekitio::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        # The `nextCursor` value from the previous response, to fetch the next page. A
        # cursor is bound to the `tagSource`, `fileType`, `sort`, `search` and `prefix` it
        # was issued with; sending it with different values returns a 400.
        cursor: nil,
        # Filter tags by the type of asset they are applied to.
        #
        # - `image` — tags in use on images
        # - `video` — tags in use on videos
        # - `static` — tags in use on any other file, such as documents, scripts and
        #   stylesheets
        # - `all` — tags in use on any asset
        file_type: nil,
        # The maximum number of tags to return in response.
        limit: nil,
        # Only return tags that begin with this value. Matching is case-insensitive.
        prefix: nil,
        # Only return tags that contain this text. Every word in the value must appear in
        # the tag and the last word may be incomplete, which suits search-as-you-type.
        # Matching is case-insensitive.
        search: nil,
        # Sort the results.
        #
        # - `ASC_NAME` / `DESC_NAME` — by `name`
        # - `ASC_LAST_USED` / `DESC_LAST_USED` — by `lastUsedAt` within the requested
        #   `tagSource` and `fileType`, ties broken by `name`
        sort: nil,
        # Filter tags by who added them.
        #
        # - `user` — tags added by users through the dashboard or the API
        # - `ai` — tags added by AI auto-tagging extensions
        # - `all` — both
        tag_source: nil,
        request_options: {}
      )
      end

      sig do
        override.returns(
          {
            cursor: String,
            file_type: Imagekitio::TagListParams::FileType::OrSymbol,
            limit: Integer,
            prefix: String,
            search: String,
            sort: Imagekitio::TagListParams::Sort::OrSymbol,
            tag_source: Imagekitio::TagListParams::TagSource::OrSymbol,
            request_options: Imagekitio::RequestOptions
          }
        )
      end
      def to_hash
      end

      # Filter tags by the type of asset they are applied to.
      #
      # - `image` — tags in use on images
      # - `video` — tags in use on videos
      # - `static` — tags in use on any other file, such as documents, scripts and
      #   stylesheets
      # - `all` — tags in use on any asset
      module FileType
        extend Imagekitio::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias { T.all(Symbol, Imagekitio::TagListParams::FileType) }
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        IMAGE = T.let(:image, Imagekitio::TagListParams::FileType::TaggedSymbol)
        VIDEO = T.let(:video, Imagekitio::TagListParams::FileType::TaggedSymbol)
        STATIC =
          T.let(:static, Imagekitio::TagListParams::FileType::TaggedSymbol)
        ALL = T.let(:all, Imagekitio::TagListParams::FileType::TaggedSymbol)

        sig do
          override.returns(
            T::Array[Imagekitio::TagListParams::FileType::TaggedSymbol]
          )
        end
        def self.values
        end
      end

      # Sort the results.
      #
      # - `ASC_NAME` / `DESC_NAME` — by `name`
      # - `ASC_LAST_USED` / `DESC_LAST_USED` — by `lastUsedAt` within the requested
      #   `tagSource` and `fileType`, ties broken by `name`
      module Sort
        extend Imagekitio::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias { T.all(Symbol, Imagekitio::TagListParams::Sort) }
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        ASC_NAME =
          T.let(:ASC_NAME, Imagekitio::TagListParams::Sort::TaggedSymbol)
        DESC_NAME =
          T.let(:DESC_NAME, Imagekitio::TagListParams::Sort::TaggedSymbol)
        ASC_LAST_USED =
          T.let(:ASC_LAST_USED, Imagekitio::TagListParams::Sort::TaggedSymbol)
        DESC_LAST_USED =
          T.let(:DESC_LAST_USED, Imagekitio::TagListParams::Sort::TaggedSymbol)

        sig do
          override.returns(
            T::Array[Imagekitio::TagListParams::Sort::TaggedSymbol]
          )
        end
        def self.values
        end
      end

      # Filter tags by who added them.
      #
      # - `user` — tags added by users through the dashboard or the API
      # - `ai` — tags added by AI auto-tagging extensions
      # - `all` — both
      module TagSource
        extend Imagekitio::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias { T.all(Symbol, Imagekitio::TagListParams::TagSource) }
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        USER = T.let(:user, Imagekitio::TagListParams::TagSource::TaggedSymbol)
        AI = T.let(:ai, Imagekitio::TagListParams::TagSource::TaggedSymbol)
        ALL = T.let(:all, Imagekitio::TagListParams::TagSource::TaggedSymbol)

        sig do
          override.returns(
            T::Array[Imagekitio::TagListParams::TagSource::TaggedSymbol]
          )
        end
        def self.values
        end
      end
    end
  end
end
