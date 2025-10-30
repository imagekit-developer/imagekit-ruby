# frozen_string_literal: true

module Imagekitio
  module Models
    # @see Imagekitio::Resources::CustomMetadataFields#create
    class CustomMetadataFieldCreateParams < Imagekitio::Internal::Type::BaseModel
      extend Imagekitio::Internal::Type::RequestParameters::Converter
      include Imagekitio::Internal::Type::RequestParameters

      # @!attribute label
      #   Human readable name of the custom metadata field. This should be unique across
      #   all non deleted custom metadata fields. This name is displayed as form field
      #   label to the users while setting field value on an asset in the media library
      #   UI.
      #
      #   @return [String]
      required :label, String

      # @!attribute name
      #   API name of the custom metadata field. This should be unique across all
      #   (including deleted) custom metadata fields.
      #
      #   @return [String]
      required :name, String

      # @!attribute schema
      #
      #   @return [Imagekitio::Models::CustomMetadataFieldCreateParams::Schema]
      required :schema, -> { Imagekitio::CustomMetadataFieldCreateParams::Schema }

      # @!method initialize(label:, name:, schema:, request_options: {})
      #   Some parameter documentations has been truncated, see
      #   {Imagekitio::Models::CustomMetadataFieldCreateParams} for more details.
      #
      #   @param label [String] Human readable name of the custom metadata field. This should be unique across a
      #
      #   @param name [String] API name of the custom metadata field. This should be unique across all (includi
      #
      #   @param schema [Imagekitio::Models::CustomMetadataFieldCreateParams::Schema]
      #
      #   @param request_options [Imagekitio::RequestOptions, Hash{Symbol=>Object}]

      class Schema < Imagekitio::Internal::Type::BaseModel
        # @!attribute type
        #   Type of the custom metadata field.
        #
        #   @return [Symbol, Imagekitio::Models::CustomMetadataFieldCreateParams::Schema::Type]
        required :type, enum: -> { Imagekitio::CustomMetadataFieldCreateParams::Schema::Type }

        # @!attribute default_value
        #   The default value for this custom metadata field. This property is only required
        #   if `isValueRequired` property is set to `true`. The value should match the
        #   `type` of custom metadata field.
        #
        #   @return [String, Float, Boolean, Array<String, Float, Boolean>, nil]
        optional :default_value,
                 union: -> { Imagekitio::CustomMetadataFieldCreateParams::Schema::DefaultValue },
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
                 union: -> { Imagekitio::CustomMetadataFieldCreateParams::Schema::MaxValue },
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
                 union: -> { Imagekitio::CustomMetadataFieldCreateParams::Schema::MinValue },
                 api_name: :minValue

        # @!attribute select_options
        #   An array of allowed values. This property is only required if `type` property is
        #   set to `SingleSelect` or `MultiSelect`.
        #
        #   @return [Array<String, Float, Boolean>, nil]
        optional :select_options,
                 -> {
                   Imagekitio::Internal::Type::ArrayOf[union: Imagekitio::CustomMetadataFieldCreateParams::Schema::SelectOption]
                 },
                 api_name: :selectOptions

        # @!method initialize(type:, default_value: nil, is_value_required: nil, max_length: nil, max_value: nil, min_length: nil, min_value: nil, select_options: nil)
        #   Some parameter documentations has been truncated, see
        #   {Imagekitio::Models::CustomMetadataFieldCreateParams::Schema} for more details.
        #
        #   @param type [Symbol, Imagekitio::Models::CustomMetadataFieldCreateParams::Schema::Type] Type of the custom metadata field.
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

        # Type of the custom metadata field.
        #
        # @see Imagekitio::Models::CustomMetadataFieldCreateParams::Schema#type
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

        # The default value for this custom metadata field. This property is only required
        # if `isValueRequired` property is set to `true`. The value should match the
        # `type` of custom metadata field.
        #
        # @see Imagekitio::Models::CustomMetadataFieldCreateParams::Schema#default_value
        module DefaultValue
          extend Imagekitio::Internal::Type::Union

          variant String

          variant Float

          variant Imagekitio::Internal::Type::Boolean

          # Default value should be of type array when custom metadata field type is set to `MultiSelect`.
          variant -> { Imagekitio::Models::CustomMetadataFieldCreateParams::Schema::DefaultValue::MixedArray }

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
              Imagekitio::CustomMetadataFieldCreateParams::Schema::DefaultValue::Mixed
            }]
        end

        # Maximum value of the field. Only set this property if field type is `Date` or
        # `Number`. For `Date` type field, set the minimum date in ISO8601 string format.
        # For `Number` type field, set the minimum numeric value.
        #
        # @see Imagekitio::Models::CustomMetadataFieldCreateParams::Schema#max_value
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
        # @see Imagekitio::Models::CustomMetadataFieldCreateParams::Schema#min_value
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
