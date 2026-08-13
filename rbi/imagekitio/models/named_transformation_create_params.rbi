# typed: strong

module Imagekitio
  module Models
    class NamedTransformationCreateParams < Imagekitio::Internal::Type::BaseModel
      extend Imagekitio::Internal::Type::RequestParameters::Converter
      include Imagekitio::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(
            Imagekitio::NamedTransformationCreateParams,
            Imagekitio::Internal::AnyHash
          )
        end

      # Alias for the transformation string, used in URLs as `tr:n-<name>`. Must contain
      # only alphanumeric characters or `_` (no hyphens), and be unique for your
      # account. Name matching is case-sensitive.
      sig { returns(String) }
      attr_accessor :name

      # The transformation string this name refers to, for example
      # `w-150,h-150,fo-center,cm-resize`. The `tr:` prefix is optional; if present, it
      # is validated. The string must be a valid ImageKit transformation and cannot
      # itself reference another named transformation (no nesting). Learn more about the
      # [transformation syntax](https://imagekit.io/docs/transformations).
      sig { returns(String) }
      attr_accessor :transformation

      # Whether the named transformation is currently enabled. When this is set to
      # `false`, requests using such disabled named transformations fail at delivery
      # time.
      sig { returns(T.nilable(T::Boolean)) }
      attr_reader :enabled

      sig { params(enabled: T::Boolean).void }
      attr_writer :enabled

      sig do
        params(
          name: String,
          transformation: String,
          enabled: T::Boolean,
          request_options: Imagekitio::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        # Alias for the transformation string, used in URLs as `tr:n-<name>`. Must contain
        # only alphanumeric characters or `_` (no hyphens), and be unique for your
        # account. Name matching is case-sensitive.
        name:,
        # The transformation string this name refers to, for example
        # `w-150,h-150,fo-center,cm-resize`. The `tr:` prefix is optional; if present, it
        # is validated. The string must be a valid ImageKit transformation and cannot
        # itself reference another named transformation (no nesting). Learn more about the
        # [transformation syntax](https://imagekit.io/docs/transformations).
        transformation:,
        # Whether the named transformation is currently enabled. When this is set to
        # `false`, requests using such disabled named transformations fail at delivery
        # time.
        enabled: nil,
        request_options: {}
      )
      end

      sig do
        override.returns(
          {
            name: String,
            transformation: String,
            enabled: T::Boolean,
            request_options: Imagekitio::RequestOptions
          }
        )
      end
      def to_hash
      end
    end
  end
end
