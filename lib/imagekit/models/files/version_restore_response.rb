# frozen_string_literal: true

module Imagekit
  module Models
    module Files
      # @see Imagekit::Resources::Files::Versions#restore
      class VersionRestoreResponse < Imagekit::Internal::Type::BaseModel
        # @!attribute ai_tags
        #   An array of tags assigned to the file by auto tagging.
        #
        #   @return [Array<Imagekit::Models::Files::VersionRestoreResponse::AITag>, nil]
        optional :ai_tags,
                 -> { Imagekit::Internal::Type::ArrayOf[Imagekit::Models::Files::VersionRestoreResponse::AITag] },
                 api_name: :AITags,
                 nil?: true

        # @!attribute created_at
        #   Date and time when the file was uploaded. The date and time is in ISO8601
        #   format.
        #
        #   @return [String, nil]
        optional :created_at, String, api_name: :createdAt

        # @!attribute custom_coordinates
        #   An string with custom coordinates of the file.
        #
        #   @return [String, nil]
        optional :custom_coordinates, String, api_name: :customCoordinates, nil?: true

        # @!attribute custom_metadata
        #   An object with custom metadata for the file.
        #
        #   @return [Object, nil]
        optional :custom_metadata, Imagekit::Internal::Type::Unknown, api_name: :customMetadata

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
        optional :has_alpha, Imagekit::Internal::Type::Boolean, api_name: :hasAlpha

        # @!attribute height
        #   Height of the file.
        #
        #   @return [Float, nil]
        optional :height, Float

        # @!attribute is_private_file
        #   Specifies if the file is private or not.
        #
        #   @return [Boolean, nil]
        optional :is_private_file, Imagekit::Internal::Type::Boolean, api_name: :isPrivateFile

        # @!attribute is_published
        #   Specifies if the file is published or not.
        #
        #   @return [Boolean, nil]
        optional :is_published, Imagekit::Internal::Type::Boolean, api_name: :isPublished

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
        optional :tags, Imagekit::Internal::Type::ArrayOf[String], nil?: true

        # @!attribute thumbnail
        #   URL of the thumbnail image. This URL is used to access the thumbnail image of
        #   the file in the media library.
        #
        #   @return [String, nil]
        optional :thumbnail, String

        # @!attribute type
        #   Type of the asset.
        #
        #   @return [String, nil]
        optional :type, String

        # @!attribute updated_at
        #   Date and time when the file was last updated. The date and time is in ISO8601
        #   format.
        #
        #   @return [String, nil]
        optional :updated_at, String, api_name: :updatedAt

        # @!attribute url
        #   URL of the file.
        #
        #   @return [String, nil]
        optional :url, String

        # @!attribute version_info
        #   An object with details of the file version.
        #
        #   @return [Imagekit::Models::Files::VersionRestoreResponse::VersionInfo, nil]
        optional :version_info,
                 -> { Imagekit::Models::Files::VersionRestoreResponse::VersionInfo },
                 api_name: :versionInfo

        # @!attribute width
        #   Width of the file.
        #
        #   @return [Float, nil]
        optional :width, Float

        # @!method initialize(ai_tags: nil, created_at: nil, custom_coordinates: nil, custom_metadata: nil, file_id: nil, file_path: nil, file_type: nil, has_alpha: nil, height: nil, is_private_file: nil, is_published: nil, mime: nil, name: nil, size: nil, tags: nil, thumbnail: nil, type: nil, updated_at: nil, url: nil, version_info: nil, width: nil)
        #   Some parameter documentations has been truncated, see
        #   {Imagekit::Models::Files::VersionRestoreResponse} for more details.
        #
        #   Object containing details of a file or file version.
        #
        #   @param ai_tags [Array<Imagekit::Models::Files::VersionRestoreResponse::AITag>, nil] An array of tags assigned to the file by auto tagging.
        #
        #   @param created_at [String] Date and time when the file was uploaded. The date and time is in ISO8601 format
        #
        #   @param custom_coordinates [String, nil] An string with custom coordinates of the file.
        #
        #   @param custom_metadata [Object] An object with custom metadata for the file.
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
        #   @param size [Float] Size of the file in bytes.
        #
        #   @param tags [Array<String>, nil] An array of tags assigned to the file. Tags are used to search files in the medi
        #
        #   @param thumbnail [String] URL of the thumbnail image. This URL is used to access the thumbnail image of th
        #
        #   @param type [String] Type of the asset.
        #
        #   @param updated_at [String] Date and time when the file was last updated. The date and time is in ISO8601 fo
        #
        #   @param url [String] URL of the file.
        #
        #   @param version_info [Imagekit::Models::Files::VersionRestoreResponse::VersionInfo] An object with details of the file version.
        #
        #   @param width [Float] Width of the file.

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
          #   Source of the tag. Possible values are `google-auto-tagging` and
          #   `aws-auto-tagging`.
          #
          #   @return [String, nil]
          optional :source, String

          # @!method initialize(confidence: nil, name: nil, source: nil)
          #   Some parameter documentations has been truncated, see
          #   {Imagekit::Models::Files::VersionRestoreResponse::AITag} for more details.
          #
          #   @param confidence [Float] Confidence score of the tag.
          #
          #   @param name [String] Name of the tag.
          #
          #   @param source [String] Source of the tag. Possible values are `google-auto-tagging` and `aws-auto-taggi
        end

        # @see Imagekit::Models::Files::VersionRestoreResponse#version_info
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
          #   An object with details of the file version.
          #
          #   @param id [String] Unique identifier of the file version.
          #
          #   @param name [String] Name of the file version.
        end
      end
    end
  end
end
