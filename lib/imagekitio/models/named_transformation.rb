# frozen_string_literal: true

module Imagekitio
  module Models
    class NamedTransformation < Imagekitio::Internal::Type::BaseModel
      # @!attribute id
      #   Unique identifier for a named transformation.
      #
      #   @return [String, nil]
      optional :id, String

      # @!attribute created_at
      #   ISO 8601 timestamp of when the named transformation was created.
      #
      #   @return [Time, nil]
      optional :created_at, Time, api_name: :createdAt

      # @!attribute enabled
      #   Whether the named transformation is currently enabled. When this is set to
      #   `false`, requests using such disabled named transformations fail at delivery
      #   time.
      #
      #   @return [Boolean, nil]
      optional :enabled, Imagekitio::Internal::Type::Boolean

      # @!attribute name
      #   Alias for the transformation string, used in URLs as `tr:n-<name>`. Must contain
      #   only alphanumeric characters or `_` (no hyphens), and be unique for your
      #   account. Name matching is case-sensitive.
      #
      #   @return [String, nil]
      optional :name, String

      # @!attribute transformation
      #   The transformation string this name refers to, for example
      #   `w-150,h-150,fo-center,cm-resize`. The `tr:` prefix is optional; if present, it
      #   is validated. The string must be a valid ImageKit transformation and cannot
      #   itself reference another named transformation (no nesting). Learn more about the
      #   [transformation syntax](https://imagekit.io/docs/transformations).
      #
      #   @return [String, nil]
      optional :transformation, String

      # @!method initialize(id: nil, created_at: nil, enabled: nil, name: nil, transformation: nil)
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
      #   @param enabled [Boolean] Whether the named transformation is currently enabled. When this is set to `fals
      #
      #   @param name [String] Alias for the transformation string, used in URLs as `tr:n-<name>`. Must contain
      #
      #   @param transformation [String] The transformation string this name refers to, for example `w-150,h-150,fo-cente
    end
  end
end
