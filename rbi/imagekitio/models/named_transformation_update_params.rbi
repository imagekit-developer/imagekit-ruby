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

      # Whether this named transformation is enabled. If omitted, the existing value is
      # left unchanged.
      sig { returns(T.nilable(T::Boolean)) }
      attr_reader :enabled

      sig { params(enabled: T::Boolean).void }
      attr_writer :enabled

      # Updated name of the named transformation. Can only contain alphanumeric
      # characters and `_`, and must be unique for your account. Name matching is
      # case-sensitive, so `Small_Thumbnail` and `small_thumbnail` are treated as
      # different names.
      sig { returns(T.nilable(String)) }
      attr_reader :name

      sig { params(name: String).void }
      attr_writer :name

      # Updated transformation, expressed as one or more comma-separated transformation
      # parameters. You do not need to prefix this with `tr:` — it is added
      # automatically. If you do include it, it must appear in lowercase at the start of
      # the string, or the request is rejected.
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
        # Whether this named transformation is enabled. If omitted, the existing value is
        # left unchanged.
        enabled: nil,
        # Updated name of the named transformation. Can only contain alphanumeric
        # characters and `_`, and must be unique for your account. Name matching is
        # case-sensitive, so `Small_Thumbnail` and `small_thumbnail` are treated as
        # different names.
        name: nil,
        # Updated transformation, expressed as one or more comma-separated transformation
        # parameters. You do not need to prefix this with `tr:` — it is added
        # automatically. If you do include it, it must appear in lowercase at the start of
        # the string, or the request is rejected.
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
