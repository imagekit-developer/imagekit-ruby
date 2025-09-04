# typed: strong

module Imagekit
  module Models
    class FileUpdateParams < Imagekit::Internal::Type::BaseModel
      extend Imagekit::Internal::Type::RequestParameters::Converter
      include Imagekit::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(Imagekit::FileUpdateParams, Imagekit::Internal::AnyHash)
        end

      sig do
        returns(
          T.nilable(
            T.any(
              Imagekit::FileUpdateParams::Update::UpdateFileDetails,
              Imagekit::FileUpdateParams::Update::ChangePublicationStatus
            )
          )
        )
      end
      attr_reader :update

      sig do
        params(
          update:
            T.any(
              Imagekit::FileUpdateParams::Update::UpdateFileDetails::OrHash,
              Imagekit::FileUpdateParams::Update::ChangePublicationStatus::OrHash
            )
        ).void
      end
      attr_writer :update

      sig do
        params(
          update:
            T.any(
              Imagekit::FileUpdateParams::Update::UpdateFileDetails::OrHash,
              Imagekit::FileUpdateParams::Update::ChangePublicationStatus::OrHash
            ),
          request_options: Imagekit::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(update: nil, request_options: {})
      end

      sig do
        override.returns(
          {
            update:
              T.any(
                Imagekit::FileUpdateParams::Update::UpdateFileDetails,
                Imagekit::FileUpdateParams::Update::ChangePublicationStatus
              ),
            request_options: Imagekit::RequestOptions
          }
        )
      end
      def to_hash
      end

      module Update
        extend Imagekit::Internal::Type::Union

        Variants =
          T.type_alias do
            T.any(
              Imagekit::FileUpdateParams::Update::UpdateFileDetails,
              Imagekit::FileUpdateParams::Update::ChangePublicationStatus
            )
          end

        class UpdateFileDetails < Imagekit::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Imagekit::FileUpdateParams::Update::UpdateFileDetails,
                Imagekit::Internal::AnyHash
              )
            end

          # Define an important area in the image in the format `x,y,width,height` e.g.
          # `10,10,100,100`. Send `null` to unset this value.
          sig { returns(T.nilable(String)) }
          attr_accessor :custom_coordinates

          # A key-value data to be associated with the asset. To unset a key, send `null`
          # value for that key. Before setting any custom metadata on an asset you have to
          # create the field using custom metadata fields API.
          sig { returns(T.nilable(T::Hash[Symbol, T.anything])) }
          attr_reader :custom_metadata

          sig { params(custom_metadata: T::Hash[Symbol, T.anything]).void }
          attr_writer :custom_metadata

          # Optional text to describe the contents of the file.
          sig { returns(T.nilable(String)) }
          attr_reader :description

          sig { params(description: String).void }
          attr_writer :description

          # Array of extensions to be applied to the asset. Each extension can be configured
          # with specific parameters based on the extension type.
          sig do
            returns(
              T.nilable(
                T::Array[
                  T.any(
                    Imagekit::ExtensionItem::RemoveBg,
                    Imagekit::ExtensionItem::AIAutoDescription,
                    Imagekit::ExtensionItem::AutoTaggingExtension
                  )
                ]
              )
            )
          end
          attr_reader :extensions

          sig do
            params(
              extensions:
                T::Array[
                  T.any(
                    Imagekit::ExtensionItem::RemoveBg::OrHash,
                    Imagekit::ExtensionItem::AIAutoDescription::OrHash,
                    Imagekit::ExtensionItem::AutoTaggingExtension::OrHash
                  )
                ]
            ).void
          end
          attr_writer :extensions

          # An array of AITags associated with the file that you want to remove, e.g.
          # `["car", "vehicle", "motorsports"]`.
          #
          # If you want to remove all AITags associated with the file, send a string -
          # "all".
          #
          # Note: The remove operation for `AITags` executes before any of the `extensions`
          # are processed.
          sig { returns(T.nilable(T.any(T::Array[String], Symbol))) }
          attr_reader :remove_ai_tags

          sig { params(remove_ai_tags: T.any(T::Array[String], Symbol)).void }
          attr_writer :remove_ai_tags

          # An array of tags associated with the file, such as `["tag1", "tag2"]`. Send
          # `null` to unset all tags associated with the file.
          sig { returns(T.nilable(T::Array[String])) }
          attr_accessor :tags

          # The final status of extensions after they have completed execution will be
          # delivered to this endpoint as a POST request.
          # [Learn more](/docs/api-reference/digital-asset-management-dam/managing-assets/update-file-details#webhook-payload-structure)
          # about the webhook payload structure.
          sig { returns(T.nilable(String)) }
          attr_reader :webhook_url

          sig { params(webhook_url: String).void }
          attr_writer :webhook_url

          sig do
            params(
              custom_coordinates: T.nilable(String),
              custom_metadata: T::Hash[Symbol, T.anything],
              description: String,
              extensions:
                T::Array[
                  T.any(
                    Imagekit::ExtensionItem::RemoveBg::OrHash,
                    Imagekit::ExtensionItem::AIAutoDescription::OrHash,
                    Imagekit::ExtensionItem::AutoTaggingExtension::OrHash
                  )
                ],
              remove_ai_tags: T.any(T::Array[String], Symbol),
              tags: T.nilable(T::Array[String]),
              webhook_url: String
            ).returns(T.attached_class)
          end
          def self.new(
            # Define an important area in the image in the format `x,y,width,height` e.g.
            # `10,10,100,100`. Send `null` to unset this value.
            custom_coordinates: nil,
            # A key-value data to be associated with the asset. To unset a key, send `null`
            # value for that key. Before setting any custom metadata on an asset you have to
            # create the field using custom metadata fields API.
            custom_metadata: nil,
            # Optional text to describe the contents of the file.
            description: nil,
            # Array of extensions to be applied to the asset. Each extension can be configured
            # with specific parameters based on the extension type.
            extensions: nil,
            # An array of AITags associated with the file that you want to remove, e.g.
            # `["car", "vehicle", "motorsports"]`.
            #
            # If you want to remove all AITags associated with the file, send a string -
            # "all".
            #
            # Note: The remove operation for `AITags` executes before any of the `extensions`
            # are processed.
            remove_ai_tags: nil,
            # An array of tags associated with the file, such as `["tag1", "tag2"]`. Send
            # `null` to unset all tags associated with the file.
            tags: nil,
            # The final status of extensions after they have completed execution will be
            # delivered to this endpoint as a POST request.
            # [Learn more](/docs/api-reference/digital-asset-management-dam/managing-assets/update-file-details#webhook-payload-structure)
            # about the webhook payload structure.
            webhook_url: nil
          )
          end

          sig do
            override.returns(
              {
                custom_coordinates: T.nilable(String),
                custom_metadata: T::Hash[Symbol, T.anything],
                description: String,
                extensions:
                  T::Array[
                    T.any(
                      Imagekit::ExtensionItem::RemoveBg,
                      Imagekit::ExtensionItem::AIAutoDescription,
                      Imagekit::ExtensionItem::AutoTaggingExtension
                    )
                  ],
                remove_ai_tags: T.any(T::Array[String], Symbol),
                tags: T.nilable(T::Array[String]),
                webhook_url: String
              }
            )
          end
          def to_hash
          end

          # An array of AITags associated with the file that you want to remove, e.g.
          # `["car", "vehicle", "motorsports"]`.
          #
          # If you want to remove all AITags associated with the file, send a string -
          # "all".
          #
          # Note: The remove operation for `AITags` executes before any of the `extensions`
          # are processed.
          module RemoveAITags
            extend Imagekit::Internal::Type::Union

            Variants = T.type_alias { T.any(T::Array[String], Symbol) }

            sig do
              override.returns(
                T::Array[
                  Imagekit::FileUpdateParams::Update::UpdateFileDetails::RemoveAITags::Variants
                ]
              )
            end
            def self.variants
            end

            StringArray =
              T.let(
                Imagekit::Internal::Type::ArrayOf[String],
                Imagekit::Internal::Type::Converter
              )
          end
        end

        class ChangePublicationStatus < Imagekit::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Imagekit::FileUpdateParams::Update::ChangePublicationStatus,
                Imagekit::Internal::AnyHash
              )
            end

          # Configure the publication status of a file and its versions.
          sig do
            returns(
              T.nilable(
                Imagekit::FileUpdateParams::Update::ChangePublicationStatus::Publish
              )
            )
          end
          attr_reader :publish

          sig do
            params(
              publish:
                Imagekit::FileUpdateParams::Update::ChangePublicationStatus::Publish::OrHash
            ).void
          end
          attr_writer :publish

          sig do
            params(
              publish:
                Imagekit::FileUpdateParams::Update::ChangePublicationStatus::Publish::OrHash
            ).returns(T.attached_class)
          end
          def self.new(
            # Configure the publication status of a file and its versions.
            publish: nil
          )
          end

          sig do
            override.returns(
              {
                publish:
                  Imagekit::FileUpdateParams::Update::ChangePublicationStatus::Publish
              }
            )
          end
          def to_hash
          end

          class Publish < Imagekit::Internal::Type::BaseModel
            OrHash =
              T.type_alias do
                T.any(
                  Imagekit::FileUpdateParams::Update::ChangePublicationStatus::Publish,
                  Imagekit::Internal::AnyHash
                )
              end

            # Set to `true` to publish the file. Set to `false` to unpublish the file.
            sig { returns(T::Boolean) }
            attr_accessor :is_published

            # Set to `true` to publish/unpublish all versions of the file. Set to `false` to
            # publish/unpublish only the current version of the file.
            sig { returns(T.nilable(T::Boolean)) }
            attr_reader :include_file_versions

            sig { params(include_file_versions: T::Boolean).void }
            attr_writer :include_file_versions

            # Configure the publication status of a file and its versions.
            sig do
              params(
                is_published: T::Boolean,
                include_file_versions: T::Boolean
              ).returns(T.attached_class)
            end
            def self.new(
              # Set to `true` to publish the file. Set to `false` to unpublish the file.
              is_published:,
              # Set to `true` to publish/unpublish all versions of the file. Set to `false` to
              # publish/unpublish only the current version of the file.
              include_file_versions: nil
            )
            end

            sig do
              override.returns(
                { is_published: T::Boolean, include_file_versions: T::Boolean }
              )
            end
            def to_hash
            end
          end
        end

        sig do
          override.returns(
            T::Array[Imagekit::FileUpdateParams::Update::Variants]
          )
        end
        def self.variants
        end
      end
    end
  end
end
