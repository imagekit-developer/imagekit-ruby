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

      # @!attribute enabled
      #   Whether this named transformation is enabled. If omitted, the existing value is
      #   left unchanged.
      #
      #   @return [Boolean, nil]
      optional :enabled, Imagekitio::Internal::Type::Boolean

      # @!attribute name
      #   Updated name of the named transformation. Can only contain alphanumeric
      #   characters and `_`, and must be unique for your account. Name matching is
      #   case-sensitive, so `Small_Thumbnail` and `small_thumbnail` are treated as
      #   different names.
      #
      #   @return [String, nil]
      optional :name, String

      # @!attribute transformation
      #   Updated transformation, expressed as one or more comma-separated transformation
      #   parameters. You do not need to prefix this with `tr:` — it is added
      #   automatically. If you do include it, it must appear in lowercase at the start of
      #   the string, or the request is rejected.
      #
      #   @return [String, nil]
      optional :transformation, String

      # @!method initialize(id:, enabled: nil, name: nil, transformation: nil, request_options: {})
      #   Some parameter documentations has been truncated, see
      #   {Imagekitio::Models::NamedTransformationUpdateParams} for more details.
      #
      #   @param id [String]
      #
      #   @param enabled [Boolean] Whether this named transformation is enabled. If omitted, the existing value is
      #
      #   @param name [String] Updated name of the named transformation. Can only contain alphanumeric characte
      #
      #   @param transformation [String] Updated transformation, expressed as one or more comma-separated transformation
      #
      #   @param request_options [Imagekitio::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
