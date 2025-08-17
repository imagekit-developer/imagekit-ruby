# frozen_string_literal: true

module Imagekit
  module Models
    module Beta
      module V2
        # @see Imagekit::Resources::Beta::V2::Files#upload
        class FileUploadResponse < Imagekit::Internal::Type::BaseModel
          # @!attribute ai_tags
          #   An array of tags assigned to the uploaded file by auto tagging.
          #
          #   @return [Array<Imagekit::Models::Beta::V2::FileUploadResponse::AITag>, nil]
          optional :ai_tags,
                   -> { Imagekit::Internal::Type::ArrayOf[Imagekit::Models::Beta::V2::FileUploadResponse::AITag] },
                   api_name: :AITags,
                   nil?: true

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

          # @!attribute custom_coordinates
          #   Value of custom coordinates associated with the image in the format
          #   `x,y,width,height`. If `customCoordinates` are not defined, then it is `null`.
          #   Send `customCoordinates` in `responseFields` in API request to get the value of
          #   this field.
          #
          #   @return [String, nil]
          optional :custom_coordinates, String, api_name: :customCoordinates, nil?: true

          # @!attribute custom_metadata
          #   A key-value data associated with the asset. Use `responseField` in API request
          #   to get `customMetadata` in the upload API response. Before setting any custom
          #   metadata on an asset, you have to create the field using custom metadata fields
          #   API. Send `customMetadata` in `responseFields` in API request to get the value
          #   of this field.
          #
          #   @return [Object, nil]
          optional :custom_metadata, Imagekit::Internal::Type::Unknown, api_name: :customMetadata

          # @!attribute duration
          #   The duration of the video in seconds (only for video).
          #
          #   @return [Integer, nil]
          optional :duration, Integer

          # @!attribute embedded_metadata
          #   Consolidated embedded metadata associated with the file. It includes exif, iptc,
          #   and xmp data. Send `embeddedMetadata` in `responseFields` in API request to get
          #   embeddedMetadata in the upload API response.
          #
          #   @return [Hash{Symbol=>Object}, nil]
          optional :embedded_metadata,
                   Imagekit::Internal::Type::HashOf[Imagekit::Internal::Type::Unknown],
                   api_name: :embeddedMetadata

          # @!attribute extension_status
          #   Extension names with their processing status at the time of completion of the
          #   request. It could have one of the following status values:
          #
          #   `success`: The extension has been successfully applied. `failed`: The extension
          #   has failed and will not be retried. `pending`: The extension will finish
          #   processing in some time. On completion, the final status (success / failed) will
          #   be sent to the `webhookUrl` provided.
          #
          #   If no extension was requested, then this parameter is not returned.
          #
          #   @return [Imagekit::Models::Beta::V2::FileUploadResponse::ExtensionStatus, nil]
          optional :extension_status,
                   -> { Imagekit::Models::Beta::V2::FileUploadResponse::ExtensionStatus },
                   api_name: :extensionStatus

          # @!attribute file_id
          #   Unique fileId. Store this fileld in your database, as this will be used to
          #   perform update action on this file.
          #
          #   @return [String, nil]
          optional :file_id, String, api_name: :fileId

          # @!attribute file_path
          #   The relative path of the file in the media library e.g.
          #   `/marketing-assets/new-banner.jpg`.
          #
          #   @return [String, nil]
          optional :file_path, String, api_name: :filePath

          # @!attribute file_type
          #   Type of the uploaded file. Possible values are `image`, `non-image`.
          #
          #   @return [String, nil]
          optional :file_type, String, api_name: :fileType

          # @!attribute height
          #   Height of the image in pixels (Only for images)
          #
          #   @return [Float, nil]
          optional :height, Float

          # @!attribute is_private_file
          #   Is the file marked as private. It can be either `true` or `false`. Send
          #   `isPrivateFile` in `responseFields` in API request to get the value of this
          #   field.
          #
          #   @return [Boolean, nil]
          optional :is_private_file, Imagekit::Internal::Type::Boolean, api_name: :isPrivateFile

          # @!attribute is_published
          #   Is the file published or in draft state. It can be either `true` or `false`.
          #   Send `isPublished` in `responseFields` in API request to get the value of this
          #   field.
          #
          #   @return [Boolean, nil]
          optional :is_published, Imagekit::Internal::Type::Boolean, api_name: :isPublished

          # @!attribute metadata
          #   Legacy metadata. Send `metadata` in `responseFields` in API request to get
          #   metadata in the upload API response.
          #
          #   @return [Imagekit::Models::Beta::V2::FileUploadResponse::Metadata, nil]
          optional :metadata, -> { Imagekit::Models::Beta::V2::FileUploadResponse::Metadata }

          # @!attribute name
          #   Name of the asset.
          #
          #   @return [String, nil]
          optional :name, String

          # @!attribute size
          #   Size of the image file in Bytes.
          #
          #   @return [Float, nil]
          optional :size, Float

          # @!attribute tags
          #   The array of tags associated with the asset. If no tags are set, it will be
          #   `null`. Send `tags` in `responseFields` in API request to get the value of this
          #   field.
          #
          #   @return [Array<String>, nil]
          optional :tags, Imagekit::Internal::Type::ArrayOf[String], nil?: true

          # @!attribute thumbnail_url
          #   In the case of an image, a small thumbnail URL.
          #
          #   @return [String, nil]
          optional :thumbnail_url, String, api_name: :thumbnailUrl

          # @!attribute url
          #   A publicly accessible URL of the file.
          #
          #   @return [String, nil]
          optional :url, String

          # @!attribute version_info
          #   An object containing the file or file version's `id` (versionId) and `name`.
          #
          #   @return [Imagekit::Models::Beta::V2::FileUploadResponse::VersionInfo, nil]
          optional :version_info,
                   -> { Imagekit::Models::Beta::V2::FileUploadResponse::VersionInfo },
                   api_name: :versionInfo

          # @!attribute video_codec
          #   The video codec used in the video (only for video).
          #
          #   @return [String, nil]
          optional :video_codec, String, api_name: :videoCodec

          # @!attribute width
          #   Width of the image in pixels (Only for Images)
          #
          #   @return [Float, nil]
          optional :width, Float

          # @!method initialize(ai_tags: nil, audio_codec: nil, bit_rate: nil, custom_coordinates: nil, custom_metadata: nil, duration: nil, embedded_metadata: nil, extension_status: nil, file_id: nil, file_path: nil, file_type: nil, height: nil, is_private_file: nil, is_published: nil, metadata: nil, name: nil, size: nil, tags: nil, thumbnail_url: nil, url: nil, version_info: nil, video_codec: nil, width: nil)
          #   Some parameter documentations has been truncated, see
          #   {Imagekit::Models::Beta::V2::FileUploadResponse} for more details.
          #
          #   Object containing details of a successful upload.
          #
          #   @param ai_tags [Array<Imagekit::Models::Beta::V2::FileUploadResponse::AITag>, nil] An array of tags assigned to the uploaded file by auto tagging.
          #
          #   @param audio_codec [String] The audio codec used in the video (only for video).
          #
          #   @param bit_rate [Integer] The bit rate of the video in kbps (only for video).
          #
          #   @param custom_coordinates [String, nil] Value of custom coordinates associated with the image in the format `x,y,width,h
          #
          #   @param custom_metadata [Object] A key-value data associated with the asset. Use `responseField` in API request t
          #
          #   @param duration [Integer] The duration of the video in seconds (only for video).
          #
          #   @param embedded_metadata [Hash{Symbol=>Object}] Consolidated embedded metadata associated with the file. It includes exif, iptc,
          #
          #   @param extension_status [Imagekit::Models::Beta::V2::FileUploadResponse::ExtensionStatus] Extension names with their processing status at the time of completion of the re
          #
          #   @param file_id [String] Unique fileId. Store this fileld in your database, as this will be used to perfo
          #
          #   @param file_path [String] The relative path of the file in the media library e.g. `/marketing-assets/new-b
          #
          #   @param file_type [String] Type of the uploaded file. Possible values are `image`, `non-image`.
          #
          #   @param height [Float] Height of the image in pixels (Only for images)
          #
          #   @param is_private_file [Boolean] Is the file marked as private. It can be either `true` or `false`. Send `isPriva
          #
          #   @param is_published [Boolean] Is the file published or in draft state. It can be either `true` or `false`. Sen
          #
          #   @param metadata [Imagekit::Models::Beta::V2::FileUploadResponse::Metadata] Legacy metadata. Send `metadata` in `responseFields` in API request to get metad
          #
          #   @param name [String] Name of the asset.
          #
          #   @param size [Float] Size of the image file in Bytes.
          #
          #   @param tags [Array<String>, nil] The array of tags associated with the asset. If no tags are set, it will be `nul
          #
          #   @param thumbnail_url [String] In the case of an image, a small thumbnail URL.
          #
          #   @param url [String] A publicly accessible URL of the file.
          #
          #   @param version_info [Imagekit::Models::Beta::V2::FileUploadResponse::VersionInfo] An object containing the file or file version's `id` (versionId) and `name`.
          #
          #   @param video_codec [String] The video codec used in the video (only for video).
          #
          #   @param width [Float] Width of the image in pixels (Only for Images)

          class AITag < Imagekit::Internal::Type::BaseModel
            # @!attribute confidence
            #   Confidence score of the tag.
            #
            #   @return [Float, nil]
            optional :confidence, Float

            # @!attribute name
            #   Name of the tag.
            #
            #   @return [String, nil]
            optional :name, String

            # @!attribute source
            #   Array of `AITags` associated with the image. If no `AITags` are set, it will be
            #   null. These tags can be added using the `google-auto-tagging` or
            #   `aws-auto-tagging` extensions.
            #
            #   @return [String, nil]
            optional :source, String

            # @!method initialize(confidence: nil, name: nil, source: nil)
            #   Some parameter documentations has been truncated, see
            #   {Imagekit::Models::Beta::V2::FileUploadResponse::AITag} for more details.
            #
            #   @param confidence [Float] Confidence score of the tag.
            #
            #   @param name [String] Name of the tag.
            #
            #   @param source [String] Array of `AITags` associated with the image. If no `AITags` are set, it will be
          end

          # @see Imagekit::Models::Beta::V2::FileUploadResponse#extension_status
          class ExtensionStatus < Imagekit::Internal::Type::BaseModel
            # @!attribute aws_auto_tagging
            #
            #   @return [Symbol, Imagekit::Models::Beta::V2::FileUploadResponse::ExtensionStatus::AwsAutoTagging, nil]
            optional :aws_auto_tagging,
                     enum: -> { Imagekit::Models::Beta::V2::FileUploadResponse::ExtensionStatus::AwsAutoTagging },
                     api_name: :"aws-auto-tagging"

            # @!attribute google_auto_tagging
            #
            #   @return [Symbol, Imagekit::Models::Beta::V2::FileUploadResponse::ExtensionStatus::GoogleAutoTagging, nil]
            optional :google_auto_tagging,
                     enum: -> { Imagekit::Models::Beta::V2::FileUploadResponse::ExtensionStatus::GoogleAutoTagging },
                     api_name: :"google-auto-tagging"

            # @!attribute remove_bg
            #
            #   @return [Symbol, Imagekit::Models::Beta::V2::FileUploadResponse::ExtensionStatus::RemoveBg, nil]
            optional :remove_bg,
                     enum: -> { Imagekit::Models::Beta::V2::FileUploadResponse::ExtensionStatus::RemoveBg },
                     api_name: :"remove-bg"

            # @!method initialize(aws_auto_tagging: nil, google_auto_tagging: nil, remove_bg: nil)
            #   Extension names with their processing status at the time of completion of the
            #   request. It could have one of the following status values:
            #
            #   `success`: The extension has been successfully applied. `failed`: The extension
            #   has failed and will not be retried. `pending`: The extension will finish
            #   processing in some time. On completion, the final status (success / failed) will
            #   be sent to the `webhookUrl` provided.
            #
            #   If no extension was requested, then this parameter is not returned.
            #
            #   @param aws_auto_tagging [Symbol, Imagekit::Models::Beta::V2::FileUploadResponse::ExtensionStatus::AwsAutoTagging]
            #   @param google_auto_tagging [Symbol, Imagekit::Models::Beta::V2::FileUploadResponse::ExtensionStatus::GoogleAutoTagging]
            #   @param remove_bg [Symbol, Imagekit::Models::Beta::V2::FileUploadResponse::ExtensionStatus::RemoveBg]

            # @see Imagekit::Models::Beta::V2::FileUploadResponse::ExtensionStatus#aws_auto_tagging
            module AwsAutoTagging
              extend Imagekit::Internal::Type::Enum

              SUCCESS = :success
              PENDING = :pending
              FAILED = :failed

              # @!method self.values
              #   @return [Array<Symbol>]
            end

            # @see Imagekit::Models::Beta::V2::FileUploadResponse::ExtensionStatus#google_auto_tagging
            module GoogleAutoTagging
              extend Imagekit::Internal::Type::Enum

              SUCCESS = :success
              PENDING = :pending
              FAILED = :failed

              # @!method self.values
              #   @return [Array<Symbol>]
            end

            # @see Imagekit::Models::Beta::V2::FileUploadResponse::ExtensionStatus#remove_bg
            module RemoveBg
              extend Imagekit::Internal::Type::Enum

              SUCCESS = :success
              PENDING = :pending
              FAILED = :failed

              # @!method self.values
              #   @return [Array<Symbol>]
            end
          end

          # @see Imagekit::Models::Beta::V2::FileUploadResponse#metadata
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
            #   @return [Imagekit::Models::Beta::V2::FileUploadResponse::Metadata::Exif, nil]
            optional :exif, -> { Imagekit::Models::Beta::V2::FileUploadResponse::Metadata::Exif }

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
            #   Legacy metadata. Send `metadata` in `responseFields` in API request to get
            #   metadata in the upload API response.
            #
            #   @param audio_codec [String] The audio codec used in the video (only for video).
            #
            #   @param bit_rate [Integer] The bit rate of the video in kbps (only for video).
            #
            #   @param density [Integer] The density of the image in DPI.
            #
            #   @param duration [Integer] The duration of the video in seconds (only for video).
            #
            #   @param exif [Imagekit::Models::Beta::V2::FileUploadResponse::Metadata::Exif]
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

            # @see Imagekit::Models::Beta::V2::FileUploadResponse::Metadata#exif
            class Exif < Imagekit::Internal::Type::BaseModel
              # @!attribute exif
              #   Object containing Exif details.
              #
              #   @return [Imagekit::Models::Beta::V2::FileUploadResponse::Metadata::Exif::Exif, nil]
              optional :exif, -> { Imagekit::Models::Beta::V2::FileUploadResponse::Metadata::Exif::Exif }

              # @!attribute gps
              #   Object containing GPS information.
              #
              #   @return [Imagekit::Models::Beta::V2::FileUploadResponse::Metadata::Exif::Gps, nil]
              optional :gps, -> { Imagekit::Models::Beta::V2::FileUploadResponse::Metadata::Exif::Gps }

              # @!attribute image
              #   Object containing EXIF image information.
              #
              #   @return [Imagekit::Models::Beta::V2::FileUploadResponse::Metadata::Exif::Image, nil]
              optional :image, -> { Imagekit::Models::Beta::V2::FileUploadResponse::Metadata::Exif::Image }

              # @!attribute interoperability
              #   JSON object.
              #
              #   @return [Imagekit::Models::Beta::V2::FileUploadResponse::Metadata::Exif::Interoperability, nil]
              optional :interoperability,
                       -> { Imagekit::Models::Beta::V2::FileUploadResponse::Metadata::Exif::Interoperability }

              # @!attribute makernote
              #
              #   @return [Hash{Symbol=>Object}, nil]
              optional :makernote, Imagekit::Internal::Type::HashOf[Imagekit::Internal::Type::Unknown]

              # @!attribute thumbnail
              #   Object containing Thumbnail information.
              #
              #   @return [Imagekit::Models::Beta::V2::FileUploadResponse::Metadata::Exif::Thumbnail, nil]
              optional :thumbnail, -> { Imagekit::Models::Beta::V2::FileUploadResponse::Metadata::Exif::Thumbnail }

              # @!method initialize(exif: nil, gps: nil, image: nil, interoperability: nil, makernote: nil, thumbnail: nil)
              #   @param exif [Imagekit::Models::Beta::V2::FileUploadResponse::Metadata::Exif::Exif] Object containing Exif details.
              #
              #   @param gps [Imagekit::Models::Beta::V2::FileUploadResponse::Metadata::Exif::Gps] Object containing GPS information.
              #
              #   @param image [Imagekit::Models::Beta::V2::FileUploadResponse::Metadata::Exif::Image] Object containing EXIF image information.
              #
              #   @param interoperability [Imagekit::Models::Beta::V2::FileUploadResponse::Metadata::Exif::Interoperability] JSON object.
              #
              #   @param makernote [Hash{Symbol=>Object}]
              #
              #   @param thumbnail [Imagekit::Models::Beta::V2::FileUploadResponse::Metadata::Exif::Thumbnail] Object containing Thumbnail information.

              # @see Imagekit::Models::Beta::V2::FileUploadResponse::Metadata::Exif#exif
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

              # @see Imagekit::Models::Beta::V2::FileUploadResponse::Metadata::Exif#gps
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

              # @see Imagekit::Models::Beta::V2::FileUploadResponse::Metadata::Exif#image
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

              # @see Imagekit::Models::Beta::V2::FileUploadResponse::Metadata::Exif#interoperability
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

              # @see Imagekit::Models::Beta::V2::FileUploadResponse::Metadata::Exif#thumbnail
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

          # @see Imagekit::Models::Beta::V2::FileUploadResponse#version_info
          class VersionInfo < Imagekit::Internal::Type::BaseModel
            # @!attribute id
            #   Unique identifier of the file version.
            #
            #   @return [String, nil]
            optional :id, String

            # @!attribute name
            #   Name of the file version.
            #
            #   @return [String, nil]
            optional :name, String

            # @!method initialize(id: nil, name: nil)
            #   An object containing the file or file version's `id` (versionId) and `name`.
            #
            #   @param id [String] Unique identifier of the file version.
            #
            #   @param name [String] Name of the file version.
          end
        end
      end
    end
  end
end
