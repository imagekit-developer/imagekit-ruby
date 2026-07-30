# frozen_string_literal: true

module Imagekitio
  module Models
    # @see Imagekitio::Resources::NamedTransformations#update
    class NamedTransformationUpdateParams < Imagekitio::Internal::Type::BaseModel
      extend Imagekitio::Internal::Type::RequestParameters::Converter
      include Imagekitio::Internal::Type::RequestParameters

      # @!attribute id
      #
      #   @return [String]
      required :id, String

      # @!attribute disabled
      #   Whether this named transformation is disabled.
      #
      #   @return [Boolean, nil]
      optional :disabled, Imagekitio::Internal::Type::Boolean

      # @!attribute name
      #   Updated name of the named transformation. Can only contain alphanumeric
      #   characters, `_` and `-`, and must be unique for your account (case-insensitive).
      #
      #   @return [String, nil]
      optional :name, String

      # @!attribute transformation
      #   Updated transformation string. It must start with `tr:` followed by one or more
      #   transformation parameters.
      #
      #   @return [String, nil]
      optional :transformation, String

      # @!method initialize(id:, disabled: nil, name: nil, transformation: nil, request_options: {})
      #   Some parameter documentations has been truncated, see
      #   {Imagekitio::Models::NamedTransformationUpdateParams} for more details.
      #
      #   @param id [String]
      #
      #   @param disabled [Boolean] Whether this named transformation is disabled.
      #
      #   @param name [String] Updated name of the named transformation. Can only contain alphanumeric characte
      #
      #   @param transformation [String] Updated transformation string. It must start with `tr:` followed by one or more
      #
      #   @param request_options [Imagekitio::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
