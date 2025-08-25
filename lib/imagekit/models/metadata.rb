# frozen_string_literal: true

module Imagekit
  module Models
    class Metadata < Imagekit::Internal::Type::BaseModel
      # @!attribute audio_codec
      #   The audio codec used in the video (only for video).
      #
      #   @return [String, nil]
      optional :audio_codec, String, api_name: :audioCodec

      # @!attribute bit_rate
      #   The bit rate of the video in kbps (only for video).
      #
      #   @return [Integer, nil]
      optional :bit_rate, Integer, api_name: :bitRate

      # @!attribute density
      #   The density of the image in DPI.
      #
      #   @return [Integer, nil]
      optional :density, Integer

      # @!attribute duration
      #   The duration of the video in seconds (only for video).
      #
      #   @return [Integer, nil]
      optional :duration, Integer

      # @!attribute exif
      #
      #   @return [Imagekit::Models::Metadata::Exif, nil]
      optional :exif, -> { Imagekit::Metadata::Exif }

      # @!attribute format_
      #   The format of the file (e.g., 'jpg', 'mp4').
      #
      #   @return [String, nil]
      optional :format_, String, api_name: :format

      # @!attribute has_color_profile
      #   Indicates if the image has a color profile.
      #
      #   @return [Boolean, nil]
      optional :has_color_profile, Imagekit::Internal::Type::Boolean, api_name: :hasColorProfile

      # @!attribute has_transparency
      #   Indicates if the image contains transparent areas.
      #
      #   @return [Boolean, nil]
      optional :has_transparency, Imagekit::Internal::Type::Boolean, api_name: :hasTransparency

      # @!attribute height
      #   The height of the image or video in pixels.
      #
      #   @return [Integer, nil]
      optional :height, Integer

      # @!attribute p_hash
      #   Perceptual hash of the image.
      #
      #   @return [String, nil]
      optional :p_hash, String, api_name: :pHash

      # @!attribute quality
      #   The quality indicator of the image.
      #
      #   @return [Integer, nil]
      optional :quality, Integer

      # @!attribute size
      #   The file size in bytes.
      #
      #   @return [Integer, nil]
      optional :size, Integer

      # @!attribute video_codec
      #   The video codec used in the video (only for video).
      #
      #   @return [String, nil]
      optional :video_codec, String, api_name: :videoCodec

      # @!attribute width
      #   The width of the image or video in pixels.
      #
      #   @return [Integer, nil]
      optional :width, Integer

      # @!method initialize(audio_codec: nil, bit_rate: nil, density: nil, duration: nil, exif: nil, format_: nil, has_color_profile: nil, has_transparency: nil, height: nil, p_hash: nil, quality: nil, size: nil, video_codec: nil, width: nil)
      #   JSON object containing metadata.
      #
      #   @param audio_codec [String] The audio codec used in the video (only for video).
      #
      #   @param bit_rate [Integer] The bit rate of the video in kbps (only for video).
      #
      #   @param density [Integer] The density of the image in DPI.
      #
      #   @param duration [Integer] The duration of the video in seconds (only for video).
      #
      #   @param exif [Imagekit::Models::Metadata::Exif]
      #
      #   @param format_ [String] The format of the file (e.g., 'jpg', 'mp4').
      #
      #   @param has_color_profile [Boolean] Indicates if the image has a color profile.
      #
      #   @param has_transparency [Boolean] Indicates if the image contains transparent areas.
      #
      #   @param height [Integer] The height of the image or video in pixels.
      #
      #   @param p_hash [String] Perceptual hash of the image.
      #
      #   @param quality [Integer] The quality indicator of the image.
      #
      #   @param size [Integer] The file size in bytes.
      #
      #   @param video_codec [String] The video codec used in the video (only for video).
      #
      #   @param width [Integer] The width of the image or video in pixels.

      # @see Imagekit::Models::Metadata#exif
      class Exif < Imagekit::Internal::Type::BaseModel
        # @!attribute exif
        #   Object containing Exif details.
        #
        #   @return [Imagekit::Models::Metadata::Exif::Exif, nil]
        optional :exif, -> { Imagekit::Metadata::Exif::Exif }

        # @!attribute gps
        #   Object containing GPS information.
        #
        #   @return [Imagekit::Models::Metadata::Exif::Gps, nil]
        optional :gps, -> { Imagekit::Metadata::Exif::Gps }

        # @!attribute image
        #   Object containing EXIF image information.
        #
        #   @return [Imagekit::Models::Metadata::Exif::Image, nil]
        optional :image, -> { Imagekit::Metadata::Exif::Image }

        # @!attribute interoperability
        #   JSON object.
        #
        #   @return [Imagekit::Models::Metadata::Exif::Interoperability, nil]
        optional :interoperability, -> { Imagekit::Metadata::Exif::Interoperability }

        # @!attribute makernote
        #
        #   @return [Hash{Symbol=>Object}, nil]
        optional :makernote, Imagekit::Internal::Type::HashOf[Imagekit::Internal::Type::Unknown]

        # @!attribute thumbnail
        #   Object containing Thumbnail information.
        #
        #   @return [Imagekit::Models::Metadata::Exif::Thumbnail, nil]
        optional :thumbnail, -> { Imagekit::Metadata::Exif::Thumbnail }

        # @!method initialize(exif: nil, gps: nil, image: nil, interoperability: nil, makernote: nil, thumbnail: nil)
        #   @param exif [Imagekit::Models::Metadata::Exif::Exif] Object containing Exif details.
        #
        #   @param gps [Imagekit::Models::Metadata::Exif::Gps] Object containing GPS information.
        #
        #   @param image [Imagekit::Models::Metadata::Exif::Image] Object containing EXIF image information.
        #
        #   @param interoperability [Imagekit::Models::Metadata::Exif::Interoperability] JSON object.
        #
        #   @param makernote [Hash{Symbol=>Object}]
        #
        #   @param thumbnail [Imagekit::Models::Metadata::Exif::Thumbnail] Object containing Thumbnail information.

        # @see Imagekit::Models::Metadata::Exif#exif
        class Exif < Imagekit::Internal::Type::BaseModel
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

        # @see Imagekit::Models::Metadata::Exif#gps
        class Gps < Imagekit::Internal::Type::BaseModel
          # @!attribute gps_version_id
          #
          #   @return [Array<Integer>, nil]
          optional :gps_version_id, Imagekit::Internal::Type::ArrayOf[Integer], api_name: :GPSVersionID

          # @!method initialize(gps_version_id: nil)
          #   Object containing GPS information.
          #
          #   @param gps_version_id [Array<Integer>]
        end

        # @see Imagekit::Models::Metadata::Exif#image
        class Image < Imagekit::Internal::Type::BaseModel
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

        # @see Imagekit::Models::Metadata::Exif#interoperability
        class Interoperability < Imagekit::Internal::Type::BaseModel
          # @!attribute interop_index
          #
          #   @return [String, nil]
          optional :interop_index, String, api_name: :InteropIndex

          # @!attribute interop_version
          #
          #   @return [String, nil]
          optional :interop_version, String, api_name: :InteropVersion

          # @!method initialize(interop_index: nil, interop_version: nil)
          #   JSON object.
          #
          #   @param interop_index [String]
          #   @param interop_version [String]
        end

        # @see Imagekit::Models::Metadata::Exif#thumbnail
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
  end
end
