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
      # only contain alphanumeric characters or `_` (hyphens are not allowed), and must
      # be unique for your account. Name matching is case-sensitive, so
      # `Small_Thumbnail` and `small_thumbnail` are treated as different names.
      sig { returns(String) }
      attr_accessor :name

      # The transformation this name refers to, expressed as one or more comma-separated
      # transformation parameters, for example `w-150,h-150,fo-center,cm-resize`. You do
      # not need to prefix this with `tr:` — it is added automatically. If you do
      # include it, it must appear in lowercase at the start of the string, or the
      # request is rejected. Learn more about the
      # [transformation syntax](https://imagekit.io/docs/transformations).
      sig { returns(String) }
      attr_accessor :transformation

      # Whether this named transformation is enabled. Set to `false` to temporarily
      # disable it without deleting it — requests using a disabled named transformation
      # fail at delivery time.
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
        # Name of the named transformation. This is the alias used to refer to the
        # transformation string in image and video URLs, for example `tr:n-<name>`. Can
        # only contain alphanumeric characters or `_` (hyphens are not allowed), and must
        # be unique for your account. Name matching is case-sensitive, so
        # `Small_Thumbnail` and `small_thumbnail` are treated as different names.
        name:,
        # The transformation this name refers to, expressed as one or more comma-separated
        # transformation parameters, for example `w-150,h-150,fo-center,cm-resize`. You do
        # not need to prefix this with `tr:` — it is added automatically. If you do
        # include it, it must appear in lowercase at the start of the string, or the
        # request is rejected. Learn more about the
        # [transformation syntax](https://imagekit.io/docs/transformations).
        transformation:,
        # Whether this named transformation is enabled. Set to `false` to temporarily
        # disable it without deleting it — requests using a disabled named transformation
        # fail at delivery time.
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
