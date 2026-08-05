# frozen_string_literal: true

module Imagekitio
  module Models
    # @see Imagekitio::Resources::NamedTransformations#create
    class NamedTransformationCreateParams < Imagekitio::Internal::Type::BaseModel
      extend Imagekitio::Internal::Type::RequestParameters::Converter
      include Imagekitio::Internal::Type::RequestParameters

      # @!attribute name
      #   Name of the named transformation. This is the alias used to refer to the
      #   transformation string in image and video URLs, for example `tr:n-<name>`. Can
      #   only contain alphanumeric characters, `_` and `-`, and must be unique for your
      #   account (case-insensitive).
      #
      #   @return [String]
      required :name, String

      # @!attribute transformation
      #   The transformation string this name refers to. It must start with `tr:` followed
      #   by one or more transformation parameters, for example
      #   `tr:w-150,h-150,fo-center,cm-resize`. Learn more about the
      #   [transformation syntax](https://imagekit.io/docs/transformations).
      #
      #   @return [String]
      required :transformation, String

      # @!attribute disabled
      #   Whether this named transformation is disabled. Set to `true` to temporarily
      #   disable it without deleting it — requests using a disabled named transformation
      #   fail at delivery time.
      #
      #   @return [Boolean, nil]
      optional :disabled, Imagekitio::Internal::Type::Boolean

      # @!method initialize(name:, transformation:, disabled: nil, request_options: {})
      #   Some parameter documentations has been truncated, see
      #   {Imagekitio::Models::NamedTransformationCreateParams} for more details.
      #
      #   @param name [String] Name of the named transformation. This is the alias used to refer to the transfo
      #
      #   @param transformation [String] The transformation string this name refers to. It must start with `tr:` followed
      #
      #   @param disabled [Boolean] Whether this named transformation is disabled. Set to `true` to temporarily disa
      #
      #   @param request_options [Imagekitio::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
