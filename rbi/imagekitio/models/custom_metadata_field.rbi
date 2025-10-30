# typed: strong

module Imagekitio
  module Models
    class CustomMetadataField < Imagekitio::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(Imagekitio::CustomMetadataField, Imagekitio::Internal::AnyHash)
        end

      # Unique identifier for the custom metadata field. Use this to update the field.
      sig { returns(String) }
      attr_accessor :id

      # Human readable name of the custom metadata field. This name is displayed as form
      # field label to the users while setting field value on the asset in the media
      # library UI.
      sig { returns(String) }
      attr_accessor :label

      # API name of the custom metadata field. This becomes the key while setting
      # `customMetadata` (key-value object) for an asset using upload or update API.
      sig { returns(String) }
      attr_accessor :name

      # An object that describes the rules for the custom metadata field value.
      sig { returns(Imagekitio::CustomMetadataField::Schema) }
      attr_reader :schema

      sig do
        params(schema: Imagekitio::CustomMetadataField::Schema::OrHash).void
      end
      attr_writer :schema

      # Object containing details of a custom metadata field.
      sig do
        params(
          id: String,
          label: String,
          name: String,
          schema: Imagekitio::CustomMetadataField::Schema::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        # Unique identifier for the custom metadata field. Use this to update the field.
        id:,
        # Human readable name of the custom metadata field. This name is displayed as form
        # field label to the users while setting field value on the asset in the media
        # library UI.
        label:,
        # API name of the custom metadata field. This becomes the key while setting
        # `customMetadata` (key-value object) for an asset using upload or update API.
        name:,
        # An object that describes the rules for the custom metadata field value.
        schema:
      )
      end

      sig do
        override.returns(
          {
            id: String,
            label: String,
            name: String,
            schema: Imagekitio::CustomMetadataField::Schema
          }
        )
      end
      def to_hash
      end

      class Schema < Imagekitio::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Imagekitio::CustomMetadataField::Schema,
              Imagekitio::Internal::AnyHash
            )
          end

        # Type of the custom metadata field.
        sig do
          returns(Imagekitio::CustomMetadataField::Schema::Type::TaggedSymbol)
        end
        attr_accessor :type

        # The default value for this custom metadata field. Data type of default value
        # depends on the field type.
        sig do
          returns(
            T.nilable(
              Imagekitio::CustomMetadataField::Schema::DefaultValue::Variants
            )
          )
        end
        attr_reader :default_value

        sig do
          params(
            default_value:
              Imagekitio::CustomMetadataField::Schema::DefaultValue::Variants
          ).void
        end
        attr_writer :default_value

        # Specifies if the this custom metadata field is required or not.
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
              Imagekitio::CustomMetadataField::Schema::MaxValue::Variants
            )
          )
        end
        attr_reader :max_value

        sig do
          params(
            max_value:
              Imagekitio::CustomMetadataField::Schema::MaxValue::Variants
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
              Imagekitio::CustomMetadataField::Schema::MinValue::Variants
            )
          )
        end
        attr_reader :min_value

        sig do
          params(
            min_value:
              Imagekitio::CustomMetadataField::Schema::MinValue::Variants
          ).void
        end
        attr_writer :min_value

        # An array of allowed values when field type is `SingleSelect` or `MultiSelect`.
        sig do
          returns(
            T.nilable(
              T::Array[
                Imagekitio::CustomMetadataField::Schema::SelectOption::Variants
              ]
            )
          )
        end
        attr_reader :select_options

        sig do
          params(
            select_options:
              T::Array[
                Imagekitio::CustomMetadataField::Schema::SelectOption::Variants
              ]
          ).void
        end
        attr_writer :select_options

        # An object that describes the rules for the custom metadata field value.
        sig do
          params(
            type: Imagekitio::CustomMetadataField::Schema::Type::OrSymbol,
            default_value:
              Imagekitio::CustomMetadataField::Schema::DefaultValue::Variants,
            is_value_required: T::Boolean,
            max_length: Float,
            max_value:
              Imagekitio::CustomMetadataField::Schema::MaxValue::Variants,
            min_length: Float,
            min_value:
              Imagekitio::CustomMetadataField::Schema::MinValue::Variants,
            select_options:
              T::Array[
                Imagekitio::CustomMetadataField::Schema::SelectOption::Variants
              ]
          ).returns(T.attached_class)
        end
        def self.new(
          # Type of the custom metadata field.
          type:,
          # The default value for this custom metadata field. Data type of default value
          # depends on the field type.
          default_value: nil,
          # Specifies if the this custom metadata field is required or not.
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
          # An array of allowed values when field type is `SingleSelect` or `MultiSelect`.
          select_options: nil
        )
        end

        sig do
          override.returns(
            {
              type: Imagekitio::CustomMetadataField::Schema::Type::TaggedSymbol,
              default_value:
                Imagekitio::CustomMetadataField::Schema::DefaultValue::Variants,
              is_value_required: T::Boolean,
              max_length: Float,
              max_value:
                Imagekitio::CustomMetadataField::Schema::MaxValue::Variants,
              min_length: Float,
              min_value:
                Imagekitio::CustomMetadataField::Schema::MinValue::Variants,
              select_options:
                T::Array[
                  Imagekitio::CustomMetadataField::Schema::SelectOption::Variants
                ]
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
              T.all(Symbol, Imagekitio::CustomMetadataField::Schema::Type)
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          TEXT =
            T.let(
              :Text,
              Imagekitio::CustomMetadataField::Schema::Type::TaggedSymbol
            )
          TEXTAREA =
            T.let(
              :Textarea,
              Imagekitio::CustomMetadataField::Schema::Type::TaggedSymbol
            )
          NUMBER =
            T.let(
              :Number,
              Imagekitio::CustomMetadataField::Schema::Type::TaggedSymbol
            )
          DATE =
            T.let(
              :Date,
              Imagekitio::CustomMetadataField::Schema::Type::TaggedSymbol
            )
          BOOLEAN =
            T.let(
              :Boolean,
              Imagekitio::CustomMetadataField::Schema::Type::TaggedSymbol
            )
          SINGLE_SELECT =
            T.let(
              :SingleSelect,
              Imagekitio::CustomMetadataField::Schema::Type::TaggedSymbol
            )
          MULTI_SELECT =
            T.let(
              :MultiSelect,
              Imagekitio::CustomMetadataField::Schema::Type::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                Imagekitio::CustomMetadataField::Schema::Type::TaggedSymbol
              ]
            )
          end
          def self.values
          end
        end

        # The default value for this custom metadata field. Data type of default value
        # depends on the field type.
        module DefaultValue
          extend Imagekitio::Internal::Type::Union

          Variants =
            T.type_alias do
              T.any(
                String,
                Float,
                T::Boolean,
                T::Array[
                  Imagekitio::CustomMetadataField::Schema::DefaultValue::Mixed::Variants
                ]
              )
            end

          module Mixed
            extend Imagekitio::Internal::Type::Union

            Variants = T.type_alias { T.any(String, Float, T::Boolean) }

            sig do
              override.returns(
                T::Array[
                  Imagekitio::CustomMetadataField::Schema::DefaultValue::Mixed::Variants
                ]
              )
            end
            def self.variants
            end
          end

          sig do
            override.returns(
              T::Array[
                Imagekitio::CustomMetadataField::Schema::DefaultValue::Variants
              ]
            )
          end
          def self.variants
          end

          MixedArray =
            T.let(
              Imagekitio::Internal::Type::ArrayOf[
                union:
                  Imagekitio::CustomMetadataField::Schema::DefaultValue::Mixed
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
                Imagekitio::CustomMetadataField::Schema::MaxValue::Variants
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
                Imagekitio::CustomMetadataField::Schema::MinValue::Variants
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
                Imagekitio::CustomMetadataField::Schema::SelectOption::Variants
              ]
            )
          end
          def self.variants
          end
        end
      end
    end
  end
end
