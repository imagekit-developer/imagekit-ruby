# typed: strong

module Imagekit
  module Models
    module Files
      class MetadataGetResponse < Imagekit::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Imagekit::Models::Files::MetadataGetResponse,
              Imagekit::Internal::AnyHash
            )
          end

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

        sig do
          returns(T.nilable(Imagekit::Models::Files::MetadataGetResponse::Exif))
        end
        attr_reader :exif

        sig do
          params(
            exif: Imagekit::Models::Files::MetadataGetResponse::Exif::OrHash
          ).void
        end
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
            exif: Imagekit::Models::Files::MetadataGetResponse::Exif::OrHash,
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
              exif: Imagekit::Models::Files::MetadataGetResponse::Exif,
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
              T.any(
                Imagekit::Models::Files::MetadataGetResponse::Exif,
                Imagekit::Internal::AnyHash
              )
            end

          # Object containing Exif details.
          sig { returns(T.nilable(Imagekit::ExifDetails)) }
          attr_reader :exif

          sig { params(exif: Imagekit::ExifDetails::OrHash).void }
          attr_writer :exif

          # Object containing GPS information.
          sig { returns(T.nilable(Imagekit::Gps)) }
          attr_reader :gps

          sig { params(gps: Imagekit::Gps::OrHash).void }
          attr_writer :gps

          # Object containing EXIF image information.
          sig { returns(T.nilable(Imagekit::ExifImage)) }
          attr_reader :image

          sig { params(image: Imagekit::ExifImage::OrHash).void }
          attr_writer :image

          # JSON object.
          sig { returns(T.nilable(Imagekit::Interoperability)) }
          attr_reader :interoperability

          sig do
            params(interoperability: Imagekit::Interoperability::OrHash).void
          end
          attr_writer :interoperability

          sig { returns(T.nilable(T::Hash[Symbol, T.anything])) }
          attr_reader :makernote

          sig { params(makernote: T::Hash[Symbol, T.anything]).void }
          attr_writer :makernote

          # Object containing Thumbnail information.
          sig { returns(T.nilable(Imagekit::Thumbnail)) }
          attr_reader :thumbnail

          sig { params(thumbnail: Imagekit::Thumbnail::OrHash).void }
          attr_writer :thumbnail

          sig do
            params(
              exif: Imagekit::ExifDetails::OrHash,
              gps: Imagekit::Gps::OrHash,
              image: Imagekit::ExifImage::OrHash,
              interoperability: Imagekit::Interoperability::OrHash,
              makernote: T::Hash[Symbol, T.anything],
              thumbnail: Imagekit::Thumbnail::OrHash
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
                exif: Imagekit::ExifDetails,
                gps: Imagekit::Gps,
                image: Imagekit::ExifImage,
                interoperability: Imagekit::Interoperability,
                makernote: T::Hash[Symbol, T.anything],
                thumbnail: Imagekit::Thumbnail
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
