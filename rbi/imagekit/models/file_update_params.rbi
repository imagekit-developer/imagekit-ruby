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
                Imagekit::FileUpdateParams::Extension::RemovedotBgExtension,
                Imagekit::FileUpdateParams::Extension::AutoTaggingExtension,
                Imagekit::FileUpdateParams::Extension::AutoDescriptionExtension
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
                Imagekit::FileUpdateParams::Extension::RemovedotBgExtension::OrHash,
                Imagekit::FileUpdateParams::Extension::AutoTaggingExtension::OrHash,
                Imagekit::FileUpdateParams::Extension::AutoDescriptionExtension::OrHash
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
      sig do
        returns(
          T.nilable(
            T.any(
              T::Array[String],
              Imagekit::FileUpdateParams::RemoveAITags::OrSymbol
            )
          )
        )
      end
      attr_reader :remove_ai_tags

      sig do
        params(
          remove_ai_tags:
            T.any(
              T::Array[String],
              Imagekit::FileUpdateParams::RemoveAITags::OrSymbol
            )
        ).void
      end
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

      # Configure the publication status of a file and its versions.
      sig { returns(T.nilable(Imagekit::FileUpdateParams::Publish)) }
      attr_reader :publish

      sig { params(publish: Imagekit::FileUpdateParams::Publish::OrHash).void }
      attr_writer :publish

      sig do
        params(
          custom_coordinates: T.nilable(String),
          custom_metadata: T::Hash[Symbol, T.anything],
          description: String,
          extensions:
            T::Array[
              T.any(
                Imagekit::FileUpdateParams::Extension::RemovedotBgExtension::OrHash,
                Imagekit::FileUpdateParams::Extension::AutoTaggingExtension::OrHash,
                Imagekit::FileUpdateParams::Extension::AutoDescriptionExtension::OrHash
              )
            ],
          remove_ai_tags:
            T.any(
              T::Array[String],
              Imagekit::FileUpdateParams::RemoveAITags::OrSymbol
            ),
          tags: T.nilable(T::Array[String]),
          webhook_url: String,
          publish: Imagekit::FileUpdateParams::Publish::OrHash,
          request_options: Imagekit::RequestOptions::OrHash
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
        webhook_url: nil,
        # Configure the publication status of a file and its versions.
        publish: nil,
        request_options: {}
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
                  Imagekit::FileUpdateParams::Extension::RemovedotBgExtension,
                  Imagekit::FileUpdateParams::Extension::AutoTaggingExtension,
                  Imagekit::FileUpdateParams::Extension::AutoDescriptionExtension
                )
              ],
            remove_ai_tags:
              T.any(
                T::Array[String],
                Imagekit::FileUpdateParams::RemoveAITags::OrSymbol
              ),
            tags: T.nilable(T::Array[String]),
            webhook_url: String,
            publish: Imagekit::FileUpdateParams::Publish,
            request_options: Imagekit::RequestOptions
          }
        )
      end
      def to_hash
      end

      module Extension
        extend Imagekit::Internal::Type::Union

        Variants =
          T.type_alias do
            T.any(
              Imagekit::FileUpdateParams::Extension::RemovedotBgExtension,
              Imagekit::FileUpdateParams::Extension::AutoTaggingExtension,
              Imagekit::FileUpdateParams::Extension::AutoDescriptionExtension
            )
          end

        class RemovedotBgExtension < Imagekit::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Imagekit::FileUpdateParams::Extension::RemovedotBgExtension,
                Imagekit::Internal::AnyHash
              )
            end

          # Specifies the background removal extension.
          sig do
            returns(
              Imagekit::FileUpdateParams::Extension::RemovedotBgExtension::Name::OrSymbol
            )
          end
          attr_accessor :name

          sig do
            returns(
              T.nilable(
                Imagekit::FileUpdateParams::Extension::RemovedotBgExtension::Options
              )
            )
          end
          attr_reader :options

          sig do
            params(
              options:
                Imagekit::FileUpdateParams::Extension::RemovedotBgExtension::Options::OrHash
            ).void
          end
          attr_writer :options

          sig do
            params(
              name:
                Imagekit::FileUpdateParams::Extension::RemovedotBgExtension::Name::OrSymbol,
              options:
                Imagekit::FileUpdateParams::Extension::RemovedotBgExtension::Options::OrHash
            ).returns(T.attached_class)
          end
          def self.new(
            # Specifies the background removal extension.
            name:,
            options: nil
          )
          end

          sig do
            override.returns(
              {
                name:
                  Imagekit::FileUpdateParams::Extension::RemovedotBgExtension::Name::OrSymbol,
                options:
                  Imagekit::FileUpdateParams::Extension::RemovedotBgExtension::Options
              }
            )
          end
          def to_hash
          end

          # Specifies the background removal extension.
          module Name
            extend Imagekit::Internal::Type::Enum

            TaggedSymbol =
              T.type_alias do
                T.all(
                  Symbol,
                  Imagekit::FileUpdateParams::Extension::RemovedotBgExtension::Name
                )
              end
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            REMOVE_BG =
              T.let(
                :"remove-bg",
                Imagekit::FileUpdateParams::Extension::RemovedotBgExtension::Name::TaggedSymbol
              )

            sig do
              override.returns(
                T::Array[
                  Imagekit::FileUpdateParams::Extension::RemovedotBgExtension::Name::TaggedSymbol
                ]
              )
            end
            def self.values
            end
          end

          class Options < Imagekit::Internal::Type::BaseModel
            OrHash =
              T.type_alias do
                T.any(
                  Imagekit::FileUpdateParams::Extension::RemovedotBgExtension::Options,
                  Imagekit::Internal::AnyHash
                )
              end

            # Whether to add an artificial shadow to the result. Default is false. Note:
            # Adding shadows is currently only supported for car photos.
            sig { returns(T.nilable(T::Boolean)) }
            attr_reader :add_shadow

            sig { params(add_shadow: T::Boolean).void }
            attr_writer :add_shadow

            # Specifies a solid color background using hex code (e.g., "81d4fa", "fff") or
            # color name (e.g., "green"). If this parameter is set, `bg_image_url` must be
            # empty.
            sig { returns(T.nilable(String)) }
            attr_reader :bg_color

            sig { params(bg_color: String).void }
            attr_writer :bg_color

            # Sets a background image from a URL. If this parameter is set, `bg_color` must be
            # empty.
            sig { returns(T.nilable(String)) }
            attr_reader :bg_image_url

            sig { params(bg_image_url: String).void }
            attr_writer :bg_image_url

            # Allows semi-transparent regions in the result. Default is true. Note:
            # Semitransparency is currently only supported for car windows.
            sig { returns(T.nilable(T::Boolean)) }
            attr_reader :semitransparency

            sig { params(semitransparency: T::Boolean).void }
            attr_writer :semitransparency

            sig do
              params(
                add_shadow: T::Boolean,
                bg_color: String,
                bg_image_url: String,
                semitransparency: T::Boolean
              ).returns(T.attached_class)
            end
            def self.new(
              # Whether to add an artificial shadow to the result. Default is false. Note:
              # Adding shadows is currently only supported for car photos.
              add_shadow: nil,
              # Specifies a solid color background using hex code (e.g., "81d4fa", "fff") or
              # color name (e.g., "green"). If this parameter is set, `bg_image_url` must be
              # empty.
              bg_color: nil,
              # Sets a background image from a URL. If this parameter is set, `bg_color` must be
              # empty.
              bg_image_url: nil,
              # Allows semi-transparent regions in the result. Default is true. Note:
              # Semitransparency is currently only supported for car windows.
              semitransparency: nil
            )
            end

            sig do
              override.returns(
                {
                  add_shadow: T::Boolean,
                  bg_color: String,
                  bg_image_url: String,
                  semitransparency: T::Boolean
                }
              )
            end
            def to_hash
            end
          end
        end

        class AutoTaggingExtension < Imagekit::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Imagekit::FileUpdateParams::Extension::AutoTaggingExtension,
                Imagekit::Internal::AnyHash
              )
            end

          # Maximum number of tags to attach to the asset.
          sig { returns(Integer) }
          attr_accessor :max_tags

          # Minimum confidence level for tags to be considered valid.
          sig { returns(Integer) }
          attr_accessor :min_confidence

          # Specifies the auto-tagging extension used.
          sig do
            returns(
              Imagekit::FileUpdateParams::Extension::AutoTaggingExtension::Name::OrSymbol
            )
          end
          attr_accessor :name

          sig do
            params(
              max_tags: Integer,
              min_confidence: Integer,
              name:
                Imagekit::FileUpdateParams::Extension::AutoTaggingExtension::Name::OrSymbol
            ).returns(T.attached_class)
          end
          def self.new(
            # Maximum number of tags to attach to the asset.
            max_tags:,
            # Minimum confidence level for tags to be considered valid.
            min_confidence:,
            # Specifies the auto-tagging extension used.
            name:
          )
          end

          sig do
            override.returns(
              {
                max_tags: Integer,
                min_confidence: Integer,
                name:
                  Imagekit::FileUpdateParams::Extension::AutoTaggingExtension::Name::OrSymbol
              }
            )
          end
          def to_hash
          end

          # Specifies the auto-tagging extension used.
          module Name
            extend Imagekit::Internal::Type::Enum

            TaggedSymbol =
              T.type_alias do
                T.all(
                  Symbol,
                  Imagekit::FileUpdateParams::Extension::AutoTaggingExtension::Name
                )
              end
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            GOOGLE_AUTO_TAGGING =
              T.let(
                :"google-auto-tagging",
                Imagekit::FileUpdateParams::Extension::AutoTaggingExtension::Name::TaggedSymbol
              )
            AWS_AUTO_TAGGING =
              T.let(
                :"aws-auto-tagging",
                Imagekit::FileUpdateParams::Extension::AutoTaggingExtension::Name::TaggedSymbol
              )

            sig do
              override.returns(
                T::Array[
                  Imagekit::FileUpdateParams::Extension::AutoTaggingExtension::Name::TaggedSymbol
                ]
              )
            end
            def self.values
            end
          end
        end

        class AutoDescriptionExtension < Imagekit::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Imagekit::FileUpdateParams::Extension::AutoDescriptionExtension,
                Imagekit::Internal::AnyHash
              )
            end

          # Specifies the auto description extension.
          sig do
            returns(
              Imagekit::FileUpdateParams::Extension::AutoDescriptionExtension::Name::OrSymbol
            )
          end
          attr_accessor :name

          sig do
            params(
              name:
                Imagekit::FileUpdateParams::Extension::AutoDescriptionExtension::Name::OrSymbol
            ).returns(T.attached_class)
          end
          def self.new(
            # Specifies the auto description extension.
            name:
          )
          end

          sig do
            override.returns(
              {
                name:
                  Imagekit::FileUpdateParams::Extension::AutoDescriptionExtension::Name::OrSymbol
              }
            )
          end
          def to_hash
          end

          # Specifies the auto description extension.
          module Name
            extend Imagekit::Internal::Type::Enum

            TaggedSymbol =
              T.type_alias do
                T.all(
                  Symbol,
                  Imagekit::FileUpdateParams::Extension::AutoDescriptionExtension::Name
                )
              end
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            AI_AUTO_DESCRIPTION =
              T.let(
                :"ai-auto-description",
                Imagekit::FileUpdateParams::Extension::AutoDescriptionExtension::Name::TaggedSymbol
              )

            sig do
              override.returns(
                T::Array[
                  Imagekit::FileUpdateParams::Extension::AutoDescriptionExtension::Name::TaggedSymbol
                ]
              )
            end
            def self.values
            end
          end
        end

        sig do
          override.returns(
            T::Array[Imagekit::FileUpdateParams::Extension::Variants]
          )
        end
        def self.variants
        end
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

        Variants =
          T.type_alias do
            T.any(
              T::Array[String],
              Imagekit::FileUpdateParams::RemoveAITags::TaggedSymbol
            )
          end

        sig do
          override.returns(
            T::Array[Imagekit::FileUpdateParams::RemoveAITags::Variants]
          )
        end
        def self.variants
        end

        StringArray =
          T.let(
            Imagekit::Internal::Type::ArrayOf[String],
            Imagekit::Internal::Type::Converter
          )

        TaggedSymbol =
          T.type_alias do
            T.all(Symbol, Imagekit::FileUpdateParams::RemoveAITags)
          end
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        ALL =
          T.let(:all, Imagekit::FileUpdateParams::RemoveAITags::TaggedSymbol)
      end

      class Publish < Imagekit::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Imagekit::FileUpdateParams::Publish,
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
  end
end
