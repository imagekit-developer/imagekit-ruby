# typed: strong

module Imagekitio
  module Models
    class CustomMetadataFieldCreateParams < Imagekitio::Internal::Type::BaseModel
      extend Imagekitio::Internal::Type::RequestParameters::Converter
      include Imagekitio::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(
            Imagekitio::CustomMetadataFieldCreateParams,
            Imagekitio::Internal::AnyHash
          )
        end

      # Human readable name of the custom metadata field. This should be unique across
      # all non deleted custom metadata fields. This name is displayed as form field
      # label to the users while setting field value on an asset in the media library
      # UI.
      sig { returns(String) }
      attr_accessor :label

      # API name of the custom metadata field. This should be unique across all
      # (including deleted) custom metadata fields.
      sig { returns(String) }
      attr_accessor :name

      sig { returns(Imagekitio::CustomMetadataFieldCreateParams::Schema) }
      attr_reader :schema

      sig do
        params(
          schema: Imagekitio::CustomMetadataFieldCreateParams::Schema::OrHash
        ).void
      end
      attr_writer :schema

      sig do
        params(
          label: String,
          name: String,
          schema: Imagekitio::CustomMetadataFieldCreateParams::Schema::OrHash,
          request_options: Imagekitio::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        # Human readable name of the custom metadata field. This should be unique across
        # all non deleted custom metadata fields. This name is displayed as form field
        # label to the users while setting field value on an asset in the media library
        # UI.
        label:,
        # API name of the custom metadata field. This should be unique across all
        # (including deleted) custom metadata fields.
        name:,
        schema:,
        request_options: {}
      )
      end

      sig do
        override.returns(
          {
            label: String,
            name: String,
            schema: Imagekitio::CustomMetadataFieldCreateParams::Schema,
            request_options: Imagekitio::RequestOptions
          }
        )
      end
      def to_hash
      end

      class Schema < Imagekitio::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Imagekitio::CustomMetadataFieldCreateParams::Schema,
              Imagekitio::Internal::AnyHash
            )
          end

        # Type of the custom metadata field.
        sig do
          returns(
            Imagekitio::CustomMetadataFieldCreateParams::Schema::Type::OrSymbol
          )
        end
        attr_accessor :type

        # The default value for this custom metadata field. This property is only required
        # if `isValueRequired` property is set to `true`. The value should match the
        # `type` of custom metadata field.
        sig do
          returns(
            T.nilable(
              Imagekitio::CustomMetadataFieldCreateParams::Schema::DefaultValue::Variants
            )
          )
        end
        attr_reader :default_value

        sig do
          params(
            default_value:
              Imagekitio::CustomMetadataFieldCreateParams::Schema::DefaultValue::Variants
          ).void
        end
        attr_writer :default_value

        # Sets this custom metadata field as required. Setting custom metadata fields on
        # an asset will throw error if the value for all required fields are not present
        # in upload or update asset API request body.
        sig { returns(T.nilable(T::Boolean)) }
        attr_reader :is_value_required

        sig { params(is_value_required: T::Boolean).void }
        attr_writer :is_value_required

        # Maximum length of string. Only set this property if `type` is set to `Text` or
        # `Textarea`.
        sig { returns(T.nilable(Float)) }
        attr_reader :max_length

        sig { params(max_length: Float).void }
        attr_writer :max_length

        # Maximum value of the field. Only set this property if field type is `Date` or
        # `Number`. For `Date` type field, set the minimum date in ISO8601 string format.
        # For `Number` type field, set the minimum numeric value.
        sig do
          returns(
            T.nilable(
              Imagekitio::CustomMetadataFieldCreateParams::Schema::MaxValue::Variants
            )
          )
        end
        attr_reader :max_value

        sig do
          params(
            max_value:
              Imagekitio::CustomMetadataFieldCreateParams::Schema::MaxValue::Variants
          ).void
        end
        attr_writer :max_value

        # Minimum length of string. Only set this property if `type` is set to `Text` or
        # `Textarea`.
        sig { returns(T.nilable(Float)) }
        attr_reader :min_length

        sig { params(min_length: Float).void }
        attr_writer :min_length

        # Minimum value of the field. Only set this property if field type is `Date` or
        # `Number`. For `Date` type field, set the minimum date in ISO8601 string format.
        # For `Number` type field, set the minimum numeric value.
        sig do
          returns(
            T.nilable(
              Imagekitio::CustomMetadataFieldCreateParams::Schema::MinValue::Variants
            )
          )
        end
        attr_reader :min_value

        sig do
          params(
            min_value:
              Imagekitio::CustomMetadataFieldCreateParams::Schema::MinValue::Variants
          ).void
        end
        attr_writer :min_value

        # An array of allowed values. This property is only required if `type` property is
        # set to `SingleSelect` or `MultiSelect`.
        sig do
          returns(
            T.nilable(
              T::Array[
                Imagekitio::CustomMetadataFieldCreateParams::Schema::SelectOption::Variants
              ]
            )
          )
        end
        attr_reader :select_options

        sig do
          params(
            select_options:
              T::Array[
                Imagekitio::CustomMetadataFieldCreateParams::Schema::SelectOption::Variants
              ]
          ).void
        end
        attr_writer :select_options

        sig do
          params(
            type:
              Imagekitio::CustomMetadataFieldCreateParams::Schema::Type::OrSymbol,
            default_value:
              Imagekitio::CustomMetadataFieldCreateParams::Schema::DefaultValue::Variants,
            is_value_required: T::Boolean,
            max_length: Float,
            max_value:
              Imagekitio::CustomMetadataFieldCreateParams::Schema::MaxValue::Variants,
            min_length: Float,
            min_value:
              Imagekitio::CustomMetadataFieldCreateParams::Schema::MinValue::Variants,
            select_options:
              T::Array[
                Imagekitio::CustomMetadataFieldCreateParams::Schema::SelectOption::Variants
              ]
          ).returns(T.attached_class)
        end
        def self.new(
          # Type of the custom metadata field.
          type:,
          # The default value for this custom metadata field. This property is only required
          # if `isValueRequired` property is set to `true`. The value should match the
          # `type` of custom metadata field.
          default_value: nil,
          # Sets this custom metadata field as required. Setting custom metadata fields on
          # an asset will throw error if the value for all required fields are not present
          # in upload or update asset API request body.
          is_value_required: nil,
          # Maximum length of string. Only set this property if `type` is set to `Text` or
          # `Textarea`.
          max_length: nil,
          # Maximum value of the field. Only set this property if field type is `Date` or
          # `Number`. For `Date` type field, set the minimum date in ISO8601 string format.
          # For `Number` type field, set the minimum numeric value.
          max_value: nil,
          # Minimum length of string. Only set this property if `type` is set to `Text` or
          # `Textarea`.
          min_length: nil,
          # Minimum value of the field. Only set this property if field type is `Date` or
          # `Number`. For `Date` type field, set the minimum date in ISO8601 string format.
          # For `Number` type field, set the minimum numeric value.
          min_value: nil,
          # An array of allowed values. This property is only required if `type` property is
          # set to `SingleSelect` or `MultiSelect`.
          select_options: nil
        )
        end

        sig do
          override.returns(
            {
              type:
                Imagekitio::CustomMetadataFieldCreateParams::Schema::Type::OrSymbol,
              default_value:
                Imagekitio::CustomMetadataFieldCreateParams::Schema::DefaultValue::Variants,
              is_value_required: T::Boolean,
              max_length: Float,
              max_value:
                Imagekitio::CustomMetadataFieldCreateParams::Schema::MaxValue::Variants,
              min_length: Float,
              min_value:
                Imagekitio::CustomMetadataFieldCreateParams::Schema::MinValue::Variants,
              select_options:
                T::Array[
                  Imagekitio::CustomMetadataFieldCreateParams::Schema::SelectOption::Variants
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
              T.all(
                Symbol,
                Imagekitio::CustomMetadataFieldCreateParams::Schema::Type
              )
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          TEXT =
            T.let(
              :Text,
              Imagekitio::CustomMetadataFieldCreateParams::Schema::Type::TaggedSymbol
            )
          TEXTAREA =
            T.let(
              :Textarea,
              Imagekitio::CustomMetadataFieldCreateParams::Schema::Type::TaggedSymbol
            )
          NUMBER =
            T.let(
              :Number,
              Imagekitio::CustomMetadataFieldCreateParams::Schema::Type::TaggedSymbol
            )
          DATE =
            T.let(
              :Date,
              Imagekitio::CustomMetadataFieldCreateParams::Schema::Type::TaggedSymbol
            )
          BOOLEAN =
            T.let(
              :Boolean,
              Imagekitio::CustomMetadataFieldCreateParams::Schema::Type::TaggedSymbol
            )
          SINGLE_SELECT =
            T.let(
              :SingleSelect,
              Imagekitio::CustomMetadataFieldCreateParams::Schema::Type::TaggedSymbol
            )
          MULTI_SELECT =
            T.let(
              :MultiSelect,
              Imagekitio::CustomMetadataFieldCreateParams::Schema::Type::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                Imagekitio::CustomMetadataFieldCreateParams::Schema::Type::TaggedSymbol
              ]
            )
          end
          def self.values
          end
        end

        # The default value for this custom metadata field. This property is only required
        # if `isValueRequired` property is set to `true`. The value should match the
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
                  Imagekitio::CustomMetadataFieldCreateParams::Schema::DefaultValue::Mixed::Variants
                ]
              )
            end

          module Mixed
            extend Imagekitio::Internal::Type::Union

            Variants = T.type_alias { T.any(String, Float, T::Boolean) }

            sig do
              override.returns(
                T::Array[
                  Imagekitio::CustomMetadataFieldCreateParams::Schema::DefaultValue::Mixed::Variants
                ]
              )
            end
            def self.variants
            end
          end

          sig do
            override.returns(
              T::Array[
                Imagekitio::CustomMetadataFieldCreateParams::Schema::DefaultValue::Variants
              ]
            )
          end
          def self.variants
          end

          MixedArray =
            T.let(
              Imagekitio::Internal::Type::ArrayOf[
                union:
                  Imagekitio::CustomMetadataFieldCreateParams::Schema::DefaultValue::Mixed
              ],
              Imagekitio::Internal::Type::Converter
            )
        end

        # Maximum value of the field. Only set this property if field type is `Date` or
        # `Number`. For `Date` type field, set the minimum date in ISO8601 string format.
        # For `Number` type field, set the minimum numeric value.
        module MaxValue
          extend Imagekitio::Internal::Type::Union

          Variants = T.type_alias { T.any(String, Float) }

          sig do
            override.returns(
              T::Array[
                Imagekitio::CustomMetadataFieldCreateParams::Schema::MaxValue::Variants
              ]
            )
          end
          def self.variants
          end
        end

        # Minimum value of the field. Only set this property if field type is `Date` or
        # `Number`. For `Date` type field, set the minimum date in ISO8601 string format.
        # For `Number` type field, set the minimum numeric value.
        module MinValue
          extend Imagekitio::Internal::Type::Union

          Variants = T.type_alias { T.any(String, Float) }

          sig do
            override.returns(
              T::Array[
                Imagekitio::CustomMetadataFieldCreateParams::Schema::MinValue::Variants
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
                Imagekitio::CustomMetadataFieldCreateParams::Schema::SelectOption::Variants
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
