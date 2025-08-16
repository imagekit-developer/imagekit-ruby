# typed: strong

module Imagekit
  module Models
    class FileUploadV2Response < Imagekit::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            Imagekit::Models::FileUploadV2Response,
            Imagekit::Internal::AnyHash
          )
        end

      # An array of tags assigned to the uploaded file by auto tagging.
      sig do
        returns(
          T.nilable(T::Array[Imagekit::Models::FileUploadV2Response::AITag])
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
      sig do
        returns(
          T.nilable(Imagekit::Models::FileUploadV2Response::EmbeddedMetadata)
        )
      end
      attr_reader :embedded_metadata

      sig do
        params(
          embedded_metadata:
            Imagekit::Models::FileUploadV2Response::EmbeddedMetadata::OrHash
        ).void
      end
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
          T.nilable(Imagekit::Models::FileUploadV2Response::ExtensionStatus)
        )
      end
      attr_reader :extension_status

      sig do
        params(
          extension_status:
            Imagekit::Models::FileUploadV2Response::ExtensionStatus::OrHash
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
      sig do
        returns(T.nilable(Imagekit::Models::FileUploadV2Response::Metadata))
      end
      attr_reader :metadata

      sig do
        params(
          metadata: Imagekit::Models::FileUploadV2Response::Metadata::OrHash
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
        returns(T.nilable(Imagekit::Models::FileUploadV2Response::VersionInfo))
      end
      attr_reader :version_info

      sig do
        params(
          version_info:
            Imagekit::Models::FileUploadV2Response::VersionInfo::OrHash
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
              T::Array[Imagekit::Models::FileUploadV2Response::AITag::OrHash]
            ),
          audio_codec: String,
          bit_rate: Integer,
          custom_coordinates: T.nilable(String),
          custom_metadata: T.anything,
          duration: Integer,
          embedded_metadata:
            Imagekit::Models::FileUploadV2Response::EmbeddedMetadata::OrHash,
          extension_status:
            Imagekit::Models::FileUploadV2Response::ExtensionStatus::OrHash,
          file_id: String,
          file_path: String,
          file_type: String,
          height: Float,
          is_private_file: T::Boolean,
          is_published: T::Boolean,
          metadata: Imagekit::Models::FileUploadV2Response::Metadata::OrHash,
          name: String,
          size: Float,
          tags: T.nilable(T::Array[String]),
          thumbnail_url: String,
          url: String,
          version_info:
            Imagekit::Models::FileUploadV2Response::VersionInfo::OrHash,
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
              T.nilable(
                T::Array[Imagekit::Models::FileUploadV2Response::AITag]
              ),
            audio_codec: String,
            bit_rate: Integer,
            custom_coordinates: T.nilable(String),
            custom_metadata: T.anything,
            duration: Integer,
            embedded_metadata:
              Imagekit::Models::FileUploadV2Response::EmbeddedMetadata,
            extension_status:
              Imagekit::Models::FileUploadV2Response::ExtensionStatus,
            file_id: String,
            file_path: String,
            file_type: String,
            height: Float,
            is_private_file: T::Boolean,
            is_published: T::Boolean,
            metadata: Imagekit::Models::FileUploadV2Response::Metadata,
            name: String,
            size: Float,
            tags: T.nilable(T::Array[String]),
            thumbnail_url: String,
            url: String,
            version_info: Imagekit::Models::FileUploadV2Response::VersionInfo,
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
              Imagekit::Models::FileUploadV2Response::AITag,
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

      class EmbeddedMetadata < Imagekit::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Imagekit::Models::FileUploadV2Response::EmbeddedMetadata,
              Imagekit::Internal::AnyHash
            )
          end

        sig { returns(T.nilable(String)) }
        attr_reader :about_cv_term_cv_id

        sig { params(about_cv_term_cv_id: String).void }
        attr_writer :about_cv_term_cv_id

        sig { returns(T.nilable(String)) }
        attr_reader :about_cv_term_id

        sig { params(about_cv_term_id: String).void }
        attr_writer :about_cv_term_id

        sig { returns(T.nilable(String)) }
        attr_reader :about_cv_term_name

        sig { params(about_cv_term_name: String).void }
        attr_writer :about_cv_term_name

        sig { returns(T.nilable(String)) }
        attr_reader :about_cv_term_refined_about

        sig { params(about_cv_term_refined_about: String).void }
        attr_writer :about_cv_term_refined_about

        sig { returns(T.nilable(String)) }
        attr_reader :additional_model_information

        sig { params(additional_model_information: String).void }
        attr_writer :additional_model_information

        sig { returns(T.nilable(Integer)) }
        attr_reader :application_record_version

        sig { params(application_record_version: Integer).void }
        attr_writer :application_record_version

        sig { returns(T.nilable(String)) }
        attr_reader :artist

        sig { params(artist: String).void }
        attr_writer :artist

        sig { returns(T.nilable(String)) }
        attr_reader :artwork_circa_date_created

        sig { params(artwork_circa_date_created: String).void }
        attr_writer :artwork_circa_date_created

        sig { returns(T.nilable(String)) }
        attr_reader :artwork_content_description

        sig { params(artwork_content_description: String).void }
        attr_writer :artwork_content_description

        sig { returns(T.nilable(String)) }
        attr_reader :artwork_contribution_description

        sig { params(artwork_contribution_description: String).void }
        attr_writer :artwork_contribution_description

        sig { returns(T.nilable(String)) }
        attr_reader :artwork_copyright_notice

        sig { params(artwork_copyright_notice: String).void }
        attr_writer :artwork_copyright_notice

        sig { returns(T.nilable(String)) }
        attr_reader :artwork_copyright_owner_id

        sig { params(artwork_copyright_owner_id: String).void }
        attr_writer :artwork_copyright_owner_id

        sig { returns(T.nilable(String)) }
        attr_reader :artwork_copyright_owner_name

        sig { params(artwork_copyright_owner_name: String).void }
        attr_writer :artwork_copyright_owner_name

        sig { returns(T.nilable(T::Array[String])) }
        attr_reader :artwork_creator

        sig { params(artwork_creator: T::Array[String]).void }
        attr_writer :artwork_creator

        sig { returns(T.nilable(T::Array[String])) }
        attr_reader :artwork_creator_id

        sig { params(artwork_creator_id: T::Array[String]).void }
        attr_writer :artwork_creator_id

        sig { returns(T.nilable(Time)) }
        attr_reader :artwork_date_created

        sig { params(artwork_date_created: Time).void }
        attr_writer :artwork_date_created

        sig { returns(T.nilable(String)) }
        attr_reader :artwork_licensor_id

        sig { params(artwork_licensor_id: String).void }
        attr_writer :artwork_licensor_id

        sig { returns(T.nilable(String)) }
        attr_reader :artwork_licensor_name

        sig { params(artwork_licensor_name: String).void }
        attr_writer :artwork_licensor_name

        sig { returns(T.nilable(String)) }
        attr_reader :artwork_physical_description

        sig { params(artwork_physical_description: String).void }
        attr_writer :artwork_physical_description

        sig { returns(T.nilable(String)) }
        attr_reader :artwork_source

        sig { params(artwork_source: String).void }
        attr_writer :artwork_source

        sig { returns(T.nilable(String)) }
        attr_reader :artwork_source_inventory_no

        sig { params(artwork_source_inventory_no: String).void }
        attr_writer :artwork_source_inventory_no

        sig { returns(T.nilable(String)) }
        attr_reader :artwork_source_inv_url

        sig { params(artwork_source_inv_url: String).void }
        attr_writer :artwork_source_inv_url

        sig { returns(T.nilable(T::Array[String])) }
        attr_reader :artwork_style_period

        sig { params(artwork_style_period: T::Array[String]).void }
        attr_writer :artwork_style_period

        sig { returns(T.nilable(String)) }
        attr_reader :artwork_title

        sig { params(artwork_title: String).void }
        attr_writer :artwork_title

        sig { returns(T.nilable(String)) }
        attr_reader :authors_position

        sig { params(authors_position: String).void }
        attr_writer :authors_position

        sig { returns(T.nilable(String)) }
        attr_reader :byline

        sig { params(byline: String).void }
        attr_writer :byline

        sig { returns(T.nilable(String)) }
        attr_reader :byline_title

        sig { params(byline_title: String).void }
        attr_writer :byline_title

        sig { returns(T.nilable(String)) }
        attr_reader :caption

        sig { params(caption: String).void }
        attr_writer :caption

        sig { returns(T.nilable(String)) }
        attr_reader :caption_abstract

        sig { params(caption_abstract: String).void }
        attr_writer :caption_abstract

        sig { returns(T.nilable(String)) }
        attr_reader :caption_writer

        sig { params(caption_writer: String).void }
        attr_writer :caption_writer

        sig { returns(T.nilable(String)) }
        attr_reader :city

        sig { params(city: String).void }
        attr_writer :city

        sig { returns(T.nilable(String)) }
        attr_reader :color_space

        sig { params(color_space: String).void }
        attr_writer :color_space

        sig { returns(T.nilable(String)) }
        attr_reader :components_configuration

        sig { params(components_configuration: String).void }
        attr_writer :components_configuration

        sig { returns(T.nilable(String)) }
        attr_reader :copyright

        sig { params(copyright: String).void }
        attr_writer :copyright

        sig { returns(T.nilable(String)) }
        attr_reader :copyright_notice

        sig { params(copyright_notice: String).void }
        attr_writer :copyright_notice

        sig { returns(T.nilable(T::Array[String])) }
        attr_reader :copyright_owner_id

        sig { params(copyright_owner_id: T::Array[String]).void }
        attr_writer :copyright_owner_id

        sig { returns(T.nilable(T::Array[String])) }
        attr_reader :copyright_owner_name

        sig { params(copyright_owner_name: T::Array[String]).void }
        attr_writer :copyright_owner_name

        sig { returns(T.nilable(String)) }
        attr_reader :country

        sig { params(country: String).void }
        attr_writer :country

        sig { returns(T.nilable(String)) }
        attr_reader :country_code

        sig { params(country_code: String).void }
        attr_writer :country_code

        sig { returns(T.nilable(String)) }
        attr_reader :country_primary_location_code

        sig { params(country_primary_location_code: String).void }
        attr_writer :country_primary_location_code

        sig { returns(T.nilable(String)) }
        attr_reader :country_primary_location_name

        sig { params(country_primary_location_name: String).void }
        attr_writer :country_primary_location_name

        sig { returns(T.nilable(String)) }
        attr_reader :creator

        sig { params(creator: String).void }
        attr_writer :creator

        sig { returns(T.nilable(String)) }
        attr_reader :creator_address

        sig { params(creator_address: String).void }
        attr_writer :creator_address

        sig { returns(T.nilable(String)) }
        attr_reader :creator_city

        sig { params(creator_city: String).void }
        attr_writer :creator_city

        sig { returns(T.nilable(String)) }
        attr_reader :creator_country

        sig { params(creator_country: String).void }
        attr_writer :creator_country

        sig { returns(T.nilable(String)) }
        attr_reader :creator_postal_code

        sig { params(creator_postal_code: String).void }
        attr_writer :creator_postal_code

        sig { returns(T.nilable(String)) }
        attr_reader :creator_region

        sig { params(creator_region: String).void }
        attr_writer :creator_region

        sig { returns(T.nilable(String)) }
        attr_reader :creator_work_email

        sig { params(creator_work_email: String).void }
        attr_writer :creator_work_email

        sig { returns(T.nilable(String)) }
        attr_reader :creator_work_telephone

        sig { params(creator_work_telephone: String).void }
        attr_writer :creator_work_telephone

        sig { returns(T.nilable(String)) }
        attr_reader :creator_work_url

        sig { params(creator_work_url: String).void }
        attr_writer :creator_work_url

        sig { returns(T.nilable(String)) }
        attr_reader :credit

        sig { params(credit: String).void }
        attr_writer :credit

        sig { returns(T.nilable(Time)) }
        attr_reader :date_created

        sig { params(date_created: Time).void }
        attr_writer :date_created

        sig { returns(T.nilable(Time)) }
        attr_reader :date_time_created

        sig { params(date_time_created: Time).void }
        attr_writer :date_time_created

        sig { returns(T.nilable(Time)) }
        attr_reader :date_time_original

        sig { params(date_time_original: Time).void }
        attr_writer :date_time_original

        sig { returns(T.nilable(String)) }
        attr_reader :description

        sig { params(description: String).void }
        attr_writer :description

        sig { returns(T.nilable(String)) }
        attr_reader :digital_image_guid

        sig { params(digital_image_guid: String).void }
        attr_writer :digital_image_guid

        sig { returns(T.nilable(String)) }
        attr_reader :digital_source_type

        sig { params(digital_source_type: String).void }
        attr_writer :digital_source_type

        sig { returns(T.nilable(String)) }
        attr_reader :embedded_encoded_rights_expr

        sig { params(embedded_encoded_rights_expr: String).void }
        attr_writer :embedded_encoded_rights_expr

        sig { returns(T.nilable(String)) }
        attr_reader :embedded_encoded_rights_expr_lang_id

        sig { params(embedded_encoded_rights_expr_lang_id: String).void }
        attr_writer :embedded_encoded_rights_expr_lang_id

        sig { returns(T.nilable(String)) }
        attr_reader :embedded_encoded_rights_expr_type

        sig { params(embedded_encoded_rights_expr_type: String).void }
        attr_writer :embedded_encoded_rights_expr_type

        sig { returns(T.nilable(String)) }
        attr_reader :event

        sig { params(event: String).void }
        attr_writer :event

        sig { returns(T.nilable(String)) }
        attr_reader :exif_version

        sig { params(exif_version: String).void }
        attr_writer :exif_version

        sig { returns(T.nilable(String)) }
        attr_reader :flashpix_version

        sig { params(flashpix_version: String).void }
        attr_writer :flashpix_version

        sig { returns(T.nilable(String)) }
        attr_reader :genre_cv_id

        sig { params(genre_cv_id: String).void }
        attr_writer :genre_cv_id

        sig { returns(T.nilable(String)) }
        attr_reader :genre_cv_term_id

        sig { params(genre_cv_term_id: String).void }
        attr_writer :genre_cv_term_id

        sig { returns(T.nilable(String)) }
        attr_reader :genre_cv_term_name

        sig { params(genre_cv_term_name: String).void }
        attr_writer :genre_cv_term_name

        sig { returns(T.nilable(String)) }
        attr_reader :genre_cv_term_refined_about

        sig { params(genre_cv_term_refined_about: String).void }
        attr_writer :genre_cv_term_refined_about

        sig { returns(T.nilable(String)) }
        attr_reader :headline

        sig { params(headline: String).void }
        attr_writer :headline

        sig { returns(T.nilable(String)) }
        attr_reader :image_creator_id

        sig { params(image_creator_id: String).void }
        attr_writer :image_creator_id

        sig { returns(T.nilable(String)) }
        attr_reader :image_creator_image_id

        sig { params(image_creator_image_id: String).void }
        attr_writer :image_creator_image_id

        sig { returns(T.nilable(String)) }
        attr_reader :image_creator_name

        sig { params(image_creator_name: String).void }
        attr_writer :image_creator_name

        sig { returns(T.nilable(String)) }
        attr_reader :image_description

        sig { params(image_description: String).void }
        attr_writer :image_description

        sig { returns(T.nilable(T::Array[Float])) }
        attr_reader :image_region_boundary_h

        sig { params(image_region_boundary_h: T::Array[Float]).void }
        attr_writer :image_region_boundary_h

        sig { returns(T.nilable(T::Array[Float])) }
        attr_reader :image_region_boundary_rx

        sig { params(image_region_boundary_rx: T::Array[Float]).void }
        attr_writer :image_region_boundary_rx

        sig { returns(T.nilable(T::Array[String])) }
        attr_reader :image_region_boundary_shape

        sig { params(image_region_boundary_shape: T::Array[String]).void }
        attr_writer :image_region_boundary_shape

        sig { returns(T.nilable(T::Array[String])) }
        attr_reader :image_region_boundary_unit

        sig { params(image_region_boundary_unit: T::Array[String]).void }
        attr_writer :image_region_boundary_unit

        sig { returns(T.nilable(T::Array[Float])) }
        attr_reader :image_region_boundary_vertices_x

        sig { params(image_region_boundary_vertices_x: T::Array[Float]).void }
        attr_writer :image_region_boundary_vertices_x

        sig { returns(T.nilable(T::Array[Float])) }
        attr_reader :image_region_boundary_vertices_y

        sig { params(image_region_boundary_vertices_y: T::Array[Float]).void }
        attr_writer :image_region_boundary_vertices_y

        sig { returns(T.nilable(T::Array[Float])) }
        attr_reader :image_region_boundary_w

        sig { params(image_region_boundary_w: T::Array[Float]).void }
        attr_writer :image_region_boundary_w

        sig { returns(T.nilable(T::Array[Float])) }
        attr_reader :image_region_boundary_x

        sig { params(image_region_boundary_x: T::Array[Float]).void }
        attr_writer :image_region_boundary_x

        sig { returns(T.nilable(T::Array[Float])) }
        attr_reader :image_region_boundary_y

        sig { params(image_region_boundary_y: T::Array[Float]).void }
        attr_writer :image_region_boundary_y

        sig { returns(T.nilable(T::Array[String])) }
        attr_reader :image_region_ctype_identifier

        sig { params(image_region_ctype_identifier: T::Array[String]).void }
        attr_writer :image_region_ctype_identifier

        sig { returns(T.nilable(T::Array[String])) }
        attr_reader :image_region_ctype_name

        sig { params(image_region_ctype_name: T::Array[String]).void }
        attr_writer :image_region_ctype_name

        sig { returns(T.nilable(T::Array[String])) }
        attr_reader :image_region_id

        sig { params(image_region_id: T::Array[String]).void }
        attr_writer :image_region_id

        sig { returns(T.nilable(T::Array[String])) }
        attr_reader :image_region_name

        sig { params(image_region_name: T::Array[String]).void }
        attr_writer :image_region_name

        sig { returns(T.nilable(T::Array[String])) }
        attr_reader :image_region_organisation_in_image_name

        sig do
          params(image_region_organisation_in_image_name: T::Array[String]).void
        end
        attr_writer :image_region_organisation_in_image_name

        sig { returns(T.nilable(T::Array[String])) }
        attr_reader :image_region_person_in_image

        sig { params(image_region_person_in_image: T::Array[String]).void }
        attr_writer :image_region_person_in_image

        sig { returns(T.nilable(T::Array[String])) }
        attr_reader :image_region_role_identifier

        sig { params(image_region_role_identifier: T::Array[String]).void }
        attr_writer :image_region_role_identifier

        sig { returns(T.nilable(T::Array[String])) }
        attr_reader :image_region_role_name

        sig { params(image_region_role_name: T::Array[String]).void }
        attr_writer :image_region_role_name

        sig { returns(T.nilable(String)) }
        attr_reader :image_supplier_id

        sig { params(image_supplier_id: String).void }
        attr_writer :image_supplier_id

        sig { returns(T.nilable(String)) }
        attr_reader :image_supplier_image_id

        sig { params(image_supplier_image_id: String).void }
        attr_writer :image_supplier_image_id

        sig { returns(T.nilable(String)) }
        attr_reader :image_supplier_name

        sig { params(image_supplier_name: String).void }
        attr_writer :image_supplier_name

        sig { returns(T.nilable(String)) }
        attr_reader :instructions

        sig { params(instructions: String).void }
        attr_writer :instructions

        sig { returns(T.nilable(String)) }
        attr_reader :intellectual_genre

        sig { params(intellectual_genre: String).void }
        attr_writer :intellectual_genre

        sig { returns(T.nilable(T::Array[String])) }
        attr_reader :keywords

        sig { params(keywords: T::Array[String]).void }
        attr_writer :keywords

        sig { returns(T.nilable(T::Array[String])) }
        attr_reader :licensor_city

        sig { params(licensor_city: T::Array[String]).void }
        attr_writer :licensor_city

        sig { returns(T.nilable(T::Array[String])) }
        attr_reader :licensor_country

        sig { params(licensor_country: T::Array[String]).void }
        attr_writer :licensor_country

        sig { returns(T.nilable(T::Array[String])) }
        attr_reader :licensor_email

        sig { params(licensor_email: T::Array[String]).void }
        attr_writer :licensor_email

        sig { returns(T.nilable(T::Array[String])) }
        attr_reader :licensor_extended_address

        sig { params(licensor_extended_address: T::Array[String]).void }
        attr_writer :licensor_extended_address

        sig { returns(T.nilable(T::Array[String])) }
        attr_reader :licensor_id

        sig { params(licensor_id: T::Array[String]).void }
        attr_writer :licensor_id

        sig { returns(T.nilable(T::Array[String])) }
        attr_reader :licensor_name

        sig { params(licensor_name: T::Array[String]).void }
        attr_writer :licensor_name

        sig { returns(T.nilable(T::Array[String])) }
        attr_reader :licensor_postal_code

        sig { params(licensor_postal_code: T::Array[String]).void }
        attr_writer :licensor_postal_code

        sig { returns(T.nilable(T::Array[String])) }
        attr_reader :licensor_region

        sig { params(licensor_region: T::Array[String]).void }
        attr_writer :licensor_region

        sig { returns(T.nilable(T::Array[String])) }
        attr_reader :licensor_street_address

        sig { params(licensor_street_address: T::Array[String]).void }
        attr_writer :licensor_street_address

        sig { returns(T.nilable(T::Array[String])) }
        attr_reader :licensor_telephone1

        sig { params(licensor_telephone1: T::Array[String]).void }
        attr_writer :licensor_telephone1

        sig { returns(T.nilable(T::Array[String])) }
        attr_reader :licensor_telephone2

        sig { params(licensor_telephone2: T::Array[String]).void }
        attr_writer :licensor_telephone2

        sig { returns(T.nilable(T::Array[String])) }
        attr_reader :licensor_url

        sig { params(licensor_url: T::Array[String]).void }
        attr_writer :licensor_url

        sig { returns(T.nilable(String)) }
        attr_reader :linked_encoded_rights_expr

        sig { params(linked_encoded_rights_expr: String).void }
        attr_writer :linked_encoded_rights_expr

        sig { returns(T.nilable(String)) }
        attr_reader :linked_encoded_rights_expr_lang_id

        sig { params(linked_encoded_rights_expr_lang_id: String).void }
        attr_writer :linked_encoded_rights_expr_lang_id

        sig { returns(T.nilable(String)) }
        attr_reader :linked_encoded_rights_expr_type

        sig { params(linked_encoded_rights_expr_type: String).void }
        attr_writer :linked_encoded_rights_expr_type

        sig { returns(T.nilable(String)) }
        attr_reader :location

        sig { params(location: String).void }
        attr_writer :location

        sig { returns(T.nilable(String)) }
        attr_reader :location_created_city

        sig { params(location_created_city: String).void }
        attr_writer :location_created_city

        sig { returns(T.nilable(String)) }
        attr_reader :location_created_country_code

        sig { params(location_created_country_code: String).void }
        attr_writer :location_created_country_code

        sig { returns(T.nilable(String)) }
        attr_reader :location_created_country_name

        sig { params(location_created_country_name: String).void }
        attr_writer :location_created_country_name

        sig { returns(T.nilable(String)) }
        attr_reader :location_created_gps_altitude

        sig { params(location_created_gps_altitude: String).void }
        attr_writer :location_created_gps_altitude

        sig { returns(T.nilable(String)) }
        attr_reader :location_created_gps_latitude

        sig { params(location_created_gps_latitude: String).void }
        attr_writer :location_created_gps_latitude

        sig { returns(T.nilable(String)) }
        attr_reader :location_created_gps_longitude

        sig { params(location_created_gps_longitude: String).void }
        attr_writer :location_created_gps_longitude

        sig { returns(T.nilable(String)) }
        attr_reader :location_created_location_id

        sig { params(location_created_location_id: String).void }
        attr_writer :location_created_location_id

        sig { returns(T.nilable(String)) }
        attr_reader :location_created_location_name

        sig { params(location_created_location_name: String).void }
        attr_writer :location_created_location_name

        sig { returns(T.nilable(String)) }
        attr_reader :location_created_province_state

        sig { params(location_created_province_state: String).void }
        attr_writer :location_created_province_state

        sig { returns(T.nilable(String)) }
        attr_reader :location_created_sublocation

        sig { params(location_created_sublocation: String).void }
        attr_writer :location_created_sublocation

        sig { returns(T.nilable(String)) }
        attr_reader :location_created_world_region

        sig { params(location_created_world_region: String).void }
        attr_writer :location_created_world_region

        sig { returns(T.nilable(T::Array[String])) }
        attr_reader :location_shown_city

        sig { params(location_shown_city: T::Array[String]).void }
        attr_writer :location_shown_city

        sig { returns(T.nilable(T::Array[String])) }
        attr_reader :location_shown_country_code

        sig { params(location_shown_country_code: T::Array[String]).void }
        attr_writer :location_shown_country_code

        sig { returns(T.nilable(T::Array[String])) }
        attr_reader :location_shown_country_name

        sig { params(location_shown_country_name: T::Array[String]).void }
        attr_writer :location_shown_country_name

        sig { returns(T.nilable(T::Array[String])) }
        attr_reader :location_shown_gps_altitude

        sig { params(location_shown_gps_altitude: T::Array[String]).void }
        attr_writer :location_shown_gps_altitude

        sig { returns(T.nilable(T::Array[String])) }
        attr_reader :location_shown_gps_latitude

        sig { params(location_shown_gps_latitude: T::Array[String]).void }
        attr_writer :location_shown_gps_latitude

        sig { returns(T.nilable(T::Array[String])) }
        attr_reader :location_shown_gps_longitude

        sig { params(location_shown_gps_longitude: T::Array[String]).void }
        attr_writer :location_shown_gps_longitude

        sig { returns(T.nilable(T::Array[String])) }
        attr_reader :location_shown_location_id

        sig { params(location_shown_location_id: T::Array[String]).void }
        attr_writer :location_shown_location_id

        sig { returns(T.nilable(T::Array[String])) }
        attr_reader :location_shown_location_name

        sig { params(location_shown_location_name: T::Array[String]).void }
        attr_writer :location_shown_location_name

        sig { returns(T.nilable(T::Array[String])) }
        attr_reader :location_shown_province_state

        sig { params(location_shown_province_state: T::Array[String]).void }
        attr_writer :location_shown_province_state

        sig { returns(T.nilable(T::Array[String])) }
        attr_reader :location_shown_sublocation

        sig { params(location_shown_sublocation: T::Array[String]).void }
        attr_writer :location_shown_sublocation

        sig { returns(T.nilable(T::Array[String])) }
        attr_reader :location_shown_world_region

        sig { params(location_shown_world_region: T::Array[String]).void }
        attr_writer :location_shown_world_region

        sig { returns(T.nilable(Float)) }
        attr_reader :max_avail_height

        sig { params(max_avail_height: Float).void }
        attr_writer :max_avail_height

        sig { returns(T.nilable(Float)) }
        attr_reader :max_avail_width

        sig { params(max_avail_width: Float).void }
        attr_writer :max_avail_width

        sig { returns(T.nilable(T::Array[Float])) }
        attr_reader :model_age

        sig { params(model_age: T::Array[Float]).void }
        attr_writer :model_age

        sig { returns(T.nilable(T::Array[String])) }
        attr_reader :model_release_id

        sig { params(model_release_id: T::Array[String]).void }
        attr_writer :model_release_id

        sig { returns(T.nilable(String)) }
        attr_reader :object_attribute_reference

        sig { params(object_attribute_reference: String).void }
        attr_writer :object_attribute_reference

        sig { returns(T.nilable(String)) }
        attr_reader :object_name

        sig { params(object_name: String).void }
        attr_writer :object_name

        sig { returns(T.nilable(String)) }
        attr_reader :offset_time_original

        sig { params(offset_time_original: String).void }
        attr_writer :offset_time_original

        sig { returns(T.nilable(T::Array[String])) }
        attr_reader :organisation_in_image_code

        sig { params(organisation_in_image_code: T::Array[String]).void }
        attr_writer :organisation_in_image_code

        sig { returns(T.nilable(T::Array[String])) }
        attr_reader :organisation_in_image_name

        sig { params(organisation_in_image_name: T::Array[String]).void }
        attr_writer :organisation_in_image_name

        sig { returns(T.nilable(String)) }
        attr_reader :orientation

        sig { params(orientation: String).void }
        attr_writer :orientation

        sig { returns(T.nilable(String)) }
        attr_reader :original_transmission_reference

        sig { params(original_transmission_reference: String).void }
        attr_writer :original_transmission_reference

        sig { returns(T.nilable(T::Array[String])) }
        attr_reader :person_in_image

        sig { params(person_in_image: T::Array[String]).void }
        attr_writer :person_in_image

        sig { returns(T.nilable(T::Array[String])) }
        attr_reader :person_in_image_cv_term_cv_id

        sig { params(person_in_image_cv_term_cv_id: T::Array[String]).void }
        attr_writer :person_in_image_cv_term_cv_id

        sig { returns(T.nilable(T::Array[String])) }
        attr_reader :person_in_image_cv_term_id

        sig { params(person_in_image_cv_term_id: T::Array[String]).void }
        attr_writer :person_in_image_cv_term_id

        sig { returns(T.nilable(T::Array[String])) }
        attr_reader :person_in_image_cv_term_name

        sig { params(person_in_image_cv_term_name: T::Array[String]).void }
        attr_writer :person_in_image_cv_term_name

        sig { returns(T.nilable(T::Array[String])) }
        attr_reader :person_in_image_cv_term_refined_about

        sig do
          params(person_in_image_cv_term_refined_about: T::Array[String]).void
        end
        attr_writer :person_in_image_cv_term_refined_about

        sig { returns(T.nilable(T::Array[String])) }
        attr_reader :person_in_image_description

        sig { params(person_in_image_description: T::Array[String]).void }
        attr_writer :person_in_image_description

        sig { returns(T.nilable(T::Array[String])) }
        attr_reader :person_in_image_id

        sig { params(person_in_image_id: T::Array[String]).void }
        attr_writer :person_in_image_id

        sig { returns(T.nilable(T::Array[String])) }
        attr_reader :person_in_image_name

        sig { params(person_in_image_name: T::Array[String]).void }
        attr_writer :person_in_image_name

        sig { returns(T.nilable(T::Array[String])) }
        attr_reader :product_in_image_description

        sig { params(product_in_image_description: T::Array[String]).void }
        attr_writer :product_in_image_description

        sig { returns(T.nilable(T::Array[Float])) }
        attr_reader :product_in_image_gtin

        sig { params(product_in_image_gtin: T::Array[Float]).void }
        attr_writer :product_in_image_gtin

        sig { returns(T.nilable(T::Array[String])) }
        attr_reader :product_in_image_name

        sig { params(product_in_image_name: T::Array[String]).void }
        attr_writer :product_in_image_name

        sig { returns(T.nilable(T::Array[String])) }
        attr_reader :property_release_id

        sig { params(property_release_id: T::Array[String]).void }
        attr_writer :property_release_id

        sig { returns(T.nilable(String)) }
        attr_reader :province_state

        sig { params(province_state: String).void }
        attr_writer :province_state

        sig { returns(T.nilable(Integer)) }
        attr_reader :rating

        sig { params(rating: Integer).void }
        attr_writer :rating

        sig { returns(T.nilable(T::Array[String])) }
        attr_reader :registry_entry_role

        sig { params(registry_entry_role: T::Array[String]).void }
        attr_writer :registry_entry_role

        sig { returns(T.nilable(T::Array[String])) }
        attr_reader :registry_item_id

        sig { params(registry_item_id: T::Array[String]).void }
        attr_writer :registry_item_id

        sig { returns(T.nilable(T::Array[String])) }
        attr_reader :registry_organisation_id

        sig { params(registry_organisation_id: T::Array[String]).void }
        attr_writer :registry_organisation_id

        sig { returns(T.nilable(String)) }
        attr_reader :resolution_unit

        sig { params(resolution_unit: String).void }
        attr_writer :resolution_unit

        sig { returns(T.nilable(String)) }
        attr_reader :rights

        sig { params(rights: String).void }
        attr_writer :rights

        sig { returns(T.nilable(T::Array[String])) }
        attr_reader :scene

        sig { params(scene: T::Array[String]).void }
        attr_writer :scene

        sig { returns(T.nilable(String)) }
        attr_reader :source

        sig { params(source: String).void }
        attr_writer :source

        sig { returns(T.nilable(String)) }
        attr_reader :special_instructions

        sig { params(special_instructions: String).void }
        attr_writer :special_instructions

        sig { returns(T.nilable(String)) }
        attr_reader :state

        sig { params(state: String).void }
        attr_writer :state

        sig { returns(T.nilable(T::Array[String])) }
        attr_reader :subject

        sig { params(subject: T::Array[String]).void }
        attr_writer :subject

        sig { returns(T.nilable(T::Array[String])) }
        attr_reader :subject_code

        sig { params(subject_code: T::Array[String]).void }
        attr_writer :subject_code

        sig { returns(T.nilable(T::Array[String])) }
        attr_reader :subject_reference

        sig { params(subject_reference: T::Array[String]).void }
        attr_writer :subject_reference

        sig { returns(T.nilable(String)) }
        attr_reader :sublocation

        sig { params(sublocation: String).void }
        attr_writer :sublocation

        sig { returns(T.nilable(String)) }
        attr_reader :time_created

        sig { params(time_created: String).void }
        attr_writer :time_created

        sig { returns(T.nilable(String)) }
        attr_reader :title

        sig { params(title: String).void }
        attr_writer :title

        sig { returns(T.nilable(String)) }
        attr_reader :transmission_reference

        sig { params(transmission_reference: String).void }
        attr_writer :transmission_reference

        sig { returns(T.nilable(String)) }
        attr_reader :usage_terms

        sig { params(usage_terms: String).void }
        attr_writer :usage_terms

        sig { returns(T.nilable(String)) }
        attr_reader :web_statement

        sig { params(web_statement: String).void }
        attr_writer :web_statement

        sig { returns(T.nilable(String)) }
        attr_reader :writer

        sig { params(writer: String).void }
        attr_writer :writer

        sig { returns(T.nilable(String)) }
        attr_reader :writer_editor

        sig { params(writer_editor: String).void }
        attr_writer :writer_editor

        sig { returns(T.nilable(Float)) }
        attr_reader :x_resolution

        sig { params(x_resolution: Float).void }
        attr_writer :x_resolution

        sig { returns(T.nilable(Float)) }
        attr_reader :y_resolution

        sig { params(y_resolution: Float).void }
        attr_writer :y_resolution

        # Consolidated embedded metadata associated with the file. It includes exif, iptc,
        # and xmp data. Send `embeddedMetadata` in `responseFields` in API request to get
        # embeddedMetadata in the upload API response.
        sig do
          params(
            about_cv_term_cv_id: String,
            about_cv_term_id: String,
            about_cv_term_name: String,
            about_cv_term_refined_about: String,
            additional_model_information: String,
            application_record_version: Integer,
            artist: String,
            artwork_circa_date_created: String,
            artwork_content_description: String,
            artwork_contribution_description: String,
            artwork_copyright_notice: String,
            artwork_copyright_owner_id: String,
            artwork_copyright_owner_name: String,
            artwork_creator: T::Array[String],
            artwork_creator_id: T::Array[String],
            artwork_date_created: Time,
            artwork_licensor_id: String,
            artwork_licensor_name: String,
            artwork_physical_description: String,
            artwork_source: String,
            artwork_source_inventory_no: String,
            artwork_source_inv_url: String,
            artwork_style_period: T::Array[String],
            artwork_title: String,
            authors_position: String,
            byline: String,
            byline_title: String,
            caption: String,
            caption_abstract: String,
            caption_writer: String,
            city: String,
            color_space: String,
            components_configuration: String,
            copyright: String,
            copyright_notice: String,
            copyright_owner_id: T::Array[String],
            copyright_owner_name: T::Array[String],
            country: String,
            country_code: String,
            country_primary_location_code: String,
            country_primary_location_name: String,
            creator: String,
            creator_address: String,
            creator_city: String,
            creator_country: String,
            creator_postal_code: String,
            creator_region: String,
            creator_work_email: String,
            creator_work_telephone: String,
            creator_work_url: String,
            credit: String,
            date_created: Time,
            date_time_created: Time,
            date_time_original: Time,
            description: String,
            digital_image_guid: String,
            digital_source_type: String,
            embedded_encoded_rights_expr: String,
            embedded_encoded_rights_expr_lang_id: String,
            embedded_encoded_rights_expr_type: String,
            event: String,
            exif_version: String,
            flashpix_version: String,
            genre_cv_id: String,
            genre_cv_term_id: String,
            genre_cv_term_name: String,
            genre_cv_term_refined_about: String,
            headline: String,
            image_creator_id: String,
            image_creator_image_id: String,
            image_creator_name: String,
            image_description: String,
            image_region_boundary_h: T::Array[Float],
            image_region_boundary_rx: T::Array[Float],
            image_region_boundary_shape: T::Array[String],
            image_region_boundary_unit: T::Array[String],
            image_region_boundary_vertices_x: T::Array[Float],
            image_region_boundary_vertices_y: T::Array[Float],
            image_region_boundary_w: T::Array[Float],
            image_region_boundary_x: T::Array[Float],
            image_region_boundary_y: T::Array[Float],
            image_region_ctype_identifier: T::Array[String],
            image_region_ctype_name: T::Array[String],
            image_region_id: T::Array[String],
            image_region_name: T::Array[String],
            image_region_organisation_in_image_name: T::Array[String],
            image_region_person_in_image: T::Array[String],
            image_region_role_identifier: T::Array[String],
            image_region_role_name: T::Array[String],
            image_supplier_id: String,
            image_supplier_image_id: String,
            image_supplier_name: String,
            instructions: String,
            intellectual_genre: String,
            keywords: T::Array[String],
            licensor_city: T::Array[String],
            licensor_country: T::Array[String],
            licensor_email: T::Array[String],
            licensor_extended_address: T::Array[String],
            licensor_id: T::Array[String],
            licensor_name: T::Array[String],
            licensor_postal_code: T::Array[String],
            licensor_region: T::Array[String],
            licensor_street_address: T::Array[String],
            licensor_telephone1: T::Array[String],
            licensor_telephone2: T::Array[String],
            licensor_url: T::Array[String],
            linked_encoded_rights_expr: String,
            linked_encoded_rights_expr_lang_id: String,
            linked_encoded_rights_expr_type: String,
            location: String,
            location_created_city: String,
            location_created_country_code: String,
            location_created_country_name: String,
            location_created_gps_altitude: String,
            location_created_gps_latitude: String,
            location_created_gps_longitude: String,
            location_created_location_id: String,
            location_created_location_name: String,
            location_created_province_state: String,
            location_created_sublocation: String,
            location_created_world_region: String,
            location_shown_city: T::Array[String],
            location_shown_country_code: T::Array[String],
            location_shown_country_name: T::Array[String],
            location_shown_gps_altitude: T::Array[String],
            location_shown_gps_latitude: T::Array[String],
            location_shown_gps_longitude: T::Array[String],
            location_shown_location_id: T::Array[String],
            location_shown_location_name: T::Array[String],
            location_shown_province_state: T::Array[String],
            location_shown_sublocation: T::Array[String],
            location_shown_world_region: T::Array[String],
            max_avail_height: Float,
            max_avail_width: Float,
            model_age: T::Array[Float],
            model_release_id: T::Array[String],
            object_attribute_reference: String,
            object_name: String,
            offset_time_original: String,
            organisation_in_image_code: T::Array[String],
            organisation_in_image_name: T::Array[String],
            orientation: String,
            original_transmission_reference: String,
            person_in_image: T::Array[String],
            person_in_image_cv_term_cv_id: T::Array[String],
            person_in_image_cv_term_id: T::Array[String],
            person_in_image_cv_term_name: T::Array[String],
            person_in_image_cv_term_refined_about: T::Array[String],
            person_in_image_description: T::Array[String],
            person_in_image_id: T::Array[String],
            person_in_image_name: T::Array[String],
            product_in_image_description: T::Array[String],
            product_in_image_gtin: T::Array[Float],
            product_in_image_name: T::Array[String],
            property_release_id: T::Array[String],
            province_state: String,
            rating: Integer,
            registry_entry_role: T::Array[String],
            registry_item_id: T::Array[String],
            registry_organisation_id: T::Array[String],
            resolution_unit: String,
            rights: String,
            scene: T::Array[String],
            source: String,
            special_instructions: String,
            state: String,
            subject: T::Array[String],
            subject_code: T::Array[String],
            subject_reference: T::Array[String],
            sublocation: String,
            time_created: String,
            title: String,
            transmission_reference: String,
            usage_terms: String,
            web_statement: String,
            writer: String,
            writer_editor: String,
            x_resolution: Float,
            y_resolution: Float
          ).returns(T.attached_class)
        end
        def self.new(
          about_cv_term_cv_id: nil,
          about_cv_term_id: nil,
          about_cv_term_name: nil,
          about_cv_term_refined_about: nil,
          additional_model_information: nil,
          application_record_version: nil,
          artist: nil,
          artwork_circa_date_created: nil,
          artwork_content_description: nil,
          artwork_contribution_description: nil,
          artwork_copyright_notice: nil,
          artwork_copyright_owner_id: nil,
          artwork_copyright_owner_name: nil,
          artwork_creator: nil,
          artwork_creator_id: nil,
          artwork_date_created: nil,
          artwork_licensor_id: nil,
          artwork_licensor_name: nil,
          artwork_physical_description: nil,
          artwork_source: nil,
          artwork_source_inventory_no: nil,
          artwork_source_inv_url: nil,
          artwork_style_period: nil,
          artwork_title: nil,
          authors_position: nil,
          byline: nil,
          byline_title: nil,
          caption: nil,
          caption_abstract: nil,
          caption_writer: nil,
          city: nil,
          color_space: nil,
          components_configuration: nil,
          copyright: nil,
          copyright_notice: nil,
          copyright_owner_id: nil,
          copyright_owner_name: nil,
          country: nil,
          country_code: nil,
          country_primary_location_code: nil,
          country_primary_location_name: nil,
          creator: nil,
          creator_address: nil,
          creator_city: nil,
          creator_country: nil,
          creator_postal_code: nil,
          creator_region: nil,
          creator_work_email: nil,
          creator_work_telephone: nil,
          creator_work_url: nil,
          credit: nil,
          date_created: nil,
          date_time_created: nil,
          date_time_original: nil,
          description: nil,
          digital_image_guid: nil,
          digital_source_type: nil,
          embedded_encoded_rights_expr: nil,
          embedded_encoded_rights_expr_lang_id: nil,
          embedded_encoded_rights_expr_type: nil,
          event: nil,
          exif_version: nil,
          flashpix_version: nil,
          genre_cv_id: nil,
          genre_cv_term_id: nil,
          genre_cv_term_name: nil,
          genre_cv_term_refined_about: nil,
          headline: nil,
          image_creator_id: nil,
          image_creator_image_id: nil,
          image_creator_name: nil,
          image_description: nil,
          image_region_boundary_h: nil,
          image_region_boundary_rx: nil,
          image_region_boundary_shape: nil,
          image_region_boundary_unit: nil,
          image_region_boundary_vertices_x: nil,
          image_region_boundary_vertices_y: nil,
          image_region_boundary_w: nil,
          image_region_boundary_x: nil,
          image_region_boundary_y: nil,
          image_region_ctype_identifier: nil,
          image_region_ctype_name: nil,
          image_region_id: nil,
          image_region_name: nil,
          image_region_organisation_in_image_name: nil,
          image_region_person_in_image: nil,
          image_region_role_identifier: nil,
          image_region_role_name: nil,
          image_supplier_id: nil,
          image_supplier_image_id: nil,
          image_supplier_name: nil,
          instructions: nil,
          intellectual_genre: nil,
          keywords: nil,
          licensor_city: nil,
          licensor_country: nil,
          licensor_email: nil,
          licensor_extended_address: nil,
          licensor_id: nil,
          licensor_name: nil,
          licensor_postal_code: nil,
          licensor_region: nil,
          licensor_street_address: nil,
          licensor_telephone1: nil,
          licensor_telephone2: nil,
          licensor_url: nil,
          linked_encoded_rights_expr: nil,
          linked_encoded_rights_expr_lang_id: nil,
          linked_encoded_rights_expr_type: nil,
          location: nil,
          location_created_city: nil,
          location_created_country_code: nil,
          location_created_country_name: nil,
          location_created_gps_altitude: nil,
          location_created_gps_latitude: nil,
          location_created_gps_longitude: nil,
          location_created_location_id: nil,
          location_created_location_name: nil,
          location_created_province_state: nil,
          location_created_sublocation: nil,
          location_created_world_region: nil,
          location_shown_city: nil,
          location_shown_country_code: nil,
          location_shown_country_name: nil,
          location_shown_gps_altitude: nil,
          location_shown_gps_latitude: nil,
          location_shown_gps_longitude: nil,
          location_shown_location_id: nil,
          location_shown_location_name: nil,
          location_shown_province_state: nil,
          location_shown_sublocation: nil,
          location_shown_world_region: nil,
          max_avail_height: nil,
          max_avail_width: nil,
          model_age: nil,
          model_release_id: nil,
          object_attribute_reference: nil,
          object_name: nil,
          offset_time_original: nil,
          organisation_in_image_code: nil,
          organisation_in_image_name: nil,
          orientation: nil,
          original_transmission_reference: nil,
          person_in_image: nil,
          person_in_image_cv_term_cv_id: nil,
          person_in_image_cv_term_id: nil,
          person_in_image_cv_term_name: nil,
          person_in_image_cv_term_refined_about: nil,
          person_in_image_description: nil,
          person_in_image_id: nil,
          person_in_image_name: nil,
          product_in_image_description: nil,
          product_in_image_gtin: nil,
          product_in_image_name: nil,
          property_release_id: nil,
          province_state: nil,
          rating: nil,
          registry_entry_role: nil,
          registry_item_id: nil,
          registry_organisation_id: nil,
          resolution_unit: nil,
          rights: nil,
          scene: nil,
          source: nil,
          special_instructions: nil,
          state: nil,
          subject: nil,
          subject_code: nil,
          subject_reference: nil,
          sublocation: nil,
          time_created: nil,
          title: nil,
          transmission_reference: nil,
          usage_terms: nil,
          web_statement: nil,
          writer: nil,
          writer_editor: nil,
          x_resolution: nil,
          y_resolution: nil
        )
        end

        sig do
          override.returns(
            {
              about_cv_term_cv_id: String,
              about_cv_term_id: String,
              about_cv_term_name: String,
              about_cv_term_refined_about: String,
              additional_model_information: String,
              application_record_version: Integer,
              artist: String,
              artwork_circa_date_created: String,
              artwork_content_description: String,
              artwork_contribution_description: String,
              artwork_copyright_notice: String,
              artwork_copyright_owner_id: String,
              artwork_copyright_owner_name: String,
              artwork_creator: T::Array[String],
              artwork_creator_id: T::Array[String],
              artwork_date_created: Time,
              artwork_licensor_id: String,
              artwork_licensor_name: String,
              artwork_physical_description: String,
              artwork_source: String,
              artwork_source_inventory_no: String,
              artwork_source_inv_url: String,
              artwork_style_period: T::Array[String],
              artwork_title: String,
              authors_position: String,
              byline: String,
              byline_title: String,
              caption: String,
              caption_abstract: String,
              caption_writer: String,
              city: String,
              color_space: String,
              components_configuration: String,
              copyright: String,
              copyright_notice: String,
              copyright_owner_id: T::Array[String],
              copyright_owner_name: T::Array[String],
              country: String,
              country_code: String,
              country_primary_location_code: String,
              country_primary_location_name: String,
              creator: String,
              creator_address: String,
              creator_city: String,
              creator_country: String,
              creator_postal_code: String,
              creator_region: String,
              creator_work_email: String,
              creator_work_telephone: String,
              creator_work_url: String,
              credit: String,
              date_created: Time,
              date_time_created: Time,
              date_time_original: Time,
              description: String,
              digital_image_guid: String,
              digital_source_type: String,
              embedded_encoded_rights_expr: String,
              embedded_encoded_rights_expr_lang_id: String,
              embedded_encoded_rights_expr_type: String,
              event: String,
              exif_version: String,
              flashpix_version: String,
              genre_cv_id: String,
              genre_cv_term_id: String,
              genre_cv_term_name: String,
              genre_cv_term_refined_about: String,
              headline: String,
              image_creator_id: String,
              image_creator_image_id: String,
              image_creator_name: String,
              image_description: String,
              image_region_boundary_h: T::Array[Float],
              image_region_boundary_rx: T::Array[Float],
              image_region_boundary_shape: T::Array[String],
              image_region_boundary_unit: T::Array[String],
              image_region_boundary_vertices_x: T::Array[Float],
              image_region_boundary_vertices_y: T::Array[Float],
              image_region_boundary_w: T::Array[Float],
              image_region_boundary_x: T::Array[Float],
              image_region_boundary_y: T::Array[Float],
              image_region_ctype_identifier: T::Array[String],
              image_region_ctype_name: T::Array[String],
              image_region_id: T::Array[String],
              image_region_name: T::Array[String],
              image_region_organisation_in_image_name: T::Array[String],
              image_region_person_in_image: T::Array[String],
              image_region_role_identifier: T::Array[String],
              image_region_role_name: T::Array[String],
              image_supplier_id: String,
              image_supplier_image_id: String,
              image_supplier_name: String,
              instructions: String,
              intellectual_genre: String,
              keywords: T::Array[String],
              licensor_city: T::Array[String],
              licensor_country: T::Array[String],
              licensor_email: T::Array[String],
              licensor_extended_address: T::Array[String],
              licensor_id: T::Array[String],
              licensor_name: T::Array[String],
              licensor_postal_code: T::Array[String],
              licensor_region: T::Array[String],
              licensor_street_address: T::Array[String],
              licensor_telephone1: T::Array[String],
              licensor_telephone2: T::Array[String],
              licensor_url: T::Array[String],
              linked_encoded_rights_expr: String,
              linked_encoded_rights_expr_lang_id: String,
              linked_encoded_rights_expr_type: String,
              location: String,
              location_created_city: String,
              location_created_country_code: String,
              location_created_country_name: String,
              location_created_gps_altitude: String,
              location_created_gps_latitude: String,
              location_created_gps_longitude: String,
              location_created_location_id: String,
              location_created_location_name: String,
              location_created_province_state: String,
              location_created_sublocation: String,
              location_created_world_region: String,
              location_shown_city: T::Array[String],
              location_shown_country_code: T::Array[String],
              location_shown_country_name: T::Array[String],
              location_shown_gps_altitude: T::Array[String],
              location_shown_gps_latitude: T::Array[String],
              location_shown_gps_longitude: T::Array[String],
              location_shown_location_id: T::Array[String],
              location_shown_location_name: T::Array[String],
              location_shown_province_state: T::Array[String],
              location_shown_sublocation: T::Array[String],
              location_shown_world_region: T::Array[String],
              max_avail_height: Float,
              max_avail_width: Float,
              model_age: T::Array[Float],
              model_release_id: T::Array[String],
              object_attribute_reference: String,
              object_name: String,
              offset_time_original: String,
              organisation_in_image_code: T::Array[String],
              organisation_in_image_name: T::Array[String],
              orientation: String,
              original_transmission_reference: String,
              person_in_image: T::Array[String],
              person_in_image_cv_term_cv_id: T::Array[String],
              person_in_image_cv_term_id: T::Array[String],
              person_in_image_cv_term_name: T::Array[String],
              person_in_image_cv_term_refined_about: T::Array[String],
              person_in_image_description: T::Array[String],
              person_in_image_id: T::Array[String],
              person_in_image_name: T::Array[String],
              product_in_image_description: T::Array[String],
              product_in_image_gtin: T::Array[Float],
              product_in_image_name: T::Array[String],
              property_release_id: T::Array[String],
              province_state: String,
              rating: Integer,
              registry_entry_role: T::Array[String],
              registry_item_id: T::Array[String],
              registry_organisation_id: T::Array[String],
              resolution_unit: String,
              rights: String,
              scene: T::Array[String],
              source: String,
              special_instructions: String,
              state: String,
              subject: T::Array[String],
              subject_code: T::Array[String],
              subject_reference: T::Array[String],
              sublocation: String,
              time_created: String,
              title: String,
              transmission_reference: String,
              usage_terms: String,
              web_statement: String,
              writer: String,
              writer_editor: String,
              x_resolution: Float,
              y_resolution: Float
            }
          )
        end
        def to_hash
        end
      end

      class ExtensionStatus < Imagekit::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Imagekit::Models::FileUploadV2Response::ExtensionStatus,
              Imagekit::Internal::AnyHash
            )
          end

        sig do
          returns(
            T.nilable(
              Imagekit::Models::FileUploadV2Response::ExtensionStatus::AwsAutoTagging::TaggedSymbol
            )
          )
        end
        attr_reader :aws_auto_tagging

        sig do
          params(
            aws_auto_tagging:
              Imagekit::Models::FileUploadV2Response::ExtensionStatus::AwsAutoTagging::OrSymbol
          ).void
        end
        attr_writer :aws_auto_tagging

        sig do
          returns(
            T.nilable(
              Imagekit::Models::FileUploadV2Response::ExtensionStatus::GoogleAutoTagging::TaggedSymbol
            )
          )
        end
        attr_reader :google_auto_tagging

        sig do
          params(
            google_auto_tagging:
              Imagekit::Models::FileUploadV2Response::ExtensionStatus::GoogleAutoTagging::OrSymbol
          ).void
        end
        attr_writer :google_auto_tagging

        sig do
          returns(
            T.nilable(
              Imagekit::Models::FileUploadV2Response::ExtensionStatus::RemoveBg::TaggedSymbol
            )
          )
        end
        attr_reader :remove_bg

        sig do
          params(
            remove_bg:
              Imagekit::Models::FileUploadV2Response::ExtensionStatus::RemoveBg::OrSymbol
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
              Imagekit::Models::FileUploadV2Response::ExtensionStatus::AwsAutoTagging::OrSymbol,
            google_auto_tagging:
              Imagekit::Models::FileUploadV2Response::ExtensionStatus::GoogleAutoTagging::OrSymbol,
            remove_bg:
              Imagekit::Models::FileUploadV2Response::ExtensionStatus::RemoveBg::OrSymbol
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
                Imagekit::Models::FileUploadV2Response::ExtensionStatus::AwsAutoTagging::TaggedSymbol,
              google_auto_tagging:
                Imagekit::Models::FileUploadV2Response::ExtensionStatus::GoogleAutoTagging::TaggedSymbol,
              remove_bg:
                Imagekit::Models::FileUploadV2Response::ExtensionStatus::RemoveBg::TaggedSymbol
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
                Imagekit::Models::FileUploadV2Response::ExtensionStatus::AwsAutoTagging
              )
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          SUCCESS =
            T.let(
              :success,
              Imagekit::Models::FileUploadV2Response::ExtensionStatus::AwsAutoTagging::TaggedSymbol
            )
          PENDING =
            T.let(
              :pending,
              Imagekit::Models::FileUploadV2Response::ExtensionStatus::AwsAutoTagging::TaggedSymbol
            )
          FAILED =
            T.let(
              :failed,
              Imagekit::Models::FileUploadV2Response::ExtensionStatus::AwsAutoTagging::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                Imagekit::Models::FileUploadV2Response::ExtensionStatus::AwsAutoTagging::TaggedSymbol
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
                Imagekit::Models::FileUploadV2Response::ExtensionStatus::GoogleAutoTagging
              )
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          SUCCESS =
            T.let(
              :success,
              Imagekit::Models::FileUploadV2Response::ExtensionStatus::GoogleAutoTagging::TaggedSymbol
            )
          PENDING =
            T.let(
              :pending,
              Imagekit::Models::FileUploadV2Response::ExtensionStatus::GoogleAutoTagging::TaggedSymbol
            )
          FAILED =
            T.let(
              :failed,
              Imagekit::Models::FileUploadV2Response::ExtensionStatus::GoogleAutoTagging::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                Imagekit::Models::FileUploadV2Response::ExtensionStatus::GoogleAutoTagging::TaggedSymbol
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
                Imagekit::Models::FileUploadV2Response::ExtensionStatus::RemoveBg
              )
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          SUCCESS =
            T.let(
              :success,
              Imagekit::Models::FileUploadV2Response::ExtensionStatus::RemoveBg::TaggedSymbol
            )
          PENDING =
            T.let(
              :pending,
              Imagekit::Models::FileUploadV2Response::ExtensionStatus::RemoveBg::TaggedSymbol
            )
          FAILED =
            T.let(
              :failed,
              Imagekit::Models::FileUploadV2Response::ExtensionStatus::RemoveBg::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                Imagekit::Models::FileUploadV2Response::ExtensionStatus::RemoveBg::TaggedSymbol
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
              Imagekit::Models::FileUploadV2Response::Metadata,
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
            T.nilable(Imagekit::Models::FileUploadV2Response::Metadata::Exif)
          )
        end
        attr_reader :exif

        sig do
          params(
            exif: Imagekit::Models::FileUploadV2Response::Metadata::Exif::OrHash
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
            exif:
              Imagekit::Models::FileUploadV2Response::Metadata::Exif::OrHash,
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
              exif: Imagekit::Models::FileUploadV2Response::Metadata::Exif,
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
                Imagekit::Models::FileUploadV2Response::Metadata::Exif,
                Imagekit::Internal::AnyHash
              )
            end

          # Object containing Exif details.
          sig { returns(T.nilable(Imagekit::ExifDetails)) }
          attr_reader :exif

          sig { params(exif: Imagekit::ExifDetails::OrHash).void }
          attr_writer :exif

          # Object containing GPS information.
          sig { returns(T.nilable(Imagekit::Gps)) }
          attr_reader :gps

          sig { params(gps: Imagekit::Gps::OrHash).void }
          attr_writer :gps

          # Object containing EXIF image information.
          sig { returns(T.nilable(Imagekit::ExifImage)) }
          attr_reader :image

          sig { params(image: Imagekit::ExifImage::OrHash).void }
          attr_writer :image

          # JSON object.
          sig { returns(T.nilable(Imagekit::Interoperability)) }
          attr_reader :interoperability

          sig do
            params(interoperability: Imagekit::Interoperability::OrHash).void
          end
          attr_writer :interoperability

          sig { returns(T.nilable(T::Hash[Symbol, T.anything])) }
          attr_reader :makernote

          sig { params(makernote: T::Hash[Symbol, T.anything]).void }
          attr_writer :makernote

          # Object containing Thumbnail information.
          sig { returns(T.nilable(Imagekit::Thumbnail)) }
          attr_reader :thumbnail

          sig { params(thumbnail: Imagekit::Thumbnail::OrHash).void }
          attr_writer :thumbnail

          sig do
            params(
              exif: Imagekit::ExifDetails::OrHash,
              gps: Imagekit::Gps::OrHash,
              image: Imagekit::ExifImage::OrHash,
              interoperability: Imagekit::Interoperability::OrHash,
              makernote: T::Hash[Symbol, T.anything],
              thumbnail: Imagekit::Thumbnail::OrHash
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
                exif: Imagekit::ExifDetails,
                gps: Imagekit::Gps,
                image: Imagekit::ExifImage,
                interoperability: Imagekit::Interoperability,
                makernote: T::Hash[Symbol, T.anything],
                thumbnail: Imagekit::Thumbnail
              }
            )
          end
          def to_hash
          end
        end
      end

      class VersionInfo < Imagekit::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Imagekit::Models::FileUploadV2Response::VersionInfo,
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
