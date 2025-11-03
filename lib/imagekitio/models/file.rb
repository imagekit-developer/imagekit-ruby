# frozen_string_literal: true

module Imagekitio
  module Models
    # @see Imagekitio::Resources::Files#get
    class File < Imagekitio::Internal::Type::BaseModel
      # @!attribute ai_tags
      #   An array of tags assigned to the file by auto tagging.
      #
      #   @return [Array<Imagekitio::Models::File::AITag>, nil]
      optional :ai_tags,
               -> { Imagekitio::Internal::Type::ArrayOf[Imagekitio::File::AITag] },
               api_name: :AITags,
               nil?: true

      # @!attribute created_at
      #   Date and time when the file was uploaded. The date and time is in ISO8601
      #   format.
      #
      #   @return [Time, nil]
      optional :created_at, Time, api_name: :createdAt

      # @!attribute custom_coordinates
      #   An string with custom coordinates of the file.
      #
      #   @return [String, nil]
      optional :custom_coordinates, String, api_name: :customCoordinates, nil?: true

      # @!attribute custom_metadata
      #   An object with custom metadata for the file.
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

      # @!attribute file_id
      #   Unique identifier of the asset.
      #
      #   @return [String, nil]
      optional :file_id, String, api_name: :fileId

      # @!attribute file_path
      #   Path of the file. This is the path you would use in the URL to access the file.
      #   For example, if the file is at the root of the media library, the path will be
      #   `/file.jpg`. If the file is inside a folder named `images`, the path will be
      #   `/images/file.jpg`.
      #
      #   @return [String, nil]
      optional :file_path, String, api_name: :filePath

      # @!attribute file_type
      #   Type of the file. Possible values are `image`, `non-image`.
      #
      #   @return [String, nil]
      optional :file_type, String, api_name: :fileType

      # @!attribute has_alpha
      #   Specifies if the image has an alpha channel.
      #
      #   @return [Boolean, nil]
      optional :has_alpha, Imagekitio::Internal::Type::Boolean, api_name: :hasAlpha

      # @!attribute height
      #   Height of the file.
      #
      #   @return [Float, nil]
      optional :height, Float

      # @!attribute is_private_file
      #   Specifies if the file is private or not.
      #
      #   @return [Boolean, nil]
      optional :is_private_file, Imagekitio::Internal::Type::Boolean, api_name: :isPrivateFile

      # @!attribute is_published
      #   Specifies if the file is published or not.
      #
      #   @return [Boolean, nil]
      optional :is_published, Imagekitio::Internal::Type::Boolean, api_name: :isPublished

      # @!attribute mime
      #   MIME type of the file.
      #
      #   @return [String, nil]
      optional :mime, String

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
      #   @return [Hash{Symbol=>Imagekitio::Models::File::SelectedFieldsSchema}, nil]
      optional :selected_fields_schema,
               -> { Imagekitio::Internal::Type::HashOf[Imagekitio::File::SelectedFieldsSchema] },
               api_name: :selectedFieldsSchema

      # @!attribute size
      #   Size of the file in bytes.
      #
      #   @return [Float, nil]
      optional :size, Float

      # @!attribute tags
      #   An array of tags assigned to the file. Tags are used to search files in the
      #   media library.
      #
      #   @return [Array<String>, nil]
      optional :tags, Imagekitio::Internal::Type::ArrayOf[String], nil?: true

      # @!attribute thumbnail
      #   URL of the thumbnail image. This URL is used to access the thumbnail image of
      #   the file in the media library.
      #
      #   @return [String, nil]
      optional :thumbnail, String

      # @!attribute type
      #   Type of the asset.
      #
      #   @return [Symbol, Imagekitio::Models::File::Type, nil]
      optional :type, enum: -> { Imagekitio::File::Type }

      # @!attribute updated_at
      #   Date and time when the file was last updated. The date and time is in ISO8601
      #   format.
      #
      #   @return [Time, nil]
      optional :updated_at, Time, api_name: :updatedAt

      # @!attribute url
      #   URL of the file.
      #
      #   @return [String, nil]
      optional :url, String

      # @!attribute version_info
      #   An object with details of the file version.
      #
      #   @return [Imagekitio::Models::File::VersionInfo, nil]
      optional :version_info, -> { Imagekitio::File::VersionInfo }, api_name: :versionInfo

      # @!attribute width
      #   Width of the file.
      #
      #   @return [Float, nil]
      optional :width, Float

      # @!method initialize(ai_tags: nil, created_at: nil, custom_coordinates: nil, custom_metadata: nil, description: nil, file_id: nil, file_path: nil, file_type: nil, has_alpha: nil, height: nil, is_private_file: nil, is_published: nil, mime: nil, name: nil, selected_fields_schema: nil, size: nil, tags: nil, thumbnail: nil, type: nil, updated_at: nil, url: nil, version_info: nil, width: nil)
      #   Some parameter documentations has been truncated, see {Imagekitio::Models::File}
      #   for more details.
      #
      #   Object containing details of a file or file version.
      #
      #   @param ai_tags [Array<Imagekitio::Models::File::AITag>, nil] An array of tags assigned to the file by auto tagging.
      #
      #   @param created_at [Time] Date and time when the file was uploaded. The date and time is in ISO8601 format
      #
      #   @param custom_coordinates [String, nil] An string with custom coordinates of the file.
      #
      #   @param custom_metadata [Hash{Symbol=>Object}] An object with custom metadata for the file.
      #
      #   @param description [String] Optional text to describe the contents of the file. Can be set by the user or th
      #
      #   @param file_id [String] Unique identifier of the asset.
      #
      #   @param file_path [String] Path of the file. This is the path you would use in the URL to access the file.
      #
      #   @param file_type [String] Type of the file. Possible values are `image`, `non-image`.
      #
      #   @param has_alpha [Boolean] Specifies if the image has an alpha channel.
      #
      #   @param height [Float] Height of the file.
      #
      #   @param is_private_file [Boolean] Specifies if the file is private or not.
      #
      #   @param is_published [Boolean] Specifies if the file is published or not.
      #
      #   @param mime [String] MIME type of the file.
      #
      #   @param name [String] Name of the asset.
      #
      #   @param selected_fields_schema [Hash{Symbol=>Imagekitio::Models::File::SelectedFieldsSchema}] This field is included in the response only if the Path policy feature is availa
      #
      #   @param size [Float] Size of the file in bytes.
      #
      #   @param tags [Array<String>, nil] An array of tags assigned to the file. Tags are used to search files in the medi
      #
      #   @param thumbnail [String] URL of the thumbnail image. This URL is used to access the thumbnail image of th
      #
      #   @param type [Symbol, Imagekitio::Models::File::Type] Type of the asset.
      #
      #   @param updated_at [Time] Date and time when the file was last updated. The date and time is in ISO8601 fo
      #
      #   @param url [String] URL of the file.
      #
      #   @param version_info [Imagekitio::Models::File::VersionInfo] An object with details of the file version.
      #
      #   @param width [Float] Width of the file.

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
        #   Source of the tag. Possible values are `google-auto-tagging` and
        #   `aws-auto-tagging`.
        #
        #   @return [String, nil]
        optional :source, String

        # @!method initialize(confidence: nil, name: nil, source: nil)
        #   Some parameter documentations has been truncated, see
        #   {Imagekitio::Models::File::AITag} for more details.
        #
        #   @param confidence [Float] Confidence score of the tag.
        #
        #   @param name [String] Name of the tag.
        #
        #   @param source [String] Source of the tag. Possible values are `google-auto-tagging` and `aws-auto-taggi
      end

      class SelectedFieldsSchema < Imagekitio::Internal::Type::BaseModel
        # @!attribute type
        #   Type of the custom metadata field.
        #
        #   @return [Symbol, Imagekitio::Models::File::SelectedFieldsSchema::Type]
        required :type, enum: -> { Imagekitio::File::SelectedFieldsSchema::Type }

        # @!attribute default_value
        #   The default value for this custom metadata field. The value should match the
        #   `type` of custom metadata field.
        #
        #   @return [String, Float, Boolean, Array<String, Float, Boolean>, nil]
        optional :default_value,
                 union: -> { Imagekitio::File::SelectedFieldsSchema::DefaultValue },
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
                 union: -> {
                   Imagekitio::File::SelectedFieldsSchema::MaxValue
                 },
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
                 union: -> {
                   Imagekitio::File::SelectedFieldsSchema::MinValue
                 },
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
                 -> {
                   Imagekitio::Internal::Type::ArrayOf[union: Imagekitio::File::SelectedFieldsSchema::SelectOption]
                 },
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
        #   {Imagekitio::Models::File::SelectedFieldsSchema} for more details.
        #
        #   @param type [Symbol, Imagekitio::Models::File::SelectedFieldsSchema::Type] Type of the custom metadata field.
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
        # @see Imagekitio::Models::File::SelectedFieldsSchema#type
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
        # @see Imagekitio::Models::File::SelectedFieldsSchema#default_value
        module DefaultValue
          extend Imagekitio::Internal::Type::Union

          variant String

          variant Float

          variant Imagekitio::Internal::Type::Boolean

          # Default value should be of type array when custom metadata field type is set to `MultiSelect`.
          variant -> { Imagekitio::Models::File::SelectedFieldsSchema::DefaultValue::MixedArray }

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
            Imagekitio::Internal::Type::ArrayOf[union: -> {
              Imagekitio::File::SelectedFieldsSchema::DefaultValue::Mixed
            }]
        end

        # Maximum value of the field. Only set if field type is `Date` or `Number`. For
        # `Date` type field, the value will be in ISO8601 string format. For `Number` type
        # field, it will be a numeric value.
        #
        # @see Imagekitio::Models::File::SelectedFieldsSchema#max_value
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
        # @see Imagekitio::Models::File::SelectedFieldsSchema#min_value
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

      # Type of the asset.
      #
      # @see Imagekitio::Models::File#type
      module Type
        extend Imagekitio::Internal::Type::Enum

        FILE = :file
        FILE_VERSION = :"file-version"

        # @!method self.values
        #   @return [Array<Symbol>]
      end

      # @see Imagekitio::Models::File#version_info
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
        #   An object with details of the file version.
        #
        #   @param id [String] Unique identifier of the file version.
        #
        #   @param name [String] Name of the file version.
      end
    end
  end
end
