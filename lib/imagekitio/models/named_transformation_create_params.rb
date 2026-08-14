# frozen_string_literal: true

module Imagekitio
  module Models
    # @see Imagekitio::Resources::NamedTransformations#create
    class NamedTransformationCreateParams < Imagekitio::Internal::Type::BaseModel
      extend Imagekitio::Internal::Type::RequestParameters::Converter
      include Imagekitio::Internal::Type::RequestParameters

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

      # @!attribute enabled
      #   Whether the named transformation is currently enabled. When set to `false`,
      #   requests using this named transformation fail at delivery time.
      #
      #   @return [Boolean, nil]
      optional :enabled, Imagekitio::Internal::Type::Boolean

      # @!method initialize(name:, transformation:, enabled: nil, request_options: {})
      #   Some parameter documentations has been truncated, see
      #   {Imagekitio::Models::NamedTransformationCreateParams} for more details.
      #
      #   @param name [String] Alias for the transformation string, used in URLs as `tr:n-<name>`. This is case
      #
      #   @param transformation [String] The transformation string this named transformation refers to. Learn more about
      #
      #   @param enabled [Boolean] Whether the named transformation is currently enabled. When set to `false`, requ
      #
      #   @param request_options [Imagekitio::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
