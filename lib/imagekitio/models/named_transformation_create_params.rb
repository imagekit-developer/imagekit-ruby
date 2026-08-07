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
      #   only contain alphanumeric characters or `_` (hyphens are not allowed), and must
      #   be unique for your account. Name matching is case-sensitive, so
      #   `Small_Thumbnail` and `small_thumbnail` are treated as different names.
      #
      #   @return [String]
      required :name, String

      # @!attribute transformation
      #   The transformation this name refers to, expressed as one or more comma-separated
      #   transformation parameters, for example `w-150,h-150,fo-center,cm-resize`. You do
      #   not need to prefix this with `tr:` — it is added automatically. If you do
      #   include it, it must appear in lowercase at the start of the string, or the
      #   request is rejected. Learn more about the
      #   [transformation syntax](https://imagekit.io/docs/transformations).
      #
      #   @return [String]
      required :transformation, String

      # @!attribute enabled
      #   Whether this named transformation is enabled. Set to `false` to temporarily
      #   disable it without deleting it — requests using a disabled named transformation
      #   fail at delivery time.
      #
      #   @return [Boolean, nil]
      optional :enabled, Imagekitio::Internal::Type::Boolean

      # @!method initialize(name:, transformation:, enabled: nil, request_options: {})
      #   Some parameter documentations has been truncated, see
      #   {Imagekitio::Models::NamedTransformationCreateParams} for more details.
      #
      #   @param name [String] Name of the named transformation. This is the alias used to refer to the transfo
      #
      #   @param transformation [String] The transformation this name refers to, expressed as one or more comma-separated
      #
      #   @param enabled [Boolean] Whether this named transformation is enabled. Set to `false` to temporarily disa
      #
      #   @param request_options [Imagekitio::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
