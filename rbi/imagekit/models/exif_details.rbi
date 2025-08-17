# typed: strong

module Imagekit
  module Models
    class ExifDetails < Imagekit::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(Imagekit::ExifDetails, Imagekit::Internal::AnyHash)
        end

      sig { returns(T.nilable(Float)) }
      attr_reader :aperture_value

      sig { params(aperture_value: Float).void }
      attr_writer :aperture_value

      sig { returns(T.nilable(Integer)) }
      attr_reader :color_space

      sig { params(color_space: Integer).void }
      attr_writer :color_space

      sig { returns(T.nilable(String)) }
      attr_reader :create_date

      sig { params(create_date: String).void }
      attr_writer :create_date

      sig { returns(T.nilable(Integer)) }
      attr_reader :custom_rendered

      sig { params(custom_rendered: Integer).void }
      attr_writer :custom_rendered

      sig { returns(T.nilable(String)) }
      attr_reader :date_time_original

      sig { params(date_time_original: String).void }
      attr_writer :date_time_original

      sig { returns(T.nilable(Integer)) }
      attr_reader :exif_image_height

      sig { params(exif_image_height: Integer).void }
      attr_writer :exif_image_height

      sig { returns(T.nilable(Integer)) }
      attr_reader :exif_image_width

      sig { params(exif_image_width: Integer).void }
      attr_writer :exif_image_width

      sig { returns(T.nilable(String)) }
      attr_reader :exif_version

      sig { params(exif_version: String).void }
      attr_writer :exif_version

      sig { returns(T.nilable(Float)) }
      attr_reader :exposure_compensation

      sig { params(exposure_compensation: Float).void }
      attr_writer :exposure_compensation

      sig { returns(T.nilable(Integer)) }
      attr_reader :exposure_mode

      sig { params(exposure_mode: Integer).void }
      attr_writer :exposure_mode

      sig { returns(T.nilable(Integer)) }
      attr_reader :exposure_program

      sig { params(exposure_program: Integer).void }
      attr_writer :exposure_program

      sig { returns(T.nilable(Float)) }
      attr_reader :exposure_time

      sig { params(exposure_time: Float).void }
      attr_writer :exposure_time

      sig { returns(T.nilable(Integer)) }
      attr_reader :flash

      sig { params(flash: Integer).void }
      attr_writer :flash

      sig { returns(T.nilable(String)) }
      attr_reader :flashpix_version

      sig { params(flashpix_version: String).void }
      attr_writer :flashpix_version

      sig { returns(T.nilable(Float)) }
      attr_reader :f_number

      sig { params(f_number: Float).void }
      attr_writer :f_number

      sig { returns(T.nilable(Integer)) }
      attr_reader :focal_length

      sig { params(focal_length: Integer).void }
      attr_writer :focal_length

      sig { returns(T.nilable(Integer)) }
      attr_reader :focal_plane_resolution_unit

      sig { params(focal_plane_resolution_unit: Integer).void }
      attr_writer :focal_plane_resolution_unit

      sig { returns(T.nilable(Float)) }
      attr_reader :focal_plane_x_resolution

      sig { params(focal_plane_x_resolution: Float).void }
      attr_writer :focal_plane_x_resolution

      sig { returns(T.nilable(Float)) }
      attr_reader :focal_plane_y_resolution

      sig { params(focal_plane_y_resolution: Float).void }
      attr_writer :focal_plane_y_resolution

      sig { returns(T.nilable(Integer)) }
      attr_reader :interop_offset

      sig { params(interop_offset: Integer).void }
      attr_writer :interop_offset

      sig { returns(T.nilable(Integer)) }
      attr_reader :iso

      sig { params(iso: Integer).void }
      attr_writer :iso

      sig { returns(T.nilable(Integer)) }
      attr_reader :metering_mode

      sig { params(metering_mode: Integer).void }
      attr_writer :metering_mode

      sig { returns(T.nilable(Integer)) }
      attr_reader :scene_capture_type

      sig { params(scene_capture_type: Integer).void }
      attr_writer :scene_capture_type

      sig { returns(T.nilable(Float)) }
      attr_reader :shutter_speed_value

      sig { params(shutter_speed_value: Float).void }
      attr_writer :shutter_speed_value

      sig { returns(T.nilable(String)) }
      attr_reader :sub_sec_time

      sig { params(sub_sec_time: String).void }
      attr_writer :sub_sec_time

      sig { returns(T.nilable(Integer)) }
      attr_reader :white_balance

      sig { params(white_balance: Integer).void }
      attr_writer :white_balance

      # Object containing Exif details.
      sig do
        params(
          aperture_value: Float,
          color_space: Integer,
          create_date: String,
          custom_rendered: Integer,
          date_time_original: String,
          exif_image_height: Integer,
          exif_image_width: Integer,
          exif_version: String,
          exposure_compensation: Float,
          exposure_mode: Integer,
          exposure_program: Integer,
          exposure_time: Float,
          flash: Integer,
          flashpix_version: String,
          f_number: Float,
          focal_length: Integer,
          focal_plane_resolution_unit: Integer,
          focal_plane_x_resolution: Float,
          focal_plane_y_resolution: Float,
          interop_offset: Integer,
          iso: Integer,
          metering_mode: Integer,
          scene_capture_type: Integer,
          shutter_speed_value: Float,
          sub_sec_time: String,
          white_balance: Integer
        ).returns(T.attached_class)
      end
      def self.new(
        aperture_value: nil,
        color_space: nil,
        create_date: nil,
        custom_rendered: nil,
        date_time_original: nil,
        exif_image_height: nil,
        exif_image_width: nil,
        exif_version: nil,
        exposure_compensation: nil,
        exposure_mode: nil,
        exposure_program: nil,
        exposure_time: nil,
        flash: nil,
        flashpix_version: nil,
        f_number: nil,
        focal_length: nil,
        focal_plane_resolution_unit: nil,
        focal_plane_x_resolution: nil,
        focal_plane_y_resolution: nil,
        interop_offset: nil,
        iso: nil,
        metering_mode: nil,
        scene_capture_type: nil,
        shutter_speed_value: nil,
        sub_sec_time: nil,
        white_balance: nil
      )
      end

      sig do
        override.returns(
          {
            aperture_value: Float,
            color_space: Integer,
            create_date: String,
            custom_rendered: Integer,
            date_time_original: String,
            exif_image_height: Integer,
            exif_image_width: Integer,
            exif_version: String,
            exposure_compensation: Float,
            exposure_mode: Integer,
            exposure_program: Integer,
            exposure_time: Float,
            flash: Integer,
            flashpix_version: String,
            f_number: Float,
            focal_length: Integer,
            focal_plane_resolution_unit: Integer,
            focal_plane_x_resolution: Float,
            focal_plane_y_resolution: Float,
            interop_offset: Integer,
            iso: Integer,
            metering_mode: Integer,
            scene_capture_type: Integer,
            shutter_speed_value: Float,
            sub_sec_time: String,
            white_balance: Integer
          }
        )
      end
      def to_hash
      end
    end
  end
end
