# frozen_string_literal: true

module Imagekitio
  module Models
    # Schema for update file update request.
    module UpdateFileRequest
      extend Imagekitio::Internal::Type::Union

      variant -> { Imagekitio::UpdateFileRequest::UpdateFileDetails }

      variant -> { Imagekitio::UpdateFileRequest::ChangePublicationStatus }

      class UpdateFileDetails < Imagekitio::Internal::Type::BaseModel
        # @!attribute custom_coordinates
        #   Define an important area in the image in the format `x,y,width,height` e.g.
        #   `10,10,100,100`. Send `null` to unset this value.
        #
        #   @return [String, nil]
        optional :custom_coordinates, String, api_name: :customCoordinates, nil?: true

        # @!attribute custom_metadata
        #   A key-value data to be associated with the asset. To unset a key, send `null`
        #   value for that key. Before setting any custom metadata on an asset you have to
        #   create the field using custom metadata fields API.
        #
        #   @return [Hash{Symbol=>Object}, nil]
        optional :custom_metadata,
                 Imagekitio::Internal::Type::HashOf[Imagekitio::Internal::Type::Unknown],
                 api_name: :customMetadata

        # @!attribute description
        #   Optional text to describe the contents of the file.
        #
        #   @return [String, nil]
        optional :description, String

        # @!attribute extensions
        #   Array of extensions to be applied to the asset. Each extension can be configured
        #   with specific parameters based on the extension type.
        #
        #   @return [Array<Imagekitio::Models::ExtensionItem::RemoveBg, Imagekitio::Models::ExtensionItem::AIAutoDescription, Imagekitio::Models::ExtensionItem::AutoTaggingExtension>, nil]
        optional :extensions, -> { Imagekitio::Internal::Type::ArrayOf[union: Imagekitio::ExtensionItem] }

        # @!attribute remove_ai_tags
        #   An array of AITags associated with the file that you want to remove, e.g.
        #   `["car", "vehicle", "motorsports"]`.
        #
        #   If you want to remove all AITags associated with the file, send a string -
        #   "all".
        #
        #   Note: The remove operation for `AITags` executes before any of the `extensions`
        #   are processed.
        #
        #   @return [Array<String>, Symbol, :all, nil]
        optional :remove_ai_tags,
                 union: -> { Imagekitio::UpdateFileRequest::UpdateFileDetails::RemoveAITags },
                 api_name: :removeAITags

        # @!attribute tags
        #   An array of tags associated with the file, such as `["tag1", "tag2"]`. Send
        #   `null` to unset all tags associated with the file.
        #
        #   @return [Array<String>, nil]
        optional :tags, Imagekitio::Internal::Type::ArrayOf[String], nil?: true

        # @!attribute webhook_url
        #   The final status of extensions after they have completed execution will be
        #   delivered to this endpoint as a POST request.
        #   [Learn more](/docs/api-reference/digital-asset-management-dam/managing-assets/update-file-details#webhook-payload-structure)
        #   about the webhook payload structure.
        #
        #   @return [String, nil]
        optional :webhook_url, String, api_name: :webhookUrl

        # @!method initialize(custom_coordinates: nil, custom_metadata: nil, description: nil, extensions: nil, remove_ai_tags: nil, tags: nil, webhook_url: nil)
        #   Some parameter documentations has been truncated, see
        #   {Imagekitio::Models::UpdateFileRequest::UpdateFileDetails} for more details.
        #
        #   @param custom_coordinates [String, nil] Define an important area in the image in the format `x,y,width,height` e.g. `10,
        #
        #   @param custom_metadata [Hash{Symbol=>Object}] A key-value data to be associated with the asset. To unset a key, send `null` va
        #
        #   @param description [String] Optional text to describe the contents of the file.
        #
        #   @param extensions [Array<Imagekitio::Models::ExtensionItem::RemoveBg, Imagekitio::Models::ExtensionItem::AIAutoDescription, Imagekitio::Models::ExtensionItem::AutoTaggingExtension>] Array of extensions to be applied to the asset. Each extension can be configured
        #
        #   @param remove_ai_tags [Array<String>, Symbol, :all] An array of AITags associated with the file that you want to remove, e.g. `["car
        #
        #   @param tags [Array<String>, nil] An array of tags associated with the file, such as `["tag1", "tag2"]`. Send `nul
        #
        #   @param webhook_url [String] The final status of extensions after they have completed execution will be deliv

        # An array of AITags associated with the file that you want to remove, e.g.
        # `["car", "vehicle", "motorsports"]`.
        #
        # If you want to remove all AITags associated with the file, send a string -
        # "all".
        #
        # Note: The remove operation for `AITags` executes before any of the `extensions`
        # are processed.
        #
        # @see Imagekitio::Models::UpdateFileRequest::UpdateFileDetails#remove_ai_tags
        module RemoveAITags
          extend Imagekitio::Internal::Type::Union

          variant -> { Imagekitio::Models::UpdateFileRequest::UpdateFileDetails::RemoveAITags::StringArray }

          variant const: :all

          # @!method self.variants
          #   @return [Array(Array<String>, Symbol, :all)]

          # @type [Imagekitio::Internal::Type::Converter]
          StringArray = Imagekitio::Internal::Type::ArrayOf[String]
        end
      end

      class ChangePublicationStatus < Imagekitio::Internal::Type::BaseModel
        # @!attribute publish
        #   Configure the publication status of a file and its versions.
        #
        #   @return [Imagekitio::Models::UpdateFileRequest::ChangePublicationStatus::Publish, nil]
        optional :publish, -> { Imagekitio::UpdateFileRequest::ChangePublicationStatus::Publish }

        # @!method initialize(publish: nil)
        #   Some parameter documentations has been truncated, see
        #   {Imagekitio::Models::UpdateFileRequest::ChangePublicationStatus} for more
        #   details.
        #
        #   @param publish [Imagekitio::Models::UpdateFileRequest::ChangePublicationStatus::Publish] Configure the publication status of a file and its versions.

        # @see Imagekitio::Models::UpdateFileRequest::ChangePublicationStatus#publish
        class Publish < Imagekitio::Internal::Type::BaseModel
          # @!attribute is_published
          #   Set to `true` to publish the file. Set to `false` to unpublish the file.
          #
          #   @return [Boolean]
          required :is_published, Imagekitio::Internal::Type::Boolean, api_name: :isPublished

          # @!attribute include_file_versions
          #   Set to `true` to publish/unpublish all versions of the file. Set to `false` to
          #   publish/unpublish only the current version of the file.
          #
          #   @return [Boolean, nil]
          optional :include_file_versions, Imagekitio::Internal::Type::Boolean, api_name: :includeFileVersions

          # @!method initialize(is_published:, include_file_versions: nil)
          #   Some parameter documentations has been truncated, see
          #   {Imagekitio::Models::UpdateFileRequest::ChangePublicationStatus::Publish} for
          #   more details.
          #
          #   Configure the publication status of a file and its versions.
          #
          #   @param is_published [Boolean] Set to `true` to publish the file. Set to `false` to unpublish the file.
          #
          #   @param include_file_versions [Boolean] Set to `true` to publish/unpublish all versions of the file. Set to `false` to p
        end
      end

      # @!method self.variants
      #   @return [Array(Imagekitio::Models::UpdateFileRequest::UpdateFileDetails, Imagekitio::Models::UpdateFileRequest::ChangePublicationStatus)]
    end
  end
end
