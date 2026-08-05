# typed: strong

module Imagekitio
  module Models
    class NamedTransformationUpdateParams < Imagekitio::Internal::Type::BaseModel
      extend Imagekitio::Internal::Type::RequestParameters::Converter
      include Imagekitio::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(
            Imagekitio::NamedTransformationUpdateParams,
            Imagekitio::Internal::AnyHash
          )
        end

      sig { returns(String) }
      attr_accessor :id

      # Whether this named transformation is disabled.
      sig { returns(T.nilable(T::Boolean)) }
      attr_reader :disabled

      sig { params(disabled: T::Boolean).void }
      attr_writer :disabled

      # Updated name of the named transformation. Can only contain alphanumeric
      # characters, `_` and `-`, and must be unique for your account (case-insensitive).
      sig { returns(T.nilable(String)) }
      attr_reader :name

      sig { params(name: String).void }
      attr_writer :name

      # Updated transformation string. It must start with `tr:` followed by one or more
      # transformation parameters.
      sig { returns(T.nilable(String)) }
      attr_reader :transformation

      sig { params(transformation: String).void }
      attr_writer :transformation

      sig do
        params(
          id: String,
          disabled: T::Boolean,
          name: String,
          transformation: String,
          request_options: Imagekitio::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        id:,
        # Whether this named transformation is disabled.
        disabled: nil,
        # Updated name of the named transformation. Can only contain alphanumeric
        # characters, `_` and `-`, and must be unique for your account (case-insensitive).
        name: nil,
        # Updated transformation string. It must start with `tr:` followed by one or more
        # transformation parameters.
        transformation: nil,
        request_options: {}
      )
      end

      sig do
        override.returns(
          {
            id: String,
            disabled: T::Boolean,
            name: String,
            transformation: String,
            request_options: Imagekitio::RequestOptions
          }
        )
      end
      def to_hash
      end
    end
  end
end
