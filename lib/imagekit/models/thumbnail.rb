# frozen_string_literal: true

module Imagekit
  module Models
    class Thumbnail < Imagekit::Internal::Type::BaseModel
      # @!attribute compression
      #
      #   @return [Integer, nil]
      optional :compression, Integer, api_name: :Compression

      # @!attribute resolution_unit
      #
      #   @return [Integer, nil]
      optional :resolution_unit, Integer, api_name: :ResolutionUnit

      # @!attribute thumbnail_length
      #
      #   @return [Integer, nil]
      optional :thumbnail_length, Integer, api_name: :ThumbnailLength

      # @!attribute thumbnail_offset
      #
      #   @return [Integer, nil]
      optional :thumbnail_offset, Integer, api_name: :ThumbnailOffset

      # @!attribute x_resolution
      #
      #   @return [Integer, nil]
      optional :x_resolution, Integer, api_name: :XResolution

      # @!attribute y_resolution
      #
      #   @return [Integer, nil]
      optional :y_resolution, Integer, api_name: :YResolution

      # @!method initialize(compression: nil, resolution_unit: nil, thumbnail_length: nil, thumbnail_offset: nil, x_resolution: nil, y_resolution: nil)
      #   Object containing Thumbnail information.
      #
      #   @param compression [Integer]
      #   @param resolution_unit [Integer]
      #   @param thumbnail_length [Integer]
      #   @param thumbnail_offset [Integer]
      #   @param x_resolution [Integer]
      #   @param y_resolution [Integer]
    end
  end
end
