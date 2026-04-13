# typed: strong

module Imagekitio
  module Models
    class File < Imagekitio::Internal::Type::BaseModel
      OrHash =
        T.type_alias { T.any(Imagekitio::File, Imagekitio::Internal::AnyHash) }

      # Array of `AITags` associated with the image. If no `AITags` are set, it will be
      # null. These tags can be added using the `google-auto-tagging` or
      # `aws-auto-tagging` extensions.
      sig { returns(T.nilable(T::Array[Imagekitio::File::AITag])) }
      attr_accessor :ai_tags

      # The audio codec used in the video (only for video/audio).
      sig { returns(T.nilable(String)) }
      attr_reader :audio_codec

      sig { params(audio_codec: String).void }
      attr_writer :audio_codec

      # The bit rate of the video in kbps (only for video).
      sig { returns(T.nilable(Integer)) }
      attr_reader :bit_rate

      sig { params(bit_rate: Integer).void }
      attr_writer :bit_rate

      # Date and time when the file was uploaded. The date and time is in ISO8601
      # format.
      sig { returns(T.nilable(Time)) }
      attr_reader :created_at

      sig { params(created_at: Time).void }
      attr_writer :created_at

      # An string with custom coordinates of the file.
      sig { returns(T.nilable(String)) }
      attr_accessor :custom_coordinates

      # A key-value data associated with the asset. Use `responseField` in API request
      # to get `customMetadata` in the upload API response. Before setting any custom
      # metadata on an asset, you have to create the field using custom metadata fields
      # API. Send `customMetadata` in `responseFields` in API request to get the value
      # of this field.
      sig { returns(T.nilable(T::Hash[Symbol, T.anything])) }
      attr_reader :custom_metadata

      sig { params(custom_metadata: T::Hash[Symbol, T.anything]).void }
      attr_writer :custom_metadata

      # Optional text to describe the contents of the file. Can be set by the user or
      # the ai-auto-description extension.
      sig { returns(T.nilable(String)) }
      attr_reader :description

      sig { params(description: String).void }
      attr_writer :description

      # The duration of the video in seconds (only for video).
      sig { returns(T.nilable(Integer)) }
      attr_reader :duration

      sig { params(duration: Integer).void }
      attr_writer :duration

      # Consolidated embedded metadata associated with the file. It includes exif, iptc,
      # and xmp data. Send `embeddedMetadata` in `responseFields` in API request to get
      # embeddedMetadata in the upload API response.
      sig { returns(T.nilable(T::Hash[Symbol, T.anything])) }
      attr_reader :embedded_metadata

      sig { params(embedded_metadata: T::Hash[Symbol, T.anything]).void }
      attr_writer :embedded_metadata

      # Unique identifier of the asset.
      sig { returns(T.nilable(String)) }
      attr_reader :file_id

      sig { params(file_id: String).void }
      attr_writer :file_id

      # Path of the file. This is the path you would use in the URL to access the file.
      # For example, if the file is at the root of the media library, the path will be
      # `/file.jpg`. If the file is inside a folder named `images`, the path will be
      # `/images/file.jpg`.
      sig { returns(T.nilable(String)) }
      attr_reader :file_path

      sig { params(file_path: String).void }
      attr_writer :file_path

      # Type of the file. Possible values are `image`, `non-image`.
      sig { returns(T.nilable(String)) }
      attr_reader :file_type

      sig { params(file_type: String).void }
      attr_writer :file_type

      # Specifies if the image has an alpha channel.
      sig { returns(T.nilable(T::Boolean)) }
      attr_reader :has_alpha

      sig { params(has_alpha: T::Boolean).void }
      attr_writer :has_alpha

      # Height of the file.
      sig { returns(T.nilable(Float)) }
      attr_reader :height

      sig { params(height: Float).void }
      attr_writer :height

      # Specifies if the file is private or not.
      sig { returns(T.nilable(T::Boolean)) }
      attr_reader :is_private_file

      sig { params(is_private_file: T::Boolean).void }
      attr_writer :is_private_file

      # Specifies if the file is published or not.
      sig { returns(T.nilable(T::Boolean)) }
      attr_reader :is_published

      sig { params(is_published: T::Boolean).void }
      attr_writer :is_published

      # MIME type of the file.
      sig { returns(T.nilable(String)) }
      attr_reader :mime

      sig { params(mime: String).void }
      attr_writer :mime

      # Name of the asset.
      sig { returns(T.nilable(String)) }
      attr_reader :name

      sig { params(name: String).void }
      attr_writer :name

      # This field is included in the response only if the Path policy feature is
      # available in the plan. It contains schema definitions for the custom metadata
      # fields selected for the specified file path. Field selection can only be done
      # when the Path policy feature is enabled.
      #
      # Keys are the names of the custom metadata fields; the value object has details
      # about the custom metadata schema.
      sig do
        returns(
          T.nilable(T::Hash[Symbol, Imagekitio::File::SelectedFieldsSchema])
        )
      end
      attr_reader :selected_fields_schema

      sig do
        params(
          selected_fields_schema:
            T::Hash[Symbol, Imagekitio::File::SelectedFieldsSchema::OrHash]
        ).void
      end
      attr_writer :selected_fields_schema

      # Size of the file in bytes.
      sig { returns(T.nilable(Float)) }
      attr_reader :size

      sig { params(size: Float).void }
      attr_writer :size

      # An array of tags assigned to the file. Tags are used to search files in the
      # media library.
      sig { returns(T.nilable(T::Array[String])) }
      attr_accessor :tags

      # URL of the thumbnail image. This URL is used to access the thumbnail image of
      # the file in the media library.
      sig { returns(T.nilable(String)) }
      attr_reader :thumbnail

      sig { params(thumbnail: String).void }
      attr_writer :thumbnail

      # Type of the asset.
      sig { returns(T.nilable(Imagekitio::File::Type::TaggedSymbol)) }
      attr_reader :type

      sig { params(type: Imagekitio::File::Type::OrSymbol).void }
      attr_writer :type

      # Date and time when the file was last updated. The date and time is in ISO8601
      # format.
      sig { returns(T.nilable(Time)) }
      attr_reader :updated_at

      sig { params(updated_at: Time).void }
      attr_writer :updated_at

      # URL of the file.
      sig { returns(T.nilable(String)) }
      attr_reader :url

      sig { params(url: String).void }
      attr_writer :url

      # An object containing the file or file version's `id` (versionId) and `name`.
      sig { returns(T.nilable(Imagekitio::File::VersionInfo)) }
      attr_reader :version_info

      sig { params(version_info: Imagekitio::File::VersionInfo::OrHash).void }
      attr_writer :version_info

      # The video codec used in the video (only for video).
      sig { returns(T.nilable(String)) }
      attr_reader :video_codec

      sig { params(video_codec: String).void }
      attr_writer :video_codec

      # Width of the file.
      sig { returns(T.nilable(Float)) }
      attr_reader :width

      sig { params(width: Float).void }
      attr_writer :width

      # Object containing details of a file or file version.
      sig do
        params(
          ai_tags: T.nilable(T::Array[Imagekitio::File::AITag::OrHash]),
          audio_codec: String,
          bit_rate: Integer,
          created_at: Time,
          custom_coordinates: T.nilable(String),
          custom_metadata: T::Hash[Symbol, T.anything],
          description: String,
          duration: Integer,
          embedded_metadata: T::Hash[Symbol, T.anything],
          file_id: String,
          file_path: String,
          file_type: String,
          has_alpha: T::Boolean,
          height: Float,
          is_private_file: T::Boolean,
          is_published: T::Boolean,
          mime: String,
          name: String,
          selected_fields_schema:
            T::Hash[Symbol, Imagekitio::File::SelectedFieldsSchema::OrHash],
          size: Float,
          tags: T.nilable(T::Array[String]),
          thumbnail: String,
          type: Imagekitio::File::Type::OrSymbol,
          updated_at: Time,
          url: String,
          version_info: Imagekitio::File::VersionInfo::OrHash,
          video_codec: String,
          width: Float
        ).returns(T.attached_class)
      end
      def self.new(
        # Array of `AITags` associated with the image. If no `AITags` are set, it will be
        # null. These tags can be added using the `google-auto-tagging` or
        # `aws-auto-tagging` extensions.
        ai_tags: nil,
        # The audio codec used in the video (only for video/audio).
        audio_codec: nil,
        # The bit rate of the video in kbps (only for video).
        bit_rate: nil,
        # Date and time when the file was uploaded. The date and time is in ISO8601
        # format.
        created_at: nil,
        # An string with custom coordinates of the file.
        custom_coordinates: nil,
        # A key-value data associated with the asset. Use `responseField` in API request
        # to get `customMetadata` in the upload API response. Before setting any custom
        # metadata on an asset, you have to create the field using custom metadata fields
        # API. Send `customMetadata` in `responseFields` in API request to get the value
        # of this field.
        custom_metadata: nil,
        # Optional text to describe the contents of the file. Can be set by the user or
        # the ai-auto-description extension.
        description: nil,
        # The duration of the video in seconds (only for video).
        duration: nil,
        # Consolidated embedded metadata associated with the file. It includes exif, iptc,
        # and xmp data. Send `embeddedMetadata` in `responseFields` in API request to get
        # embeddedMetadata in the upload API response.
        embedded_metadata: nil,
        # Unique identifier of the asset.
        file_id: nil,
        # Path of the file. This is the path you would use in the URL to access the file.
        # For example, if the file is at the root of the media library, the path will be
        # `/file.jpg`. If the file is inside a folder named `images`, the path will be
        # `/images/file.jpg`.
        file_path: nil,
        # Type of the file. Possible values are `image`, `non-image`.
        file_type: nil,
        # Specifies if the image has an alpha channel.
        has_alpha: nil,
        # Height of the file.
        height: nil,
        # Specifies if the file is private or not.
        is_private_file: nil,
        # Specifies if the file is published or not.
        is_published: nil,
        # MIME type of the file.
        mime: nil,
        # Name of the asset.
        name: nil,
        # This field is included in the response only if the Path policy feature is
        # available in the plan. It contains schema definitions for the custom metadata
        # fields selected for the specified file path. Field selection can only be done
        # when the Path policy feature is enabled.
        #
        # Keys are the names of the custom metadata fields; the value object has details
        # about the custom metadata schema.
        selected_fields_schema: nil,
        # Size of the file in bytes.
        size: nil,
        # An array of tags assigned to the file. Tags are used to search files in the
        # media library.
        tags: nil,
        # URL of the thumbnail image. This URL is used to access the thumbnail image of
        # the file in the media library.
        thumbnail: nil,
        # Type of the asset.
        type: nil,
        # Date and time when the file was last updated. The date and time is in ISO8601
        # format.
        updated_at: nil,
        # URL of the file.
        url: nil,
        # An object containing the file or file version's `id` (versionId) and `name`.
        version_info: nil,
        # The video codec used in the video (only for video).
        video_codec: nil,
        # Width of the file.
        width: nil
      )
      end

      sig do
        override.returns(
          {
            ai_tags: T.nilable(T::Array[Imagekitio::File::AITag]),
            audio_codec: String,
            bit_rate: Integer,
            created_at: Time,
            custom_coordinates: T.nilable(String),
            custom_metadata: T::Hash[Symbol, T.anything],
            description: String,
            duration: Integer,
            embedded_metadata: T::Hash[Symbol, T.anything],
            file_id: String,
            file_path: String,
            file_type: String,
            has_alpha: T::Boolean,
            height: Float,
            is_private_file: T::Boolean,
            is_published: T::Boolean,
            mime: String,
            name: String,
            selected_fields_schema:
              T::Hash[Symbol, Imagekitio::File::SelectedFieldsSchema],
            size: Float,
            tags: T.nilable(T::Array[String]),
            thumbnail: String,
            type: Imagekitio::File::Type::TaggedSymbol,
            updated_at: Time,
            url: String,
            version_info: Imagekitio::File::VersionInfo,
            video_codec: String,
            width: Float
          }
        )
      end
      def to_hash
      end

      # Type of the asset.
      module Type
        extend Imagekitio::Internal::Type::Enum

        TaggedSymbol = T.type_alias { T.all(Symbol, Imagekitio::File::Type) }
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        FILE = T.let(:file, Imagekitio::File::Type::TaggedSymbol)
        FILE_VERSION =
          T.let(:"file-version", Imagekitio::File::Type::TaggedSymbol)

        sig { override.returns(T::Array[Imagekitio::File::Type::TaggedSymbol]) }
        def self.values
        end
      end
    end
  end
end
