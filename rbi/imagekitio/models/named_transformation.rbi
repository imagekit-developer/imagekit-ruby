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

      # Whether the named transformation is currently enabled. When set to `false`,
      # requests using this named transformation fail at delivery time.
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
        # Whether the named transformation is currently enabled. When set to `false`,
        # requests using this named transformation fail at delivery time.
        enabled: nil,
        # Alias for the transformation string, used in URLs as `tr:n-<name>`. This is
        # case-sensitive, contains only alphanumeric characters or `_` (underscore), and
        # is unique across all named transformations for your account.
        name: nil,
        # The transformation string this named transformation refers to. Learn more about
        # the [transformation string syntax](https://imagekit.io/docs/transformations).
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
