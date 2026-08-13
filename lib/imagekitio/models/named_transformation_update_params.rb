# frozen_string_literal: true

module Imagekitio
  module Models
    # @see Imagekitio::Resources::NamedTransformations#update
    class NamedTransformationUpdateParams < Imagekitio::Internal::Type::BaseModel
      extend Imagekitio::Internal::Type::RequestParameters::Converter
      include Imagekitio::Internal::Type::RequestParameters

      # @!attribute id
      #   Unique identifier for a named transformation.
      #
      #   @return [String]
      required :id, String

      # @!attribute enabled
      #   Whether the named transformation is enabled. Omit to leave the current value
      #   unchanged.
      #
      #   @return [Boolean, nil]
      optional :enabled, Imagekitio::Internal::Type::Boolean

      # @!attribute name
      #   Alias for the transformation string, used in URLs as `tr:n-<name>`. This is
      #   case-sensitive, contains only alphanumeric characters or `_` (underscore), and
      #   is unique across all named transformations for your account.
      #
      #   @return [String, nil]
      optional :name, String

      # @!attribute transformation
      #   The transformation string this named transformation refers to. Learn more about
      #   the [transformation string syntax](https://imagekit.io/docs/transformations).
      #
      #   @return [String, nil]
      optional :transformation, String

      # @!method initialize(id:, enabled: nil, name: nil, transformation: nil, request_options: {})
      #   Some parameter documentations has been truncated, see
      #   {Imagekitio::Models::NamedTransformationUpdateParams} for more details.
      #
      #   @param id [String] Unique identifier for a named transformation.
      #
      #   @param enabled [Boolean] Whether the named transformation is enabled. Omit to leave the current value unc
      #
      #   @param name [String] Alias for the transformation string, used in URLs as `tr:n-<name>`. This is case
      #
      #   @param transformation [String] The transformation string this named transformation refers to. Learn more about
      #
      #   @param request_options [Imagekitio::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
