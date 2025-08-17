# frozen_string_literal: true

module Imagekit
  module Models
    # @see Imagekit::Resources::Files#upload
    class FileUploadResponse < Imagekit::Internal::Type::BaseModel
      # @!attribute ai_tags
      #   An array of tags assigned to the uploaded file by auto tagging.
      #
      #   @return [Array<Imagekit::Models::FileUploadResponse::AITag>, nil]
      optional :ai_tags,
               -> { Imagekit::Internal::Type::ArrayOf[Imagekit::Models::FileUploadResponse::AITag] },
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
      #   @return [Hash{Symbol=>Object}, nil]
      optional :custom_metadata,
               Imagekit::Internal::Type::HashOf[Imagekit::Internal::Type::Unknown],
               api_name: :customMetadata

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
      #   @return [Imagekit::Models::FileUploadResponse::ExtensionStatus, nil]
      optional :extension_status,
               -> { Imagekit::Models::FileUploadResponse::ExtensionStatus },
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
      #   @return [Imagekit::Models::FileUploadResponse::Metadata, nil]
      optional :metadata, -> { Imagekit::Models::FileUploadResponse::Metadata }

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
      #   @return [Imagekit::Models::FileUploadResponse::VersionInfo, nil]
      optional :version_info, -> { Imagekit::Models::FileUploadResponse::VersionInfo }, api_name: :versionInfo

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
      #   {Imagekit::Models::FileUploadResponse} for more details.
      #
      #   Object containing details of a successful upload.
      #
      #   @param ai_tags [Array<Imagekit::Models::FileUploadResponse::AITag>, nil] An array of tags assigned to the uploaded file by auto tagging.
      #
      #   @param audio_codec [String] The audio codec used in the video (only for video).
      #
      #   @param bit_rate [Integer] The bit rate of the video in kbps (only for video).
      #
      #   @param custom_coordinates [String, nil] Value of custom coordinates associated with the image in the format `x,y,width,h
      #
      #   @param custom_metadata [Hash{Symbol=>Object}] A key-value data associated with the asset. Use `responseField` in API request t
      #
      #   @param duration [Integer] The duration of the video in seconds (only for video).
      #
      #   @param embedded_metadata [Hash{Symbol=>Object}] Consolidated embedded metadata associated with the file. It includes exif, iptc,
      #
      #   @param extension_status [Imagekit::Models::FileUploadResponse::ExtensionStatus] Extension names with their processing status at the time of completion of the re
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
      #   @param metadata [Imagekit::Models::FileUploadResponse::Metadata] Legacy metadata. Send `metadata` in `responseFields` in API request to get metad
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
      #   @param version_info [Imagekit::Models::FileUploadResponse::VersionInfo] An object containing the file or file version's `id` (versionId) and `name`.
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
        #   {Imagekit::Models::FileUploadResponse::AITag} for more details.
        #
        #   @param confidence [Float] Confidence score of the tag.
        #
        #   @param name [String] Name of the tag.
        #
        #   @param source [String] Array of `AITags` associated with the image. If no `AITags` are set, it will be
      end

      # @see Imagekit::Models::FileUploadResponse#extension_status
      class ExtensionStatus < Imagekit::Internal::Type::BaseModel
        # @!attribute aws_auto_tagging
        #
        #   @return [Symbol, Imagekit::Models::FileUploadResponse::ExtensionStatus::AwsAutoTagging, nil]
        optional :aws_auto_tagging,
                 enum: -> { Imagekit::Models::FileUploadResponse::ExtensionStatus::AwsAutoTagging },
                 api_name: :"aws-auto-tagging"

        # @!attribute google_auto_tagging
        #
        #   @return [Symbol, Imagekit::Models::FileUploadResponse::ExtensionStatus::GoogleAutoTagging, nil]
        optional :google_auto_tagging,
                 enum: -> { Imagekit::Models::FileUploadResponse::ExtensionStatus::GoogleAutoTagging },
                 api_name: :"google-auto-tagging"

        # @!attribute remove_bg
        #
        #   @return [Symbol, Imagekit::Models::FileUploadResponse::ExtensionStatus::RemoveBg, nil]
        optional :remove_bg,
                 enum: -> { Imagekit::Models::FileUploadResponse::ExtensionStatus::RemoveBg },
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
        #   @param aws_auto_tagging [Symbol, Imagekit::Models::FileUploadResponse::ExtensionStatus::AwsAutoTagging]
        #   @param google_auto_tagging [Symbol, Imagekit::Models::FileUploadResponse::ExtensionStatus::GoogleAutoTagging]
        #   @param remove_bg [Symbol, Imagekit::Models::FileUploadResponse::ExtensionStatus::RemoveBg]

        # @see Imagekit::Models::FileUploadResponse::ExtensionStatus#aws_auto_tagging
        module AwsAutoTagging
          extend Imagekit::Internal::Type::Enum

          SUCCESS = :success
          PENDING = :pending
          FAILED = :failed

          # @!method self.values
          #   @return [Array<Symbol>]
        end

        # @see Imagekit::Models::FileUploadResponse::ExtensionStatus#google_auto_tagging
        module GoogleAutoTagging
          extend Imagekit::Internal::Type::Enum

          SUCCESS = :success
          PENDING = :pending
          FAILED = :failed

          # @!method self.values
          #   @return [Array<Symbol>]
        end

        # @see Imagekit::Models::FileUploadResponse::ExtensionStatus#remove_bg
        module RemoveBg
          extend Imagekit::Internal::Type::Enum

          SUCCESS = :success
          PENDING = :pending
          FAILED = :failed

          # @!method self.values
          #   @return [Array<Symbol>]
        end
      end

      # @see Imagekit::Models::FileUploadResponse#metadata
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
        #   @return [Imagekit::Models::FileUploadResponse::Metadata::Exif, nil]
        optional :exif, -> { Imagekit::Models::FileUploadResponse::Metadata::Exif }

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
        #   @param exif [Imagekit::Models::FileUploadResponse::Metadata::Exif]
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

        # @see Imagekit::Models::FileUploadResponse::Metadata#exif
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

      # @see Imagekit::Models::FileUploadResponse#version_info
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
