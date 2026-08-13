# frozen_string_literal: true

module Imagekitio
  module Models
    # @see Imagekitio::Resources::NamedTransformations#create
    class NamedTransformationCreateParams < Imagekitio::Internal::Type::BaseModel
      extend Imagekitio::Internal::Type::RequestParameters::Converter
      include Imagekitio::Internal::Type::RequestParameters

      # @!attribute name
      #   Alias for the transformation string, used in URLs as `tr:n-<name>`. Must contain
      #   only alphanumeric characters or `_` (no hyphens), and be unique for your
      #   account. Name matching is case-sensitive.
      #
      #   @return [String]
      required :name, String

      # @!attribute transformation
      #   The transformation string this name refers to, for example
      #   `w-150,h-150,fo-center,cm-resize`. The `tr:` prefix is optional; if present, it
      #   is validated. The string must be a valid ImageKit transformation and cannot
      #   itself reference another named transformation (no nesting). Learn more about the
      #   [transformation syntax](https://imagekit.io/docs/transformations).
      #
      #   @return [String]
      required :transformation, String

      # @!attribute enabled
      #   Whether the named transformation is currently enabled. When this is set to
      #   `false`, requests using such disabled named transformations fail at delivery
      #   time.
      #
      #   @return [Boolean, nil]
      optional :enabled, Imagekitio::Internal::Type::Boolean

      # @!method initialize(name:, transformation:, enabled: nil, request_options: {})
      #   Some parameter documentations has been truncated, see
      #   {Imagekitio::Models::NamedTransformationCreateParams} for more details.
      #
      #   @param name [String] Alias for the transformation string, used in URLs as `tr:n-<name>`. Must contain
      #
      #   @param transformation [String] The transformation string this name refers to, for example `w-150,h-150,fo-cente
      #
      #   @param enabled [Boolean] Whether the named transformation is currently enabled. When this is set to `fals
      #
      #   @param request_options [Imagekitio::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
