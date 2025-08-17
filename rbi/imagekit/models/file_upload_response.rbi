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
      sig { returns(T.nilable(T.anything)) }
      attr_reader :custom_metadata

      sig { params(custom_metadata: T.anything).void }
      attr_writer :custom_metadata

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
      sig { returns(T.nilable(Imagekit::Models::FileUploadResponse::Metadata)) }
      attr_reader :metadata

      sig do
        params(
          metadata: Imagekit::Models::FileUploadResponse::Metadata::OrHash
        ).void
      end
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
          custom_metadata: T.anything,
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
          metadata: Imagekit::Models::FileUploadResponse::Metadata::OrHash,
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
            custom_metadata: T.anything,
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
            metadata: Imagekit::Models::FileUploadResponse::Metadata,
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
            aws_auto_tagging:
              Imagekit::Models::FileUploadResponse::ExtensionStatus::AwsAutoTagging::OrSymbol,
            google_auto_tagging:
              Imagekit::Models::FileUploadResponse::ExtensionStatus::GoogleAutoTagging::OrSymbol,
            remove_bg:
              Imagekit::Models::FileUploadResponse::ExtensionStatus::RemoveBg::OrSymbol
          ).returns(T.attached_class)
        end
        def self.new(
          aws_auto_tagging: nil,
          google_auto_tagging: nil,
          remove_bg: nil
        )
        end

        sig do
          override.returns(
            {
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

      class Metadata < Imagekit::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Imagekit::Models::FileUploadResponse::Metadata,
              Imagekit::Internal::AnyHash
            )
          end

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

        # The density of the image in DPI.
        sig { returns(T.nilable(Integer)) }
        attr_reader :density

        sig { params(density: Integer).void }
        attr_writer :density

        # The duration of the video in seconds (only for video).
        sig { returns(T.nilable(Integer)) }
        attr_reader :duration

        sig { params(duration: Integer).void }
        attr_writer :duration

        sig do
          returns(
            T.nilable(Imagekit::Models::FileUploadResponse::Metadata::Exif)
          )
        end
        attr_reader :exif

        sig do
          params(
            exif: Imagekit::Models::FileUploadResponse::Metadata::Exif::OrHash
          ).void
        end
        attr_writer :exif

        # The format of the file (e.g., 'jpg', 'mp4').
        sig { returns(T.nilable(String)) }
        attr_reader :format_

        sig { params(format_: String).void }
        attr_writer :format_

        # Indicates if the image has a color profile.
        sig { returns(T.nilable(T::Boolean)) }
        attr_reader :has_color_profile

        sig { params(has_color_profile: T::Boolean).void }
        attr_writer :has_color_profile

        # Indicates if the image contains transparent areas.
        sig { returns(T.nilable(T::Boolean)) }
        attr_reader :has_transparency

        sig { params(has_transparency: T::Boolean).void }
        attr_writer :has_transparency

        # The height of the image or video in pixels.
        sig { returns(T.nilable(Integer)) }
        attr_reader :height

        sig { params(height: Integer).void }
        attr_writer :height

        # Perceptual hash of the image.
        sig { returns(T.nilable(String)) }
        attr_reader :p_hash

        sig { params(p_hash: String).void }
        attr_writer :p_hash

        # The quality indicator of the image.
        sig { returns(T.nilable(Integer)) }
        attr_reader :quality

        sig { params(quality: Integer).void }
        attr_writer :quality

        # The file size in bytes.
        sig { returns(T.nilable(Integer)) }
        attr_reader :size

        sig { params(size: Integer).void }
        attr_writer :size

        # The video codec used in the video (only for video).
        sig { returns(T.nilable(String)) }
        attr_reader :video_codec

        sig { params(video_codec: String).void }
        attr_writer :video_codec

        # The width of the image or video in pixels.
        sig { returns(T.nilable(Integer)) }
        attr_reader :width

        sig { params(width: Integer).void }
        attr_writer :width

        # Legacy metadata. Send `metadata` in `responseFields` in API request to get
        # metadata in the upload API response.
        sig do
          params(
            audio_codec: String,
            bit_rate: Integer,
            density: Integer,
            duration: Integer,
            exif: Imagekit::Models::FileUploadResponse::Metadata::Exif::OrHash,
            format_: String,
            has_color_profile: T::Boolean,
            has_transparency: T::Boolean,
            height: Integer,
            p_hash: String,
            quality: Integer,
            size: Integer,
            video_codec: String,
            width: Integer
          ).returns(T.attached_class)
        end
        def self.new(
          # The audio codec used in the video (only for video).
          audio_codec: nil,
          # The bit rate of the video in kbps (only for video).
          bit_rate: nil,
          # The density of the image in DPI.
          density: nil,
          # The duration of the video in seconds (only for video).
          duration: nil,
          exif: nil,
          # The format of the file (e.g., 'jpg', 'mp4').
          format_: nil,
          # Indicates if the image has a color profile.
          has_color_profile: nil,
          # Indicates if the image contains transparent areas.
          has_transparency: nil,
          # The height of the image or video in pixels.
          height: nil,
          # Perceptual hash of the image.
          p_hash: nil,
          # The quality indicator of the image.
          quality: nil,
          # The file size in bytes.
          size: nil,
          # The video codec used in the video (only for video).
          video_codec: nil,
          # The width of the image or video in pixels.
          width: nil
        )
        end

        sig do
          override.returns(
            {
              audio_codec: String,
              bit_rate: Integer,
              density: Integer,
              duration: Integer,
              exif: Imagekit::Models::FileUploadResponse::Metadata::Exif,
              format_: String,
              has_color_profile: T::Boolean,
              has_transparency: T::Boolean,
              height: Integer,
              p_hash: String,
              quality: Integer,
              size: Integer,
              video_codec: String,
              width: Integer
            }
          )
        end
        def to_hash
        end

        class Exif < Imagekit::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Imagekit::Models::FileUploadResponse::Metadata::Exif,
                Imagekit::Internal::AnyHash
              )
            end

          # Object containing Exif details.
          sig do
            returns(
              T.nilable(
                Imagekit::Models::FileUploadResponse::Metadata::Exif::Exif
              )
            )
          end
          attr_reader :exif

          sig do
            params(
              exif:
                Imagekit::Models::FileUploadResponse::Metadata::Exif::Exif::OrHash
            ).void
          end
          attr_writer :exif

          # Object containing GPS information.
          sig do
            returns(
              T.nilable(
                Imagekit::Models::FileUploadResponse::Metadata::Exif::Gps
              )
            )
          end
          attr_reader :gps

          sig do
            params(
              gps:
                Imagekit::Models::FileUploadResponse::Metadata::Exif::Gps::OrHash
            ).void
          end
          attr_writer :gps

          # Object containing EXIF image information.
          sig do
            returns(
              T.nilable(
                Imagekit::Models::FileUploadResponse::Metadata::Exif::Image
              )
            )
          end
          attr_reader :image

          sig do
            params(
              image:
                Imagekit::Models::FileUploadResponse::Metadata::Exif::Image::OrHash
            ).void
          end
          attr_writer :image

          # JSON object.
          sig do
            returns(
              T.nilable(
                Imagekit::Models::FileUploadResponse::Metadata::Exif::Interoperability
              )
            )
          end
          attr_reader :interoperability

          sig do
            params(
              interoperability:
                Imagekit::Models::FileUploadResponse::Metadata::Exif::Interoperability::OrHash
            ).void
          end
          attr_writer :interoperability

          sig { returns(T.nilable(T::Hash[Symbol, T.anything])) }
          attr_reader :makernote

          sig { params(makernote: T::Hash[Symbol, T.anything]).void }
          attr_writer :makernote

          # Object containing Thumbnail information.
          sig do
            returns(
              T.nilable(
                Imagekit::Models::FileUploadResponse::Metadata::Exif::Thumbnail
              )
            )
          end
          attr_reader :thumbnail

          sig do
            params(
              thumbnail:
                Imagekit::Models::FileUploadResponse::Metadata::Exif::Thumbnail::OrHash
            ).void
          end
          attr_writer :thumbnail

          sig do
            params(
              exif:
                Imagekit::Models::FileUploadResponse::Metadata::Exif::Exif::OrHash,
              gps:
                Imagekit::Models::FileUploadResponse::Metadata::Exif::Gps::OrHash,
              image:
                Imagekit::Models::FileUploadResponse::Metadata::Exif::Image::OrHash,
              interoperability:
                Imagekit::Models::FileUploadResponse::Metadata::Exif::Interoperability::OrHash,
              makernote: T::Hash[Symbol, T.anything],
              thumbnail:
                Imagekit::Models::FileUploadResponse::Metadata::Exif::Thumbnail::OrHash
            ).returns(T.attached_class)
          end
          def self.new(
            # Object containing Exif details.
            exif: nil,
            # Object containing GPS information.
            gps: nil,
            # Object containing EXIF image information.
            image: nil,
            # JSON object.
            interoperability: nil,
            makernote: nil,
            # Object containing Thumbnail information.
            thumbnail: nil
          )
          end

          sig do
            override.returns(
              {
                exif:
                  Imagekit::Models::FileUploadResponse::Metadata::Exif::Exif,
                gps: Imagekit::Models::FileUploadResponse::Metadata::Exif::Gps,
                image:
                  Imagekit::Models::FileUploadResponse::Metadata::Exif::Image,
                interoperability:
                  Imagekit::Models::FileUploadResponse::Metadata::Exif::Interoperability,
                makernote: T::Hash[Symbol, T.anything],
                thumbnail:
                  Imagekit::Models::FileUploadResponse::Metadata::Exif::Thumbnail
              }
            )
          end
          def to_hash
          end

          class Exif < Imagekit::Internal::Type::BaseModel
            OrHash =
              T.type_alias do
                T.any(
                  Imagekit::Models::FileUploadResponse::Metadata::Exif::Exif,
                  Imagekit::Internal::AnyHash
                )
              end

            sig { returns(T.nilable(Float)) }
            attr_reader :aperture_value

            sig { params(aperture_value: Float).void }
            attr_writer :aperture_value

            sig { returns(T.nilable(Integer)) }
            attr_reader :color_space

            sig { params(color_space: Integer).void }
            attr_writer :color_space

            sig { returns(T.nilable(String)) }
            attr_reader :create_date

            sig { params(create_date: String).void }
            attr_writer :create_date

            sig { returns(T.nilable(Integer)) }
            attr_reader :custom_rendered

            sig { params(custom_rendered: Integer).void }
            attr_writer :custom_rendered

            sig { returns(T.nilable(String)) }
            attr_reader :date_time_original

            sig { params(date_time_original: String).void }
            attr_writer :date_time_original

            sig { returns(T.nilable(Integer)) }
            attr_reader :exif_image_height

            sig { params(exif_image_height: Integer).void }
            attr_writer :exif_image_height

            sig { returns(T.nilable(Integer)) }
            attr_reader :exif_image_width

            sig { params(exif_image_width: Integer).void }
            attr_writer :exif_image_width

            sig { returns(T.nilable(String)) }
            attr_reader :exif_version

            sig { params(exif_version: String).void }
            attr_writer :exif_version

            sig { returns(T.nilable(Float)) }
            attr_reader :exposure_compensation

            sig { params(exposure_compensation: Float).void }
            attr_writer :exposure_compensation

            sig { returns(T.nilable(Integer)) }
            attr_reader :exposure_mode

            sig { params(exposure_mode: Integer).void }
            attr_writer :exposure_mode

            sig { returns(T.nilable(Integer)) }
            attr_reader :exposure_program

            sig { params(exposure_program: Integer).void }
            attr_writer :exposure_program

            sig { returns(T.nilable(Float)) }
            attr_reader :exposure_time

            sig { params(exposure_time: Float).void }
            attr_writer :exposure_time

            sig { returns(T.nilable(Integer)) }
            attr_reader :flash

            sig { params(flash: Integer).void }
            attr_writer :flash

            sig { returns(T.nilable(String)) }
            attr_reader :flashpix_version

            sig { params(flashpix_version: String).void }
            attr_writer :flashpix_version

            sig { returns(T.nilable(Float)) }
            attr_reader :f_number

            sig { params(f_number: Float).void }
            attr_writer :f_number

            sig { returns(T.nilable(Integer)) }
            attr_reader :focal_length

            sig { params(focal_length: Integer).void }
            attr_writer :focal_length

            sig { returns(T.nilable(Integer)) }
            attr_reader :focal_plane_resolution_unit

            sig { params(focal_plane_resolution_unit: Integer).void }
            attr_writer :focal_plane_resolution_unit

            sig { returns(T.nilable(Float)) }
            attr_reader :focal_plane_x_resolution

            sig { params(focal_plane_x_resolution: Float).void }
            attr_writer :focal_plane_x_resolution

            sig { returns(T.nilable(Float)) }
            attr_reader :focal_plane_y_resolution

            sig { params(focal_plane_y_resolution: Float).void }
            attr_writer :focal_plane_y_resolution

            sig { returns(T.nilable(Integer)) }
            attr_reader :interop_offset

            sig { params(interop_offset: Integer).void }
            attr_writer :interop_offset

            sig { returns(T.nilable(Integer)) }
            attr_reader :iso

            sig { params(iso: Integer).void }
            attr_writer :iso

            sig { returns(T.nilable(Integer)) }
            attr_reader :metering_mode

            sig { params(metering_mode: Integer).void }
            attr_writer :metering_mode

            sig { returns(T.nilable(Integer)) }
            attr_reader :scene_capture_type

            sig { params(scene_capture_type: Integer).void }
            attr_writer :scene_capture_type

            sig { returns(T.nilable(Float)) }
            attr_reader :shutter_speed_value

            sig { params(shutter_speed_value: Float).void }
            attr_writer :shutter_speed_value

            sig { returns(T.nilable(String)) }
            attr_reader :sub_sec_time

            sig { params(sub_sec_time: String).void }
            attr_writer :sub_sec_time

            sig { returns(T.nilable(Integer)) }
            attr_reader :white_balance

            sig { params(white_balance: Integer).void }
            attr_writer :white_balance

            # Object containing Exif details.
            sig do
              params(
                aperture_value: Float,
                color_space: Integer,
                create_date: String,
                custom_rendered: Integer,
                date_time_original: String,
                exif_image_height: Integer,
                exif_image_width: Integer,
                exif_version: String,
                exposure_compensation: Float,
                exposure_mode: Integer,
                exposure_program: Integer,
                exposure_time: Float,
                flash: Integer,
                flashpix_version: String,
                f_number: Float,
                focal_length: Integer,
                focal_plane_resolution_unit: Integer,
                focal_plane_x_resolution: Float,
                focal_plane_y_resolution: Float,
                interop_offset: Integer,
                iso: Integer,
                metering_mode: Integer,
                scene_capture_type: Integer,
                shutter_speed_value: Float,
                sub_sec_time: String,
                white_balance: Integer
              ).returns(T.attached_class)
            end
            def self.new(
              aperture_value: nil,
              color_space: nil,
              create_date: nil,
              custom_rendered: nil,
              date_time_original: nil,
              exif_image_height: nil,
              exif_image_width: nil,
              exif_version: nil,
              exposure_compensation: nil,
              exposure_mode: nil,
              exposure_program: nil,
              exposure_time: nil,
              flash: nil,
              flashpix_version: nil,
              f_number: nil,
              focal_length: nil,
              focal_plane_resolution_unit: nil,
              focal_plane_x_resolution: nil,
              focal_plane_y_resolution: nil,
              interop_offset: nil,
              iso: nil,
              metering_mode: nil,
              scene_capture_type: nil,
              shutter_speed_value: nil,
              sub_sec_time: nil,
              white_balance: nil
            )
            end

            sig do
              override.returns(
                {
                  aperture_value: Float,
                  color_space: Integer,
                  create_date: String,
                  custom_rendered: Integer,
                  date_time_original: String,
                  exif_image_height: Integer,
                  exif_image_width: Integer,
                  exif_version: String,
                  exposure_compensation: Float,
                  exposure_mode: Integer,
                  exposure_program: Integer,
                  exposure_time: Float,
                  flash: Integer,
                  flashpix_version: String,
                  f_number: Float,
                  focal_length: Integer,
                  focal_plane_resolution_unit: Integer,
                  focal_plane_x_resolution: Float,
                  focal_plane_y_resolution: Float,
                  interop_offset: Integer,
                  iso: Integer,
                  metering_mode: Integer,
                  scene_capture_type: Integer,
                  shutter_speed_value: Float,
                  sub_sec_time: String,
                  white_balance: Integer
                }
              )
            end
            def to_hash
            end
          end

          class Gps < Imagekit::Internal::Type::BaseModel
            OrHash =
              T.type_alias do
                T.any(
                  Imagekit::Models::FileUploadResponse::Metadata::Exif::Gps,
                  Imagekit::Internal::AnyHash
                )
              end

            sig { returns(T.nilable(T::Array[Integer])) }
            attr_reader :gps_version_id

            sig { params(gps_version_id: T::Array[Integer]).void }
            attr_writer :gps_version_id

            # Object containing GPS information.
            sig do
              params(gps_version_id: T::Array[Integer]).returns(
                T.attached_class
              )
            end
            def self.new(gps_version_id: nil)
            end

            sig { override.returns({ gps_version_id: T::Array[Integer] }) }
            def to_hash
            end
          end

          class Image < Imagekit::Internal::Type::BaseModel
            OrHash =
              T.type_alias do
                T.any(
                  Imagekit::Models::FileUploadResponse::Metadata::Exif::Image,
                  Imagekit::Internal::AnyHash
                )
              end

            sig { returns(T.nilable(Integer)) }
            attr_reader :exif_offset

            sig { params(exif_offset: Integer).void }
            attr_writer :exif_offset

            sig { returns(T.nilable(Integer)) }
            attr_reader :gps_info

            sig { params(gps_info: Integer).void }
            attr_writer :gps_info

            sig { returns(T.nilable(String)) }
            attr_reader :make

            sig { params(make: String).void }
            attr_writer :make

            sig { returns(T.nilable(String)) }
            attr_reader :model

            sig { params(model: String).void }
            attr_writer :model

            sig { returns(T.nilable(String)) }
            attr_reader :modify_date

            sig { params(modify_date: String).void }
            attr_writer :modify_date

            sig { returns(T.nilable(Integer)) }
            attr_reader :orientation

            sig { params(orientation: Integer).void }
            attr_writer :orientation

            sig { returns(T.nilable(Integer)) }
            attr_reader :resolution_unit

            sig { params(resolution_unit: Integer).void }
            attr_writer :resolution_unit

            sig { returns(T.nilable(String)) }
            attr_reader :software

            sig { params(software: String).void }
            attr_writer :software

            sig { returns(T.nilable(Integer)) }
            attr_reader :x_resolution

            sig { params(x_resolution: Integer).void }
            attr_writer :x_resolution

            sig { returns(T.nilable(Integer)) }
            attr_reader :y_cb_cr_positioning

            sig { params(y_cb_cr_positioning: Integer).void }
            attr_writer :y_cb_cr_positioning

            sig { returns(T.nilable(Integer)) }
            attr_reader :y_resolution

            sig { params(y_resolution: Integer).void }
            attr_writer :y_resolution

            # Object containing EXIF image information.
            sig do
              params(
                exif_offset: Integer,
                gps_info: Integer,
                make: String,
                model: String,
                modify_date: String,
                orientation: Integer,
                resolution_unit: Integer,
                software: String,
                x_resolution: Integer,
                y_cb_cr_positioning: Integer,
                y_resolution: Integer
              ).returns(T.attached_class)
            end
            def self.new(
              exif_offset: nil,
              gps_info: nil,
              make: nil,
              model: nil,
              modify_date: nil,
              orientation: nil,
              resolution_unit: nil,
              software: nil,
              x_resolution: nil,
              y_cb_cr_positioning: nil,
              y_resolution: nil
            )
            end

            sig do
              override.returns(
                {
                  exif_offset: Integer,
                  gps_info: Integer,
                  make: String,
                  model: String,
                  modify_date: String,
                  orientation: Integer,
                  resolution_unit: Integer,
                  software: String,
                  x_resolution: Integer,
                  y_cb_cr_positioning: Integer,
                  y_resolution: Integer
                }
              )
            end
            def to_hash
            end
          end

          class Interoperability < Imagekit::Internal::Type::BaseModel
            OrHash =
              T.type_alias do
                T.any(
                  Imagekit::Models::FileUploadResponse::Metadata::Exif::Interoperability,
                  Imagekit::Internal::AnyHash
                )
              end

            sig { returns(T.nilable(String)) }
            attr_reader :interop_index

            sig { params(interop_index: String).void }
            attr_writer :interop_index

            sig { returns(T.nilable(String)) }
            attr_reader :interop_version

            sig { params(interop_version: String).void }
            attr_writer :interop_version

            # JSON object.
            sig do
              params(interop_index: String, interop_version: String).returns(
                T.attached_class
              )
            end
            def self.new(interop_index: nil, interop_version: nil)
            end

            sig do
              override.returns(
                { interop_index: String, interop_version: String }
              )
            end
            def to_hash
            end
          end

          class Thumbnail < Imagekit::Internal::Type::BaseModel
            OrHash =
              T.type_alias do
                T.any(
                  Imagekit::Models::FileUploadResponse::Metadata::Exif::Thumbnail,
                  Imagekit::Internal::AnyHash
                )
              end

            sig { returns(T.nilable(Integer)) }
            attr_reader :compression

            sig { params(compression: Integer).void }
            attr_writer :compression

            sig { returns(T.nilable(Integer)) }
            attr_reader :resolution_unit

            sig { params(resolution_unit: Integer).void }
            attr_writer :resolution_unit

            sig { returns(T.nilable(Integer)) }
            attr_reader :thumbnail_length

            sig { params(thumbnail_length: Integer).void }
            attr_writer :thumbnail_length

            sig { returns(T.nilable(Integer)) }
            attr_reader :thumbnail_offset

            sig { params(thumbnail_offset: Integer).void }
            attr_writer :thumbnail_offset

            sig { returns(T.nilable(Integer)) }
            attr_reader :x_resolution

            sig { params(x_resolution: Integer).void }
            attr_writer :x_resolution

            sig { returns(T.nilable(Integer)) }
            attr_reader :y_resolution

            sig { params(y_resolution: Integer).void }
            attr_writer :y_resolution

            # Object containing Thumbnail information.
            sig do
              params(
                compression: Integer,
                resolution_unit: Integer,
                thumbnail_length: Integer,
                thumbnail_offset: Integer,
                x_resolution: Integer,
                y_resolution: Integer
              ).returns(T.attached_class)
            end
            def self.new(
              compression: nil,
              resolution_unit: nil,
              thumbnail_length: nil,
              thumbnail_offset: nil,
              x_resolution: nil,
              y_resolution: nil
            )
            end

            sig do
              override.returns(
                {
                  compression: Integer,
                  resolution_unit: Integer,
                  thumbnail_length: Integer,
                  thumbnail_offset: Integer,
                  x_resolution: Integer,
                  y_resolution: Integer
                }
              )
            end
            def to_hash
            end
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
