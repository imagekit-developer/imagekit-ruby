# frozen_string_literal: true

module Imagekitio
  module Models
    # @see Imagekitio::Resources::AIFilterSearch#create
    class AIFilterSearchCreateResponse < Imagekitio::Internal::Type::BaseModel
      # @!attribute file_type
      #   Suggested asset-type filter derived from the prompt. Empty string means no
      #   file-type restriction.
      #
      #   @return [Symbol, Imagekitio::Models::AIFilterSearchCreateResponse::FileType, nil]
      optional :file_type,
               enum: -> { Imagekitio::Models::AIFilterSearchCreateResponse::FileType },
               api_name: :fileType

      # @!attribute is_version_included_in_search
      #   Whether previous file versions should be included in the search results.
      #
      #   @return [Boolean, nil]
      optional :is_version_included_in_search,
               Imagekitio::Internal::Type::Boolean,
               api_name: :isVersionIncludedInSearch

      # @!attribute search_query
      #   Generated query in ImageKit's Lucene-like syntax. Pass this as the `searchQuery`
      #   parameter to the list and search assets API. Empty string when no filters could
      #   be derived from the prompt.
      #
      #   @return [String, nil]
      optional :search_query, String, api_name: :searchQuery

      # @!method initialize(file_type: nil, is_version_included_in_search: nil, search_query: nil)
      #   Some parameter documentations has been truncated, see
      #   {Imagekitio::Models::AIFilterSearchCreateResponse} for more details.
      #
      #   @param file_type [Symbol, Imagekitio::Models::AIFilterSearchCreateResponse::FileType] Suggested asset-type filter derived from the prompt. Empty string means no file-
      #
      #   @param is_version_included_in_search [Boolean] Whether previous file versions should be included in the search results.
      #
      #   @param search_query [String] Generated query in ImageKit's Lucene-like syntax. Pass this as the `searchQuery`

      # Suggested asset-type filter derived from the prompt. Empty string means no
      # file-type restriction.
      #
      # @see Imagekitio::Models::AIFilterSearchCreateResponse#file_type
      module FileType
        extend Imagekitio::Internal::Type::Enum

        EMPTY = :""
        IMAGES = :images
        VIDEOS = :videos
        CSS_JS = :cssJs
        OTHERS = :others

        # @!method self.values
        #   @return [Array<Symbol>]
      end
    end
  end
end
