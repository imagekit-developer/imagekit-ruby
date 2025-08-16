# typed: strong

module Imagekit
  module Models
    class CustomMetadataFieldUpdateParams < Imagekit::Internal::Type::BaseModel
      extend Imagekit::Internal::Type::RequestParameters::Converter
      include Imagekit::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(
            Imagekit::CustomMetadataFieldUpdateParams,
            Imagekit::Internal::AnyHash
          )
        end

      # Human readable name of the custom metadata field. This should be unique across
      # all non deleted custom metadata fields. This name is displayed as form field
      # label to the users while setting field value on an asset in the media library
      # UI. This parameter is required if `schema` is not provided.
      sig { returns(T.nilable(String)) }
      attr_reader :label

      sig { params(label: String).void }
      attr_writer :label

      # An object that describes the rules for the custom metadata key. This parameter
      # is required if `label` is not provided. Note: `type` cannot be updated and will
      # be ignored if sent with the `schema`. The schema will be validated as per the
      # existing `type`.
      sig do
        returns(T.nilable(Imagekit::CustomMetadataFieldUpdateParams::Schema))
      end
      attr_reader :schema

      sig do
        params(
          schema: Imagekit::CustomMetadataFieldUpdateParams::Schema::OrHash
        ).void
      end
      attr_writer :schema

      sig do
        params(
          label: String,
          schema: Imagekit::CustomMetadataFieldUpdateParams::Schema::OrHash,
          request_options: Imagekit::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        # Human readable name of the custom metadata field. This should be unique across
        # all non deleted custom metadata fields. This name is displayed as form field
        # label to the users while setting field value on an asset in the media library
        # UI. This parameter is required if `schema` is not provided.
        label: nil,
        # An object that describes the rules for the custom metadata key. This parameter
        # is required if `label` is not provided. Note: `type` cannot be updated and will
        # be ignored if sent with the `schema`. The schema will be validated as per the
        # existing `type`.
        schema: nil,
        request_options: {}
      )
      end

      sig do
        override.returns(
          {
            label: String,
            schema: Imagekit::CustomMetadataFieldUpdateParams::Schema,
            request_options: Imagekit::RequestOptions
          }
        )
      end
      def to_hash
      end

      class Schema < Imagekit::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Imagekit::CustomMetadataFieldUpdateParams::Schema,
              Imagekit::Internal::AnyHash
            )
          end

        # The default value for this custom metadata field. This property is only required
        # if `isValueRequired` property is set to `true`. The value should match the
        # `type` of custom metadata field.
        sig do
          returns(
            T.nilable(
              Imagekit::CustomMetadataFieldUpdateParams::Schema::DefaultValue::Variants
            )
          )
        end
        attr_reader :default_value

        sig do
          params(
            default_value:
              Imagekit::CustomMetadataFieldUpdateParams::Schema::DefaultValue::Variants
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
              Imagekit::CustomMetadataFieldUpdateParams::Schema::MaxValue::Variants
            )
          )
        end
        attr_reader :max_value

        sig do
          params(
            max_value:
              Imagekit::CustomMetadataFieldUpdateParams::Schema::MaxValue::Variants
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
              Imagekit::CustomMetadataFieldUpdateParams::Schema::MinValue::Variants
            )
          )
        end
        attr_reader :min_value

        sig do
          params(
            min_value:
              Imagekit::CustomMetadataFieldUpdateParams::Schema::MinValue::Variants
          ).void
        end
        attr_writer :min_value

        # An array of allowed values. This property is only required if `type` property is
        # set to `SingleSelect` or `MultiSelect`.
        sig do
          returns(
            T.nilable(
              T::Array[
                Imagekit::CustomMetadataFieldUpdateParams::Schema::SelectOption::Variants
              ]
            )
          )
        end
        attr_reader :select_options

        sig do
          params(
            select_options:
              T::Array[
                Imagekit::CustomMetadataFieldUpdateParams::Schema::SelectOption::Variants
              ]
          ).void
        end
        attr_writer :select_options

        # An object that describes the rules for the custom metadata key. This parameter
        # is required if `label` is not provided. Note: `type` cannot be updated and will
        # be ignored if sent with the `schema`. The schema will be validated as per the
        # existing `type`.
        sig do
          params(
            default_value:
              Imagekit::CustomMetadataFieldUpdateParams::Schema::DefaultValue::Variants,
            is_value_required: T::Boolean,
            max_length: Float,
            max_value:
              Imagekit::CustomMetadataFieldUpdateParams::Schema::MaxValue::Variants,
            min_length: Float,
            min_value:
              Imagekit::CustomMetadataFieldUpdateParams::Schema::MinValue::Variants,
            select_options:
              T::Array[
                Imagekit::CustomMetadataFieldUpdateParams::Schema::SelectOption::Variants
              ]
          ).returns(T.attached_class)
        end
        def self.new(
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
              default_value:
                Imagekit::CustomMetadataFieldUpdateParams::Schema::DefaultValue::Variants,
              is_value_required: T::Boolean,
              max_length: Float,
              max_value:
                Imagekit::CustomMetadataFieldUpdateParams::Schema::MaxValue::Variants,
              min_length: Float,
              min_value:
                Imagekit::CustomMetadataFieldUpdateParams::Schema::MinValue::Variants,
              select_options:
                T::Array[
                  Imagekit::CustomMetadataFieldUpdateParams::Schema::SelectOption::Variants
                ]
            }
          )
        end
        def to_hash
        end

        # The default value for this custom metadata field. This property is only required
        # if `isValueRequired` property is set to `true`. The value should match the
        # `type` of custom metadata field.
        module DefaultValue
          extend Imagekit::Internal::Type::Union

          Variants =
            T.type_alias do
              T.any(
                String,
                Float,
                T::Boolean,
                T::Array[
                  Imagekit::CustomMetadataFieldUpdateParams::Schema::DefaultValue::UnionMember3::Variants
                ]
              )
            end

          module UnionMember3
            extend Imagekit::Internal::Type::Union

            Variants = T.type_alias { T.any(String, Float, T::Boolean) }

            sig do
              override.returns(
                T::Array[
                  Imagekit::CustomMetadataFieldUpdateParams::Schema::DefaultValue::UnionMember3::Variants
                ]
              )
            end
            def self.variants
            end
          end

          sig do
            override.returns(
              T::Array[
                Imagekit::CustomMetadataFieldUpdateParams::Schema::DefaultValue::Variants
              ]
            )
          end
          def self.variants
          end

          UnionMember3Array =
            T.let(
              Imagekit::Internal::Type::ArrayOf[
                union:
                  Imagekit::CustomMetadataFieldUpdateParams::Schema::DefaultValue::UnionMember3
              ],
              Imagekit::Internal::Type::Converter
            )
        end

        # Maximum value of the field. Only set this property if field type is `Date` or
        # `Number`. For `Date` type field, set the minimum date in ISO8601 string format.
        # For `Number` type field, set the minimum numeric value.
        module MaxValue
          extend Imagekit::Internal::Type::Union

          Variants = T.type_alias { T.any(String, Float) }

          sig do
            override.returns(
              T::Array[
                Imagekit::CustomMetadataFieldUpdateParams::Schema::MaxValue::Variants
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
          extend Imagekit::Internal::Type::Union

          Variants = T.type_alias { T.any(String, Float) }

          sig do
            override.returns(
              T::Array[
                Imagekit::CustomMetadataFieldUpdateParams::Schema::MinValue::Variants
              ]
            )
          end
          def self.variants
          end
        end

        module SelectOption
          extend Imagekit::Internal::Type::Union

          Variants = T.type_alias { T.any(String, Float, T::Boolean) }

          sig do
            override.returns(
              T::Array[
                Imagekit::CustomMetadataFieldUpdateParams::Schema::SelectOption::Variants
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
