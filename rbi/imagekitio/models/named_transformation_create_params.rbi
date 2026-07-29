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

      # Name of the named transformation. This is the alias used to refer to the
      # transformation string in image and video URLs, for example `tr:n-<name>`. Can
      # only contain alphanumeric characters, `_` and `-`, and must be unique for your
      # account (case-insensitive).
      sig { returns(String) }
      attr_accessor :name

      # The transformation string this name refers to. It must start with `tr:` followed
      # by one or more transformation parameters, for example
      # `tr:w-150,h-150,fo-center,cm-resize`. Learn more about the
      # [transformation syntax](https://imagekit.io/docs/transformations).
      sig { returns(String) }
      attr_accessor :transformation

      # Whether this named transformation is disabled. Set to `true` to temporarily
      # disable it without deleting it — requests using a disabled named transformation
      # fail at delivery time.
      sig { returns(T.nilable(T::Boolean)) }
      attr_reader :disabled

      sig { params(disabled: T::Boolean).void }
      attr_writer :disabled

      sig do
        params(
          name: String,
          transformation: String,
          disabled: T::Boolean,
          request_options: Imagekitio::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        # Name of the named transformation. This is the alias used to refer to the
        # transformation string in image and video URLs, for example `tr:n-<name>`. Can
        # only contain alphanumeric characters, `_` and `-`, and must be unique for your
        # account (case-insensitive).
        name:,
        # The transformation string this name refers to. It must start with `tr:` followed
        # by one or more transformation parameters, for example
        # `tr:w-150,h-150,fo-center,cm-resize`. Learn more about the
        # [transformation syntax](https://imagekit.io/docs/transformations).
        transformation:,
        # Whether this named transformation is disabled. Set to `true` to temporarily
        # disable it without deleting it — requests using a disabled named transformation
        # fail at delivery time.
        disabled: nil,
        request_options: {}
      )
      end

      sig do
        override.returns(
          {
            name: String,
            transformation: String,
            disabled: T::Boolean,
            request_options: Imagekitio::RequestOptions
          }
        )
      end
      def to_hash
      end
    end
  end
end
