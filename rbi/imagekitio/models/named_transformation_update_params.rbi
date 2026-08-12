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

      # Whether the named transformation is enabled. Omit to leave the current value
      # unchanged.
      sig { returns(T.nilable(T::Boolean)) }
      attr_reader :enabled

      sig { params(enabled: T::Boolean).void }
      attr_writer :enabled

      # Alias for the transformation string, used in URLs as `tr:n-<name>`. Must contain
      # only alphanumeric characters or `_` (no hyphens), and be unique for your
      # account. Name matching is case-sensitive.
      sig { returns(T.nilable(String)) }
      attr_reader :name

      sig { params(name: String).void }
      attr_writer :name

      # The transformation string this name refers to, for example
      # `w-150,h-150,fo-center,cm-resize`. The `tr:` prefix is optional — it's added
      # automatically if missing, and validated if present. The string must be a valid
      # ImageKit transformation and cannot itself reference another named transformation
      # (no nesting). Learn more about the
      # [transformation syntax](https://imagekit.io/docs/transformations).
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
        id:,
        # Whether the named transformation is enabled. Omit to leave the current value
        # unchanged.
        enabled: nil,
        # Alias for the transformation string, used in URLs as `tr:n-<name>`. Must contain
        # only alphanumeric characters or `_` (no hyphens), and be unique for your
        # account. Name matching is case-sensitive.
        name: nil,
        # The transformation string this name refers to, for example
        # `w-150,h-150,fo-center,cm-resize`. The `tr:` prefix is optional — it's added
        # automatically if missing, and validated if present. The string must be a valid
        # ImageKit transformation and cannot itself reference another named transformation
        # (no nesting). Learn more about the
        # [transformation syntax](https://imagekit.io/docs/transformations).
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
