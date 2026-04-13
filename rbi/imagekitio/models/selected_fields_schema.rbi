# typed: strong

module Imagekitio
  module Models
    class SelectedFieldsSchemaItem < Imagekitio::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            Imagekitio::SelectedFieldsSchemaItem,
            Imagekitio::Internal::AnyHash
          )
        end

      # Type of the custom metadata field.
      sig { returns(Imagekitio::SelectedFieldsSchemaItem::Type::TaggedSymbol) }
      attr_accessor :type

      # The default value for this custom metadata field. The value should match the
      # `type` of custom metadata field.
      sig do
        returns(
          T.nilable(
            Imagekitio::SelectedFieldsSchemaItem::DefaultValue::Variants
          )
        )
      end
      attr_reader :default_value

      sig do
        params(
          default_value:
            Imagekitio::SelectedFieldsSchemaItem::DefaultValue::Variants
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
          T.nilable(Imagekitio::SelectedFieldsSchemaItem::MaxValue::Variants)
        )
      end
      attr_reader :max_value

      sig do
        params(
          max_value: Imagekitio::SelectedFieldsSchemaItem::MaxValue::Variants
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
          T.nilable(Imagekitio::SelectedFieldsSchemaItem::MinValue::Variants)
        )
      end
      attr_reader :min_value

      sig do
        params(
          min_value: Imagekitio::SelectedFieldsSchemaItem::MinValue::Variants
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
              Imagekitio::SelectedFieldsSchemaItem::SelectOption::Variants
            ]
          )
        )
      end
      attr_reader :select_options

      sig do
        params(
          select_options:
            T::Array[
              Imagekitio::SelectedFieldsSchemaItem::SelectOption::Variants
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
          type: Imagekitio::SelectedFieldsSchemaItem::Type::OrSymbol,
          default_value:
            Imagekitio::SelectedFieldsSchemaItem::DefaultValue::Variants,
          is_value_required: T::Boolean,
          max_length: Float,
          max_value: Imagekitio::SelectedFieldsSchemaItem::MaxValue::Variants,
          min_length: Float,
          min_value: Imagekitio::SelectedFieldsSchemaItem::MinValue::Variants,
          read_only: T::Boolean,
          select_options:
            T::Array[
              Imagekitio::SelectedFieldsSchemaItem::SelectOption::Variants
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
            type: Imagekitio::SelectedFieldsSchemaItem::Type::TaggedSymbol,
            default_value:
              Imagekitio::SelectedFieldsSchemaItem::DefaultValue::Variants,
            is_value_required: T::Boolean,
            max_length: Float,
            max_value: Imagekitio::SelectedFieldsSchemaItem::MaxValue::Variants,
            min_length: Float,
            min_value: Imagekitio::SelectedFieldsSchemaItem::MinValue::Variants,
            read_only: T::Boolean,
            select_options:
              T::Array[
                Imagekitio::SelectedFieldsSchemaItem::SelectOption::Variants
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
            T.all(Symbol, Imagekitio::SelectedFieldsSchemaItem::Type)
          end
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        TEXT =
          T.let(:Text, Imagekitio::SelectedFieldsSchemaItem::Type::TaggedSymbol)
        TEXTAREA =
          T.let(
            :Textarea,
            Imagekitio::SelectedFieldsSchemaItem::Type::TaggedSymbol
          )
        NUMBER =
          T.let(
            :Number,
            Imagekitio::SelectedFieldsSchemaItem::Type::TaggedSymbol
          )
        DATE =
          T.let(:Date, Imagekitio::SelectedFieldsSchemaItem::Type::TaggedSymbol)
        BOOLEAN =
          T.let(
            :Boolean,
            Imagekitio::SelectedFieldsSchemaItem::Type::TaggedSymbol
          )
        SINGLE_SELECT =
          T.let(
            :SingleSelect,
            Imagekitio::SelectedFieldsSchemaItem::Type::TaggedSymbol
          )
        MULTI_SELECT =
          T.let(
            :MultiSelect,
            Imagekitio::SelectedFieldsSchemaItem::Type::TaggedSymbol
          )

        sig do
          override.returns(
            T::Array[Imagekitio::SelectedFieldsSchemaItem::Type::TaggedSymbol]
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
                Imagekitio::SelectedFieldsSchemaItem::DefaultValue::Mixed::Variants
              ]
            )
          end

        module Mixed
          extend Imagekitio::Internal::Type::Union

          Variants = T.type_alias { T.any(String, Float, T::Boolean) }

          sig do
            override.returns(
              T::Array[
                Imagekitio::SelectedFieldsSchemaItem::DefaultValue::Mixed::Variants
              ]
            )
          end
          def self.variants
          end
        end

        sig do
          override.returns(
            T::Array[
              Imagekitio::SelectedFieldsSchemaItem::DefaultValue::Variants
            ]
          )
        end
        def self.variants
        end

        MixedArray =
          T.let(
            Imagekitio::Internal::Type::ArrayOf[
              union: Imagekitio::SelectedFieldsSchemaItem::DefaultValue::Mixed
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
            T::Array[Imagekitio::SelectedFieldsSchemaItem::MaxValue::Variants]
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
            T::Array[Imagekitio::SelectedFieldsSchemaItem::MinValue::Variants]
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
              Imagekitio::SelectedFieldsSchemaItem::SelectOption::Variants
            ]
          )
        end
        def self.variants
        end
      end
    end

    SelectedFieldsSchema =
      T.let(
        Imagekitio::Internal::Type::HashOf[
          Imagekitio::SelectedFieldsSchemaItem
        ],
        Imagekitio::Internal::Type::Converter
      )
  end
end
