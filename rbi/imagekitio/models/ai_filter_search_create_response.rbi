# typed: strong

module Imagekitio
  module Models
    class AIFilterSearchCreateResponse < Imagekitio::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            Imagekitio::Models::AIFilterSearchCreateResponse,
            Imagekitio::Internal::AnyHash
          )
        end

      # Suggested asset-type filter derived from the prompt. Empty string means no
      # file-type restriction.
      sig do
        returns(
          T.nilable(
            Imagekitio::Models::AIFilterSearchCreateResponse::FileType::TaggedSymbol
          )
        )
      end
      attr_reader :file_type

      sig do
        params(
          file_type:
            Imagekitio::Models::AIFilterSearchCreateResponse::FileType::OrSymbol
        ).void
      end
      attr_writer :file_type

      # Whether previous file versions should be included in the search results.
      sig { returns(T.nilable(T::Boolean)) }
      attr_reader :is_version_included_in_search

      sig { params(is_version_included_in_search: T::Boolean).void }
      attr_writer :is_version_included_in_search

      # Generated query in ImageKit's Lucene-like syntax. Pass this as the `searchQuery`
      # parameter to the list and search assets API. Empty string when no filters could
      # be derived from the prompt.
      sig { returns(T.nilable(String)) }
      attr_reader :search_query

      sig { params(search_query: String).void }
      attr_writer :search_query

      sig do
        params(
          file_type:
            Imagekitio::Models::AIFilterSearchCreateResponse::FileType::OrSymbol,
          is_version_included_in_search: T::Boolean,
          search_query: String
        ).returns(T.attached_class)
      end
      def self.new(
        # Suggested asset-type filter derived from the prompt. Empty string means no
        # file-type restriction.
        file_type: nil,
        # Whether previous file versions should be included in the search results.
        is_version_included_in_search: nil,
        # Generated query in ImageKit's Lucene-like syntax. Pass this as the `searchQuery`
        # parameter to the list and search assets API. Empty string when no filters could
        # be derived from the prompt.
        search_query: nil
      )
      end

      sig do
        override.returns(
          {
            file_type:
              Imagekitio::Models::AIFilterSearchCreateResponse::FileType::TaggedSymbol,
            is_version_included_in_search: T::Boolean,
            search_query: String
          }
        )
      end
      def to_hash
      end

      # Suggested asset-type filter derived from the prompt. Empty string means no
      # file-type restriction.
      module FileType
        extend Imagekitio::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias do
            T.all(
              Symbol,
              Imagekitio::Models::AIFilterSearchCreateResponse::FileType
            )
          end
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        EMPTY =
          T.let(
            :"",
            Imagekitio::Models::AIFilterSearchCreateResponse::FileType::TaggedSymbol
          )
        IMAGES =
          T.let(
            :images,
            Imagekitio::Models::AIFilterSearchCreateResponse::FileType::TaggedSymbol
          )
        VIDEOS =
          T.let(
            :videos,
            Imagekitio::Models::AIFilterSearchCreateResponse::FileType::TaggedSymbol
          )
        CSS_JS =
          T.let(
            :cssJs,
            Imagekitio::Models::AIFilterSearchCreateResponse::FileType::TaggedSymbol
          )
        OTHERS =
          T.let(
            :others,
            Imagekitio::Models::AIFilterSearchCreateResponse::FileType::TaggedSymbol
          )

        sig do
          override.returns(
            T::Array[
              Imagekitio::Models::AIFilterSearchCreateResponse::FileType::TaggedSymbol
            ]
          )
        end
        def self.values
        end
      end
    end
  end
end
