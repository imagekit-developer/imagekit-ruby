# frozen_string_literal: true

module Imagekitio
  module Models
    class SelectedFieldsSchemaItem < Imagekitio::Internal::Type::BaseModel
      # @!attribute type
      #   Type of the custom metadata field.
      #
      #   @return [Symbol, Imagekitio::Models::SelectedFieldsSchemaItem::Type]
      required :type, enum: -> { Imagekitio::SelectedFieldsSchemaItem::Type }

      # @!attribute default_value
      #   The default value for this custom metadata field. The value should match the
      #   `type` of custom metadata field.
      #
      #   @return [String, Float, Boolean, Array<String, Float, Boolean>, nil]
      optional :default_value,
               union: -> { Imagekitio::SelectedFieldsSchemaItem::DefaultValue },
               api_name: :defaultValue

      # @!attribute is_value_required
      #   Specifies if the custom metadata field is required or not.
      #
      #   @return [Boolean, nil]
      optional :is_value_required, Imagekitio::Internal::Type::Boolean, api_name: :isValueRequired

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
      optional :max_value, union: -> { Imagekitio::SelectedFieldsSchemaItem::MaxValue }, api_name: :maxValue

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
      optional :min_value, union: -> { Imagekitio::SelectedFieldsSchemaItem::MinValue }, api_name: :minValue

      # @!attribute read_only
      #   Indicates whether the custom metadata field is read only. A read only field
      #   cannot be modified after being set. This field is configurable only via the
      #   **Path policy** feature.
      #
      #   @return [Boolean, nil]
      optional :read_only, Imagekitio::Internal::Type::Boolean, api_name: :readOnly

      # @!attribute select_options
      #   An array of allowed values when field type is `SingleSelect` or `MultiSelect`.
      #
      #   @return [Array<String, Float, Boolean>, nil]
      optional :select_options,
               -> {
                 Imagekitio::Internal::Type::ArrayOf[union: Imagekitio::SelectedFieldsSchemaItem::SelectOption]
               },
               api_name: :selectOptions

      # @!attribute select_options_truncated
      #   Specifies if the selectOptions array is truncated. It is truncated when number
      #   of options are > 100.
      #
      #   @return [Boolean, nil]
      optional :select_options_truncated,
               Imagekitio::Internal::Type::Boolean,
               api_name: :selectOptionsTruncated

      # @!method initialize(type:, default_value: nil, is_value_required: nil, max_length: nil, max_value: nil, min_length: nil, min_value: nil, read_only: nil, select_options: nil, select_options_truncated: nil)
      #   Some parameter documentations has been truncated, see
      #   {Imagekitio::Models::SelectedFieldsSchemaItem} for more details.
      #
      #   @param type [Symbol, Imagekitio::Models::SelectedFieldsSchemaItem::Type] Type of the custom metadata field.
      #
      #   @param default_value [String, Float, Boolean, Array<String, Float, Boolean>] The default value for this custom metadata field. The value should match the `ty
      #
      #   @param is_value_required [Boolean] Specifies if the custom metadata field is required or not.
      #
      #   @param max_length [Float] Maximum length of string. Only set if `type` is set to `Text` or `Textarea`.
      #
      #   @param max_value [String, Float] Maximum value of the field. Only set if field type is `Date` or `Number`. For `D
      #
      #   @param min_length [Float] Minimum length of string. Only set if `type` is set to `Text` or `Textarea`.
      #
      #   @param min_value [String, Float] Minimum value of the field. Only set if field type is `Date` or `Number`. For `D
      #
      #   @param read_only [Boolean] Indicates whether the custom metadata field is read only. A read only field cann
      #
      #   @param select_options [Array<String, Float, Boolean>] An array of allowed values when field type is `SingleSelect` or `MultiSelect`.
      #
      #   @param select_options_truncated [Boolean] Specifies if the selectOptions array is truncated. It is truncated when number o

      # Type of the custom metadata field.
      #
      # @see Imagekitio::Models::SelectedFieldsSchemaItem#type
      module Type
        extend Imagekitio::Internal::Type::Enum

        TEXT = :Text
        TEXTAREA = :Textarea
        NUMBER = :Number
        DATE = :Date
        BOOLEAN = :Boolean
        SINGLE_SELECT = :SingleSelect
        MULTI_SELECT = :MultiSelect

        # @!method self.values
        #   @return [Array<Symbol>]
      end

      # The default value for this custom metadata field. The value should match the
      # `type` of custom metadata field.
      #
      # @see Imagekitio::Models::SelectedFieldsSchemaItem#default_value
      module DefaultValue
        extend Imagekitio::Internal::Type::Union

        variant String

        variant Float

        variant Imagekitio::Internal::Type::Boolean

        # Default value should be of type array when custom metadata field type is set to `MultiSelect`.
        variant -> { Imagekitio::Models::SelectedFieldsSchemaItem::DefaultValue::MixedArray }

        module Mixed
          extend Imagekitio::Internal::Type::Union

          variant String

          variant Float

          variant Imagekitio::Internal::Type::Boolean

          # @!method self.variants
          #   @return [Array(String, Float, Boolean)]
        end

        # @!method self.variants
        #   @return [Array(String, Float, Boolean, Array<String, Float, Boolean>)]

        # @type [Imagekitio::Internal::Type::Converter]
        MixedArray =
          Imagekitio::Internal::Type::ArrayOf[union: -> {
            Imagekitio::SelectedFieldsSchemaItem::DefaultValue::Mixed
          }]
      end

      # Maximum value of the field. Only set if field type is `Date` or `Number`. For
      # `Date` type field, the value will be in ISO8601 string format. For `Number` type
      # field, it will be a numeric value.
      #
      # @see Imagekitio::Models::SelectedFieldsSchemaItem#max_value
      module MaxValue
        extend Imagekitio::Internal::Type::Union

        variant String

        variant Float

        # @!method self.variants
        #   @return [Array(String, Float)]
      end

      # Minimum value of the field. Only set if field type is `Date` or `Number`. For
      # `Date` type field, the value will be in ISO8601 string format. For `Number` type
      # field, it will be a numeric value.
      #
      # @see Imagekitio::Models::SelectedFieldsSchemaItem#min_value
      module MinValue
        extend Imagekitio::Internal::Type::Union

        variant String

        variant Float

        # @!method self.variants
        #   @return [Array(String, Float)]
      end

      module SelectOption
        extend Imagekitio::Internal::Type::Union

        variant String

        variant Float

        variant Imagekitio::Internal::Type::Boolean

        # @!method self.variants
        #   @return [Array(String, Float, Boolean)]
      end
    end

    # @type [Imagekitio::Internal::Type::Converter]
    SelectedFieldsSchema = Imagekitio::Internal::Type::HashOf[-> { Imagekitio::SelectedFieldsSchemaItem }]
  end
end
