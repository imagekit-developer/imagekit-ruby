# frozen_string_literal: true

module Imagekitio
  module Models
    # @see Imagekitio::Resources::CustomMetadataFields#update
    class CustomMetadataFieldUpdateParams < Imagekitio::Internal::Type::BaseModel
      extend Imagekitio::Internal::Type::RequestParameters::Converter
      include Imagekitio::Internal::Type::RequestParameters

      # @!attribute label
      #   Human readable name of the custom metadata field. This should be unique across
      #   all non deleted custom metadata fields. This name is displayed as form field
      #   label to the users while setting field value on an asset in the media library
      #   UI. This parameter is required if `schema` is not provided.
      #
      #   @return [String, nil]
      optional :label, String

      # @!attribute schema
      #   An object that describes the rules for the custom metadata key. This parameter
      #   is required if `label` is not provided. Note: `type` cannot be updated and will
      #   be ignored if sent with the `schema`. The schema will be validated as per the
      #   existing `type`.
      #
      #   @return [Imagekitio::Models::CustomMetadataFieldUpdateParams::Schema, nil]
      optional :schema, -> { Imagekitio::CustomMetadataFieldUpdateParams::Schema }

      # @!method initialize(label: nil, schema: nil, request_options: {})
      #   Some parameter documentations has been truncated, see
      #   {Imagekitio::Models::CustomMetadataFieldUpdateParams} for more details.
      #
      #   @param label [String] Human readable name of the custom metadata field. This should be unique across a
      #
      #   @param schema [Imagekitio::Models::CustomMetadataFieldUpdateParams::Schema] An object that describes the rules for the custom metadata key. This parameter i
      #
      #   @param request_options [Imagekitio::RequestOptions, Hash{Symbol=>Object}]

      class Schema < Imagekitio::Internal::Type::BaseModel
        # @!attribute default_value
        #   The default value for this custom metadata field. This property is only required
        #   if `isValueRequired` property is set to `true`. The value should match the
        #   `type` of custom metadata field.
        #
        #   @return [String, Float, Boolean, Array<String, Float, Boolean>, nil]
        optional :default_value,
                 union: -> { Imagekitio::CustomMetadataFieldUpdateParams::Schema::DefaultValue },
                 api_name: :defaultValue

        # @!attribute is_value_required
        #   Sets this custom metadata field as required. Setting custom metadata fields on
        #   an asset will throw error if the value for all required fields are not present
        #   in upload or update asset API request body.
        #
        #   @return [Boolean, nil]
        optional :is_value_required, Imagekitio::Internal::Type::Boolean, api_name: :isValueRequired

        # @!attribute max_length
        #   Maximum length of string. Only set this property if `type` is set to `Text` or
        #   `Textarea`.
        #
        #   @return [Float, nil]
        optional :max_length, Float, api_name: :maxLength

        # @!attribute max_value
        #   Maximum value of the field. Only set this property if field type is `Date` or
        #   `Number`. For `Date` type field, set the minimum date in ISO8601 string format.
        #   For `Number` type field, set the minimum numeric value.
        #
        #   @return [String, Float, nil]
        optional :max_value,
                 union: -> { Imagekitio::CustomMetadataFieldUpdateParams::Schema::MaxValue },
                 api_name: :maxValue

        # @!attribute min_length
        #   Minimum length of string. Only set this property if `type` is set to `Text` or
        #   `Textarea`.
        #
        #   @return [Float, nil]
        optional :min_length, Float, api_name: :minLength

        # @!attribute min_value
        #   Minimum value of the field. Only set this property if field type is `Date` or
        #   `Number`. For `Date` type field, set the minimum date in ISO8601 string format.
        #   For `Number` type field, set the minimum numeric value.
        #
        #   @return [String, Float, nil]
        optional :min_value,
                 union: -> { Imagekitio::CustomMetadataFieldUpdateParams::Schema::MinValue },
                 api_name: :minValue

        # @!attribute select_options
        #   An array of allowed values. This property is only required if `type` property is
        #   set to `SingleSelect` or `MultiSelect`.
        #
        #   @return [Array<String, Float, Boolean>, nil]
        optional :select_options,
                 -> {
                   Imagekitio::Internal::Type::ArrayOf[union: Imagekitio::CustomMetadataFieldUpdateParams::Schema::SelectOption]
                 },
                 api_name: :selectOptions

        # @!method initialize(default_value: nil, is_value_required: nil, max_length: nil, max_value: nil, min_length: nil, min_value: nil, select_options: nil)
        #   Some parameter documentations has been truncated, see
        #   {Imagekitio::Models::CustomMetadataFieldUpdateParams::Schema} for more details.
        #
        #   An object that describes the rules for the custom metadata key. This parameter
        #   is required if `label` is not provided. Note: `type` cannot be updated and will
        #   be ignored if sent with the `schema`. The schema will be validated as per the
        #   existing `type`.
        #
        #   @param default_value [String, Float, Boolean, Array<String, Float, Boolean>] The default value for this custom metadata field. This property is only required
        #
        #   @param is_value_required [Boolean] Sets this custom metadata field as required. Setting custom metadata fields on a
        #
        #   @param max_length [Float] Maximum length of string. Only set this property if `type` is set to `Text` or `
        #
        #   @param max_value [String, Float] Maximum value of the field. Only set this property if field type is `Date` or `N
        #
        #   @param min_length [Float] Minimum length of string. Only set this property if `type` is set to `Text` or `
        #
        #   @param min_value [String, Float] Minimum value of the field. Only set this property if field type is `Date` or `N
        #
        #   @param select_options [Array<String, Float, Boolean>] An array of allowed values. This property is only required if `type` property is

        # The default value for this custom metadata field. This property is only required
        # if `isValueRequired` property is set to `true`. The value should match the
        # `type` of custom metadata field.
        #
        # @see Imagekitio::Models::CustomMetadataFieldUpdateParams::Schema#default_value
        module DefaultValue
          extend Imagekitio::Internal::Type::Union

          variant String

          variant Float

          variant Imagekitio::Internal::Type::Boolean

          # Default value should be of type array when custom metadata field type is set to `MultiSelect`.
          variant -> { Imagekitio::Models::CustomMetadataFieldUpdateParams::Schema::DefaultValue::MixedArray }

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
              Imagekitio::CustomMetadataFieldUpdateParams::Schema::DefaultValue::Mixed
            }]
        end

        # Maximum value of the field. Only set this property if field type is `Date` or
        # `Number`. For `Date` type field, set the minimum date in ISO8601 string format.
        # For `Number` type field, set the minimum numeric value.
        #
        # @see Imagekitio::Models::CustomMetadataFieldUpdateParams::Schema#max_value
        module MaxValue
          extend Imagekitio::Internal::Type::Union

          variant String

          variant Float

          # @!method self.variants
          #   @return [Array(String, Float)]
        end

        # Minimum value of the field. Only set this property if field type is `Date` or
        # `Number`. For `Date` type field, set the minimum date in ISO8601 string format.
        # For `Number` type field, set the minimum numeric value.
        #
        # @see Imagekitio::Models::CustomMetadataFieldUpdateParams::Schema#min_value
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
    end
  end
end
