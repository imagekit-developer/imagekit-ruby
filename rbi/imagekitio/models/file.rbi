# typed: strong

module Imagekitio
  module Models
    class File < Imagekitio::Internal::Type::BaseModel
      OrHash =
        T.type_alias { T.any(Imagekitio::File, Imagekitio::Internal::AnyHash) }

      # An array of tags assigned to the file by auto tagging.
      sig { returns(T.nilable(T::Array[Imagekitio::File::AITag])) }
      attr_accessor :ai_tags

      # Date and time when the file was uploaded. The date and time is in ISO8601
      # format.
      sig { returns(T.nilable(Time)) }
      attr_reader :created_at

      sig { params(created_at: Time).void }
      attr_writer :created_at

      # An string with custom coordinates of the file.
      sig { returns(T.nilable(String)) }
      attr_accessor :custom_coordinates

      # An object with custom metadata for the file.
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

      # An object with details of the file version.
      sig { returns(T.nilable(Imagekitio::File::VersionInfo)) }
      attr_reader :version_info

      sig { params(version_info: Imagekitio::File::VersionInfo::OrHash).void }
      attr_writer :version_info

      # Width of the file.
      sig { returns(T.nilable(Float)) }
      attr_reader :width

      sig { params(width: Float).void }
      attr_writer :width

      # Object containing details of a file or file version.
      sig do
        params(
          ai_tags: T.nilable(T::Array[Imagekitio::File::AITag::OrHash]),
          created_at: Time,
          custom_coordinates: T.nilable(String),
          custom_metadata: T::Hash[Symbol, T.anything],
          description: String,
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
          width: Float
        ).returns(T.attached_class)
      end
      def self.new(
        # An array of tags assigned to the file by auto tagging.
        ai_tags: nil,
        # Date and time when the file was uploaded. The date and time is in ISO8601
        # format.
        created_at: nil,
        # An string with custom coordinates of the file.
        custom_coordinates: nil,
        # An object with custom metadata for the file.
        custom_metadata: nil,
        # Optional text to describe the contents of the file. Can be set by the user or
        # the ai-auto-description extension.
        description: nil,
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
        # An object with details of the file version.
        version_info: nil,
        # Width of the file.
        width: nil
      )
      end

      sig do
        override.returns(
          {
            ai_tags: T.nilable(T::Array[Imagekitio::File::AITag]),
            created_at: Time,
            custom_coordinates: T.nilable(String),
            custom_metadata: T::Hash[Symbol, T.anything],
            description: String,
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
            width: Float
          }
        )
      end
      def to_hash
      end

      class AITag < Imagekitio::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(Imagekitio::File::AITag, Imagekitio::Internal::AnyHash)
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

        # Source of the tag. Possible values are `google-auto-tagging` and
        # `aws-auto-tagging`.
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
          # Source of the tag. Possible values are `google-auto-tagging` and
          # `aws-auto-tagging`.
          source: nil
        )
        end

        sig do
          override.returns({ confidence: Float, name: String, source: String })
        end
        def to_hash
        end
      end

      class SelectedFieldsSchema < Imagekitio::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Imagekitio::File::SelectedFieldsSchema,
              Imagekitio::Internal::AnyHash
            )
          end

        # Type of the custom metadata field.
        sig do
          returns(Imagekitio::File::SelectedFieldsSchema::Type::TaggedSymbol)
        end
        attr_accessor :type

        # The default value for this custom metadata field. The value should match the
        # `type` of custom metadata field.
        sig do
          returns(
            T.nilable(
              Imagekitio::File::SelectedFieldsSchema::DefaultValue::Variants
            )
          )
        end
        attr_reader :default_value

        sig do
          params(
            default_value:
              Imagekitio::File::SelectedFieldsSchema::DefaultValue::Variants
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
              Imagekitio::File::SelectedFieldsSchema::MaxValue::Variants
            )
          )
        end
        attr_reader :max_value

        sig do
          params(
            max_value:
              Imagekitio::File::SelectedFieldsSchema::MaxValue::Variants
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
              Imagekitio::File::SelectedFieldsSchema::MinValue::Variants
            )
          )
        end
        attr_reader :min_value

        sig do
          params(
            min_value:
              Imagekitio::File::SelectedFieldsSchema::MinValue::Variants
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
                Imagekitio::File::SelectedFieldsSchema::SelectOption::Variants
              ]
            )
          )
        end
        attr_reader :select_options

        sig do
          params(
            select_options:
              T::Array[
                Imagekitio::File::SelectedFieldsSchema::SelectOption::Variants
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
            type: Imagekitio::File::SelectedFieldsSchema::Type::OrSymbol,
            default_value:
              Imagekitio::File::SelectedFieldsSchema::DefaultValue::Variants,
            is_value_required: T::Boolean,
            max_length: Float,
            max_value:
              Imagekitio::File::SelectedFieldsSchema::MaxValue::Variants,
            min_length: Float,
            min_value:
              Imagekitio::File::SelectedFieldsSchema::MinValue::Variants,
            read_only: T::Boolean,
            select_options:
              T::Array[
                Imagekitio::File::SelectedFieldsSchema::SelectOption::Variants
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
              type: Imagekitio::File::SelectedFieldsSchema::Type::TaggedSymbol,
              default_value:
                Imagekitio::File::SelectedFieldsSchema::DefaultValue::Variants,
              is_value_required: T::Boolean,
              max_length: Float,
              max_value:
                Imagekitio::File::SelectedFieldsSchema::MaxValue::Variants,
              min_length: Float,
              min_value:
                Imagekitio::File::SelectedFieldsSchema::MinValue::Variants,
              read_only: T::Boolean,
              select_options:
                T::Array[
                  Imagekitio::File::SelectedFieldsSchema::SelectOption::Variants
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
              T.all(Symbol, Imagekitio::File::SelectedFieldsSchema::Type)
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          TEXT =
            T.let(
              :Text,
              Imagekitio::File::SelectedFieldsSchema::Type::TaggedSymbol
            )
          TEXTAREA =
            T.let(
              :Textarea,
              Imagekitio::File::SelectedFieldsSchema::Type::TaggedSymbol
            )
          NUMBER =
            T.let(
              :Number,
              Imagekitio::File::SelectedFieldsSchema::Type::TaggedSymbol
            )
          DATE =
            T.let(
              :Date,
              Imagekitio::File::SelectedFieldsSchema::Type::TaggedSymbol
            )
          BOOLEAN =
            T.let(
              :Boolean,
              Imagekitio::File::SelectedFieldsSchema::Type::TaggedSymbol
            )
          SINGLE_SELECT =
            T.let(
              :SingleSelect,
              Imagekitio::File::SelectedFieldsSchema::Type::TaggedSymbol
            )
          MULTI_SELECT =
            T.let(
              :MultiSelect,
              Imagekitio::File::SelectedFieldsSchema::Type::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                Imagekitio::File::SelectedFieldsSchema::Type::TaggedSymbol
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
                  Imagekitio::File::SelectedFieldsSchema::DefaultValue::Mixed::Variants
                ]
              )
            end

          module Mixed
            extend Imagekitio::Internal::Type::Union

            Variants = T.type_alias { T.any(String, Float, T::Boolean) }

            sig do
              override.returns(
                T::Array[
                  Imagekitio::File::SelectedFieldsSchema::DefaultValue::Mixed::Variants
                ]
              )
            end
            def self.variants
            end
          end

          sig do
            override.returns(
              T::Array[
                Imagekitio::File::SelectedFieldsSchema::DefaultValue::Variants
              ]
            )
          end
          def self.variants
          end

          MixedArray =
            T.let(
              Imagekitio::Internal::Type::ArrayOf[
                union:
                  Imagekitio::File::SelectedFieldsSchema::DefaultValue::Mixed
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
                Imagekitio::File::SelectedFieldsSchema::MaxValue::Variants
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
                Imagekitio::File::SelectedFieldsSchema::MinValue::Variants
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
                Imagekitio::File::SelectedFieldsSchema::SelectOption::Variants
              ]
            )
          end
          def self.variants
          end
        end
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

      class VersionInfo < Imagekitio::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(Imagekitio::File::VersionInfo, Imagekitio::Internal::AnyHash)
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

        # An object with details of the file version.
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
