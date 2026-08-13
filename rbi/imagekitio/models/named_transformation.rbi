# typed: strong

module Imagekitio
  module Models
    class NamedTransformation < Imagekitio::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(Imagekitio::NamedTransformation, Imagekitio::Internal::AnyHash)
        end

      # Unique identifier for a named transformation.
      sig { returns(T.nilable(String)) }
      attr_reader :id

      sig { params(id: String).void }
      attr_writer :id

      # ISO 8601 timestamp of when the named transformation was created.
      sig { returns(T.nilable(Time)) }
      attr_reader :created_at

      sig { params(created_at: Time).void }
      attr_writer :created_at

      # Whether the named transformation is currently enabled. When this is set to
      # `false`, requests using such disabled named transformations fail at delivery
      # time.
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
      # `w-150,h-150,fo-center,cm-resize`. The `tr:` prefix is optional; if present, it
      # is validated. The string must be a valid ImageKit transformation and cannot
      # itself reference another named transformation (no nesting). Learn more about the
      # [transformation syntax](https://imagekit.io/docs/transformations).
      sig { returns(T.nilable(String)) }
      attr_reader :transformation

      sig { params(transformation: String).void }
      attr_writer :transformation

      # A named transformation is an alias for a transformation string, letting you
      # apply and later update complex transformations without changing your image or
      # video URLs. Learn more about
      # [named transformations](https://imagekit.io/docs/transformations#named-transformations).
      sig do
        params(
          id: String,
          created_at: Time,
          enabled: T::Boolean,
          name: String,
          transformation: String
        ).returns(T.attached_class)
      end
      def self.new(
        # Unique identifier for a named transformation.
        id: nil,
        # ISO 8601 timestamp of when the named transformation was created.
        created_at: nil,
        # Whether the named transformation is currently enabled. When this is set to
        # `false`, requests using such disabled named transformations fail at delivery
        # time.
        enabled: nil,
        # Alias for the transformation string, used in URLs as `tr:n-<name>`. Must contain
        # only alphanumeric characters or `_` (no hyphens), and be unique for your
        # account. Name matching is case-sensitive.
        name: nil,
        # The transformation string this name refers to, for example
        # `w-150,h-150,fo-center,cm-resize`. The `tr:` prefix is optional; if present, it
        # is validated. The string must be a valid ImageKit transformation and cannot
        # itself reference another named transformation (no nesting). Learn more about the
        # [transformation syntax](https://imagekit.io/docs/transformations).
        transformation: nil
      )
      end

      sig do
        override.returns(
          {
            id: String,
            created_at: Time,
            enabled: T::Boolean,
            name: String,
            transformation: String
          }
        )
      end
      def to_hash
      end
    end
  end
end
