# frozen_string_literal: true

module Imagekitio
  module Models
    # @see Imagekitio::Resources::Tags#list
    class TagListResponse < Imagekitio::Internal::Type::BaseModel
      # @!attribute next_cursor
      #   Cursor for the next page, or `null` when there are no more tags.
      #
      #   @return [String, nil]
      required :next_cursor, String, api_name: :nextCursor, nil?: true

      # @!attribute tags
      #   Tags matching the request, in the requested order.
      #
      #   @return [Array<Imagekitio::Models::Tag>]
      required :tags, -> { Imagekitio::Internal::Type::ArrayOf[Imagekitio::Tag] }

      # @!method initialize(next_cursor:, tags:)
      #   @param next_cursor [String, nil] Cursor for the next page, or `null` when there are no more tags.
      #
      #   @param tags [Array<Imagekitio::Models::Tag>] Tags matching the request, in the requested order.
    end
  end
end
