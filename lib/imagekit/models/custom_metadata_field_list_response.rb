# frozen_string_literal: true

module Imagekit
  module Models
    class CustomMetadataFieldListResponseItem < Imagekit::Internal::Type::BaseModel
      # @!attribute id
      #   Unique identifier for the custom metadata field. Use this to update the field.
      #
      #   @return [String]
      required :id, String

      # @!attribute label
      #   Human readable name of the custom metadata field. This name is displayed as form
      #   field label to the users while setting field value on the asset in the media
      #   library UI.
      #
      #   @return [String]
      required :label, String

      # @!attribute name
      #   API name of the custom metadata field. This becomes the key while setting
      #   `customMetadata` (key-value object) for an asset using upload or update API.
      #
      #   @return [String]
      required :name, String

      # @!attribute schema
      #   An object that describes the rules for the custom metadata field value.
      #
      #   @return [Imagekit::Models::CustomMetadataFieldListResponseItem::Schema]
      required :schema, -> { Imagekit::Models::CustomMetadataFieldListResponseItem::Schema }

      # @!method initialize(id:, label:, name:, schema:)
      #   Some parameter documentations has been truncated, see
      #   {Imagekit::Models::CustomMetadataFieldListResponseItem} for more details.
      #
      #   Object containing details of a custom metadata field.
      #
      #   @param id [String] Unique identifier for the custom metadata field. Use this to update the field.
      #
      #   @param label [String] Human readable name of the custom metadata field. This name is displayed as form
      #
      #   @param name [String] API name of the custom metadata field. This becomes the key while setting `custo
      #
      #   @param schema [Imagekit::Models::CustomMetadataFieldListResponseItem::Schema] An object that describes the rules for the custom metadata field value.

      # @see Imagekit::Models::CustomMetadataFieldListResponseItem#schema
      class Schema < Imagekit::Internal::Type::BaseModel
        # @!attribute type
        #   Type of the custom metadata field.
        #
        #   @return [Symbol, Imagekit::Models::CustomMetadataFieldListResponseItem::Schema::Type]
        required :type, enum: -> { Imagekit::Models::CustomMetadataFieldListResponseItem::Schema::Type }

        # @!attribute default_value
        #   The default value for this custom metadata field. Date type of default value
        #   depends on the field type.
        #
        #   @return [String, Float, Boolean, Array<String, Float, Boolean>, nil]
        optional :default_value,
                 union: -> { Imagekit::Models::CustomMetadataFieldListResponseItem::Schema::DefaultValue },
                 api_name: :defaultValue

        # @!attribute is_value_required
        #   Specifies if the this custom metadata field is required or not.
        #
        #   @return [Boolean, nil]
        optional :is_value_required, Imagekit::Internal::Type::Boolean, api_name: :isValueRequired

        # @!attribute max_length
        #   Maximum length of string. Only set if `type` is set to `Text` or `Textarea`.
        #
        #   @return [Float, nil]
        optional :max_length, Float, api_name: :maxLength

        # @!attribute max_value
        #   Maximum value of the field. Only set if field type is `Date` or `Number`. For
        #   `Date` type field, the value will be in ISO8601 string format. For `Number` type
        #   field, it will be a numeric value.
        #
        #   @return [String, Float, nil]
        optional :max_value,
                 union: -> { Imagekit::Models::CustomMetadataFieldListResponseItem::Schema::MaxValue },
                 api_name: :maxValue

        # @!attribute min_length
        #   Minimum length of string. Only set if `type` is set to `Text` or `Textarea`.
        #
        #   @return [Float, nil]
        optional :min_length, Float, api_name: :minLength

        # @!attribute min_value
        #   Minimum value of the field. Only set if field type is `Date` or `Number`. For
        #   `Date` type field, the value will be in ISO8601 string format. For `Number` type
        #   field, it will be a numeric value.
        #
        #   @return [String, Float, nil]
        optional :min_value,
                 union: -> { Imagekit::Models::CustomMetadataFieldListResponseItem::Schema::MinValue },
                 api_name: :minValue

        # @!attribute select_options
        #   An array of allowed values when field type is `SingleSelect` or `MultiSelect`.
        #
        #   @return [Array<String, Float, Boolean>, nil]
        optional :select_options,
                 -> { Imagekit::Internal::Type::ArrayOf[union: Imagekit::Models::CustomMetadataFieldListResponseItem::Schema::SelectOption] },
                 api_name: :selectOptions

        # @!method initialize(type:, default_value: nil, is_value_required: nil, max_length: nil, max_value: nil, min_length: nil, min_value: nil, select_options: nil)
        #   Some parameter documentations has been truncated, see
        #   {Imagekit::Models::CustomMetadataFieldListResponseItem::Schema} for more
        #   details.
        #
        #   An object that describes the rules for the custom metadata field value.
        #
        #   @param type [Symbol, Imagekit::Models::CustomMetadataFieldListResponseItem::Schema::Type] Type of the custom metadata field.
        #
        #   @param default_value [String, Float, Boolean, Array<String, Float, Boolean>] The default value for this custom metadata field. Date type of default value dep
        #
        #   @param is_value_required [Boolean] Specifies if the this custom metadata field is required or not.
        #
        #   @param max_length [Float] Maximum length of string. Only set if `type` is set to `Text` or `Textarea`.
        #
        #   @param max_value [String, Float] Maximum value of the field. Only set if field type is `Date` or `Number`. For `D
        #
        #   @param min_length [Float] Minimum length of string. Only set if `type` is set to `Text` or `Textarea`.
        #
        #   @param min_value [String, Float] Minimum value of the field. Only set if field type is `Date` or `Number`. For `D
        #
        #   @param select_options [Array<String, Float, Boolean>] An array of allowed values when field type is `SingleSelect` or `MultiSelect`.

        # Type of the custom metadata field.
        #
        # @see Imagekit::Models::CustomMetadataFieldListResponseItem::Schema#type
        module Type
          extend Imagekit::Internal::Type::Enum

          TEXT = :Text
          TEXT_AREA = :TextArea
          NUMBER = :Number
          DATE = :Date
          BOOLEAN = :Boolean
          SINGLE_SELECT = :SingleSelect
          MULTI_SELECT = :MultiSelect

          # @!method self.values
          #   @return [Array<Symbol>]
        end

        # The default value for this custom metadata field. Date type of default value
        # depends on the field type.
        #
        # @see Imagekit::Models::CustomMetadataFieldListResponseItem::Schema#default_value
        module DefaultValue
          extend Imagekit::Internal::Type::Union

          variant String

          variant Float

          variant Imagekit::Internal::Type::Boolean

          # Default value should be of type array when custom metadata field type is set to `MultiSelect`.
          variant -> { Imagekit::Models::CustomMetadataFieldListResponseItem::Schema::DefaultValue::UnionMember3Array }

          module UnionMember3
            extend Imagekit::Internal::Type::Union

            variant String

            variant Float

            variant Imagekit::Internal::Type::Boolean

            # @!method self.variants
            #   @return [Array(String, Float, Boolean)]
          end

          # @!method self.variants
          #   @return [Array(String, Float, Boolean, Array<String, Float, Boolean>)]

          # @type [Imagekit::Internal::Type::Converter]
          UnionMember3Array =
            Imagekit::Internal::Type::ArrayOf[union: -> { Imagekit::Models::CustomMetadataFieldListResponseItem::Schema::DefaultValue::UnionMember3 }]
        end

        # Maximum value of the field. Only set if field type is `Date` or `Number`. For
        # `Date` type field, the value will be in ISO8601 string format. For `Number` type
        # field, it will be a numeric value.
        #
        # @see Imagekit::Models::CustomMetadataFieldListResponseItem::Schema#max_value
        module MaxValue
          extend Imagekit::Internal::Type::Union

          variant String

          variant Float

          # @!method self.variants
          #   @return [Array(String, Float)]
        end

        # Minimum value of the field. Only set if field type is `Date` or `Number`. For
        # `Date` type field, the value will be in ISO8601 string format. For `Number` type
        # field, it will be a numeric value.
        #
        # @see Imagekit::Models::CustomMetadataFieldListResponseItem::Schema#min_value
        module MinValue
          extend Imagekit::Internal::Type::Union

          variant String

          variant Float

          # @!method self.variants
          #   @return [Array(String, Float)]
        end

        module SelectOption
          extend Imagekit::Internal::Type::Union

          variant String

          variant Float

          variant Imagekit::Internal::Type::Boolean

          # @!method self.variants
          #   @return [Array(String, Float, Boolean)]
        end
      end
    end

    # @type [Imagekit::Internal::Type::Converter]
    CustomMetadataFieldListResponse =
      Imagekit::Internal::Type::ArrayOf[-> { Imagekit::Models::CustomMetadataFieldListResponseItem }]
  end
end
