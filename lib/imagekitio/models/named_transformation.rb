# frozen_string_literal: true

module Imagekitio
  module Models
    class NamedTransformation < Imagekitio::Internal::Type::BaseModel
      # @!attribute id
      #   Unique identifier for a named transformation.
      #
      #   @return [String]
      required :id, String

      # @!attribute created_at
      #   ISO 8601 timestamp of when the named transformation was created.
      #
      #   @return [Time]
      required :created_at, Time, api_name: :createdAt

      # @!attribute enabled
      #   Whether the named transformation is currently enabled. When set to `false`,
      #   requests using this named transformation fail at delivery time.
      #
      #   @return [Boolean]
      required :enabled, Imagekitio::Internal::Type::Boolean

      # @!attribute name
      #   Alias for the transformation string, used in URLs as `tr:n-<name>`. This is
      #   case-sensitive, contains only alphanumeric characters or `_` (underscore), and
      #   is unique across all named transformations for your account.
      #
      #   @return [String]
      required :name, String

      # @!attribute transformation
      #   The transformation string this named transformation refers to. Learn more about
      #   the [transformation string syntax](https://imagekit.io/docs/transformations).
      #
      #   @return [String]
      required :transformation, String

      # @!method initialize(id:, created_at:, enabled:, name:, transformation:)
      #   Some parameter documentations has been truncated, see
      #   {Imagekitio::Models::NamedTransformation} for more details.
      #
      #   A named transformation is an alias for a transformation string, letting you
      #   apply and later update complex transformations without changing your image or
      #   video URLs. Learn more about
      #   [named transformations](https://imagekit.io/docs/transformations#named-transformations).
      #
      #   @param id [String] Unique identifier for a named transformation.
      #
      #   @param created_at [Time] ISO 8601 timestamp of when the named transformation was created.
      #
      #   @param enabled [Boolean] Whether the named transformation is currently enabled. When set to `false`, requ
      #
      #   @param name [String] Alias for the transformation string, used in URLs as `tr:n-<name>`. This is case
      #
      #   @param transformation [String] The transformation string this named transformation refers to. Learn more about
    end
  end
end
