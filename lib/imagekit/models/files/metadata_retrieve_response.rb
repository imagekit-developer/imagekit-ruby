# frozen_string_literal: true

module Imagekit
  module Models
    module Files
      # @see Imagekit::Resources::Files::Metadata#retrieve
      class MetadataRetrieveResponse < Imagekit::Internal::Type::BaseModel
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
        #   @return [Imagekit::Models::Files::MetadataRetrieveResponse::Exif, nil]
        optional :exif, -> { Imagekit::Models::Files::MetadataRetrieveResponse::Exif }

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
        #   @param exif [Imagekit::Models::Files::MetadataRetrieveResponse::Exif]
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

        # @see Imagekit::Models::Files::MetadataRetrieveResponse#exif
        class Exif < Imagekit::Internal::Type::BaseModel
          # @!attribute exif
          #   Object containing Exif details.
          #
          #   @return [Imagekit::Models::ExifDetails, nil]
          optional :exif, -> { Imagekit::ExifDetails }

          # @!attribute gps
          #   Object containing GPS information.
          #
          #   @return [Imagekit::Models::Gps, nil]
          optional :gps, -> { Imagekit::Gps }

          # @!attribute image
          #   Object containing EXIF image information.
          #
          #   @return [Imagekit::Models::ExifImage, nil]
          optional :image, -> { Imagekit::ExifImage }

          # @!attribute interoperability
          #   JSON object.
          #
          #   @return [Imagekit::Models::Interoperability, nil]
          optional :interoperability, -> { Imagekit::Interoperability }

          # @!attribute makernote
          #
          #   @return [Hash{Symbol=>Object}, nil]
          optional :makernote, Imagekit::Internal::Type::HashOf[Imagekit::Internal::Type::Unknown]

          # @!attribute thumbnail
          #   Object containing Thumbnail information.
          #
          #   @return [Imagekit::Models::Thumbnail, nil]
          optional :thumbnail, -> { Imagekit::Thumbnail }

          # @!method initialize(exif: nil, gps: nil, image: nil, interoperability: nil, makernote: nil, thumbnail: nil)
          #   @param exif [Imagekit::Models::ExifDetails] Object containing Exif details.
          #
          #   @param gps [Imagekit::Models::Gps] Object containing GPS information.
          #
          #   @param image [Imagekit::Models::ExifImage] Object containing EXIF image information.
          #
          #   @param interoperability [Imagekit::Models::Interoperability] JSON object.
          #
          #   @param makernote [Hash{Symbol=>Object}]
          #
          #   @param thumbnail [Imagekit::Models::Thumbnail] Object containing Thumbnail information.
        end
      end
    end
  end
end
