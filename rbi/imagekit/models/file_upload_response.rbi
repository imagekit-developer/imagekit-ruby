# typed: strong

module Imagekit
  module Models
    class FileUploadResponse < Imagekit::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            Imagekit::Models::FileUploadResponse,
            Imagekit::Internal::AnyHash
          )
        end

      # An array of tags assigned to the uploaded file by auto tagging.
      sig do
        returns(
          T.nilable(T::Array[Imagekit::Models::FileUploadResponse::AITag])
        )
      end
      attr_accessor :ai_tags

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

      # Value of custom coordinates associated with the image in the format
      # `x,y,width,height`. If `customCoordinates` are not defined, then it is `null`.
      # Send `customCoordinates` in `responseFields` in API request to get the value of
      # this field.
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

      # Extension names with their processing status at the time of completion of the
      # request. It could have one of the following status values:
      #
      # `success`: The extension has been successfully applied. `failed`: The extension
      # has failed and will not be retried. `pending`: The extension will finish
      # processing in some time. On completion, the final status (success / failed) will
      # be sent to the `webhookUrl` provided.
      #
      # If no extension was requested, then this parameter is not returned.
      sig do
        returns(
          T.nilable(Imagekit::Models::FileUploadResponse::ExtensionStatus)
        )
      end
      attr_reader :extension_status

      sig do
        params(
          extension_status:
            Imagekit::Models::FileUploadResponse::ExtensionStatus::OrHash
        ).void
      end
      attr_writer :extension_status

      # Unique fileId. Store this fileld in your database, as this will be used to
      # perform update action on this file.
      sig { returns(T.nilable(String)) }
      attr_reader :file_id

      sig { params(file_id: String).void }
      attr_writer :file_id

      # The relative path of the file in the media library e.g.
      # `/marketing-assets/new-banner.jpg`.
      sig { returns(T.nilable(String)) }
      attr_reader :file_path

      sig { params(file_path: String).void }
      attr_writer :file_path

      # Type of the uploaded file. Possible values are `image`, `non-image`.
      sig { returns(T.nilable(String)) }
      attr_reader :file_type

      sig { params(file_type: String).void }
      attr_writer :file_type

      # Height of the image in pixels (Only for images)
      sig { returns(T.nilable(Float)) }
      attr_reader :height

      sig { params(height: Float).void }
      attr_writer :height

      # Is the file marked as private. It can be either `true` or `false`. Send
      # `isPrivateFile` in `responseFields` in API request to get the value of this
      # field.
      sig { returns(T.nilable(T::Boolean)) }
      attr_reader :is_private_file

      sig { params(is_private_file: T::Boolean).void }
      attr_writer :is_private_file

      # Is the file published or in draft state. It can be either `true` or `false`.
      # Send `isPublished` in `responseFields` in API request to get the value of this
      # field.
      sig { returns(T.nilable(T::Boolean)) }
      attr_reader :is_published

      sig { params(is_published: T::Boolean).void }
      attr_writer :is_published

      # Legacy metadata. Send `metadata` in `responseFields` in API request to get
      # metadata in the upload API response.
      sig { returns(T.nilable(Imagekit::Metadata)) }
      attr_reader :metadata

      sig { params(metadata: Imagekit::Metadata::OrHash).void }
      attr_writer :metadata

      # Name of the asset.
      sig { returns(T.nilable(String)) }
      attr_reader :name

      sig { params(name: String).void }
      attr_writer :name

      # Size of the image file in Bytes.
      sig { returns(T.nilable(Float)) }
      attr_reader :size

      sig { params(size: Float).void }
      attr_writer :size

      # The array of tags associated with the asset. If no tags are set, it will be
      # `null`. Send `tags` in `responseFields` in API request to get the value of this
      # field.
      sig { returns(T.nilable(T::Array[String])) }
      attr_accessor :tags

      # In the case of an image, a small thumbnail URL.
      sig { returns(T.nilable(String)) }
      attr_reader :thumbnail_url

      sig { params(thumbnail_url: String).void }
      attr_writer :thumbnail_url

      # A publicly accessible URL of the file.
      sig { returns(T.nilable(String)) }
      attr_reader :url

      sig { params(url: String).void }
      attr_writer :url

      # An object containing the file or file version's `id` (versionId) and `name`.
      sig do
        returns(T.nilable(Imagekit::Models::FileUploadResponse::VersionInfo))
      end
      attr_reader :version_info

      sig do
        params(
          version_info:
            Imagekit::Models::FileUploadResponse::VersionInfo::OrHash
        ).void
      end
      attr_writer :version_info

      # The video codec used in the video (only for video).
      sig { returns(T.nilable(String)) }
      attr_reader :video_codec

      sig { params(video_codec: String).void }
      attr_writer :video_codec

      # Width of the image in pixels (Only for Images)
      sig { returns(T.nilable(Float)) }
      attr_reader :width

      sig { params(width: Float).void }
      attr_writer :width

      # Object containing details of a successful upload.
      sig do
        params(
          ai_tags:
            T.nilable(
              T::Array[Imagekit::Models::FileUploadResponse::AITag::OrHash]
            ),
          audio_codec: String,
          bit_rate: Integer,
          custom_coordinates: T.nilable(String),
          custom_metadata: T::Hash[Symbol, T.anything],
          description: String,
          duration: Integer,
          embedded_metadata: T::Hash[Symbol, T.anything],
          extension_status:
            Imagekit::Models::FileUploadResponse::ExtensionStatus::OrHash,
          file_id: String,
          file_path: String,
          file_type: String,
          height: Float,
          is_private_file: T::Boolean,
          is_published: T::Boolean,
          metadata: Imagekit::Metadata::OrHash,
          name: String,
          size: Float,
          tags: T.nilable(T::Array[String]),
          thumbnail_url: String,
          url: String,
          version_info:
            Imagekit::Models::FileUploadResponse::VersionInfo::OrHash,
          video_codec: String,
          width: Float
        ).returns(T.attached_class)
      end
      def self.new(
        # An array of tags assigned to the uploaded file by auto tagging.
        ai_tags: nil,
        # The audio codec used in the video (only for video).
        audio_codec: nil,
        # The bit rate of the video in kbps (only for video).
        bit_rate: nil,
        # Value of custom coordinates associated with the image in the format
        # `x,y,width,height`. If `customCoordinates` are not defined, then it is `null`.
        # Send `customCoordinates` in `responseFields` in API request to get the value of
        # this field.
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
        # Extension names with their processing status at the time of completion of the
        # request. It could have one of the following status values:
        #
        # `success`: The extension has been successfully applied. `failed`: The extension
        # has failed and will not be retried. `pending`: The extension will finish
        # processing in some time. On completion, the final status (success / failed) will
        # be sent to the `webhookUrl` provided.
        #
        # If no extension was requested, then this parameter is not returned.
        extension_status: nil,
        # Unique fileId. Store this fileld in your database, as this will be used to
        # perform update action on this file.
        file_id: nil,
        # The relative path of the file in the media library e.g.
        # `/marketing-assets/new-banner.jpg`.
        file_path: nil,
        # Type of the uploaded file. Possible values are `image`, `non-image`.
        file_type: nil,
        # Height of the image in pixels (Only for images)
        height: nil,
        # Is the file marked as private. It can be either `true` or `false`. Send
        # `isPrivateFile` in `responseFields` in API request to get the value of this
        # field.
        is_private_file: nil,
        # Is the file published or in draft state. It can be either `true` or `false`.
        # Send `isPublished` in `responseFields` in API request to get the value of this
        # field.
        is_published: nil,
        # Legacy metadata. Send `metadata` in `responseFields` in API request to get
        # metadata in the upload API response.
        metadata: nil,
        # Name of the asset.
        name: nil,
        # Size of the image file in Bytes.
        size: nil,
        # The array of tags associated with the asset. If no tags are set, it will be
        # `null`. Send `tags` in `responseFields` in API request to get the value of this
        # field.
        tags: nil,
        # In the case of an image, a small thumbnail URL.
        thumbnail_url: nil,
        # A publicly accessible URL of the file.
        url: nil,
        # An object containing the file or file version's `id` (versionId) and `name`.
        version_info: nil,
        # The video codec used in the video (only for video).
        video_codec: nil,
        # Width of the image in pixels (Only for Images)
        width: nil
      )
      end

      sig do
        override.returns(
          {
            ai_tags:
              T.nilable(T::Array[Imagekit::Models::FileUploadResponse::AITag]),
            audio_codec: String,
            bit_rate: Integer,
            custom_coordinates: T.nilable(String),
            custom_metadata: T::Hash[Symbol, T.anything],
            description: String,
            duration: Integer,
            embedded_metadata: T::Hash[Symbol, T.anything],
            extension_status:
              Imagekit::Models::FileUploadResponse::ExtensionStatus,
            file_id: String,
            file_path: String,
            file_type: String,
            height: Float,
            is_private_file: T::Boolean,
            is_published: T::Boolean,
            metadata: Imagekit::Metadata,
            name: String,
            size: Float,
            tags: T.nilable(T::Array[String]),
            thumbnail_url: String,
            url: String,
            version_info: Imagekit::Models::FileUploadResponse::VersionInfo,
            video_codec: String,
            width: Float
          }
        )
      end
      def to_hash
      end

      class AITag < Imagekit::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Imagekit::Models::FileUploadResponse::AITag,
              Imagekit::Internal::AnyHash
            )
          end

        # Confidence score of the tag.
        sig { returns(T.nilable(Float)) }
        attr_reader :confidence

        sig { params(confidence: Float).void }
        attr_writer :confidence

        # Name of the tag.
        sig { returns(T.nilable(String)) }
        attr_reader :name

        sig { params(name: String).void }
        attr_writer :name

        # Array of `AITags` associated with the image. If no `AITags` are set, it will be
        # null. These tags can be added using the `google-auto-tagging` or
        # `aws-auto-tagging` extensions.
        sig { returns(T.nilable(String)) }
        attr_reader :source

        sig { params(source: String).void }
        attr_writer :source

        sig do
          params(confidence: Float, name: String, source: String).returns(
            T.attached_class
          )
        end
        def self.new(
          # Confidence score of the tag.
          confidence: nil,
          # Name of the tag.
          name: nil,
          # Array of `AITags` associated with the image. If no `AITags` are set, it will be
          # null. These tags can be added using the `google-auto-tagging` or
          # `aws-auto-tagging` extensions.
          source: nil
        )
        end

        sig do
          override.returns({ confidence: Float, name: String, source: String })
        end
        def to_hash
        end
      end

      class ExtensionStatus < Imagekit::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Imagekit::Models::FileUploadResponse::ExtensionStatus,
              Imagekit::Internal::AnyHash
            )
          end

        sig do
          returns(
            T.nilable(
              Imagekit::Models::FileUploadResponse::ExtensionStatus::AIAutoDescription::TaggedSymbol
            )
          )
        end
        attr_reader :ai_auto_description

        sig do
          params(
            ai_auto_description:
              Imagekit::Models::FileUploadResponse::ExtensionStatus::AIAutoDescription::OrSymbol
          ).void
        end
        attr_writer :ai_auto_description

        sig do
          returns(
            T.nilable(
              Imagekit::Models::FileUploadResponse::ExtensionStatus::AwsAutoTagging::TaggedSymbol
            )
          )
        end
        attr_reader :aws_auto_tagging

        sig do
          params(
            aws_auto_tagging:
              Imagekit::Models::FileUploadResponse::ExtensionStatus::AwsAutoTagging::OrSymbol
          ).void
        end
        attr_writer :aws_auto_tagging

        sig do
          returns(
            T.nilable(
              Imagekit::Models::FileUploadResponse::ExtensionStatus::GoogleAutoTagging::TaggedSymbol
            )
          )
        end
        attr_reader :google_auto_tagging

        sig do
          params(
            google_auto_tagging:
              Imagekit::Models::FileUploadResponse::ExtensionStatus::GoogleAutoTagging::OrSymbol
          ).void
        end
        attr_writer :google_auto_tagging

        sig do
          returns(
            T.nilable(
              Imagekit::Models::FileUploadResponse::ExtensionStatus::RemoveBg::TaggedSymbol
            )
          )
        end
        attr_reader :remove_bg

        sig do
          params(
            remove_bg:
              Imagekit::Models::FileUploadResponse::ExtensionStatus::RemoveBg::OrSymbol
          ).void
        end
        attr_writer :remove_bg

        # Extension names with their processing status at the time of completion of the
        # request. It could have one of the following status values:
        #
        # `success`: The extension has been successfully applied. `failed`: The extension
        # has failed and will not be retried. `pending`: The extension will finish
        # processing in some time. On completion, the final status (success / failed) will
        # be sent to the `webhookUrl` provided.
        #
        # If no extension was requested, then this parameter is not returned.
        sig do
          params(
            ai_auto_description:
              Imagekit::Models::FileUploadResponse::ExtensionStatus::AIAutoDescription::OrSymbol,
            aws_auto_tagging:
              Imagekit::Models::FileUploadResponse::ExtensionStatus::AwsAutoTagging::OrSymbol,
            google_auto_tagging:
              Imagekit::Models::FileUploadResponse::ExtensionStatus::GoogleAutoTagging::OrSymbol,
            remove_bg:
              Imagekit::Models::FileUploadResponse::ExtensionStatus::RemoveBg::OrSymbol
          ).returns(T.attached_class)
        end
        def self.new(
          ai_auto_description: nil,
          aws_auto_tagging: nil,
          google_auto_tagging: nil,
          remove_bg: nil
        )
        end

        sig do
          override.returns(
            {
              ai_auto_description:
                Imagekit::Models::FileUploadResponse::ExtensionStatus::AIAutoDescription::TaggedSymbol,
              aws_auto_tagging:
                Imagekit::Models::FileUploadResponse::ExtensionStatus::AwsAutoTagging::TaggedSymbol,
              google_auto_tagging:
                Imagekit::Models::FileUploadResponse::ExtensionStatus::GoogleAutoTagging::TaggedSymbol,
              remove_bg:
                Imagekit::Models::FileUploadResponse::ExtensionStatus::RemoveBg::TaggedSymbol
            }
          )
        end
        def to_hash
        end

        module AIAutoDescription
          extend Imagekit::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(
                Symbol,
                Imagekit::Models::FileUploadResponse::ExtensionStatus::AIAutoDescription
              )
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          SUCCESS =
            T.let(
              :success,
              Imagekit::Models::FileUploadResponse::ExtensionStatus::AIAutoDescription::TaggedSymbol
            )
          PENDING =
            T.let(
              :pending,
              Imagekit::Models::FileUploadResponse::ExtensionStatus::AIAutoDescription::TaggedSymbol
            )
          FAILED =
            T.let(
              :failed,
              Imagekit::Models::FileUploadResponse::ExtensionStatus::AIAutoDescription::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                Imagekit::Models::FileUploadResponse::ExtensionStatus::AIAutoDescription::TaggedSymbol
              ]
            )
          end
          def self.values
          end
        end

        module AwsAutoTagging
          extend Imagekit::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(
                Symbol,
                Imagekit::Models::FileUploadResponse::ExtensionStatus::AwsAutoTagging
              )
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          SUCCESS =
            T.let(
              :success,
              Imagekit::Models::FileUploadResponse::ExtensionStatus::AwsAutoTagging::TaggedSymbol
            )
          PENDING =
            T.let(
              :pending,
              Imagekit::Models::FileUploadResponse::ExtensionStatus::AwsAutoTagging::TaggedSymbol
            )
          FAILED =
            T.let(
              :failed,
              Imagekit::Models::FileUploadResponse::ExtensionStatus::AwsAutoTagging::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                Imagekit::Models::FileUploadResponse::ExtensionStatus::AwsAutoTagging::TaggedSymbol
              ]
            )
          end
          def self.values
          end
        end

        module GoogleAutoTagging
          extend Imagekit::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(
                Symbol,
                Imagekit::Models::FileUploadResponse::ExtensionStatus::GoogleAutoTagging
              )
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          SUCCESS =
            T.let(
              :success,
              Imagekit::Models::FileUploadResponse::ExtensionStatus::GoogleAutoTagging::TaggedSymbol
            )
          PENDING =
            T.let(
              :pending,
              Imagekit::Models::FileUploadResponse::ExtensionStatus::GoogleAutoTagging::TaggedSymbol
            )
          FAILED =
            T.let(
              :failed,
              Imagekit::Models::FileUploadResponse::ExtensionStatus::GoogleAutoTagging::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                Imagekit::Models::FileUploadResponse::ExtensionStatus::GoogleAutoTagging::TaggedSymbol
              ]
            )
          end
          def self.values
          end
        end

        module RemoveBg
          extend Imagekit::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(
                Symbol,
                Imagekit::Models::FileUploadResponse::ExtensionStatus::RemoveBg
              )
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          SUCCESS =
            T.let(
              :success,
              Imagekit::Models::FileUploadResponse::ExtensionStatus::RemoveBg::TaggedSymbol
            )
          PENDING =
            T.let(
              :pending,
              Imagekit::Models::FileUploadResponse::ExtensionStatus::RemoveBg::TaggedSymbol
            )
          FAILED =
            T.let(
              :failed,
              Imagekit::Models::FileUploadResponse::ExtensionStatus::RemoveBg::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                Imagekit::Models::FileUploadResponse::ExtensionStatus::RemoveBg::TaggedSymbol
              ]
            )
          end
          def self.values
          end
        end
      end

      class VersionInfo < Imagekit::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Imagekit::Models::FileUploadResponse::VersionInfo,
              Imagekit::Internal::AnyHash
            )
          end

        # Unique identifier of the file version.
        sig { returns(T.nilable(String)) }
        attr_reader :id

        sig { params(id: String).void }
        attr_writer :id

        # Name of the file version.
        sig { returns(T.nilable(String)) }
        attr_reader :name

        sig { params(name: String).void }
        attr_writer :name

        # An object containing the file or file version's `id` (versionId) and `name`.
        sig { params(id: String, name: String).returns(T.attached_class) }
        def self.new(
          # Unique identifier of the file version.
          id: nil,
          # Name of the file version.
          name: nil
        )
        end

        sig { override.returns({ id: String, name: String }) }
        def to_hash
        end
      end
    end
  end
end
