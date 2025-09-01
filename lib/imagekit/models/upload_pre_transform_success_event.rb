# frozen_string_literal: true

module Imagekit
  module Models
    class UploadPreTransformSuccessEvent < Imagekit::Internal::Type::BaseModel
      # @!attribute id
      #   Unique identifier for the event.
      #
      #   @return [String]
      required :id, String

      # @!attribute created_at
      #   Timestamp of when the event occurred in ISO8601 format.
      #
      #   @return [Time]
      required :created_at, Time

      # @!attribute data
      #   Object containing details of a successful upload.
      #
      #   @return [Imagekit::Models::UploadPreTransformSuccessEvent::Data]
      required :data, -> { Imagekit::UploadPreTransformSuccessEvent::Data }

      # @!attribute request
      #
      #   @return [Imagekit::Models::UploadPreTransformSuccessEvent::Request]
      required :request, -> { Imagekit::UploadPreTransformSuccessEvent::Request }

      # @!attribute type
      #
      #   @return [Symbol, :"upload.pre-transform.success"]
      required :type, const: :"upload.pre-transform.success"

      # @!method initialize(id:, created_at:, data:, request:, type: :"upload.pre-transform.success")
      #   Triggered when a pre-transformation completes successfully. The file has been
      #   processed with the requested transformation and is now available in the Media
      #   Library.
      #
      #   @param id [String] Unique identifier for the event.
      #
      #   @param created_at [Time] Timestamp of when the event occurred in ISO8601 format.
      #
      #   @param data [Imagekit::Models::UploadPreTransformSuccessEvent::Data] Object containing details of a successful upload.
      #
      #   @param request [Imagekit::Models::UploadPreTransformSuccessEvent::Request]
      #
      #   @param type [Symbol, :"upload.pre-transform.success"]

      # @see Imagekit::Models::UploadPreTransformSuccessEvent#data
      class Data < Imagekit::Internal::Type::BaseModel
        # @!attribute ai_tags
        #   An array of tags assigned to the uploaded file by auto tagging.
        #
        #   @return [Array<Imagekit::Models::UploadPreTransformSuccessEvent::Data::AITag>, nil]
        optional :ai_tags,
                 -> {
                   Imagekit::Internal::Type::ArrayOf[Imagekit::UploadPreTransformSuccessEvent::Data::AITag]
                 },
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

        # @!attribute description
        #   Optional text to describe the contents of the file. Can be set by the user or
        #   the ai-auto-description extension.
        #
        #   @return [String, nil]
        optional :description, String

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
        #   @return [Imagekit::Models::UploadPreTransformSuccessEvent::Data::ExtensionStatus, nil]
        optional :extension_status,
                 -> { Imagekit::UploadPreTransformSuccessEvent::Data::ExtensionStatus },
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
        #   @return [Imagekit::Models::Metadata, nil]
        optional :metadata, -> { Imagekit::Metadata }

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
        #   @return [Imagekit::Models::UploadPreTransformSuccessEvent::Data::VersionInfo, nil]
        optional :version_info,
                 -> { Imagekit::UploadPreTransformSuccessEvent::Data::VersionInfo },
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

        # @!method initialize(ai_tags: nil, audio_codec: nil, bit_rate: nil, custom_coordinates: nil, custom_metadata: nil, description: nil, duration: nil, embedded_metadata: nil, extension_status: nil, file_id: nil, file_path: nil, file_type: nil, height: nil, is_private_file: nil, is_published: nil, metadata: nil, name: nil, size: nil, tags: nil, thumbnail_url: nil, url: nil, version_info: nil, video_codec: nil, width: nil)
        #   Some parameter documentations has been truncated, see
        #   {Imagekit::Models::UploadPreTransformSuccessEvent::Data} for more details.
        #
        #   Object containing details of a successful upload.
        #
        #   @param ai_tags [Array<Imagekit::Models::UploadPreTransformSuccessEvent::Data::AITag>, nil] An array of tags assigned to the uploaded file by auto tagging.
        #
        #   @param audio_codec [String] The audio codec used in the video (only for video).
        #
        #   @param bit_rate [Integer] The bit rate of the video in kbps (only for video).
        #
        #   @param custom_coordinates [String, nil] Value of custom coordinates associated with the image in the format `x,y,width,h
        #
        #   @param custom_metadata [Hash{Symbol=>Object}] A key-value data associated with the asset. Use `responseField` in API request t
        #
        #   @param description [String] Optional text to describe the contents of the file. Can be set by the user or th
        #
        #   @param duration [Integer] The duration of the video in seconds (only for video).
        #
        #   @param embedded_metadata [Hash{Symbol=>Object}] Consolidated embedded metadata associated with the file. It includes exif, iptc,
        #
        #   @param extension_status [Imagekit::Models::UploadPreTransformSuccessEvent::Data::ExtensionStatus] Extension names with their processing status at the time of completion of the re
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
        #   @param metadata [Imagekit::Models::Metadata] Legacy metadata. Send `metadata` in `responseFields` in API request to get metad
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
        #   @param version_info [Imagekit::Models::UploadPreTransformSuccessEvent::Data::VersionInfo] An object containing the file or file version's `id` (versionId) and `name`.
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
          #   {Imagekit::Models::UploadPreTransformSuccessEvent::Data::AITag} for more
          #   details.
          #
          #   @param confidence [Float] Confidence score of the tag.
          #
          #   @param name [String] Name of the tag.
          #
          #   @param source [String] Array of `AITags` associated with the image. If no `AITags` are set, it will be
        end

        # @see Imagekit::Models::UploadPreTransformSuccessEvent::Data#extension_status
        class ExtensionStatus < Imagekit::Internal::Type::BaseModel
          # @!attribute aws_auto_tagging
          #
          #   @return [Symbol, Imagekit::Models::UploadPreTransformSuccessEvent::Data::ExtensionStatus::AwsAutoTagging, nil]
          optional :aws_auto_tagging,
                   enum: -> {
                     Imagekit::UploadPreTransformSuccessEvent::Data::ExtensionStatus::AwsAutoTagging
                   },
                   api_name: :"aws-auto-tagging"

          # @!attribute google_auto_tagging
          #
          #   @return [Symbol, Imagekit::Models::UploadPreTransformSuccessEvent::Data::ExtensionStatus::GoogleAutoTagging, nil]
          optional :google_auto_tagging,
                   enum: -> {
                     Imagekit::UploadPreTransformSuccessEvent::Data::ExtensionStatus::GoogleAutoTagging
                   },
                   api_name: :"google-auto-tagging"

          # @!attribute remove_bg
          #
          #   @return [Symbol, Imagekit::Models::UploadPreTransformSuccessEvent::Data::ExtensionStatus::RemoveBg, nil]
          optional :remove_bg,
                   enum: -> { Imagekit::UploadPreTransformSuccessEvent::Data::ExtensionStatus::RemoveBg },
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
          #   @param aws_auto_tagging [Symbol, Imagekit::Models::UploadPreTransformSuccessEvent::Data::ExtensionStatus::AwsAutoTagging]
          #   @param google_auto_tagging [Symbol, Imagekit::Models::UploadPreTransformSuccessEvent::Data::ExtensionStatus::GoogleAutoTagging]
          #   @param remove_bg [Symbol, Imagekit::Models::UploadPreTransformSuccessEvent::Data::ExtensionStatus::RemoveBg]

          # @see Imagekit::Models::UploadPreTransformSuccessEvent::Data::ExtensionStatus#aws_auto_tagging
          module AwsAutoTagging
            extend Imagekit::Internal::Type::Enum

            SUCCESS = :success
            PENDING = :pending
            FAILED = :failed

            # @!method self.values
            #   @return [Array<Symbol>]
          end

          # @see Imagekit::Models::UploadPreTransformSuccessEvent::Data::ExtensionStatus#google_auto_tagging
          module GoogleAutoTagging
            extend Imagekit::Internal::Type::Enum

            SUCCESS = :success
            PENDING = :pending
            FAILED = :failed

            # @!method self.values
            #   @return [Array<Symbol>]
          end

          # @see Imagekit::Models::UploadPreTransformSuccessEvent::Data::ExtensionStatus#remove_bg
          module RemoveBg
            extend Imagekit::Internal::Type::Enum

            SUCCESS = :success
            PENDING = :pending
            FAILED = :failed

            # @!method self.values
            #   @return [Array<Symbol>]
          end
        end

        # @see Imagekit::Models::UploadPreTransformSuccessEvent::Data#version_info
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

      # @see Imagekit::Models::UploadPreTransformSuccessEvent#request
      class Request < Imagekit::Internal::Type::BaseModel
        # @!attribute transformation
        #   The requested pre-transformation string.
        #
        #   @return [String]
        required :transformation, String

        # @!attribute x_request_id
        #   Unique identifier for the originating request.
        #
        #   @return [String]
        required :x_request_id, String

        # @!method initialize(transformation:, x_request_id:)
        #   @param transformation [String] The requested pre-transformation string.
        #
        #   @param x_request_id [String] Unique identifier for the originating request.
      end
    end
  end
end
