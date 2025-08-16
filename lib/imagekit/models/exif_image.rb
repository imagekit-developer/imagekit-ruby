# frozen_string_literal: true

module Imagekit
  module Models
    class ExifImage < Imagekit::Internal::Type::BaseModel
      # @!attribute exif_offset
      #
      #   @return [Integer, nil]
      optional :exif_offset, Integer, api_name: :ExifOffset

      # @!attribute gps_info
      #
      #   @return [Integer, nil]
      optional :gps_info, Integer, api_name: :GPSInfo

      # @!attribute make
      #
      #   @return [String, nil]
      optional :make, String, api_name: :Make

      # @!attribute model
      #
      #   @return [String, nil]
      optional :model, String, api_name: :Model

      # @!attribute modify_date
      #
      #   @return [String, nil]
      optional :modify_date, String, api_name: :ModifyDate

      # @!attribute orientation
      #
      #   @return [Integer, nil]
      optional :orientation, Integer, api_name: :Orientation

      # @!attribute resolution_unit
      #
      #   @return [Integer, nil]
      optional :resolution_unit, Integer, api_name: :ResolutionUnit

      # @!attribute software
      #
      #   @return [String, nil]
      optional :software, String, api_name: :Software

      # @!attribute x_resolution
      #
      #   @return [Integer, nil]
      optional :x_resolution, Integer, api_name: :XResolution

      # @!attribute y_cb_cr_positioning
      #
      #   @return [Integer, nil]
      optional :y_cb_cr_positioning, Integer, api_name: :YCbCrPositioning

      # @!attribute y_resolution
      #
      #   @return [Integer, nil]
      optional :y_resolution, Integer, api_name: :YResolution

      # @!method initialize(exif_offset: nil, gps_info: nil, make: nil, model: nil, modify_date: nil, orientation: nil, resolution_unit: nil, software: nil, x_resolution: nil, y_cb_cr_positioning: nil, y_resolution: nil)
      #   Object containing EXIF image information.
      #
      #   @param exif_offset [Integer]
      #   @param gps_info [Integer]
      #   @param make [String]
      #   @param model [String]
      #   @param modify_date [String]
      #   @param orientation [Integer]
      #   @param resolution_unit [Integer]
      #   @param software [String]
      #   @param x_resolution [Integer]
      #   @param y_cb_cr_positioning [Integer]
      #   @param y_resolution [Integer]
    end
  end
end
