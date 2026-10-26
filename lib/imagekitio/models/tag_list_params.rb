# frozen_string_literal: true

module Imagekitio
  module Models
    # @see Imagekitio::Resources::Tags#list
    class TagListParams < Imagekitio::Internal::Type::BaseModel
      extend Imagekitio::Internal::Type::RequestParameters::Converter
      include Imagekitio::Internal::Type::RequestParameters

      # @!attribute cursor
      #   The `nextCursor` value from the previous response, to fetch the next page. A
      #   cursor is bound to the `tagSource`, `fileType`, `sort`, `search` and `prefix` it
      #   was issued with; sending it with different values returns a 400.
      #
      #   @return [String, nil]
      optional :cursor, String

      # @!attribute file_type
      #   Filter tags by the type of asset they are applied to.
      #
      #   - `image` — tags in use on images
      #   - `video` — tags in use on videos
      #   - `static` — tags in use on any other file, such as documents, scripts and
      #     stylesheets
      #   - `all` — tags in use on any asset
      #
      #   @return [Symbol, Imagekitio::Models::TagListParams::FileType, nil]
      optional :file_type, enum: -> { Imagekitio::TagListParams::FileType }

      # @!attribute limit
      #   The maximum number of tags to return in response.
      #
      #   @return [Integer, nil]
      optional :limit, Integer

      # @!attribute prefix
      #   Only return tags that begin with this value. Matching is case-insensitive.
      #
      #   @return [String, nil]
      optional :prefix, String

      # @!attribute search
      #   Only return tags that contain this text. Every word in the value must appear in
      #   the tag and the last word may be incomplete, which suits search-as-you-type.
      #   Matching is case-insensitive.
      #
      #   @return [String, nil]
      optional :search, String

      # @!attribute sort
      #   Sort the results.
      #
      #   - `ASC_NAME` / `DESC_NAME` — by `name`
      #   - `ASC_LAST_USED` / `DESC_LAST_USED` — by `lastUsedAt` within the requested
      #     `tagSource` and `fileType`, ties broken by `name`
      #
      #   @return [Symbol, Imagekitio::Models::TagListParams::Sort, nil]
      optional :sort, enum: -> { Imagekitio::TagListParams::Sort }

      # @!attribute tag_source
      #   Filter tags by who added them.
      #
      #   - `user` — tags added by users through the dashboard or the API
      #   - `ai` — tags added by AI auto-tagging extensions
      #   - `all` — both
      #
      #   @return [Symbol, Imagekitio::Models::TagListParams::TagSource, nil]
      optional :tag_source, enum: -> { Imagekitio::TagListParams::TagSource }

      # @!method initialize(cursor: nil, file_type: nil, limit: nil, prefix: nil, search: nil, sort: nil, tag_source: nil, request_options: {})
      #   Some parameter documentations has been truncated, see
      #   {Imagekitio::Models::TagListParams} for more details.
      #
      #   @param cursor [String] The `nextCursor` value from the previous response, to fetch the next page. A cur
      #
      #   @param file_type [Symbol, Imagekitio::Models::TagListParams::FileType] Filter tags by the type of asset they are applied to.
      #
      #   @param limit [Integer] The maximum number of tags to return in response.
      #
      #   @param prefix [String] Only return tags that begin with this value. Matching is case-insensitive.
      #
      #   @param search [String] Only return tags that contain this text. Every word in the value must appear in
      #
      #   @param sort [Symbol, Imagekitio::Models::TagListParams::Sort] Sort the results.
      #
      #   @param tag_source [Symbol, Imagekitio::Models::TagListParams::TagSource] Filter tags by who added them.
      #
      #   @param request_options [Imagekitio::RequestOptions, Hash{Symbol=>Object}]

      # Filter tags by the type of asset they are applied to.
      #
      # - `image` — tags in use on images
      # - `video` — tags in use on videos
      # - `static` — tags in use on any other file, such as documents, scripts and
      #   stylesheets
      # - `all` — tags in use on any asset
      module FileType
        extend Imagekitio::Internal::Type::Enum

        IMAGE = :image
        VIDEO = :video
        STATIC = :static
        ALL = :all

        # @!method self.values
        #   @return [Array<Symbol>]
      end

      # Sort the results.
      #
      # - `ASC_NAME` / `DESC_NAME` — by `name`
      # - `ASC_LAST_USED` / `DESC_LAST_USED` — by `lastUsedAt` within the requested
      #   `tagSource` and `fileType`, ties broken by `name`
      module Sort
        extend Imagekitio::Internal::Type::Enum

        ASC_NAME = :ASC_NAME
        DESC_NAME = :DESC_NAME
        ASC_LAST_USED = :ASC_LAST_USED
        DESC_LAST_USED = :DESC_LAST_USED

        # @!method self.values
        #   @return [Array<Symbol>]
      end

      # Filter tags by who added them.
      #
      # - `user` — tags added by users through the dashboard or the API
      # - `ai` — tags added by AI auto-tagging extensions
      # - `all` — both
      module TagSource
        extend Imagekitio::Internal::Type::Enum

        USER = :user
        AI = :ai
        ALL = :all

        # @!method self.values
        #   @return [Array<Symbol>]
      end
    end
  end
end
