# frozen_string_literal: true

module Imagekit
  module Models
    # @see Imagekit::Resources::Files#update
    class FileUpdateParams < Imagekit::Internal::Type::BaseModel
      extend Imagekit::Internal::Type::RequestParameters::Converter
      include Imagekit::Internal::Type::RequestParameters

      # @!attribute update
      #
      #   @return [Imagekit::Models::FileUpdateParams::Update::UpdateFileDetails, Imagekit::Models::FileUpdateParams::Update::ChangePublicationStatus, nil]
      optional :update, union: -> { Imagekit::FileUpdateParams::Update }

      # @!method initialize(update: nil, request_options: {})
      #   @param update [Imagekit::Models::FileUpdateParams::Update::UpdateFileDetails, Imagekit::Models::FileUpdateParams::Update::ChangePublicationStatus]
      #   @param request_options [Imagekit::RequestOptions, Hash{Symbol=>Object}]

      module Update
        extend Imagekit::Internal::Type::Union

        variant -> { Imagekit::FileUpdateParams::Update::UpdateFileDetails }

        variant -> { Imagekit::FileUpdateParams::Update::ChangePublicationStatus }

        class UpdateFileDetails < Imagekit::Internal::Type::BaseModel
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
                   Imagekit::Internal::Type::HashOf[Imagekit::Internal::Type::Unknown],
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
          #   @return [Array<Imagekit::Models::FileUpdateParams::Update::UpdateFileDetails::Extension::RemoveBg, Imagekit::Models::FileUpdateParams::Update::UpdateFileDetails::Extension::AIAutoDescription, Imagekit::Models::FileUpdateParams::Update::UpdateFileDetails::Extension::AutoTaggingExtension>, nil]
          optional :extensions,
                   -> { Imagekit::Internal::Type::ArrayOf[union: Imagekit::FileUpdateParams::Update::UpdateFileDetails::Extension] }

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
                   union: -> { Imagekit::FileUpdateParams::Update::UpdateFileDetails::RemoveAITags },
                   api_name: :removeAITags

          # @!attribute tags
          #   An array of tags associated with the file, such as `["tag1", "tag2"]`. Send
          #   `null` to unset all tags associated with the file.
          #
          #   @return [Array<String>, nil]
          optional :tags, Imagekit::Internal::Type::ArrayOf[String], nil?: true

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
          #   {Imagekit::Models::FileUpdateParams::Update::UpdateFileDetails} for more
          #   details.
          #
          #   @param custom_coordinates [String, nil] Define an important area in the image in the format `x,y,width,height` e.g. `10,
          #
          #   @param custom_metadata [Hash{Symbol=>Object}] A key-value data to be associated with the asset. To unset a key, send `null` va
          #
          #   @param description [String] Optional text to describe the contents of the file.
          #
          #   @param extensions [Array<Imagekit::Models::FileUpdateParams::Update::UpdateFileDetails::Extension::RemoveBg, Imagekit::Models::FileUpdateParams::Update::UpdateFileDetails::Extension::AIAutoDescription, Imagekit::Models::FileUpdateParams::Update::UpdateFileDetails::Extension::AutoTaggingExtension>] Array of extensions to be applied to the asset. Each extension can be configured
          #
          #   @param remove_ai_tags [Array<String>, Symbol, :all] An array of AITags associated with the file that you want to remove, e.g. `["car
          #
          #   @param tags [Array<String>, nil] An array of tags associated with the file, such as `["tag1", "tag2"]`. Send `nul
          #
          #   @param webhook_url [String] The final status of extensions after they have completed execution will be deliv

          module Extension
            extend Imagekit::Internal::Type::Union

            discriminator :name

            variant :"remove-bg", -> { Imagekit::FileUpdateParams::Update::UpdateFileDetails::Extension::RemoveBg }

            variant :"ai-auto-description",
                    -> { Imagekit::FileUpdateParams::Update::UpdateFileDetails::Extension::AIAutoDescription }

            variant -> { Imagekit::FileUpdateParams::Update::UpdateFileDetails::Extension::AutoTaggingExtension }

            class RemoveBg < Imagekit::Internal::Type::BaseModel
              # @!attribute name
              #   Specifies the background removal extension.
              #
              #   @return [Symbol, :"remove-bg"]
              required :name, const: :"remove-bg"

              # @!attribute options
              #
              #   @return [Imagekit::Models::FileUpdateParams::Update::UpdateFileDetails::Extension::RemoveBg::Options, nil]
              optional :options,
                       -> { Imagekit::FileUpdateParams::Update::UpdateFileDetails::Extension::RemoveBg::Options }

              # @!method initialize(options: nil, name: :"remove-bg")
              #   @param options [Imagekit::Models::FileUpdateParams::Update::UpdateFileDetails::Extension::RemoveBg::Options]
              #
              #   @param name [Symbol, :"remove-bg"] Specifies the background removal extension.

              # @see Imagekit::Models::FileUpdateParams::Update::UpdateFileDetails::Extension::RemoveBg#options
              class Options < Imagekit::Internal::Type::BaseModel
                # @!attribute add_shadow
                #   Whether to add an artificial shadow to the result. Default is false. Note:
                #   Adding shadows is currently only supported for car photos.
                #
                #   @return [Boolean, nil]
                optional :add_shadow, Imagekit::Internal::Type::Boolean

                # @!attribute bg_color
                #   Specifies a solid color background using hex code (e.g., "81d4fa", "fff") or
                #   color name (e.g., "green"). If this parameter is set, `bg_image_url` must be
                #   empty.
                #
                #   @return [String, nil]
                optional :bg_color, String

                # @!attribute bg_image_url
                #   Sets a background image from a URL. If this parameter is set, `bg_color` must be
                #   empty.
                #
                #   @return [String, nil]
                optional :bg_image_url, String

                # @!attribute semitransparency
                #   Allows semi-transparent regions in the result. Default is true. Note:
                #   Semitransparency is currently only supported for car windows.
                #
                #   @return [Boolean, nil]
                optional :semitransparency, Imagekit::Internal::Type::Boolean

                # @!method initialize(add_shadow: nil, bg_color: nil, bg_image_url: nil, semitransparency: nil)
                #   Some parameter documentations has been truncated, see
                #   {Imagekit::Models::FileUpdateParams::Update::UpdateFileDetails::Extension::RemoveBg::Options}
                #   for more details.
                #
                #   @param add_shadow [Boolean] Whether to add an artificial shadow to the result. Default is false. Note: Addin
                #
                #   @param bg_color [String] Specifies a solid color background using hex code (e.g., "81d4fa", "fff") or col
                #
                #   @param bg_image_url [String] Sets a background image from a URL. If this parameter is set, `bg_color` must be
                #
                #   @param semitransparency [Boolean] Allows semi-transparent regions in the result. Default is true. Note: Semitransp
              end
            end

            class AutoTaggingExtension < Imagekit::Internal::Type::BaseModel
              # @!attribute max_tags
              #   Maximum number of tags to attach to the asset.
              #
              #   @return [Integer]
              required :max_tags, Integer, api_name: :maxTags

              # @!attribute min_confidence
              #   Minimum confidence level for tags to be considered valid.
              #
              #   @return [Integer]
              required :min_confidence, Integer, api_name: :minConfidence

              # @!attribute name
              #   Specifies the auto-tagging extension used.
              #
              #   @return [Symbol, Imagekit::Models::FileUpdateParams::Update::UpdateFileDetails::Extension::AutoTaggingExtension::Name]
              required :name,
                       enum: -> { Imagekit::FileUpdateParams::Update::UpdateFileDetails::Extension::AutoTaggingExtension::Name }

              # @!method initialize(max_tags:, min_confidence:, name:)
              #   @param max_tags [Integer] Maximum number of tags to attach to the asset.
              #
              #   @param min_confidence [Integer] Minimum confidence level for tags to be considered valid.
              #
              #   @param name [Symbol, Imagekit::Models::FileUpdateParams::Update::UpdateFileDetails::Extension::AutoTaggingExtension::Name] Specifies the auto-tagging extension used.

              # Specifies the auto-tagging extension used.
              #
              # @see Imagekit::Models::FileUpdateParams::Update::UpdateFileDetails::Extension::AutoTaggingExtension#name
              module Name
                extend Imagekit::Internal::Type::Enum

                GOOGLE_AUTO_TAGGING = :"google-auto-tagging"
                AWS_AUTO_TAGGING = :"aws-auto-tagging"

                # @!method self.values
                #   @return [Array<Symbol>]
              end
            end

            class AIAutoDescription < Imagekit::Internal::Type::BaseModel
              # @!attribute name
              #   Specifies the auto description extension.
              #
              #   @return [Symbol, :"ai-auto-description"]
              required :name, const: :"ai-auto-description"

              # @!method initialize(name: :"ai-auto-description")
              #   @param name [Symbol, :"ai-auto-description"] Specifies the auto description extension.
            end

            # @!method self.variants
            #   @return [Array(Imagekit::Models::FileUpdateParams::Update::UpdateFileDetails::Extension::RemoveBg, Imagekit::Models::FileUpdateParams::Update::UpdateFileDetails::Extension::AIAutoDescription, Imagekit::Models::FileUpdateParams::Update::UpdateFileDetails::Extension::AutoTaggingExtension)]
          end

          # An array of AITags associated with the file that you want to remove, e.g.
          # `["car", "vehicle", "motorsports"]`.
          #
          # If you want to remove all AITags associated with the file, send a string -
          # "all".
          #
          # Note: The remove operation for `AITags` executes before any of the `extensions`
          # are processed.
          #
          # @see Imagekit::Models::FileUpdateParams::Update::UpdateFileDetails#remove_ai_tags
          module RemoveAITags
            extend Imagekit::Internal::Type::Union

            variant -> { Imagekit::Models::FileUpdateParams::Update::UpdateFileDetails::RemoveAITags::StringArray }

            variant const: :all

            # @!method self.variants
            #   @return [Array(Array<String>, Symbol, :all)]

            # @type [Imagekit::Internal::Type::Converter]
            StringArray = Imagekit::Internal::Type::ArrayOf[String]
          end
        end

        class ChangePublicationStatus < Imagekit::Internal::Type::BaseModel
          # @!attribute publish
          #   Configure the publication status of a file and its versions.
          #
          #   @return [Imagekit::Models::FileUpdateParams::Update::ChangePublicationStatus::Publish, nil]
          optional :publish, -> { Imagekit::FileUpdateParams::Update::ChangePublicationStatus::Publish }

          # @!method initialize(publish: nil)
          #   Some parameter documentations has been truncated, see
          #   {Imagekit::Models::FileUpdateParams::Update::ChangePublicationStatus} for more
          #   details.
          #
          #   @param publish [Imagekit::Models::FileUpdateParams::Update::ChangePublicationStatus::Publish] Configure the publication status of a file and its versions.

          # @see Imagekit::Models::FileUpdateParams::Update::ChangePublicationStatus#publish
          class Publish < Imagekit::Internal::Type::BaseModel
            # @!attribute is_published
            #   Set to `true` to publish the file. Set to `false` to unpublish the file.
            #
            #   @return [Boolean]
            required :is_published, Imagekit::Internal::Type::Boolean, api_name: :isPublished

            # @!attribute include_file_versions
            #   Set to `true` to publish/unpublish all versions of the file. Set to `false` to
            #   publish/unpublish only the current version of the file.
            #
            #   @return [Boolean, nil]
            optional :include_file_versions, Imagekit::Internal::Type::Boolean, api_name: :includeFileVersions

            # @!method initialize(is_published:, include_file_versions: nil)
            #   Some parameter documentations has been truncated, see
            #   {Imagekit::Models::FileUpdateParams::Update::ChangePublicationStatus::Publish}
            #   for more details.
            #
            #   Configure the publication status of a file and its versions.
            #
            #   @param is_published [Boolean] Set to `true` to publish the file. Set to `false` to unpublish the file.
            #
            #   @param include_file_versions [Boolean] Set to `true` to publish/unpublish all versions of the file. Set to `false` to p
          end
        end

        # @!method self.variants
        #   @return [Array(Imagekit::Models::FileUpdateParams::Update::UpdateFileDetails, Imagekit::Models::FileUpdateParams::Update::ChangePublicationStatus)]
      end
    end
  end
end
