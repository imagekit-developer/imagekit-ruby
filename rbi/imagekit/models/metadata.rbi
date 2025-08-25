# typed: strong

module Imagekit
  module Models
    class Metadata < Imagekit::Internal::Type::BaseModel
      OrHash =
        T.type_alias { T.any(Imagekit::Metadata, Imagekit::Internal::AnyHash) }

      # The audio codec used in the video (only for video).
      sig { returns(T.nilable(String)) }
      attr_reader :audio_codec

      sig { params(audio_codec: String).void }
      attr_writer :audio_codec

      # The bit rate of the video in kbps (only for video).
      sig { returns(T.nilable(Integer)) }
      attr_reader :bit_rate

      sig { params(bit_rate: Integer).void }
      attr_writer :bit_rate

      # The density of the image in DPI.
      sig { returns(T.nilable(Integer)) }
      attr_reader :density

      sig { params(density: Integer).void }
      attr_writer :density

      # The duration of the video in seconds (only for video).
      sig { returns(T.nilable(Integer)) }
      attr_reader :duration

      sig { params(duration: Integer).void }
      attr_writer :duration

      sig { returns(T.nilable(Imagekit::Metadata::Exif)) }
      attr_reader :exif

      sig { params(exif: Imagekit::Metadata::Exif::OrHash).void }
      attr_writer :exif

      # The format of the file (e.g., 'jpg', 'mp4').
      sig { returns(T.nilable(String)) }
      attr_reader :format_

      sig { params(format_: String).void }
      attr_writer :format_

      # Indicates if the image has a color profile.
      sig { returns(T.nilable(T::Boolean)) }
      attr_reader :has_color_profile

      sig { params(has_color_profile: T::Boolean).void }
      attr_writer :has_color_profile

      # Indicates if the image contains transparent areas.
      sig { returns(T.nilable(T::Boolean)) }
      attr_reader :has_transparency

      sig { params(has_transparency: T::Boolean).void }
      attr_writer :has_transparency

      # The height of the image or video in pixels.
      sig { returns(T.nilable(Integer)) }
      attr_reader :height

      sig { params(height: Integer).void }
      attr_writer :height

      # Perceptual hash of the image.
      sig { returns(T.nilable(String)) }
      attr_reader :p_hash

      sig { params(p_hash: String).void }
      attr_writer :p_hash

      # The quality indicator of the image.
      sig { returns(T.nilable(Integer)) }
      attr_reader :quality

      sig { params(quality: Integer).void }
      attr_writer :quality

      # The file size in bytes.
      sig { returns(T.nilable(Integer)) }
      attr_reader :size

      sig { params(size: Integer).void }
      attr_writer :size

      # The video codec used in the video (only for video).
      sig { returns(T.nilable(String)) }
      attr_reader :video_codec

      sig { params(video_codec: String).void }
      attr_writer :video_codec

      # The width of the image or video in pixels.
      sig { returns(T.nilable(Integer)) }
      attr_reader :width

      sig { params(width: Integer).void }
      attr_writer :width

      # JSON object containing metadata.
      sig do
        params(
          audio_codec: String,
          bit_rate: Integer,
          density: Integer,
          duration: Integer,
          exif: Imagekit::Metadata::Exif::OrHash,
          format_: String,
          has_color_profile: T::Boolean,
          has_transparency: T::Boolean,
          height: Integer,
          p_hash: String,
          quality: Integer,
          size: Integer,
          video_codec: String,
          width: Integer
        ).returns(T.attached_class)
      end
      def self.new(
        # The audio codec used in the video (only for video).
        audio_codec: nil,
        # The bit rate of the video in kbps (only for video).
        bit_rate: nil,
        # The density of the image in DPI.
        density: nil,
        # The duration of the video in seconds (only for video).
        duration: nil,
        exif: nil,
        # The format of the file (e.g., 'jpg', 'mp4').
        format_: nil,
        # Indicates if the image has a color profile.
        has_color_profile: nil,
        # Indicates if the image contains transparent areas.
        has_transparency: nil,
        # The height of the image or video in pixels.
        height: nil,
        # Perceptual hash of the image.
        p_hash: nil,
        # The quality indicator of the image.
        quality: nil,
        # The file size in bytes.
        size: nil,
        # The video codec used in the video (only for video).
        video_codec: nil,
        # The width of the image or video in pixels.
        width: nil
      )
      end

      sig do
        override.returns(
          {
            audio_codec: String,
            bit_rate: Integer,
            density: Integer,
            duration: Integer,
            exif: Imagekit::Metadata::Exif,
            format_: String,
            has_color_profile: T::Boolean,
            has_transparency: T::Boolean,
            height: Integer,
            p_hash: String,
            quality: Integer,
            size: Integer,
            video_codec: String,
            width: Integer
          }
        )
      end
      def to_hash
      end

      class Exif < Imagekit::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(Imagekit::Metadata::Exif, Imagekit::Internal::AnyHash)
          end

        # Object containing Exif details.
        sig { returns(T.nilable(Imagekit::Metadata::Exif::Exif)) }
        attr_reader :exif

        sig { params(exif: Imagekit::Metadata::Exif::Exif::OrHash).void }
        attr_writer :exif

        # Object containing GPS information.
        sig { returns(T.nilable(Imagekit::Metadata::Exif::Gps)) }
        attr_reader :gps

        sig { params(gps: Imagekit::Metadata::Exif::Gps::OrHash).void }
        attr_writer :gps

        # Object containing EXIF image information.
        sig { returns(T.nilable(Imagekit::Metadata::Exif::Image)) }
        attr_reader :image

        sig { params(image: Imagekit::Metadata::Exif::Image::OrHash).void }
        attr_writer :image

        # JSON object.
        sig { returns(T.nilable(Imagekit::Metadata::Exif::Interoperability)) }
        attr_reader :interoperability

        sig do
          params(
            interoperability: Imagekit::Metadata::Exif::Interoperability::OrHash
          ).void
        end
        attr_writer :interoperability

        sig { returns(T.nilable(T::Hash[Symbol, T.anything])) }
        attr_reader :makernote

        sig { params(makernote: T::Hash[Symbol, T.anything]).void }
        attr_writer :makernote

        # Object containing Thumbnail information.
        sig { returns(T.nilable(Imagekit::Metadata::Exif::Thumbnail)) }
        attr_reader :thumbnail

        sig do
          params(thumbnail: Imagekit::Metadata::Exif::Thumbnail::OrHash).void
        end
        attr_writer :thumbnail

        sig do
          params(
            exif: Imagekit::Metadata::Exif::Exif::OrHash,
            gps: Imagekit::Metadata::Exif::Gps::OrHash,
            image: Imagekit::Metadata::Exif::Image::OrHash,
            interoperability:
              Imagekit::Metadata::Exif::Interoperability::OrHash,
            makernote: T::Hash[Symbol, T.anything],
            thumbnail: Imagekit::Metadata::Exif::Thumbnail::OrHash
          ).returns(T.attached_class)
        end
        def self.new(
          # Object containing Exif details.
          exif: nil,
          # Object containing GPS information.
          gps: nil,
          # Object containing EXIF image information.
          image: nil,
          # JSON object.
          interoperability: nil,
          makernote: nil,
          # Object containing Thumbnail information.
          thumbnail: nil
        )
        end

        sig do
          override.returns(
            {
              exif: Imagekit::Metadata::Exif::Exif,
              gps: Imagekit::Metadata::Exif::Gps,
              image: Imagekit::Metadata::Exif::Image,
              interoperability: Imagekit::Metadata::Exif::Interoperability,
              makernote: T::Hash[Symbol, T.anything],
              thumbnail: Imagekit::Metadata::Exif::Thumbnail
            }
          )
        end
        def to_hash
        end

        class Exif < Imagekit::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(Imagekit::Metadata::Exif::Exif, Imagekit::Internal::AnyHash)
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

        class Gps < Imagekit::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(Imagekit::Metadata::Exif::Gps, Imagekit::Internal::AnyHash)
            end

          sig { returns(T.nilable(T::Array[Integer])) }
          attr_reader :gps_version_id

          sig { params(gps_version_id: T::Array[Integer]).void }
          attr_writer :gps_version_id

          # Object containing GPS information.
          sig do
            params(gps_version_id: T::Array[Integer]).returns(T.attached_class)
          end
          def self.new(gps_version_id: nil)
          end

          sig { override.returns({ gps_version_id: T::Array[Integer] }) }
          def to_hash
          end
        end

        class Image < Imagekit::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Imagekit::Metadata::Exif::Image,
                Imagekit::Internal::AnyHash
              )
            end

          sig { returns(T.nilable(Integer)) }
          attr_reader :exif_offset

          sig { params(exif_offset: Integer).void }
          attr_writer :exif_offset

          sig { returns(T.nilable(Integer)) }
          attr_reader :gps_info

          sig { params(gps_info: Integer).void }
          attr_writer :gps_info

          sig { returns(T.nilable(String)) }
          attr_reader :make

          sig { params(make: String).void }
          attr_writer :make

          sig { returns(T.nilable(String)) }
          attr_reader :model

          sig { params(model: String).void }
          attr_writer :model

          sig { returns(T.nilable(String)) }
          attr_reader :modify_date

          sig { params(modify_date: String).void }
          attr_writer :modify_date

          sig { returns(T.nilable(Integer)) }
          attr_reader :orientation

          sig { params(orientation: Integer).void }
          attr_writer :orientation

          sig { returns(T.nilable(Integer)) }
          attr_reader :resolution_unit

          sig { params(resolution_unit: Integer).void }
          attr_writer :resolution_unit

          sig { returns(T.nilable(String)) }
          attr_reader :software

          sig { params(software: String).void }
          attr_writer :software

          sig { returns(T.nilable(Integer)) }
          attr_reader :x_resolution

          sig { params(x_resolution: Integer).void }
          attr_writer :x_resolution

          sig { returns(T.nilable(Integer)) }
          attr_reader :y_cb_cr_positioning

          sig { params(y_cb_cr_positioning: Integer).void }
          attr_writer :y_cb_cr_positioning

          sig { returns(T.nilable(Integer)) }
          attr_reader :y_resolution

          sig { params(y_resolution: Integer).void }
          attr_writer :y_resolution

          # Object containing EXIF image information.
          sig do
            params(
              exif_offset: Integer,
              gps_info: Integer,
              make: String,
              model: String,
              modify_date: String,
              orientation: Integer,
              resolution_unit: Integer,
              software: String,
              x_resolution: Integer,
              y_cb_cr_positioning: Integer,
              y_resolution: Integer
            ).returns(T.attached_class)
          end
          def self.new(
            exif_offset: nil,
            gps_info: nil,
            make: nil,
            model: nil,
            modify_date: nil,
            orientation: nil,
            resolution_unit: nil,
            software: nil,
            x_resolution: nil,
            y_cb_cr_positioning: nil,
            y_resolution: nil
          )
          end

          sig do
            override.returns(
              {
                exif_offset: Integer,
                gps_info: Integer,
                make: String,
                model: String,
                modify_date: String,
                orientation: Integer,
                resolution_unit: Integer,
                software: String,
                x_resolution: Integer,
                y_cb_cr_positioning: Integer,
                y_resolution: Integer
              }
            )
          end
          def to_hash
          end
        end

        class Interoperability < Imagekit::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Imagekit::Metadata::Exif::Interoperability,
                Imagekit::Internal::AnyHash
              )
            end

          sig { returns(T.nilable(String)) }
          attr_reader :interop_index

          sig { params(interop_index: String).void }
          attr_writer :interop_index

          sig { returns(T.nilable(String)) }
          attr_reader :interop_version

          sig { params(interop_version: String).void }
          attr_writer :interop_version

          # JSON object.
          sig do
            params(interop_index: String, interop_version: String).returns(
              T.attached_class
            )
          end
          def self.new(interop_index: nil, interop_version: nil)
          end

          sig do
            override.returns({ interop_index: String, interop_version: String })
          end
          def to_hash
          end
        end

        class Thumbnail < Imagekit::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Imagekit::Metadata::Exif::Thumbnail,
                Imagekit::Internal::AnyHash
              )
            end

          sig { returns(T.nilable(Integer)) }
          attr_reader :compression

          sig { params(compression: Integer).void }
          attr_writer :compression

          sig { returns(T.nilable(Integer)) }
          attr_reader :resolution_unit

          sig { params(resolution_unit: Integer).void }
          attr_writer :resolution_unit

          sig { returns(T.nilable(Integer)) }
          attr_reader :thumbnail_length

          sig { params(thumbnail_length: Integer).void }
          attr_writer :thumbnail_length

          sig { returns(T.nilable(Integer)) }
          attr_reader :thumbnail_offset

          sig { params(thumbnail_offset: Integer).void }
          attr_writer :thumbnail_offset

          sig { returns(T.nilable(Integer)) }
          attr_reader :x_resolution

          sig { params(x_resolution: Integer).void }
          attr_writer :x_resolution

          sig { returns(T.nilable(Integer)) }
          attr_reader :y_resolution

          sig { params(y_resolution: Integer).void }
          attr_writer :y_resolution

          # Object containing Thumbnail information.
          sig do
            params(
              compression: Integer,
              resolution_unit: Integer,
              thumbnail_length: Integer,
              thumbnail_offset: Integer,
              x_resolution: Integer,
              y_resolution: Integer
            ).returns(T.attached_class)
          end
          def self.new(
            compression: nil,
            resolution_unit: nil,
            thumbnail_length: nil,
            thumbnail_offset: nil,
            x_resolution: nil,
            y_resolution: nil
          )
          end

          sig do
            override.returns(
              {
                compression: Integer,
                resolution_unit: Integer,
                thumbnail_length: Integer,
                thumbnail_offset: Integer,
                x_resolution: Integer,
                y_resolution: Integer
              }
            )
          end
          def to_hash
          end
        end
      end
    end
  end
end
