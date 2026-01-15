# frozen_string_literal: true

module Imagekitio
  module Models
    module Beta
      module V2
        # @see Imagekitio::Resources::Beta::V2::Files#upload
        class FileUploadResponse < Imagekitio::Internal::Type::BaseModel
          # @!attribute ai_tags
          #   An array of tags assigned to the uploaded file by auto tagging.
          #
          #   @return [Array<Imagekitio::Models::Beta::V2::FileUploadResponse::AITag>, nil]
          optional :ai_tags,
                   -> { Imagekitio::Internal::Type::ArrayOf[Imagekitio::Models::Beta::V2::FileUploadResponse::AITag] },
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
                   Imagekitio::Internal::Type::HashOf[Imagekitio::Internal::Type::Unknown],
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
                   Imagekitio::Internal::Type::HashOf[Imagekitio::Internal::Type::Unknown],
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
          #   @return [Imagekitio::Models::Beta::V2::FileUploadResponse::ExtensionStatus, nil]
          optional :extension_status,
                   -> { Imagekitio::Models::Beta::V2::FileUploadResponse::ExtensionStatus },
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
          optional :is_private_file, Imagekitio::Internal::Type::Boolean, api_name: :isPrivateFile

          # @!attribute is_published
          #   Is the file published or in draft state. It can be either `true` or `false`.
          #   Send `isPublished` in `responseFields` in API request to get the value of this
          #   field.
          #
          #   @return [Boolean, nil]
          optional :is_published, Imagekitio::Internal::Type::Boolean, api_name: :isPublished

          # @!attribute metadata
          #   Legacy metadata. Send `metadata` in `responseFields` in API request to get
          #   metadata in the upload API response.
          #
          #   @return [Imagekitio::Models::Metadata, nil]
          optional :metadata, -> { Imagekitio::Metadata }

          # @!attribute name
          #   Name of the asset.
          #
          #   @return [String, nil]
          optional :name, String

          # @!attribute selected_fields_schema
          #   This field is included in the response only if the Path policy feature is
          #   available in the plan. It contains schema definitions for the custom metadata
          #   fields selected for the specified file path. Field selection can only be done
          #   when the Path policy feature is enabled.
          #
          #   Keys are the names of the custom metadata fields; the value object has details
          #   about the custom metadata schema.
          #
          #   @return [Hash{Symbol=>Imagekitio::Models::Beta::V2::FileUploadResponse::SelectedFieldsSchema}, nil]
          optional :selected_fields_schema,
                   -> { Imagekitio::Internal::Type::HashOf[Imagekitio::Models::Beta::V2::FileUploadResponse::SelectedFieldsSchema] },
                   api_name: :selectedFieldsSchema

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
          optional :tags, Imagekitio::Internal::Type::ArrayOf[String], nil?: true

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
          #   @return [Imagekitio::Models::Beta::V2::FileUploadResponse::VersionInfo, nil]
          optional :version_info,
                   -> { Imagekitio::Models::Beta::V2::FileUploadResponse::VersionInfo },
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

          # @!method initialize(ai_tags: nil, audio_codec: nil, bit_rate: nil, custom_coordinates: nil, custom_metadata: nil, description: nil, duration: nil, embedded_metadata: nil, extension_status: nil, file_id: nil, file_path: nil, file_type: nil, height: nil, is_private_file: nil, is_published: nil, metadata: nil, name: nil, selected_fields_schema: nil, size: nil, tags: nil, thumbnail_url: nil, url: nil, version_info: nil, video_codec: nil, width: nil)
          #   Some parameter documentations has been truncated, see
          #   {Imagekitio::Models::Beta::V2::FileUploadResponse} for more details.
          #
          #   Object containing details of a successful upload.
          #
          #   @param ai_tags [Array<Imagekitio::Models::Beta::V2::FileUploadResponse::AITag>, nil] An array of tags assigned to the uploaded file by auto tagging.
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
          #   @param extension_status [Imagekitio::Models::Beta::V2::FileUploadResponse::ExtensionStatus] Extension names with their processing status at the time of completion of the re
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
          #   @param metadata [Imagekitio::Models::Metadata] Legacy metadata. Send `metadata` in `responseFields` in API request to get metad
          #
          #   @param name [String] Name of the asset.
          #
          #   @param selected_fields_schema [Hash{Symbol=>Imagekitio::Models::Beta::V2::FileUploadResponse::SelectedFieldsSchema}] This field is included in the response only if the Path policy feature is availa
          #
          #   @param size [Float] Size of the image file in Bytes.
          #
          #   @param tags [Array<String>, nil] The array of tags associated with the asset. If no tags are set, it will be `nul
          #
          #   @param thumbnail_url [String] In the case of an image, a small thumbnail URL.
          #
          #   @param url [String] A publicly accessible URL of the file.
          #
          #   @param version_info [Imagekitio::Models::Beta::V2::FileUploadResponse::VersionInfo] An object containing the file or file version's `id` (versionId) and `name`.
          #
          #   @param video_codec [String] The video codec used in the video (only for video).
          #
          #   @param width [Float] Width of the image in pixels (Only for Images)

          class AITag < Imagekitio::Internal::Type::BaseModel
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
            #   {Imagekitio::Models::Beta::V2::FileUploadResponse::AITag} for more details.
            #
            #   @param confidence [Float] Confidence score of the tag.
            #
            #   @param name [String] Name of the tag.
            #
            #   @param source [String] Array of `AITags` associated with the image. If no `AITags` are set, it will be
          end

          # @see Imagekitio::Models::Beta::V2::FileUploadResponse#extension_status
          class ExtensionStatus < Imagekitio::Internal::Type::BaseModel
            # @!attribute ai_auto_description
            #
            #   @return [Symbol, Imagekitio::Models::Beta::V2::FileUploadResponse::ExtensionStatus::AIAutoDescription, nil]
            optional :ai_auto_description,
                     enum: -> { Imagekitio::Models::Beta::V2::FileUploadResponse::ExtensionStatus::AIAutoDescription },
                     api_name: :"ai-auto-description"

            # @!attribute ai_tasks
            #
            #   @return [Symbol, Imagekitio::Models::Beta::V2::FileUploadResponse::ExtensionStatus::AITasks, nil]
            optional :ai_tasks,
                     enum: -> { Imagekitio::Models::Beta::V2::FileUploadResponse::ExtensionStatus::AITasks },
                     api_name: :"ai-tasks"

            # @!attribute aws_auto_tagging
            #
            #   @return [Symbol, Imagekitio::Models::Beta::V2::FileUploadResponse::ExtensionStatus::AwsAutoTagging, nil]
            optional :aws_auto_tagging,
                     enum: -> { Imagekitio::Models::Beta::V2::FileUploadResponse::ExtensionStatus::AwsAutoTagging },
                     api_name: :"aws-auto-tagging"

            # @!attribute google_auto_tagging
            #
            #   @return [Symbol, Imagekitio::Models::Beta::V2::FileUploadResponse::ExtensionStatus::GoogleAutoTagging, nil]
            optional :google_auto_tagging,
                     enum: -> { Imagekitio::Models::Beta::V2::FileUploadResponse::ExtensionStatus::GoogleAutoTagging },
                     api_name: :"google-auto-tagging"

            # @!attribute remove_bg
            #
            #   @return [Symbol, Imagekitio::Models::Beta::V2::FileUploadResponse::ExtensionStatus::RemoveBg, nil]
            optional :remove_bg,
                     enum: -> { Imagekitio::Models::Beta::V2::FileUploadResponse::ExtensionStatus::RemoveBg },
                     api_name: :"remove-bg"

            # @!method initialize(ai_auto_description: nil, ai_tasks: nil, aws_auto_tagging: nil, google_auto_tagging: nil, remove_bg: nil)
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
            #   @param ai_auto_description [Symbol, Imagekitio::Models::Beta::V2::FileUploadResponse::ExtensionStatus::AIAutoDescription]
            #   @param ai_tasks [Symbol, Imagekitio::Models::Beta::V2::FileUploadResponse::ExtensionStatus::AITasks]
            #   @param aws_auto_tagging [Symbol, Imagekitio::Models::Beta::V2::FileUploadResponse::ExtensionStatus::AwsAutoTagging]
            #   @param google_auto_tagging [Symbol, Imagekitio::Models::Beta::V2::FileUploadResponse::ExtensionStatus::GoogleAutoTagging]
            #   @param remove_bg [Symbol, Imagekitio::Models::Beta::V2::FileUploadResponse::ExtensionStatus::RemoveBg]

            # @see Imagekitio::Models::Beta::V2::FileUploadResponse::ExtensionStatus#ai_auto_description
            module AIAutoDescription
              extend Imagekitio::Internal::Type::Enum

              SUCCESS = :success
              PENDING = :pending
              FAILED = :failed

              # @!method self.values
              #   @return [Array<Symbol>]
            end

            # @see Imagekitio::Models::Beta::V2::FileUploadResponse::ExtensionStatus#ai_tasks
            module AITasks
              extend Imagekitio::Internal::Type::Enum

              SUCCESS = :success
              PENDING = :pending
              FAILED = :failed

              # @!method self.values
              #   @return [Array<Symbol>]
            end

            # @see Imagekitio::Models::Beta::V2::FileUploadResponse::ExtensionStatus#aws_auto_tagging
            module AwsAutoTagging
              extend Imagekitio::Internal::Type::Enum

              SUCCESS = :success
              PENDING = :pending
              FAILED = :failed

              # @!method self.values
              #   @return [Array<Symbol>]
            end

            # @see Imagekitio::Models::Beta::V2::FileUploadResponse::ExtensionStatus#google_auto_tagging
            module GoogleAutoTagging
              extend Imagekitio::Internal::Type::Enum

              SUCCESS = :success
              PENDING = :pending
              FAILED = :failed

              # @!method self.values
              #   @return [Array<Symbol>]
            end

            # @see Imagekitio::Models::Beta::V2::FileUploadResponse::ExtensionStatus#remove_bg
            module RemoveBg
              extend Imagekitio::Internal::Type::Enum

              SUCCESS = :success
              PENDING = :pending
              FAILED = :failed

              # @!method self.values
              #   @return [Array<Symbol>]
            end
          end

          class SelectedFieldsSchema < Imagekitio::Internal::Type::BaseModel
            # @!attribute type
            #   Type of the custom metadata field.
            #
            #   @return [Symbol, Imagekitio::Models::Beta::V2::FileUploadResponse::SelectedFieldsSchema::Type]
            required :type, enum: -> { Imagekitio::Models::Beta::V2::FileUploadResponse::SelectedFieldsSchema::Type }

            # @!attribute default_value
            #   The default value for this custom metadata field. The value should match the
            #   `type` of custom metadata field.
            #
            #   @return [String, Float, Boolean, Array<String, Float, Boolean>, nil]
            optional :default_value,
                     union: -> { Imagekitio::Models::Beta::V2::FileUploadResponse::SelectedFieldsSchema::DefaultValue },
                     api_name: :defaultValue

            # @!attribute is_value_required
            #   Specifies if the custom metadata field is required or not.
            #
            #   @return [Boolean, nil]
            optional :is_value_required, Imagekitio::Internal::Type::Boolean, api_name: :isValueRequired

            # @!attribute max_length
            #   Maximum length of string. Only set if `type` is set to `Text` or `Textarea`.
            #
            #   @return [Float, nil]
            optional :max_length, Float, api_name: :maxLength

            # @!attribute max_value
            #   Maximum value of the field. Only set if field type is `Date` or `Number`. For
            #   `Date` type field, the value will be in ISO8601 string format. For `Number` type
            #   field, it will be a numeric value.
            #
            #   @return [String, Float, nil]
            optional :max_value,
                     union: -> { Imagekitio::Models::Beta::V2::FileUploadResponse::SelectedFieldsSchema::MaxValue },
                     api_name: :maxValue

            # @!attribute min_length
            #   Minimum length of string. Only set if `type` is set to `Text` or `Textarea`.
            #
            #   @return [Float, nil]
            optional :min_length, Float, api_name: :minLength

            # @!attribute min_value
            #   Minimum value of the field. Only set if field type is `Date` or `Number`. For
            #   `Date` type field, the value will be in ISO8601 string format. For `Number` type
            #   field, it will be a numeric value.
            #
            #   @return [String, Float, nil]
            optional :min_value,
                     union: -> { Imagekitio::Models::Beta::V2::FileUploadResponse::SelectedFieldsSchema::MinValue },
                     api_name: :minValue

            # @!attribute read_only
            #   Indicates whether the custom metadata field is read only. A read only field
            #   cannot be modified after being set. This field is configurable only via the
            #   **Path policy** feature.
            #
            #   @return [Boolean, nil]
            optional :read_only, Imagekitio::Internal::Type::Boolean, api_name: :readOnly

            # @!attribute select_options
            #   An array of allowed values when field type is `SingleSelect` or `MultiSelect`.
            #
            #   @return [Array<String, Float, Boolean>, nil]
            optional :select_options,
                     -> { Imagekitio::Internal::Type::ArrayOf[union: Imagekitio::Models::Beta::V2::FileUploadResponse::SelectedFieldsSchema::SelectOption] },
                     api_name: :selectOptions

            # @!attribute select_options_truncated
            #   Specifies if the selectOptions array is truncated. It is truncated when number
            #   of options are > 100.
            #
            #   @return [Boolean, nil]
            optional :select_options_truncated,
                     Imagekitio::Internal::Type::Boolean,
                     api_name: :selectOptionsTruncated

            # @!method initialize(type:, default_value: nil, is_value_required: nil, max_length: nil, max_value: nil, min_length: nil, min_value: nil, read_only: nil, select_options: nil, select_options_truncated: nil)
            #   Some parameter documentations has been truncated, see
            #   {Imagekitio::Models::Beta::V2::FileUploadResponse::SelectedFieldsSchema} for
            #   more details.
            #
            #   @param type [Symbol, Imagekitio::Models::Beta::V2::FileUploadResponse::SelectedFieldsSchema::Type] Type of the custom metadata field.
            #
            #   @param default_value [String, Float, Boolean, Array<String, Float, Boolean>] The default value for this custom metadata field. The value should match the `ty
            #
            #   @param is_value_required [Boolean] Specifies if the custom metadata field is required or not.
            #
            #   @param max_length [Float] Maximum length of string. Only set if `type` is set to `Text` or `Textarea`.
            #
            #   @param max_value [String, Float] Maximum value of the field. Only set if field type is `Date` or `Number`. For `D
            #
            #   @param min_length [Float] Minimum length of string. Only set if `type` is set to `Text` or `Textarea`.
            #
            #   @param min_value [String, Float] Minimum value of the field. Only set if field type is `Date` or `Number`. For `D
            #
            #   @param read_only [Boolean] Indicates whether the custom metadata field is read only. A read only field cann
            #
            #   @param select_options [Array<String, Float, Boolean>] An array of allowed values when field type is `SingleSelect` or `MultiSelect`.
            #
            #   @param select_options_truncated [Boolean] Specifies if the selectOptions array is truncated. It is truncated when number o

            # Type of the custom metadata field.
            #
            # @see Imagekitio::Models::Beta::V2::FileUploadResponse::SelectedFieldsSchema#type
            module Type
              extend Imagekitio::Internal::Type::Enum

              TEXT = :Text
              TEXTAREA = :Textarea
              NUMBER = :Number
              DATE = :Date
              BOOLEAN = :Boolean
              SINGLE_SELECT = :SingleSelect
              MULTI_SELECT = :MultiSelect

              # @!method self.values
              #   @return [Array<Symbol>]
            end

            # The default value for this custom metadata field. The value should match the
            # `type` of custom metadata field.
            #
            # @see Imagekitio::Models::Beta::V2::FileUploadResponse::SelectedFieldsSchema#default_value
            module DefaultValue
              extend Imagekitio::Internal::Type::Union

              variant String

              variant Float

              variant Imagekitio::Internal::Type::Boolean

              # Default value should be of type array when custom metadata field type is set to `MultiSelect`.
              variant -> { Imagekitio::Models::Beta::V2::FileUploadResponse::SelectedFieldsSchema::DefaultValue::MixedArray }

              module Mixed
                extend Imagekitio::Internal::Type::Union

                variant String

                variant Float

                variant Imagekitio::Internal::Type::Boolean

                # @!method self.variants
                #   @return [Array(String, Float, Boolean)]
              end

              # @!method self.variants
              #   @return [Array(String, Float, Boolean, Array<String, Float, Boolean>)]

              # @type [Imagekitio::Internal::Type::Converter]
              MixedArray =
                Imagekitio::Internal::Type::ArrayOf[union: -> { Imagekitio::Models::Beta::V2::FileUploadResponse::SelectedFieldsSchema::DefaultValue::Mixed }]
            end

            # Maximum value of the field. Only set if field type is `Date` or `Number`. For
            # `Date` type field, the value will be in ISO8601 string format. For `Number` type
            # field, it will be a numeric value.
            #
            # @see Imagekitio::Models::Beta::V2::FileUploadResponse::SelectedFieldsSchema#max_value
            module MaxValue
              extend Imagekitio::Internal::Type::Union

              variant String

              variant Float

              # @!method self.variants
              #   @return [Array(String, Float)]
            end

            # Minimum value of the field. Only set if field type is `Date` or `Number`. For
            # `Date` type field, the value will be in ISO8601 string format. For `Number` type
            # field, it will be a numeric value.
            #
            # @see Imagekitio::Models::Beta::V2::FileUploadResponse::SelectedFieldsSchema#min_value
            module MinValue
              extend Imagekitio::Internal::Type::Union

              variant String

              variant Float

              # @!method self.variants
              #   @return [Array(String, Float)]
            end

            module SelectOption
              extend Imagekitio::Internal::Type::Union

              variant String

              variant Float

              variant Imagekitio::Internal::Type::Boolean

              # @!method self.variants
              #   @return [Array(String, Float, Boolean)]
            end
          end

          # @see Imagekitio::Models::Beta::V2::FileUploadResponse#version_info
          class VersionInfo < Imagekitio::Internal::Type::BaseModel
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
