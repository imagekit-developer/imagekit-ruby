# frozen_string_literal: true

module Imagekitio
  module Models
    class Tag < Imagekitio::Internal::Type::BaseModel
      # @!attribute asset_count
      #   The number of assets carrying the tag, counted across both tag sources and all
      #   file types regardless of the request's filters.
      #
      #   @return [Integer]
      required :asset_count, Integer, api_name: :assetCount

      # @!attribute label
      #   The tag as it was spelled when it was last applied to any asset. Use it for
      #   display.
      #
      #   @return [String]
      required :label, String

      # @!attribute last_used_at
      #   When the tag was last applied to an asset matching the `tagSource` and
      #   `fileType` filters of the request, in ISO 8601 format.
      #
      #   @return [Time]
      required :last_used_at, Time, api_name: :lastUsedAt

      # @!attribute name
      #   The tag in lowercase. Tags are case-insensitive, so this is the unique key of
      #   the tag within your account.
      #
      #   @return [String]
      required :name, String

      # @!method initialize(asset_count:, label:, last_used_at:, name:)
      #   Some parameter documentations has been truncated, see {Imagekitio::Models::Tag}
      #   for more details.
      #
      #   A tag in use in your media library, aggregated case-insensitively across the
      #   assets that carry it.
      #
      #   @param asset_count [Integer] The number of assets carrying the tag, counted across both tag sources and all f
      #
      #   @param label [String] The tag as it was spelled when it was last applied to any asset. Use it for disp
      #
      #   @param last_used_at [Time] When the tag was last applied to an asset matching the `tagSource` and `fileType
      #
      #   @param name [String] The tag in lowercase. Tags are case-insensitive, so this is the unique key of th
    end
  end
end
