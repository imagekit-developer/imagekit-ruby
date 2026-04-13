# frozen_string_literal: true

module Imagekitio
  module Models
    # @see Imagekitio::Resources::Files#get
    class File < Imagekitio::Internal::Type::BaseModel
      # @!attribute ai_tags
      #   Array of AI-generated tags associated with the image. If no AITags are set, it
      #   will be null.
      #
      #   @return [Array<Imagekitio::Models::File::AITag>, nil]
      optional :ai_tags,
               -> { Imagekitio::Internal::Type::ArrayOf[Imagekitio::File::AITag] },
               api_name: :AITags,
               nil?: true

      # @!attribute audio_codec
      #   The audio codec used in the video (only for video/audio).
      #
      #   @return [String, nil]
      optional :audio_codec, String, api_name: :audioCodec

      # @!attribute bit_rate
      #   The bit rate of the video in kbps (only for video).
      #
      #   @return [Integer, nil]
      optional :bit_rate, Integer, api_name: :bitRate

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

      # @!attribute duration
      #   The duration of the video in seconds (only for video).
      #
      #   @return [Integer, nil]
      optional :duration, Integer

      # @!attribute embedded_metadata
      #   Consolidated embedded metadata associated with the file. It includes exif, iptc,
      #   and xmp data.
      #
      #   @return [Hash{Symbol=>Object}, nil]
      optional :embedded_metadata,
               Imagekitio::Internal::Type::HashOf[Imagekitio::Internal::Type::Unknown],
               api_name: :embeddedMetadata

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

      # @!attribute video_codec
      #   The video codec used in the video (only for video).
      #
      #   @return [String, nil]
      optional :video_codec, String, api_name: :videoCodec

      # @!attribute width
      #   Width of the file.
      #
      #   @return [Float, nil]
      optional :width, Float

      # @!method initialize(ai_tags: nil, audio_codec: nil, bit_rate: nil, created_at: nil, custom_coordinates: nil, custom_metadata: nil, description: nil, duration: nil, embedded_metadata: nil, file_id: nil, file_path: nil, file_type: nil, has_alpha: nil, height: nil, is_private_file: nil, is_published: nil, mime: nil, name: nil, selected_fields_schema: nil, size: nil, tags: nil, thumbnail: nil, type: nil, updated_at: nil, url: nil, version_info: nil, video_codec: nil, width: nil)
      #   Some parameter documentations has been truncated, see {Imagekitio::Models::File}
      #   for more details.
      #
      #   Object containing details of a file or file version.
      #
      #   @param ai_tags [Array<Imagekitio::Models::File::AITag>, nil] Array of AI-generated tags associated with the image. If no AITags are set, it w
      #
      #   @param audio_codec [String] The audio codec used in the video (only for video/audio).
      #
      #   @param bit_rate [Integer] The bit rate of the video in kbps (only for video).
      #
      #   @param created_at [Time] Date and time when the file was uploaded. The date and time is in ISO8601 format
      #
      #   @param custom_coordinates [String, nil] An string with custom coordinates of the file.
      #
      #   @param custom_metadata [Hash{Symbol=>Object}] An object with custom metadata for the file.
      #
      #   @param description [String] Optional text to describe the contents of the file. Can be set by the user or th
      #
      #   @param duration [Integer] The duration of the video in seconds (only for video).
      #
      #   @param embedded_metadata [Hash{Symbol=>Object}] Consolidated embedded metadata associated with the file. It includes exif, iptc,
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
      #   @param video_codec [String] The video codec used in the video (only for video).
      #
      #   @param width [Float] Width of the file.

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
    end
  end
end
