# typed: strong

module Imagekitio
  module Models
    class UploadPreTransformSuccessEvent < Imagekitio::Models::BaseWebhookEvent
      OrHash =
        T.type_alias do
          T.any(
            Imagekitio::UploadPreTransformSuccessEvent,
            Imagekitio::Internal::AnyHash
          )
        end

      # Timestamp of when the event occurred in ISO8601 format.
      sig { returns(Time) }
      attr_accessor :created_at

      # Object containing details of a successful upload.
      sig { returns(Imagekitio::UploadPreTransformSuccessEvent::Data) }
      attr_reader :data

      sig do
        params(
          data: Imagekitio::UploadPreTransformSuccessEvent::Data::OrHash
        ).void
      end
      attr_writer :data

      sig { returns(Imagekitio::UploadPreTransformSuccessEvent::Request) }
      attr_reader :request

      sig do
        params(
          request: Imagekitio::UploadPreTransformSuccessEvent::Request::OrHash
        ).void
      end
      attr_writer :request

      sig { returns(Symbol) }
      attr_accessor :type

      # Triggered when a pre-transformation completes successfully. The file has been
      # processed with the requested transformation and is now available in the Media
      # Library.
      sig do
        params(
          created_at: Time,
          data: Imagekitio::UploadPreTransformSuccessEvent::Data::OrHash,
          request: Imagekitio::UploadPreTransformSuccessEvent::Request::OrHash,
          type: Symbol
        ).returns(T.attached_class)
      end
      def self.new(
        # Timestamp of when the event occurred in ISO8601 format.
        created_at:,
        # Object containing details of a successful upload.
        data:,
        request:,
        type: :"upload.pre-transform.success"
      )
      end

      sig do
        override.returns(
          {
            created_at: Time,
            data: Imagekitio::UploadPreTransformSuccessEvent::Data,
            request: Imagekitio::UploadPreTransformSuccessEvent::Request,
            type: Symbol
          }
        )
      end
      def to_hash
      end

      class Data < Imagekitio::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Imagekitio::UploadPreTransformSuccessEvent::Data,
              Imagekitio::Internal::AnyHash
            )
          end

        # An array of tags assigned to the uploaded file by auto tagging.
        sig do
          returns(
            T.nilable(
              T::Array[Imagekitio::UploadPreTransformSuccessEvent::Data::AITag]
            )
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
            T.nilable(
              Imagekitio::UploadPreTransformSuccessEvent::Data::ExtensionStatus
            )
          )
        end
        attr_reader :extension_status

        sig do
          params(
            extension_status:
              Imagekitio::UploadPreTransformSuccessEvent::Data::ExtensionStatus::OrHash
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
        sig { returns(T.nilable(Imagekitio::Metadata)) }
        attr_reader :metadata

        sig { params(metadata: Imagekitio::Metadata::OrHash).void }
        attr_writer :metadata

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
            T.nilable(
              T::Hash[
                Symbol,
                Imagekitio::UploadPreTransformSuccessEvent::Data::SelectedFieldsSchema
              ]
            )
          )
        end
        attr_reader :selected_fields_schema

        sig do
          params(
            selected_fields_schema:
              T::Hash[
                Symbol,
                Imagekitio::UploadPreTransformSuccessEvent::Data::SelectedFieldsSchema::OrHash
              ]
          ).void
        end
        attr_writer :selected_fields_schema

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
          returns(
            T.nilable(
              Imagekitio::UploadPreTransformSuccessEvent::Data::VersionInfo
            )
          )
        end
        attr_reader :version_info

        sig do
          params(
            version_info:
              Imagekitio::UploadPreTransformSuccessEvent::Data::VersionInfo::OrHash
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
                T::Array[
                  Imagekitio::UploadPreTransformSuccessEvent::Data::AITag::OrHash
                ]
              ),
            audio_codec: String,
            bit_rate: Integer,
            custom_coordinates: T.nilable(String),
            custom_metadata: T::Hash[Symbol, T.anything],
            description: String,
            duration: Integer,
            embedded_metadata: T::Hash[Symbol, T.anything],
            extension_status:
              Imagekitio::UploadPreTransformSuccessEvent::Data::ExtensionStatus::OrHash,
            file_id: String,
            file_path: String,
            file_type: String,
            height: Float,
            is_private_file: T::Boolean,
            is_published: T::Boolean,
            metadata: Imagekitio::Metadata::OrHash,
            name: String,
            selected_fields_schema:
              T::Hash[
                Symbol,
                Imagekitio::UploadPreTransformSuccessEvent::Data::SelectedFieldsSchema::OrHash
              ],
            size: Float,
            tags: T.nilable(T::Array[String]),
            thumbnail_url: String,
            url: String,
            version_info:
              Imagekitio::UploadPreTransformSuccessEvent::Data::VersionInfo::OrHash,
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
          # This field is included in the response only if the Path policy feature is
          # available in the plan. It contains schema definitions for the custom metadata
          # fields selected for the specified file path. Field selection can only be done
          # when the Path policy feature is enabled.
          #
          # Keys are the names of the custom metadata fields; the value object has details
          # about the custom metadata schema.
          selected_fields_schema: nil,
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
                T.nilable(
                  T::Array[
                    Imagekitio::UploadPreTransformSuccessEvent::Data::AITag
                  ]
                ),
              audio_codec: String,
              bit_rate: Integer,
              custom_coordinates: T.nilable(String),
              custom_metadata: T::Hash[Symbol, T.anything],
              description: String,
              duration: Integer,
              embedded_metadata: T::Hash[Symbol, T.anything],
              extension_status:
                Imagekitio::UploadPreTransformSuccessEvent::Data::ExtensionStatus,
              file_id: String,
              file_path: String,
              file_type: String,
              height: Float,
              is_private_file: T::Boolean,
              is_published: T::Boolean,
              metadata: Imagekitio::Metadata,
              name: String,
              selected_fields_schema:
                T::Hash[
                  Symbol,
                  Imagekitio::UploadPreTransformSuccessEvent::Data::SelectedFieldsSchema
                ],
              size: Float,
              tags: T.nilable(T::Array[String]),
              thumbnail_url: String,
              url: String,
              version_info:
                Imagekitio::UploadPreTransformSuccessEvent::Data::VersionInfo,
              video_codec: String,
              width: Float
            }
          )
        end
        def to_hash
        end

        class AITag < Imagekitio::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Imagekitio::UploadPreTransformSuccessEvent::Data::AITag,
                Imagekitio::Internal::AnyHash
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
            override.returns(
              { confidence: Float, name: String, source: String }
            )
          end
          def to_hash
          end
        end

        class ExtensionStatus < Imagekitio::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Imagekitio::UploadPreTransformSuccessEvent::Data::ExtensionStatus,
                Imagekitio::Internal::AnyHash
              )
            end

          sig do
            returns(
              T.nilable(
                Imagekitio::UploadPreTransformSuccessEvent::Data::ExtensionStatus::AIAutoDescription::TaggedSymbol
              )
            )
          end
          attr_reader :ai_auto_description

          sig do
            params(
              ai_auto_description:
                Imagekitio::UploadPreTransformSuccessEvent::Data::ExtensionStatus::AIAutoDescription::OrSymbol
            ).void
          end
          attr_writer :ai_auto_description

          sig do
            returns(
              T.nilable(
                Imagekitio::UploadPreTransformSuccessEvent::Data::ExtensionStatus::AwsAutoTagging::TaggedSymbol
              )
            )
          end
          attr_reader :aws_auto_tagging

          sig do
            params(
              aws_auto_tagging:
                Imagekitio::UploadPreTransformSuccessEvent::Data::ExtensionStatus::AwsAutoTagging::OrSymbol
            ).void
          end
          attr_writer :aws_auto_tagging

          sig do
            returns(
              T.nilable(
                Imagekitio::UploadPreTransformSuccessEvent::Data::ExtensionStatus::GoogleAutoTagging::TaggedSymbol
              )
            )
          end
          attr_reader :google_auto_tagging

          sig do
            params(
              google_auto_tagging:
                Imagekitio::UploadPreTransformSuccessEvent::Data::ExtensionStatus::GoogleAutoTagging::OrSymbol
            ).void
          end
          attr_writer :google_auto_tagging

          sig do
            returns(
              T.nilable(
                Imagekitio::UploadPreTransformSuccessEvent::Data::ExtensionStatus::RemoveBg::TaggedSymbol
              )
            )
          end
          attr_reader :remove_bg

          sig do
            params(
              remove_bg:
                Imagekitio::UploadPreTransformSuccessEvent::Data::ExtensionStatus::RemoveBg::OrSymbol
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
                Imagekitio::UploadPreTransformSuccessEvent::Data::ExtensionStatus::AIAutoDescription::OrSymbol,
              aws_auto_tagging:
                Imagekitio::UploadPreTransformSuccessEvent::Data::ExtensionStatus::AwsAutoTagging::OrSymbol,
              google_auto_tagging:
                Imagekitio::UploadPreTransformSuccessEvent::Data::ExtensionStatus::GoogleAutoTagging::OrSymbol,
              remove_bg:
                Imagekitio::UploadPreTransformSuccessEvent::Data::ExtensionStatus::RemoveBg::OrSymbol
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
                  Imagekitio::UploadPreTransformSuccessEvent::Data::ExtensionStatus::AIAutoDescription::TaggedSymbol,
                aws_auto_tagging:
                  Imagekitio::UploadPreTransformSuccessEvent::Data::ExtensionStatus::AwsAutoTagging::TaggedSymbol,
                google_auto_tagging:
                  Imagekitio::UploadPreTransformSuccessEvent::Data::ExtensionStatus::GoogleAutoTagging::TaggedSymbol,
                remove_bg:
                  Imagekitio::UploadPreTransformSuccessEvent::Data::ExtensionStatus::RemoveBg::TaggedSymbol
              }
            )
          end
          def to_hash
          end

          module AIAutoDescription
            extend Imagekitio::Internal::Type::Enum

            TaggedSymbol =
              T.type_alias do
                T.all(
                  Symbol,
                  Imagekitio::UploadPreTransformSuccessEvent::Data::ExtensionStatus::AIAutoDescription
                )
              end
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            SUCCESS =
              T.let(
                :success,
                Imagekitio::UploadPreTransformSuccessEvent::Data::ExtensionStatus::AIAutoDescription::TaggedSymbol
              )
            PENDING =
              T.let(
                :pending,
                Imagekitio::UploadPreTransformSuccessEvent::Data::ExtensionStatus::AIAutoDescription::TaggedSymbol
              )
            FAILED =
              T.let(
                :failed,
                Imagekitio::UploadPreTransformSuccessEvent::Data::ExtensionStatus::AIAutoDescription::TaggedSymbol
              )

            sig do
              override.returns(
                T::Array[
                  Imagekitio::UploadPreTransformSuccessEvent::Data::ExtensionStatus::AIAutoDescription::TaggedSymbol
                ]
              )
            end
            def self.values
            end
          end

          module AwsAutoTagging
            extend Imagekitio::Internal::Type::Enum

            TaggedSymbol =
              T.type_alias do
                T.all(
                  Symbol,
                  Imagekitio::UploadPreTransformSuccessEvent::Data::ExtensionStatus::AwsAutoTagging
                )
              end
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            SUCCESS =
              T.let(
                :success,
                Imagekitio::UploadPreTransformSuccessEvent::Data::ExtensionStatus::AwsAutoTagging::TaggedSymbol
              )
            PENDING =
              T.let(
                :pending,
                Imagekitio::UploadPreTransformSuccessEvent::Data::ExtensionStatus::AwsAutoTagging::TaggedSymbol
              )
            FAILED =
              T.let(
                :failed,
                Imagekitio::UploadPreTransformSuccessEvent::Data::ExtensionStatus::AwsAutoTagging::TaggedSymbol
              )

            sig do
              override.returns(
                T::Array[
                  Imagekitio::UploadPreTransformSuccessEvent::Data::ExtensionStatus::AwsAutoTagging::TaggedSymbol
                ]
              )
            end
            def self.values
            end
          end

          module GoogleAutoTagging
            extend Imagekitio::Internal::Type::Enum

            TaggedSymbol =
              T.type_alias do
                T.all(
                  Symbol,
                  Imagekitio::UploadPreTransformSuccessEvent::Data::ExtensionStatus::GoogleAutoTagging
                )
              end
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            SUCCESS =
              T.let(
                :success,
                Imagekitio::UploadPreTransformSuccessEvent::Data::ExtensionStatus::GoogleAutoTagging::TaggedSymbol
              )
            PENDING =
              T.let(
                :pending,
                Imagekitio::UploadPreTransformSuccessEvent::Data::ExtensionStatus::GoogleAutoTagging::TaggedSymbol
              )
            FAILED =
              T.let(
                :failed,
                Imagekitio::UploadPreTransformSuccessEvent::Data::ExtensionStatus::GoogleAutoTagging::TaggedSymbol
              )

            sig do
              override.returns(
                T::Array[
                  Imagekitio::UploadPreTransformSuccessEvent::Data::ExtensionStatus::GoogleAutoTagging::TaggedSymbol
                ]
              )
            end
            def self.values
            end
          end

          module RemoveBg
            extend Imagekitio::Internal::Type::Enum

            TaggedSymbol =
              T.type_alias do
                T.all(
                  Symbol,
                  Imagekitio::UploadPreTransformSuccessEvent::Data::ExtensionStatus::RemoveBg
                )
              end
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            SUCCESS =
              T.let(
                :success,
                Imagekitio::UploadPreTransformSuccessEvent::Data::ExtensionStatus::RemoveBg::TaggedSymbol
              )
            PENDING =
              T.let(
                :pending,
                Imagekitio::UploadPreTransformSuccessEvent::Data::ExtensionStatus::RemoveBg::TaggedSymbol
              )
            FAILED =
              T.let(
                :failed,
                Imagekitio::UploadPreTransformSuccessEvent::Data::ExtensionStatus::RemoveBg::TaggedSymbol
              )

            sig do
              override.returns(
                T::Array[
                  Imagekitio::UploadPreTransformSuccessEvent::Data::ExtensionStatus::RemoveBg::TaggedSymbol
                ]
              )
            end
            def self.values
            end
          end
        end

        class SelectedFieldsSchema < Imagekitio::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Imagekitio::UploadPreTransformSuccessEvent::Data::SelectedFieldsSchema,
                Imagekitio::Internal::AnyHash
              )
            end

          # Type of the custom metadata field.
          sig do
            returns(
              Imagekitio::UploadPreTransformSuccessEvent::Data::SelectedFieldsSchema::Type::TaggedSymbol
            )
          end
          attr_accessor :type

          # The default value for this custom metadata field. The value should match the
          # `type` of custom metadata field.
          sig do
            returns(
              T.nilable(
                Imagekitio::UploadPreTransformSuccessEvent::Data::SelectedFieldsSchema::DefaultValue::Variants
              )
            )
          end
          attr_reader :default_value

          sig do
            params(
              default_value:
                Imagekitio::UploadPreTransformSuccessEvent::Data::SelectedFieldsSchema::DefaultValue::Variants
            ).void
          end
          attr_writer :default_value

          # Specifies if the custom metadata field is required or not.
          sig { returns(T.nilable(T::Boolean)) }
          attr_reader :is_value_required

          sig { params(is_value_required: T::Boolean).void }
          attr_writer :is_value_required

          # Maximum length of string. Only set if `type` is set to `Text` or `Textarea`.
          sig { returns(T.nilable(Float)) }
          attr_reader :max_length

          sig { params(max_length: Float).void }
          attr_writer :max_length

          # Maximum value of the field. Only set if field type is `Date` or `Number`. For
          # `Date` type field, the value will be in ISO8601 string format. For `Number` type
          # field, it will be a numeric value.
          sig do
            returns(
              T.nilable(
                Imagekitio::UploadPreTransformSuccessEvent::Data::SelectedFieldsSchema::MaxValue::Variants
              )
            )
          end
          attr_reader :max_value

          sig do
            params(
              max_value:
                Imagekitio::UploadPreTransformSuccessEvent::Data::SelectedFieldsSchema::MaxValue::Variants
            ).void
          end
          attr_writer :max_value

          # Minimum length of string. Only set if `type` is set to `Text` or `Textarea`.
          sig { returns(T.nilable(Float)) }
          attr_reader :min_length

          sig { params(min_length: Float).void }
          attr_writer :min_length

          # Minimum value of the field. Only set if field type is `Date` or `Number`. For
          # `Date` type field, the value will be in ISO8601 string format. For `Number` type
          # field, it will be a numeric value.
          sig do
            returns(
              T.nilable(
                Imagekitio::UploadPreTransformSuccessEvent::Data::SelectedFieldsSchema::MinValue::Variants
              )
            )
          end
          attr_reader :min_value

          sig do
            params(
              min_value:
                Imagekitio::UploadPreTransformSuccessEvent::Data::SelectedFieldsSchema::MinValue::Variants
            ).void
          end
          attr_writer :min_value

          # Indicates whether the custom metadata field is read only. A read only field
          # cannot be modified after being set. This field is configurable only via the
          # **Path policy** feature.
          sig { returns(T.nilable(T::Boolean)) }
          attr_reader :read_only

          sig { params(read_only: T::Boolean).void }
          attr_writer :read_only

          # An array of allowed values when field type is `SingleSelect` or `MultiSelect`.
          sig do
            returns(
              T.nilable(
                T::Array[
                  Imagekitio::UploadPreTransformSuccessEvent::Data::SelectedFieldsSchema::SelectOption::Variants
                ]
              )
            )
          end
          attr_reader :select_options

          sig do
            params(
              select_options:
                T::Array[
                  Imagekitio::UploadPreTransformSuccessEvent::Data::SelectedFieldsSchema::SelectOption::Variants
                ]
            ).void
          end
          attr_writer :select_options

          # Specifies if the selectOptions array is truncated. It is truncated when number
          # of options are > 100.
          sig { returns(T.nilable(T::Boolean)) }
          attr_reader :select_options_truncated

          sig { params(select_options_truncated: T::Boolean).void }
          attr_writer :select_options_truncated

          sig do
            params(
              type:
                Imagekitio::UploadPreTransformSuccessEvent::Data::SelectedFieldsSchema::Type::OrSymbol,
              default_value:
                Imagekitio::UploadPreTransformSuccessEvent::Data::SelectedFieldsSchema::DefaultValue::Variants,
              is_value_required: T::Boolean,
              max_length: Float,
              max_value:
                Imagekitio::UploadPreTransformSuccessEvent::Data::SelectedFieldsSchema::MaxValue::Variants,
              min_length: Float,
              min_value:
                Imagekitio::UploadPreTransformSuccessEvent::Data::SelectedFieldsSchema::MinValue::Variants,
              read_only: T::Boolean,
              select_options:
                T::Array[
                  Imagekitio::UploadPreTransformSuccessEvent::Data::SelectedFieldsSchema::SelectOption::Variants
                ],
              select_options_truncated: T::Boolean
            ).returns(T.attached_class)
          end
          def self.new(
            # Type of the custom metadata field.
            type:,
            # The default value for this custom metadata field. The value should match the
            # `type` of custom metadata field.
            default_value: nil,
            # Specifies if the custom metadata field is required or not.
            is_value_required: nil,
            # Maximum length of string. Only set if `type` is set to `Text` or `Textarea`.
            max_length: nil,
            # Maximum value of the field. Only set if field type is `Date` or `Number`. For
            # `Date` type field, the value will be in ISO8601 string format. For `Number` type
            # field, it will be a numeric value.
            max_value: nil,
            # Minimum length of string. Only set if `type` is set to `Text` or `Textarea`.
            min_length: nil,
            # Minimum value of the field. Only set if field type is `Date` or `Number`. For
            # `Date` type field, the value will be in ISO8601 string format. For `Number` type
            # field, it will be a numeric value.
            min_value: nil,
            # Indicates whether the custom metadata field is read only. A read only field
            # cannot be modified after being set. This field is configurable only via the
            # **Path policy** feature.
            read_only: nil,
            # An array of allowed values when field type is `SingleSelect` or `MultiSelect`.
            select_options: nil,
            # Specifies if the selectOptions array is truncated. It is truncated when number
            # of options are > 100.
            select_options_truncated: nil
          )
          end

          sig do
            override.returns(
              {
                type:
                  Imagekitio::UploadPreTransformSuccessEvent::Data::SelectedFieldsSchema::Type::TaggedSymbol,
                default_value:
                  Imagekitio::UploadPreTransformSuccessEvent::Data::SelectedFieldsSchema::DefaultValue::Variants,
                is_value_required: T::Boolean,
                max_length: Float,
                max_value:
                  Imagekitio::UploadPreTransformSuccessEvent::Data::SelectedFieldsSchema::MaxValue::Variants,
                min_length: Float,
                min_value:
                  Imagekitio::UploadPreTransformSuccessEvent::Data::SelectedFieldsSchema::MinValue::Variants,
                read_only: T::Boolean,
                select_options:
                  T::Array[
                    Imagekitio::UploadPreTransformSuccessEvent::Data::SelectedFieldsSchema::SelectOption::Variants
                  ],
                select_options_truncated: T::Boolean
              }
            )
          end
          def to_hash
          end

          # Type of the custom metadata field.
          module Type
            extend Imagekitio::Internal::Type::Enum

            TaggedSymbol =
              T.type_alias do
                T.all(
                  Symbol,
                  Imagekitio::UploadPreTransformSuccessEvent::Data::SelectedFieldsSchema::Type
                )
              end
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            TEXT =
              T.let(
                :Text,
                Imagekitio::UploadPreTransformSuccessEvent::Data::SelectedFieldsSchema::Type::TaggedSymbol
              )
            TEXTAREA =
              T.let(
                :Textarea,
                Imagekitio::UploadPreTransformSuccessEvent::Data::SelectedFieldsSchema::Type::TaggedSymbol
              )
            NUMBER =
              T.let(
                :Number,
                Imagekitio::UploadPreTransformSuccessEvent::Data::SelectedFieldsSchema::Type::TaggedSymbol
              )
            DATE =
              T.let(
                :Date,
                Imagekitio::UploadPreTransformSuccessEvent::Data::SelectedFieldsSchema::Type::TaggedSymbol
              )
            BOOLEAN =
              T.let(
                :Boolean,
                Imagekitio::UploadPreTransformSuccessEvent::Data::SelectedFieldsSchema::Type::TaggedSymbol
              )
            SINGLE_SELECT =
              T.let(
                :SingleSelect,
                Imagekitio::UploadPreTransformSuccessEvent::Data::SelectedFieldsSchema::Type::TaggedSymbol
              )
            MULTI_SELECT =
              T.let(
                :MultiSelect,
                Imagekitio::UploadPreTransformSuccessEvent::Data::SelectedFieldsSchema::Type::TaggedSymbol
              )

            sig do
              override.returns(
                T::Array[
                  Imagekitio::UploadPreTransformSuccessEvent::Data::SelectedFieldsSchema::Type::TaggedSymbol
                ]
              )
            end
            def self.values
            end
          end

          # The default value for this custom metadata field. The value should match the
          # `type` of custom metadata field.
          module DefaultValue
            extend Imagekitio::Internal::Type::Union

            Variants =
              T.type_alias do
                T.any(
                  String,
                  Float,
                  T::Boolean,
                  T::Array[
                    Imagekitio::UploadPreTransformSuccessEvent::Data::SelectedFieldsSchema::DefaultValue::Mixed::Variants
                  ]
                )
              end

            module Mixed
              extend Imagekitio::Internal::Type::Union

              Variants = T.type_alias { T.any(String, Float, T::Boolean) }

              sig do
                override.returns(
                  T::Array[
                    Imagekitio::UploadPreTransformSuccessEvent::Data::SelectedFieldsSchema::DefaultValue::Mixed::Variants
                  ]
                )
              end
              def self.variants
              end
            end

            sig do
              override.returns(
                T::Array[
                  Imagekitio::UploadPreTransformSuccessEvent::Data::SelectedFieldsSchema::DefaultValue::Variants
                ]
              )
            end
            def self.variants
            end

            MixedArray =
              T.let(
                Imagekitio::Internal::Type::ArrayOf[
                  union:
                    Imagekitio::UploadPreTransformSuccessEvent::Data::SelectedFieldsSchema::DefaultValue::Mixed
                ],
                Imagekitio::Internal::Type::Converter
              )
          end

          # Maximum value of the field. Only set if field type is `Date` or `Number`. For
          # `Date` type field, the value will be in ISO8601 string format. For `Number` type
          # field, it will be a numeric value.
          module MaxValue
            extend Imagekitio::Internal::Type::Union

            Variants = T.type_alias { T.any(String, Float) }

            sig do
              override.returns(
                T::Array[
                  Imagekitio::UploadPreTransformSuccessEvent::Data::SelectedFieldsSchema::MaxValue::Variants
                ]
              )
            end
            def self.variants
            end
          end

          # Minimum value of the field. Only set if field type is `Date` or `Number`. For
          # `Date` type field, the value will be in ISO8601 string format. For `Number` type
          # field, it will be a numeric value.
          module MinValue
            extend Imagekitio::Internal::Type::Union

            Variants = T.type_alias { T.any(String, Float) }

            sig do
              override.returns(
                T::Array[
                  Imagekitio::UploadPreTransformSuccessEvent::Data::SelectedFieldsSchema::MinValue::Variants
                ]
              )
            end
            def self.variants
            end
          end

          module SelectOption
            extend Imagekitio::Internal::Type::Union

            Variants = T.type_alias { T.any(String, Float, T::Boolean) }

            sig do
              override.returns(
                T::Array[
                  Imagekitio::UploadPreTransformSuccessEvent::Data::SelectedFieldsSchema::SelectOption::Variants
                ]
              )
            end
            def self.variants
            end
          end
        end

        class VersionInfo < Imagekitio::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Imagekitio::UploadPreTransformSuccessEvent::Data::VersionInfo,
                Imagekitio::Internal::AnyHash
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

      class Request < Imagekitio::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Imagekitio::UploadPreTransformSuccessEvent::Request,
              Imagekitio::Internal::AnyHash
            )
          end

        # The requested pre-transformation string.
        sig { returns(String) }
        attr_accessor :transformation

        # Unique identifier for the originating request.
        sig { returns(String) }
        attr_accessor :x_request_id

        sig do
          params(transformation: String, x_request_id: String).returns(
            T.attached_class
          )
        end
        def self.new(
          # The requested pre-transformation string.
          transformation:,
          # Unique identifier for the originating request.
          x_request_id:
        )
        end

        sig do
          override.returns({ transformation: String, x_request_id: String })
        end
        def to_hash
        end
      end
    end
  end
end
