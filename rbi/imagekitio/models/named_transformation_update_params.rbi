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

      # Unique identifier for a named transformation.
      sig { returns(String) }
      attr_accessor :id

      # Whether the named transformation is enabled. Omit to leave the current value
      # unchanged.
      sig { returns(T.nilable(T::Boolean)) }
      attr_reader :enabled

      sig { params(enabled: T::Boolean).void }
      attr_writer :enabled

      # Alias for the transformation string, used in URLs as `tr:n-<name>`. This is
      # case-sensitive, contains only alphanumeric characters or `_` (underscore), and
      # is unique across all named transformations for your account.
      sig { returns(T.nilable(String)) }
      attr_reader :name

      sig { params(name: String).void }
      attr_writer :name

      # The transformation string this named transformation refers to. Learn more about
      # the [transformation string syntax](https://imagekit.io/docs/transformations).
      sig { returns(T.nilable(String)) }
      attr_reader :transformation

      sig { params(transformation: String).void }
      attr_writer :transformation

      sig do
        params(
          id: String,
          enabled: T::Boolean,
          name: String,
          transformation: String,
          request_options: Imagekitio::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        # Unique identifier for a named transformation.
        id:,
        # Whether the named transformation is enabled. Omit to leave the current value
        # unchanged.
        enabled: nil,
        # Alias for the transformation string, used in URLs as `tr:n-<name>`. This is
        # case-sensitive, contains only alphanumeric characters or `_` (underscore), and
        # is unique across all named transformations for your account.
        name: nil,
        # The transformation string this named transformation refers to. Learn more about
        # the [transformation string syntax](https://imagekit.io/docs/transformations).
        transformation: nil,
        request_options: {}
      )
      end

      sig do
        override.returns(
          {
            id: String,
            enabled: T::Boolean,
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
