# frozen_string_literal: true

module Imagekit
  module Models
    # @see Imagekit::Resources::Files#upload_v1
    class FileUploadV1Response < Imagekit::Internal::Type::BaseModel
      # @!attribute ai_tags
      #   An array of tags assigned to the uploaded file by auto tagging.
      #
      #   @return [Array<Imagekit::Models::FileUploadV1Response::AITag>, nil]
      optional :ai_tags,
               -> { Imagekit::Internal::Type::ArrayOf[Imagekit::Models::FileUploadV1Response::AITag] },
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
      #   @return [Object, nil]
      optional :custom_metadata, Imagekit::Internal::Type::Unknown, api_name: :customMetadata

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
      #   @return [Imagekit::Models::FileUploadV1Response::EmbeddedMetadata, nil]
      optional :embedded_metadata,
               -> { Imagekit::Models::FileUploadV1Response::EmbeddedMetadata },
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
      #   @return [Imagekit::Models::FileUploadV1Response::ExtensionStatus, nil]
      optional :extension_status,
               -> { Imagekit::Models::FileUploadV1Response::ExtensionStatus },
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
      #   @return [Imagekit::Models::FileUploadV1Response::Metadata, nil]
      optional :metadata, -> { Imagekit::Models::FileUploadV1Response::Metadata }

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
      #   @return [Imagekit::Models::FileUploadV1Response::VersionInfo, nil]
      optional :version_info, -> { Imagekit::Models::FileUploadV1Response::VersionInfo }, api_name: :versionInfo

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

      # @!method initialize(ai_tags: nil, audio_codec: nil, bit_rate: nil, custom_coordinates: nil, custom_metadata: nil, duration: nil, embedded_metadata: nil, extension_status: nil, file_id: nil, file_path: nil, file_type: nil, height: nil, is_private_file: nil, is_published: nil, metadata: nil, name: nil, size: nil, tags: nil, thumbnail_url: nil, url: nil, version_info: nil, video_codec: nil, width: nil)
      #   Some parameter documentations has been truncated, see
      #   {Imagekit::Models::FileUploadV1Response} for more details.
      #
      #   Object containing details of a successful upload.
      #
      #   @param ai_tags [Array<Imagekit::Models::FileUploadV1Response::AITag>, nil] An array of tags assigned to the uploaded file by auto tagging.
      #
      #   @param audio_codec [String] The audio codec used in the video (only for video).
      #
      #   @param bit_rate [Integer] The bit rate of the video in kbps (only for video).
      #
      #   @param custom_coordinates [String, nil] Value of custom coordinates associated with the image in the format `x,y,width,h
      #
      #   @param custom_metadata [Object] A key-value data associated with the asset. Use `responseField` in API request t
      #
      #   @param duration [Integer] The duration of the video in seconds (only for video).
      #
      #   @param embedded_metadata [Imagekit::Models::FileUploadV1Response::EmbeddedMetadata] Consolidated embedded metadata associated with the file. It includes exif, iptc,
      #
      #   @param extension_status [Imagekit::Models::FileUploadV1Response::ExtensionStatus] Extension names with their processing status at the time of completion of the re
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
      #   @param metadata [Imagekit::Models::FileUploadV1Response::Metadata] Legacy metadata. Send `metadata` in `responseFields` in API request to get metad
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
      #   @param version_info [Imagekit::Models::FileUploadV1Response::VersionInfo] An object containing the file or file version's `id` (versionId) and `name`.
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
        #   {Imagekit::Models::FileUploadV1Response::AITag} for more details.
        #
        #   @param confidence [Float] Confidence score of the tag.
        #
        #   @param name [String] Name of the tag.
        #
        #   @param source [String] Array of `AITags` associated with the image. If no `AITags` are set, it will be
      end

      # @see Imagekit::Models::FileUploadV1Response#embedded_metadata
      class EmbeddedMetadata < Imagekit::Internal::Type::BaseModel
        # @!attribute about_cv_term_cv_id
        #
        #   @return [String, nil]
        optional :about_cv_term_cv_id, String, api_name: :AboutCvTermCvId

        # @!attribute about_cv_term_id
        #
        #   @return [String, nil]
        optional :about_cv_term_id, String, api_name: :AboutCvTermId

        # @!attribute about_cv_term_name
        #
        #   @return [String, nil]
        optional :about_cv_term_name, String, api_name: :AboutCvTermName

        # @!attribute about_cv_term_refined_about
        #
        #   @return [String, nil]
        optional :about_cv_term_refined_about, String, api_name: :AboutCvTermRefinedAbout

        # @!attribute additional_model_information
        #
        #   @return [String, nil]
        optional :additional_model_information, String, api_name: :AdditionalModelInformation

        # @!attribute application_record_version
        #
        #   @return [Integer, nil]
        optional :application_record_version, Integer, api_name: :ApplicationRecordVersion

        # @!attribute artist
        #
        #   @return [String, nil]
        optional :artist, String, api_name: :Artist

        # @!attribute artwork_circa_date_created
        #
        #   @return [String, nil]
        optional :artwork_circa_date_created, String, api_name: :ArtworkCircaDateCreated

        # @!attribute artwork_content_description
        #
        #   @return [String, nil]
        optional :artwork_content_description, String, api_name: :ArtworkContentDescription

        # @!attribute artwork_contribution_description
        #
        #   @return [String, nil]
        optional :artwork_contribution_description, String, api_name: :ArtworkContributionDescription

        # @!attribute artwork_copyright_notice
        #
        #   @return [String, nil]
        optional :artwork_copyright_notice, String, api_name: :ArtworkCopyrightNotice

        # @!attribute artwork_copyright_owner_id
        #
        #   @return [String, nil]
        optional :artwork_copyright_owner_id, String, api_name: :ArtworkCopyrightOwnerID

        # @!attribute artwork_copyright_owner_name
        #
        #   @return [String, nil]
        optional :artwork_copyright_owner_name, String, api_name: :ArtworkCopyrightOwnerName

        # @!attribute artwork_creator
        #
        #   @return [Array<String>, nil]
        optional :artwork_creator, Imagekit::Internal::Type::ArrayOf[String], api_name: :ArtworkCreator

        # @!attribute artwork_creator_id
        #
        #   @return [Array<String>, nil]
        optional :artwork_creator_id, Imagekit::Internal::Type::ArrayOf[String], api_name: :ArtworkCreatorID

        # @!attribute artwork_date_created
        #
        #   @return [Time, nil]
        optional :artwork_date_created, Time, api_name: :ArtworkDateCreated

        # @!attribute artwork_licensor_id
        #
        #   @return [String, nil]
        optional :artwork_licensor_id, String, api_name: :ArtworkLicensorID

        # @!attribute artwork_licensor_name
        #
        #   @return [String, nil]
        optional :artwork_licensor_name, String, api_name: :ArtworkLicensorName

        # @!attribute artwork_physical_description
        #
        #   @return [String, nil]
        optional :artwork_physical_description, String, api_name: :ArtworkPhysicalDescription

        # @!attribute artwork_source
        #
        #   @return [String, nil]
        optional :artwork_source, String, api_name: :ArtworkSource

        # @!attribute artwork_source_inventory_no
        #
        #   @return [String, nil]
        optional :artwork_source_inventory_no, String, api_name: :ArtworkSourceInventoryNo

        # @!attribute artwork_source_inv_url
        #
        #   @return [String, nil]
        optional :artwork_source_inv_url, String, api_name: :ArtworkSourceInvURL

        # @!attribute artwork_style_period
        #
        #   @return [Array<String>, nil]
        optional :artwork_style_period,
                 Imagekit::Internal::Type::ArrayOf[String],
                 api_name: :ArtworkStylePeriod

        # @!attribute artwork_title
        #
        #   @return [String, nil]
        optional :artwork_title, String, api_name: :ArtworkTitle

        # @!attribute authors_position
        #
        #   @return [String, nil]
        optional :authors_position, String, api_name: :AuthorsPosition

        # @!attribute byline
        #
        #   @return [String, nil]
        optional :byline, String, api_name: :Byline

        # @!attribute byline_title
        #
        #   @return [String, nil]
        optional :byline_title, String, api_name: :BylineTitle

        # @!attribute caption
        #
        #   @return [String, nil]
        optional :caption, String, api_name: :Caption

        # @!attribute caption_abstract
        #
        #   @return [String, nil]
        optional :caption_abstract, String, api_name: :CaptionAbstract

        # @!attribute caption_writer
        #
        #   @return [String, nil]
        optional :caption_writer, String, api_name: :CaptionWriter

        # @!attribute city
        #
        #   @return [String, nil]
        optional :city, String, api_name: :City

        # @!attribute color_space
        #
        #   @return [String, nil]
        optional :color_space, String, api_name: :ColorSpace

        # @!attribute components_configuration
        #
        #   @return [String, nil]
        optional :components_configuration, String, api_name: :ComponentsConfiguration

        # @!attribute copyright
        #
        #   @return [String, nil]
        optional :copyright, String, api_name: :Copyright

        # @!attribute copyright_notice
        #
        #   @return [String, nil]
        optional :copyright_notice, String, api_name: :CopyrightNotice

        # @!attribute copyright_owner_id
        #
        #   @return [Array<String>, nil]
        optional :copyright_owner_id, Imagekit::Internal::Type::ArrayOf[String], api_name: :CopyrightOwnerID

        # @!attribute copyright_owner_name
        #
        #   @return [Array<String>, nil]
        optional :copyright_owner_name,
                 Imagekit::Internal::Type::ArrayOf[String],
                 api_name: :CopyrightOwnerName

        # @!attribute country
        #
        #   @return [String, nil]
        optional :country, String, api_name: :Country

        # @!attribute country_code
        #
        #   @return [String, nil]
        optional :country_code, String, api_name: :CountryCode

        # @!attribute country_primary_location_code
        #
        #   @return [String, nil]
        optional :country_primary_location_code, String, api_name: :CountryPrimaryLocationCode

        # @!attribute country_primary_location_name
        #
        #   @return [String, nil]
        optional :country_primary_location_name, String, api_name: :CountryPrimaryLocationName

        # @!attribute creator
        #
        #   @return [String, nil]
        optional :creator, String, api_name: :Creator

        # @!attribute creator_address
        #
        #   @return [String, nil]
        optional :creator_address, String, api_name: :CreatorAddress

        # @!attribute creator_city
        #
        #   @return [String, nil]
        optional :creator_city, String, api_name: :CreatorCity

        # @!attribute creator_country
        #
        #   @return [String, nil]
        optional :creator_country, String, api_name: :CreatorCountry

        # @!attribute creator_postal_code
        #
        #   @return [String, nil]
        optional :creator_postal_code, String, api_name: :CreatorPostalCode

        # @!attribute creator_region
        #
        #   @return [String, nil]
        optional :creator_region, String, api_name: :CreatorRegion

        # @!attribute creator_work_email
        #
        #   @return [String, nil]
        optional :creator_work_email, String, api_name: :CreatorWorkEmail

        # @!attribute creator_work_telephone
        #
        #   @return [String, nil]
        optional :creator_work_telephone, String, api_name: :CreatorWorkTelephone

        # @!attribute creator_work_url
        #
        #   @return [String, nil]
        optional :creator_work_url, String, api_name: :CreatorWorkURL

        # @!attribute credit
        #
        #   @return [String, nil]
        optional :credit, String, api_name: :Credit

        # @!attribute date_created
        #
        #   @return [Time, nil]
        optional :date_created, Time, api_name: :DateCreated

        # @!attribute date_time_created
        #
        #   @return [Time, nil]
        optional :date_time_created, Time, api_name: :DateTimeCreated

        # @!attribute date_time_original
        #
        #   @return [Time, nil]
        optional :date_time_original, Time, api_name: :DateTimeOriginal

        # @!attribute description
        #
        #   @return [String, nil]
        optional :description, String, api_name: :Description

        # @!attribute digital_image_guid
        #
        #   @return [String, nil]
        optional :digital_image_guid, String, api_name: :DigitalImageGUID

        # @!attribute digital_source_type
        #
        #   @return [String, nil]
        optional :digital_source_type, String, api_name: :DigitalSourceType

        # @!attribute embedded_encoded_rights_expr
        #
        #   @return [String, nil]
        optional :embedded_encoded_rights_expr, String, api_name: :EmbeddedEncodedRightsExpr

        # @!attribute embedded_encoded_rights_expr_lang_id
        #
        #   @return [String, nil]
        optional :embedded_encoded_rights_expr_lang_id, String, api_name: :EmbeddedEncodedRightsExprLangID

        # @!attribute embedded_encoded_rights_expr_type
        #
        #   @return [String, nil]
        optional :embedded_encoded_rights_expr_type, String, api_name: :EmbeddedEncodedRightsExprType

        # @!attribute event
        #
        #   @return [String, nil]
        optional :event, String, api_name: :Event

        # @!attribute exif_version
        #
        #   @return [String, nil]
        optional :exif_version, String, api_name: :ExifVersion

        # @!attribute flashpix_version
        #
        #   @return [String, nil]
        optional :flashpix_version, String, api_name: :FlashpixVersion

        # @!attribute genre_cv_id
        #
        #   @return [String, nil]
        optional :genre_cv_id, String, api_name: :GenreCvId

        # @!attribute genre_cv_term_id
        #
        #   @return [String, nil]
        optional :genre_cv_term_id, String, api_name: :GenreCvTermId

        # @!attribute genre_cv_term_name
        #
        #   @return [String, nil]
        optional :genre_cv_term_name, String, api_name: :GenreCvTermName

        # @!attribute genre_cv_term_refined_about
        #
        #   @return [String, nil]
        optional :genre_cv_term_refined_about, String, api_name: :GenreCvTermRefinedAbout

        # @!attribute headline
        #
        #   @return [String, nil]
        optional :headline, String, api_name: :Headline

        # @!attribute image_creator_id
        #
        #   @return [String, nil]
        optional :image_creator_id, String, api_name: :ImageCreatorID

        # @!attribute image_creator_image_id
        #
        #   @return [String, nil]
        optional :image_creator_image_id, String, api_name: :ImageCreatorImageID

        # @!attribute image_creator_name
        #
        #   @return [String, nil]
        optional :image_creator_name, String, api_name: :ImageCreatorName

        # @!attribute image_description
        #
        #   @return [String, nil]
        optional :image_description, String, api_name: :ImageDescription

        # @!attribute image_region_boundary_h
        #
        #   @return [Array<Float>, nil]
        optional :image_region_boundary_h,
                 Imagekit::Internal::Type::ArrayOf[Float],
                 api_name: :ImageRegionBoundaryH

        # @!attribute image_region_boundary_rx
        #
        #   @return [Array<Float>, nil]
        optional :image_region_boundary_rx,
                 Imagekit::Internal::Type::ArrayOf[Float],
                 api_name: :ImageRegionBoundaryRx

        # @!attribute image_region_boundary_shape
        #
        #   @return [Array<String>, nil]
        optional :image_region_boundary_shape,
                 Imagekit::Internal::Type::ArrayOf[String],
                 api_name: :ImageRegionBoundaryShape

        # @!attribute image_region_boundary_unit
        #
        #   @return [Array<String>, nil]
        optional :image_region_boundary_unit,
                 Imagekit::Internal::Type::ArrayOf[String],
                 api_name: :ImageRegionBoundaryUnit

        # @!attribute image_region_boundary_vertices_x
        #
        #   @return [Array<Float>, nil]
        optional :image_region_boundary_vertices_x,
                 Imagekit::Internal::Type::ArrayOf[Float],
                 api_name: :ImageRegionBoundaryVerticesX

        # @!attribute image_region_boundary_vertices_y
        #
        #   @return [Array<Float>, nil]
        optional :image_region_boundary_vertices_y,
                 Imagekit::Internal::Type::ArrayOf[Float],
                 api_name: :ImageRegionBoundaryVerticesY

        # @!attribute image_region_boundary_w
        #
        #   @return [Array<Float>, nil]
        optional :image_region_boundary_w,
                 Imagekit::Internal::Type::ArrayOf[Float],
                 api_name: :ImageRegionBoundaryW

        # @!attribute image_region_boundary_x
        #
        #   @return [Array<Float>, nil]
        optional :image_region_boundary_x,
                 Imagekit::Internal::Type::ArrayOf[Float],
                 api_name: :ImageRegionBoundaryX

        # @!attribute image_region_boundary_y
        #
        #   @return [Array<Float>, nil]
        optional :image_region_boundary_y,
                 Imagekit::Internal::Type::ArrayOf[Float],
                 api_name: :ImageRegionBoundaryY

        # @!attribute image_region_ctype_identifier
        #
        #   @return [Array<String>, nil]
        optional :image_region_ctype_identifier,
                 Imagekit::Internal::Type::ArrayOf[String],
                 api_name: :ImageRegionCtypeIdentifier

        # @!attribute image_region_ctype_name
        #
        #   @return [Array<String>, nil]
        optional :image_region_ctype_name,
                 Imagekit::Internal::Type::ArrayOf[String],
                 api_name: :ImageRegionCtypeName

        # @!attribute image_region_id
        #
        #   @return [Array<String>, nil]
        optional :image_region_id, Imagekit::Internal::Type::ArrayOf[String], api_name: :ImageRegionID

        # @!attribute image_region_name
        #
        #   @return [Array<String>, nil]
        optional :image_region_name, Imagekit::Internal::Type::ArrayOf[String], api_name: :ImageRegionName

        # @!attribute image_region_organisation_in_image_name
        #
        #   @return [Array<String>, nil]
        optional :image_region_organisation_in_image_name,
                 Imagekit::Internal::Type::ArrayOf[String],
                 api_name: :ImageRegionOrganisationInImageName

        # @!attribute image_region_person_in_image
        #
        #   @return [Array<String>, nil]
        optional :image_region_person_in_image,
                 Imagekit::Internal::Type::ArrayOf[String],
                 api_name: :ImageRegionPersonInImage

        # @!attribute image_region_role_identifier
        #
        #   @return [Array<String>, nil]
        optional :image_region_role_identifier,
                 Imagekit::Internal::Type::ArrayOf[String],
                 api_name: :ImageRegionRoleIdentifier

        # @!attribute image_region_role_name
        #
        #   @return [Array<String>, nil]
        optional :image_region_role_name,
                 Imagekit::Internal::Type::ArrayOf[String],
                 api_name: :ImageRegionRoleName

        # @!attribute image_supplier_id
        #
        #   @return [String, nil]
        optional :image_supplier_id, String, api_name: :ImageSupplierID

        # @!attribute image_supplier_image_id
        #
        #   @return [String, nil]
        optional :image_supplier_image_id, String, api_name: :ImageSupplierImageID

        # @!attribute image_supplier_name
        #
        #   @return [String, nil]
        optional :image_supplier_name, String, api_name: :ImageSupplierName

        # @!attribute instructions
        #
        #   @return [String, nil]
        optional :instructions, String, api_name: :Instructions

        # @!attribute intellectual_genre
        #
        #   @return [String, nil]
        optional :intellectual_genre, String, api_name: :IntellectualGenre

        # @!attribute keywords
        #
        #   @return [Array<String>, nil]
        optional :keywords, Imagekit::Internal::Type::ArrayOf[String], api_name: :Keywords

        # @!attribute licensor_city
        #
        #   @return [Array<String>, nil]
        optional :licensor_city, Imagekit::Internal::Type::ArrayOf[String], api_name: :LicensorCity

        # @!attribute licensor_country
        #
        #   @return [Array<String>, nil]
        optional :licensor_country, Imagekit::Internal::Type::ArrayOf[String], api_name: :LicensorCountry

        # @!attribute licensor_email
        #
        #   @return [Array<String>, nil]
        optional :licensor_email, Imagekit::Internal::Type::ArrayOf[String], api_name: :LicensorEmail

        # @!attribute licensor_extended_address
        #
        #   @return [Array<String>, nil]
        optional :licensor_extended_address,
                 Imagekit::Internal::Type::ArrayOf[String],
                 api_name: :LicensorExtendedAddress

        # @!attribute licensor_id
        #
        #   @return [Array<String>, nil]
        optional :licensor_id, Imagekit::Internal::Type::ArrayOf[String], api_name: :LicensorID

        # @!attribute licensor_name
        #
        #   @return [Array<String>, nil]
        optional :licensor_name, Imagekit::Internal::Type::ArrayOf[String], api_name: :LicensorName

        # @!attribute licensor_postal_code
        #
        #   @return [Array<String>, nil]
        optional :licensor_postal_code,
                 Imagekit::Internal::Type::ArrayOf[String],
                 api_name: :LicensorPostalCode

        # @!attribute licensor_region
        #
        #   @return [Array<String>, nil]
        optional :licensor_region, Imagekit::Internal::Type::ArrayOf[String], api_name: :LicensorRegion

        # @!attribute licensor_street_address
        #
        #   @return [Array<String>, nil]
        optional :licensor_street_address,
                 Imagekit::Internal::Type::ArrayOf[String],
                 api_name: :LicensorStreetAddress

        # @!attribute licensor_telephone1
        #
        #   @return [Array<String>, nil]
        optional :licensor_telephone1,
                 Imagekit::Internal::Type::ArrayOf[String],
                 api_name: :LicensorTelephone1

        # @!attribute licensor_telephone2
        #
        #   @return [Array<String>, nil]
        optional :licensor_telephone2,
                 Imagekit::Internal::Type::ArrayOf[String],
                 api_name: :LicensorTelephone2

        # @!attribute licensor_url
        #
        #   @return [Array<String>, nil]
        optional :licensor_url, Imagekit::Internal::Type::ArrayOf[String], api_name: :LicensorURL

        # @!attribute linked_encoded_rights_expr
        #
        #   @return [String, nil]
        optional :linked_encoded_rights_expr, String, api_name: :LinkedEncodedRightsExpr

        # @!attribute linked_encoded_rights_expr_lang_id
        #
        #   @return [String, nil]
        optional :linked_encoded_rights_expr_lang_id, String, api_name: :LinkedEncodedRightsExprLangID

        # @!attribute linked_encoded_rights_expr_type
        #
        #   @return [String, nil]
        optional :linked_encoded_rights_expr_type, String, api_name: :LinkedEncodedRightsExprType

        # @!attribute location
        #
        #   @return [String, nil]
        optional :location, String, api_name: :Location

        # @!attribute location_created_city
        #
        #   @return [String, nil]
        optional :location_created_city, String, api_name: :LocationCreatedCity

        # @!attribute location_created_country_code
        #
        #   @return [String, nil]
        optional :location_created_country_code, String, api_name: :LocationCreatedCountryCode

        # @!attribute location_created_country_name
        #
        #   @return [String, nil]
        optional :location_created_country_name, String, api_name: :LocationCreatedCountryName

        # @!attribute location_created_gps_altitude
        #
        #   @return [String, nil]
        optional :location_created_gps_altitude, String, api_name: :LocationCreatedGPSAltitude

        # @!attribute location_created_gps_latitude
        #
        #   @return [String, nil]
        optional :location_created_gps_latitude, String, api_name: :LocationCreatedGPSLatitude

        # @!attribute location_created_gps_longitude
        #
        #   @return [String, nil]
        optional :location_created_gps_longitude, String, api_name: :LocationCreatedGPSLongitude

        # @!attribute location_created_location_id
        #
        #   @return [String, nil]
        optional :location_created_location_id, String, api_name: :LocationCreatedLocationId

        # @!attribute location_created_location_name
        #
        #   @return [String, nil]
        optional :location_created_location_name, String, api_name: :LocationCreatedLocationName

        # @!attribute location_created_province_state
        #
        #   @return [String, nil]
        optional :location_created_province_state, String, api_name: :LocationCreatedProvinceState

        # @!attribute location_created_sublocation
        #
        #   @return [String, nil]
        optional :location_created_sublocation, String, api_name: :LocationCreatedSublocation

        # @!attribute location_created_world_region
        #
        #   @return [String, nil]
        optional :location_created_world_region, String, api_name: :LocationCreatedWorldRegion

        # @!attribute location_shown_city
        #
        #   @return [Array<String>, nil]
        optional :location_shown_city, Imagekit::Internal::Type::ArrayOf[String], api_name: :LocationShownCity

        # @!attribute location_shown_country_code
        #
        #   @return [Array<String>, nil]
        optional :location_shown_country_code,
                 Imagekit::Internal::Type::ArrayOf[String],
                 api_name: :LocationShownCountryCode

        # @!attribute location_shown_country_name
        #
        #   @return [Array<String>, nil]
        optional :location_shown_country_name,
                 Imagekit::Internal::Type::ArrayOf[String],
                 api_name: :LocationShownCountryName

        # @!attribute location_shown_gps_altitude
        #
        #   @return [Array<String>, nil]
        optional :location_shown_gps_altitude,
                 Imagekit::Internal::Type::ArrayOf[String],
                 api_name: :LocationShownGPSAltitude

        # @!attribute location_shown_gps_latitude
        #
        #   @return [Array<String>, nil]
        optional :location_shown_gps_latitude,
                 Imagekit::Internal::Type::ArrayOf[String],
                 api_name: :LocationShownGPSLatitude

        # @!attribute location_shown_gps_longitude
        #
        #   @return [Array<String>, nil]
        optional :location_shown_gps_longitude,
                 Imagekit::Internal::Type::ArrayOf[String],
                 api_name: :LocationShownGPSLongitude

        # @!attribute location_shown_location_id
        #
        #   @return [Array<String>, nil]
        optional :location_shown_location_id,
                 Imagekit::Internal::Type::ArrayOf[String],
                 api_name: :LocationShownLocationId

        # @!attribute location_shown_location_name
        #
        #   @return [Array<String>, nil]
        optional :location_shown_location_name,
                 Imagekit::Internal::Type::ArrayOf[String],
                 api_name: :LocationShownLocationName

        # @!attribute location_shown_province_state
        #
        #   @return [Array<String>, nil]
        optional :location_shown_province_state,
                 Imagekit::Internal::Type::ArrayOf[String],
                 api_name: :LocationShownProvinceState

        # @!attribute location_shown_sublocation
        #
        #   @return [Array<String>, nil]
        optional :location_shown_sublocation,
                 Imagekit::Internal::Type::ArrayOf[String],
                 api_name: :LocationShownSublocation

        # @!attribute location_shown_world_region
        #
        #   @return [Array<String>, nil]
        optional :location_shown_world_region,
                 Imagekit::Internal::Type::ArrayOf[String],
                 api_name: :LocationShownWorldRegion

        # @!attribute max_avail_height
        #
        #   @return [Float, nil]
        optional :max_avail_height, Float, api_name: :MaxAvailHeight

        # @!attribute max_avail_width
        #
        #   @return [Float, nil]
        optional :max_avail_width, Float, api_name: :MaxAvailWidth

        # @!attribute model_age
        #
        #   @return [Array<Float>, nil]
        optional :model_age, Imagekit::Internal::Type::ArrayOf[Float], api_name: :ModelAge

        # @!attribute model_release_id
        #
        #   @return [Array<String>, nil]
        optional :model_release_id, Imagekit::Internal::Type::ArrayOf[String], api_name: :ModelReleaseID

        # @!attribute object_attribute_reference
        #
        #   @return [String, nil]
        optional :object_attribute_reference, String, api_name: :ObjectAttributeReference

        # @!attribute object_name
        #
        #   @return [String, nil]
        optional :object_name, String, api_name: :ObjectName

        # @!attribute offset_time_original
        #
        #   @return [String, nil]
        optional :offset_time_original, String, api_name: :OffsetTimeOriginal

        # @!attribute organisation_in_image_code
        #
        #   @return [Array<String>, nil]
        optional :organisation_in_image_code,
                 Imagekit::Internal::Type::ArrayOf[String],
                 api_name: :OrganisationInImageCode

        # @!attribute organisation_in_image_name
        #
        #   @return [Array<String>, nil]
        optional :organisation_in_image_name,
                 Imagekit::Internal::Type::ArrayOf[String],
                 api_name: :OrganisationInImageName

        # @!attribute orientation
        #
        #   @return [String, nil]
        optional :orientation, String, api_name: :Orientation

        # @!attribute original_transmission_reference
        #
        #   @return [String, nil]
        optional :original_transmission_reference, String, api_name: :OriginalTransmissionReference

        # @!attribute person_in_image
        #
        #   @return [Array<String>, nil]
        optional :person_in_image, Imagekit::Internal::Type::ArrayOf[String], api_name: :PersonInImage

        # @!attribute person_in_image_cv_term_cv_id
        #
        #   @return [Array<String>, nil]
        optional :person_in_image_cv_term_cv_id,
                 Imagekit::Internal::Type::ArrayOf[String],
                 api_name: :PersonInImageCvTermCvId

        # @!attribute person_in_image_cv_term_id
        #
        #   @return [Array<String>, nil]
        optional :person_in_image_cv_term_id,
                 Imagekit::Internal::Type::ArrayOf[String],
                 api_name: :PersonInImageCvTermId

        # @!attribute person_in_image_cv_term_name
        #
        #   @return [Array<String>, nil]
        optional :person_in_image_cv_term_name,
                 Imagekit::Internal::Type::ArrayOf[String],
                 api_name: :PersonInImageCvTermName

        # @!attribute person_in_image_cv_term_refined_about
        #
        #   @return [Array<String>, nil]
        optional :person_in_image_cv_term_refined_about,
                 Imagekit::Internal::Type::ArrayOf[String],
                 api_name: :PersonInImageCvTermRefinedAbout

        # @!attribute person_in_image_description
        #
        #   @return [Array<String>, nil]
        optional :person_in_image_description,
                 Imagekit::Internal::Type::ArrayOf[String],
                 api_name: :PersonInImageDescription

        # @!attribute person_in_image_id
        #
        #   @return [Array<String>, nil]
        optional :person_in_image_id, Imagekit::Internal::Type::ArrayOf[String], api_name: :PersonInImageId

        # @!attribute person_in_image_name
        #
        #   @return [Array<String>, nil]
        optional :person_in_image_name,
                 Imagekit::Internal::Type::ArrayOf[String],
                 api_name: :PersonInImageName

        # @!attribute product_in_image_description
        #
        #   @return [Array<String>, nil]
        optional :product_in_image_description,
                 Imagekit::Internal::Type::ArrayOf[String],
                 api_name: :ProductInImageDescription

        # @!attribute product_in_image_gtin
        #
        #   @return [Array<Float>, nil]
        optional :product_in_image_gtin,
                 Imagekit::Internal::Type::ArrayOf[Float],
                 api_name: :ProductInImageGTIN

        # @!attribute product_in_image_name
        #
        #   @return [Array<String>, nil]
        optional :product_in_image_name,
                 Imagekit::Internal::Type::ArrayOf[String],
                 api_name: :ProductInImageName

        # @!attribute property_release_id
        #
        #   @return [Array<String>, nil]
        optional :property_release_id, Imagekit::Internal::Type::ArrayOf[String], api_name: :PropertyReleaseID

        # @!attribute province_state
        #
        #   @return [String, nil]
        optional :province_state, String, api_name: :ProvinceState

        # @!attribute rating
        #
        #   @return [Integer, nil]
        optional :rating, Integer, api_name: :Rating

        # @!attribute registry_entry_role
        #
        #   @return [Array<String>, nil]
        optional :registry_entry_role, Imagekit::Internal::Type::ArrayOf[String], api_name: :RegistryEntryRole

        # @!attribute registry_item_id
        #
        #   @return [Array<String>, nil]
        optional :registry_item_id, Imagekit::Internal::Type::ArrayOf[String], api_name: :RegistryItemID

        # @!attribute registry_organisation_id
        #
        #   @return [Array<String>, nil]
        optional :registry_organisation_id,
                 Imagekit::Internal::Type::ArrayOf[String],
                 api_name: :RegistryOrganisationID

        # @!attribute resolution_unit
        #
        #   @return [String, nil]
        optional :resolution_unit, String, api_name: :ResolutionUnit

        # @!attribute rights
        #
        #   @return [String, nil]
        optional :rights, String, api_name: :Rights

        # @!attribute scene
        #
        #   @return [Array<String>, nil]
        optional :scene, Imagekit::Internal::Type::ArrayOf[String], api_name: :Scene

        # @!attribute source
        #
        #   @return [String, nil]
        optional :source, String, api_name: :Source

        # @!attribute special_instructions
        #
        #   @return [String, nil]
        optional :special_instructions, String, api_name: :SpecialInstructions

        # @!attribute state
        #
        #   @return [String, nil]
        optional :state, String, api_name: :State

        # @!attribute subject
        #
        #   @return [Array<String>, nil]
        optional :subject, Imagekit::Internal::Type::ArrayOf[String], api_name: :Subject

        # @!attribute subject_code
        #
        #   @return [Array<String>, nil]
        optional :subject_code, Imagekit::Internal::Type::ArrayOf[String], api_name: :SubjectCode

        # @!attribute subject_reference
        #
        #   @return [Array<String>, nil]
        optional :subject_reference, Imagekit::Internal::Type::ArrayOf[String], api_name: :SubjectReference

        # @!attribute sublocation
        #
        #   @return [String, nil]
        optional :sublocation, String, api_name: :Sublocation

        # @!attribute time_created
        #
        #   @return [String, nil]
        optional :time_created, String, api_name: :TimeCreated

        # @!attribute title
        #
        #   @return [String, nil]
        optional :title, String, api_name: :Title

        # @!attribute transmission_reference
        #
        #   @return [String, nil]
        optional :transmission_reference, String, api_name: :TransmissionReference

        # @!attribute usage_terms
        #
        #   @return [String, nil]
        optional :usage_terms, String, api_name: :UsageTerms

        # @!attribute web_statement
        #
        #   @return [String, nil]
        optional :web_statement, String, api_name: :WebStatement

        # @!attribute writer
        #
        #   @return [String, nil]
        optional :writer, String, api_name: :Writer

        # @!attribute writer_editor
        #
        #   @return [String, nil]
        optional :writer_editor, String, api_name: :WriterEditor

        # @!attribute x_resolution
        #
        #   @return [Float, nil]
        optional :x_resolution, Float, api_name: :XResolution

        # @!attribute y_resolution
        #
        #   @return [Float, nil]
        optional :y_resolution, Float, api_name: :YResolution

        # @!method initialize(about_cv_term_cv_id: nil, about_cv_term_id: nil, about_cv_term_name: nil, about_cv_term_refined_about: nil, additional_model_information: nil, application_record_version: nil, artist: nil, artwork_circa_date_created: nil, artwork_content_description: nil, artwork_contribution_description: nil, artwork_copyright_notice: nil, artwork_copyright_owner_id: nil, artwork_copyright_owner_name: nil, artwork_creator: nil, artwork_creator_id: nil, artwork_date_created: nil, artwork_licensor_id: nil, artwork_licensor_name: nil, artwork_physical_description: nil, artwork_source: nil, artwork_source_inventory_no: nil, artwork_source_inv_url: nil, artwork_style_period: nil, artwork_title: nil, authors_position: nil, byline: nil, byline_title: nil, caption: nil, caption_abstract: nil, caption_writer: nil, city: nil, color_space: nil, components_configuration: nil, copyright: nil, copyright_notice: nil, copyright_owner_id: nil, copyright_owner_name: nil, country: nil, country_code: nil, country_primary_location_code: nil, country_primary_location_name: nil, creator: nil, creator_address: nil, creator_city: nil, creator_country: nil, creator_postal_code: nil, creator_region: nil, creator_work_email: nil, creator_work_telephone: nil, creator_work_url: nil, credit: nil, date_created: nil, date_time_created: nil, date_time_original: nil, description: nil, digital_image_guid: nil, digital_source_type: nil, embedded_encoded_rights_expr: nil, embedded_encoded_rights_expr_lang_id: nil, embedded_encoded_rights_expr_type: nil, event: nil, exif_version: nil, flashpix_version: nil, genre_cv_id: nil, genre_cv_term_id: nil, genre_cv_term_name: nil, genre_cv_term_refined_about: nil, headline: nil, image_creator_id: nil, image_creator_image_id: nil, image_creator_name: nil, image_description: nil, image_region_boundary_h: nil, image_region_boundary_rx: nil, image_region_boundary_shape: nil, image_region_boundary_unit: nil, image_region_boundary_vertices_x: nil, image_region_boundary_vertices_y: nil, image_region_boundary_w: nil, image_region_boundary_x: nil, image_region_boundary_y: nil, image_region_ctype_identifier: nil, image_region_ctype_name: nil, image_region_id: nil, image_region_name: nil, image_region_organisation_in_image_name: nil, image_region_person_in_image: nil, image_region_role_identifier: nil, image_region_role_name: nil, image_supplier_id: nil, image_supplier_image_id: nil, image_supplier_name: nil, instructions: nil, intellectual_genre: nil, keywords: nil, licensor_city: nil, licensor_country: nil, licensor_email: nil, licensor_extended_address: nil, licensor_id: nil, licensor_name: nil, licensor_postal_code: nil, licensor_region: nil, licensor_street_address: nil, licensor_telephone1: nil, licensor_telephone2: nil, licensor_url: nil, linked_encoded_rights_expr: nil, linked_encoded_rights_expr_lang_id: nil, linked_encoded_rights_expr_type: nil, location: nil, location_created_city: nil, location_created_country_code: nil, location_created_country_name: nil, location_created_gps_altitude: nil, location_created_gps_latitude: nil, location_created_gps_longitude: nil, location_created_location_id: nil, location_created_location_name: nil, location_created_province_state: nil, location_created_sublocation: nil, location_created_world_region: nil, location_shown_city: nil, location_shown_country_code: nil, location_shown_country_name: nil, location_shown_gps_altitude: nil, location_shown_gps_latitude: nil, location_shown_gps_longitude: nil, location_shown_location_id: nil, location_shown_location_name: nil, location_shown_province_state: nil, location_shown_sublocation: nil, location_shown_world_region: nil, max_avail_height: nil, max_avail_width: nil, model_age: nil, model_release_id: nil, object_attribute_reference: nil, object_name: nil, offset_time_original: nil, organisation_in_image_code: nil, organisation_in_image_name: nil, orientation: nil, original_transmission_reference: nil, person_in_image: nil, person_in_image_cv_term_cv_id: nil, person_in_image_cv_term_id: nil, person_in_image_cv_term_name: nil, person_in_image_cv_term_refined_about: nil, person_in_image_description: nil, person_in_image_id: nil, person_in_image_name: nil, product_in_image_description: nil, product_in_image_gtin: nil, product_in_image_name: nil, property_release_id: nil, province_state: nil, rating: nil, registry_entry_role: nil, registry_item_id: nil, registry_organisation_id: nil, resolution_unit: nil, rights: nil, scene: nil, source: nil, special_instructions: nil, state: nil, subject: nil, subject_code: nil, subject_reference: nil, sublocation: nil, time_created: nil, title: nil, transmission_reference: nil, usage_terms: nil, web_statement: nil, writer: nil, writer_editor: nil, x_resolution: nil, y_resolution: nil)
        #   Consolidated embedded metadata associated with the file. It includes exif, iptc,
        #   and xmp data. Send `embeddedMetadata` in `responseFields` in API request to get
        #   embeddedMetadata in the upload API response.
        #
        #   @param about_cv_term_cv_id [String]
        #   @param about_cv_term_id [String]
        #   @param about_cv_term_name [String]
        #   @param about_cv_term_refined_about [String]
        #   @param additional_model_information [String]
        #   @param application_record_version [Integer]
        #   @param artist [String]
        #   @param artwork_circa_date_created [String]
        #   @param artwork_content_description [String]
        #   @param artwork_contribution_description [String]
        #   @param artwork_copyright_notice [String]
        #   @param artwork_copyright_owner_id [String]
        #   @param artwork_copyright_owner_name [String]
        #   @param artwork_creator [Array<String>]
        #   @param artwork_creator_id [Array<String>]
        #   @param artwork_date_created [Time]
        #   @param artwork_licensor_id [String]
        #   @param artwork_licensor_name [String]
        #   @param artwork_physical_description [String]
        #   @param artwork_source [String]
        #   @param artwork_source_inventory_no [String]
        #   @param artwork_source_inv_url [String]
        #   @param artwork_style_period [Array<String>]
        #   @param artwork_title [String]
        #   @param authors_position [String]
        #   @param byline [String]
        #   @param byline_title [String]
        #   @param caption [String]
        #   @param caption_abstract [String]
        #   @param caption_writer [String]
        #   @param city [String]
        #   @param color_space [String]
        #   @param components_configuration [String]
        #   @param copyright [String]
        #   @param copyright_notice [String]
        #   @param copyright_owner_id [Array<String>]
        #   @param copyright_owner_name [Array<String>]
        #   @param country [String]
        #   @param country_code [String]
        #   @param country_primary_location_code [String]
        #   @param country_primary_location_name [String]
        #   @param creator [String]
        #   @param creator_address [String]
        #   @param creator_city [String]
        #   @param creator_country [String]
        #   @param creator_postal_code [String]
        #   @param creator_region [String]
        #   @param creator_work_email [String]
        #   @param creator_work_telephone [String]
        #   @param creator_work_url [String]
        #   @param credit [String]
        #   @param date_created [Time]
        #   @param date_time_created [Time]
        #   @param date_time_original [Time]
        #   @param description [String]
        #   @param digital_image_guid [String]
        #   @param digital_source_type [String]
        #   @param embedded_encoded_rights_expr [String]
        #   @param embedded_encoded_rights_expr_lang_id [String]
        #   @param embedded_encoded_rights_expr_type [String]
        #   @param event [String]
        #   @param exif_version [String]
        #   @param flashpix_version [String]
        #   @param genre_cv_id [String]
        #   @param genre_cv_term_id [String]
        #   @param genre_cv_term_name [String]
        #   @param genre_cv_term_refined_about [String]
        #   @param headline [String]
        #   @param image_creator_id [String]
        #   @param image_creator_image_id [String]
        #   @param image_creator_name [String]
        #   @param image_description [String]
        #   @param image_region_boundary_h [Array<Float>]
        #   @param image_region_boundary_rx [Array<Float>]
        #   @param image_region_boundary_shape [Array<String>]
        #   @param image_region_boundary_unit [Array<String>]
        #   @param image_region_boundary_vertices_x [Array<Float>]
        #   @param image_region_boundary_vertices_y [Array<Float>]
        #   @param image_region_boundary_w [Array<Float>]
        #   @param image_region_boundary_x [Array<Float>]
        #   @param image_region_boundary_y [Array<Float>]
        #   @param image_region_ctype_identifier [Array<String>]
        #   @param image_region_ctype_name [Array<String>]
        #   @param image_region_id [Array<String>]
        #   @param image_region_name [Array<String>]
        #   @param image_region_organisation_in_image_name [Array<String>]
        #   @param image_region_person_in_image [Array<String>]
        #   @param image_region_role_identifier [Array<String>]
        #   @param image_region_role_name [Array<String>]
        #   @param image_supplier_id [String]
        #   @param image_supplier_image_id [String]
        #   @param image_supplier_name [String]
        #   @param instructions [String]
        #   @param intellectual_genre [String]
        #   @param keywords [Array<String>]
        #   @param licensor_city [Array<String>]
        #   @param licensor_country [Array<String>]
        #   @param licensor_email [Array<String>]
        #   @param licensor_extended_address [Array<String>]
        #   @param licensor_id [Array<String>]
        #   @param licensor_name [Array<String>]
        #   @param licensor_postal_code [Array<String>]
        #   @param licensor_region [Array<String>]
        #   @param licensor_street_address [Array<String>]
        #   @param licensor_telephone1 [Array<String>]
        #   @param licensor_telephone2 [Array<String>]
        #   @param licensor_url [Array<String>]
        #   @param linked_encoded_rights_expr [String]
        #   @param linked_encoded_rights_expr_lang_id [String]
        #   @param linked_encoded_rights_expr_type [String]
        #   @param location [String]
        #   @param location_created_city [String]
        #   @param location_created_country_code [String]
        #   @param location_created_country_name [String]
        #   @param location_created_gps_altitude [String]
        #   @param location_created_gps_latitude [String]
        #   @param location_created_gps_longitude [String]
        #   @param location_created_location_id [String]
        #   @param location_created_location_name [String]
        #   @param location_created_province_state [String]
        #   @param location_created_sublocation [String]
        #   @param location_created_world_region [String]
        #   @param location_shown_city [Array<String>]
        #   @param location_shown_country_code [Array<String>]
        #   @param location_shown_country_name [Array<String>]
        #   @param location_shown_gps_altitude [Array<String>]
        #   @param location_shown_gps_latitude [Array<String>]
        #   @param location_shown_gps_longitude [Array<String>]
        #   @param location_shown_location_id [Array<String>]
        #   @param location_shown_location_name [Array<String>]
        #   @param location_shown_province_state [Array<String>]
        #   @param location_shown_sublocation [Array<String>]
        #   @param location_shown_world_region [Array<String>]
        #   @param max_avail_height [Float]
        #   @param max_avail_width [Float]
        #   @param model_age [Array<Float>]
        #   @param model_release_id [Array<String>]
        #   @param object_attribute_reference [String]
        #   @param object_name [String]
        #   @param offset_time_original [String]
        #   @param organisation_in_image_code [Array<String>]
        #   @param organisation_in_image_name [Array<String>]
        #   @param orientation [String]
        #   @param original_transmission_reference [String]
        #   @param person_in_image [Array<String>]
        #   @param person_in_image_cv_term_cv_id [Array<String>]
        #   @param person_in_image_cv_term_id [Array<String>]
        #   @param person_in_image_cv_term_name [Array<String>]
        #   @param person_in_image_cv_term_refined_about [Array<String>]
        #   @param person_in_image_description [Array<String>]
        #   @param person_in_image_id [Array<String>]
        #   @param person_in_image_name [Array<String>]
        #   @param product_in_image_description [Array<String>]
        #   @param product_in_image_gtin [Array<Float>]
        #   @param product_in_image_name [Array<String>]
        #   @param property_release_id [Array<String>]
        #   @param province_state [String]
        #   @param rating [Integer]
        #   @param registry_entry_role [Array<String>]
        #   @param registry_item_id [Array<String>]
        #   @param registry_organisation_id [Array<String>]
        #   @param resolution_unit [String]
        #   @param rights [String]
        #   @param scene [Array<String>]
        #   @param source [String]
        #   @param special_instructions [String]
        #   @param state [String]
        #   @param subject [Array<String>]
        #   @param subject_code [Array<String>]
        #   @param subject_reference [Array<String>]
        #   @param sublocation [String]
        #   @param time_created [String]
        #   @param title [String]
        #   @param transmission_reference [String]
        #   @param usage_terms [String]
        #   @param web_statement [String]
        #   @param writer [String]
        #   @param writer_editor [String]
        #   @param x_resolution [Float]
        #   @param y_resolution [Float]
      end

      # @see Imagekit::Models::FileUploadV1Response#extension_status
      class ExtensionStatus < Imagekit::Internal::Type::BaseModel
        # @!attribute aws_auto_tagging
        #
        #   @return [Symbol, Imagekit::Models::FileUploadV1Response::ExtensionStatus::AwsAutoTagging, nil]
        optional :aws_auto_tagging,
                 enum: -> { Imagekit::Models::FileUploadV1Response::ExtensionStatus::AwsAutoTagging },
                 api_name: :"aws-auto-tagging"

        # @!attribute google_auto_tagging
        #
        #   @return [Symbol, Imagekit::Models::FileUploadV1Response::ExtensionStatus::GoogleAutoTagging, nil]
        optional :google_auto_tagging,
                 enum: -> { Imagekit::Models::FileUploadV1Response::ExtensionStatus::GoogleAutoTagging },
                 api_name: :"google-auto-tagging"

        # @!attribute remove_bg
        #
        #   @return [Symbol, Imagekit::Models::FileUploadV1Response::ExtensionStatus::RemoveBg, nil]
        optional :remove_bg,
                 enum: -> { Imagekit::Models::FileUploadV1Response::ExtensionStatus::RemoveBg },
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
        #   @param aws_auto_tagging [Symbol, Imagekit::Models::FileUploadV1Response::ExtensionStatus::AwsAutoTagging]
        #   @param google_auto_tagging [Symbol, Imagekit::Models::FileUploadV1Response::ExtensionStatus::GoogleAutoTagging]
        #   @param remove_bg [Symbol, Imagekit::Models::FileUploadV1Response::ExtensionStatus::RemoveBg]

        # @see Imagekit::Models::FileUploadV1Response::ExtensionStatus#aws_auto_tagging
        module AwsAutoTagging
          extend Imagekit::Internal::Type::Enum

          SUCCESS = :success
          PENDING = :pending
          FAILED = :failed

          # @!method self.values
          #   @return [Array<Symbol>]
        end

        # @see Imagekit::Models::FileUploadV1Response::ExtensionStatus#google_auto_tagging
        module GoogleAutoTagging
          extend Imagekit::Internal::Type::Enum

          SUCCESS = :success
          PENDING = :pending
          FAILED = :failed

          # @!method self.values
          #   @return [Array<Symbol>]
        end

        # @see Imagekit::Models::FileUploadV1Response::ExtensionStatus#remove_bg
        module RemoveBg
          extend Imagekit::Internal::Type::Enum

          SUCCESS = :success
          PENDING = :pending
          FAILED = :failed

          # @!method self.values
          #   @return [Array<Symbol>]
        end
      end

      # @see Imagekit::Models::FileUploadV1Response#metadata
      class Metadata < Imagekit::Internal::Type::BaseModel
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

        # @!attribute density
        #   The density of the image in DPI.
        #
        #   @return [Integer, nil]
        optional :density, Integer

        # @!attribute duration
        #   The duration of the video in seconds (only for video).
        #
        #   @return [Integer, nil]
        optional :duration, Integer

        # @!attribute exif
        #
        #   @return [Imagekit::Models::FileUploadV1Response::Metadata::Exif, nil]
        optional :exif, -> { Imagekit::Models::FileUploadV1Response::Metadata::Exif }

        # @!attribute format_
        #   The format of the file (e.g., 'jpg', 'mp4').
        #
        #   @return [String, nil]
        optional :format_, String, api_name: :format

        # @!attribute has_color_profile
        #   Indicates if the image has a color profile.
        #
        #   @return [Boolean, nil]
        optional :has_color_profile, Imagekit::Internal::Type::Boolean, api_name: :hasColorProfile

        # @!attribute has_transparency
        #   Indicates if the image contains transparent areas.
        #
        #   @return [Boolean, nil]
        optional :has_transparency, Imagekit::Internal::Type::Boolean, api_name: :hasTransparency

        # @!attribute height
        #   The height of the image or video in pixels.
        #
        #   @return [Integer, nil]
        optional :height, Integer

        # @!attribute p_hash
        #   Perceptual hash of the image.
        #
        #   @return [String, nil]
        optional :p_hash, String, api_name: :pHash

        # @!attribute quality
        #   The quality indicator of the image.
        #
        #   @return [Integer, nil]
        optional :quality, Integer

        # @!attribute size
        #   The file size in bytes.
        #
        #   @return [Integer, nil]
        optional :size, Integer

        # @!attribute video_codec
        #   The video codec used in the video (only for video).
        #
        #   @return [String, nil]
        optional :video_codec, String, api_name: :videoCodec

        # @!attribute width
        #   The width of the image or video in pixels.
        #
        #   @return [Integer, nil]
        optional :width, Integer

        # @!method initialize(audio_codec: nil, bit_rate: nil, density: nil, duration: nil, exif: nil, format_: nil, has_color_profile: nil, has_transparency: nil, height: nil, p_hash: nil, quality: nil, size: nil, video_codec: nil, width: nil)
        #   Legacy metadata. Send `metadata` in `responseFields` in API request to get
        #   metadata in the upload API response.
        #
        #   @param audio_codec [String] The audio codec used in the video (only for video).
        #
        #   @param bit_rate [Integer] The bit rate of the video in kbps (only for video).
        #
        #   @param density [Integer] The density of the image in DPI.
        #
        #   @param duration [Integer] The duration of the video in seconds (only for video).
        #
        #   @param exif [Imagekit::Models::FileUploadV1Response::Metadata::Exif]
        #
        #   @param format_ [String] The format of the file (e.g., 'jpg', 'mp4').
        #
        #   @param has_color_profile [Boolean] Indicates if the image has a color profile.
        #
        #   @param has_transparency [Boolean] Indicates if the image contains transparent areas.
        #
        #   @param height [Integer] The height of the image or video in pixels.
        #
        #   @param p_hash [String] Perceptual hash of the image.
        #
        #   @param quality [Integer] The quality indicator of the image.
        #
        #   @param size [Integer] The file size in bytes.
        #
        #   @param video_codec [String] The video codec used in the video (only for video).
        #
        #   @param width [Integer] The width of the image or video in pixels.

        # @see Imagekit::Models::FileUploadV1Response::Metadata#exif
        class Exif < Imagekit::Internal::Type::BaseModel
          # @!attribute exif
          #   Object containing Exif details.
          #
          #   @return [Imagekit::Models::ExifDetails, nil]
          optional :exif, -> { Imagekit::ExifDetails }

          # @!attribute gps
          #   Object containing GPS information.
          #
          #   @return [Imagekit::Models::Gps, nil]
          optional :gps, -> { Imagekit::Gps }

          # @!attribute image
          #   Object containing EXIF image information.
          #
          #   @return [Imagekit::Models::ExifImage, nil]
          optional :image, -> { Imagekit::ExifImage }

          # @!attribute interoperability
          #   JSON object.
          #
          #   @return [Imagekit::Models::Interoperability, nil]
          optional :interoperability, -> { Imagekit::Interoperability }

          # @!attribute makernote
          #
          #   @return [Hash{Symbol=>Object}, nil]
          optional :makernote, Imagekit::Internal::Type::HashOf[Imagekit::Internal::Type::Unknown]

          # @!attribute thumbnail
          #   Object containing Thumbnail information.
          #
          #   @return [Imagekit::Models::Thumbnail, nil]
          optional :thumbnail, -> { Imagekit::Thumbnail }

          # @!method initialize(exif: nil, gps: nil, image: nil, interoperability: nil, makernote: nil, thumbnail: nil)
          #   @param exif [Imagekit::Models::ExifDetails] Object containing Exif details.
          #
          #   @param gps [Imagekit::Models::Gps] Object containing GPS information.
          #
          #   @param image [Imagekit::Models::ExifImage] Object containing EXIF image information.
          #
          #   @param interoperability [Imagekit::Models::Interoperability] JSON object.
          #
          #   @param makernote [Hash{Symbol=>Object}]
          #
          #   @param thumbnail [Imagekit::Models::Thumbnail] Object containing Thumbnail information.
        end
      end

      # @see Imagekit::Models::FileUploadV1Response#version_info
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
  end
end
