# frozen_string_literal: true

module Imagekit
  module Models
    class ExifDetails < Imagekit::Internal::Type::BaseModel
      # @!attribute aperture_value
      #
      #   @return [Float, nil]
      optional :aperture_value, Float, api_name: :ApertureValue

      # @!attribute color_space
      #
      #   @return [Integer, nil]
      optional :color_space, Integer, api_name: :ColorSpace

      # @!attribute create_date
      #
      #   @return [String, nil]
      optional :create_date, String, api_name: :CreateDate

      # @!attribute custom_rendered
      #
      #   @return [Integer, nil]
      optional :custom_rendered, Integer, api_name: :CustomRendered

      # @!attribute date_time_original
      #
      #   @return [String, nil]
      optional :date_time_original, String, api_name: :DateTimeOriginal

      # @!attribute exif_image_height
      #
      #   @return [Integer, nil]
      optional :exif_image_height, Integer, api_name: :ExifImageHeight

      # @!attribute exif_image_width
      #
      #   @return [Integer, nil]
      optional :exif_image_width, Integer, api_name: :ExifImageWidth

      # @!attribute exif_version
      #
      #   @return [String, nil]
      optional :exif_version, String, api_name: :ExifVersion

      # @!attribute exposure_compensation
      #
      #   @return [Float, nil]
      optional :exposure_compensation, Float, api_name: :ExposureCompensation

      # @!attribute exposure_mode
      #
      #   @return [Integer, nil]
      optional :exposure_mode, Integer, api_name: :ExposureMode

      # @!attribute exposure_program
      #
      #   @return [Integer, nil]
      optional :exposure_program, Integer, api_name: :ExposureProgram

      # @!attribute exposure_time
      #
      #   @return [Float, nil]
      optional :exposure_time, Float, api_name: :ExposureTime

      # @!attribute flash
      #
      #   @return [Integer, nil]
      optional :flash, Integer, api_name: :Flash

      # @!attribute flashpix_version
      #
      #   @return [String, nil]
      optional :flashpix_version, String, api_name: :FlashpixVersion

      # @!attribute f_number
      #
      #   @return [Float, nil]
      optional :f_number, Float, api_name: :FNumber

      # @!attribute focal_length
      #
      #   @return [Integer, nil]
      optional :focal_length, Integer, api_name: :FocalLength

      # @!attribute focal_plane_resolution_unit
      #
      #   @return [Integer, nil]
      optional :focal_plane_resolution_unit, Integer, api_name: :FocalPlaneResolutionUnit

      # @!attribute focal_plane_x_resolution
      #
      #   @return [Float, nil]
      optional :focal_plane_x_resolution, Float, api_name: :FocalPlaneXResolution

      # @!attribute focal_plane_y_resolution
      #
      #   @return [Float, nil]
      optional :focal_plane_y_resolution, Float, api_name: :FocalPlaneYResolution

      # @!attribute interop_offset
      #
      #   @return [Integer, nil]
      optional :interop_offset, Integer, api_name: :InteropOffset

      # @!attribute iso
      #
      #   @return [Integer, nil]
      optional :iso, Integer, api_name: :ISO

      # @!attribute metering_mode
      #
      #   @return [Integer, nil]
      optional :metering_mode, Integer, api_name: :MeteringMode

      # @!attribute scene_capture_type
      #
      #   @return [Integer, nil]
      optional :scene_capture_type, Integer, api_name: :SceneCaptureType

      # @!attribute shutter_speed_value
      #
      #   @return [Float, nil]
      optional :shutter_speed_value, Float, api_name: :ShutterSpeedValue

      # @!attribute sub_sec_time
      #
      #   @return [String, nil]
      optional :sub_sec_time, String, api_name: :SubSecTime

      # @!attribute white_balance
      #
      #   @return [Integer, nil]
      optional :white_balance, Integer, api_name: :WhiteBalance

      # @!method initialize(aperture_value: nil, color_space: nil, create_date: nil, custom_rendered: nil, date_time_original: nil, exif_image_height: nil, exif_image_width: nil, exif_version: nil, exposure_compensation: nil, exposure_mode: nil, exposure_program: nil, exposure_time: nil, flash: nil, flashpix_version: nil, f_number: nil, focal_length: nil, focal_plane_resolution_unit: nil, focal_plane_x_resolution: nil, focal_plane_y_resolution: nil, interop_offset: nil, iso: nil, metering_mode: nil, scene_capture_type: nil, shutter_speed_value: nil, sub_sec_time: nil, white_balance: nil)
      #   Object containing Exif details.
      #
      #   @param aperture_value [Float]
      #   @param color_space [Integer]
      #   @param create_date [String]
      #   @param custom_rendered [Integer]
      #   @param date_time_original [String]
      #   @param exif_image_height [Integer]
      #   @param exif_image_width [Integer]
      #   @param exif_version [String]
      #   @param exposure_compensation [Float]
      #   @param exposure_mode [Integer]
      #   @param exposure_program [Integer]
      #   @param exposure_time [Float]
      #   @param flash [Integer]
      #   @param flashpix_version [String]
      #   @param f_number [Float]
      #   @param focal_length [Integer]
      #   @param focal_plane_resolution_unit [Integer]
      #   @param focal_plane_x_resolution [Float]
      #   @param focal_plane_y_resolution [Float]
      #   @param interop_offset [Integer]
      #   @param iso [Integer]
      #   @param metering_mode [Integer]
      #   @param scene_capture_type [Integer]
      #   @param shutter_speed_value [Float]
      #   @param sub_sec_time [String]
      #   @param white_balance [Integer]
    end
  end
end
