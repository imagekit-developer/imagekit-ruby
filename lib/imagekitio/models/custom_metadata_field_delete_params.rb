# frozen_string_literal: true

module Imagekitio
  module Models
    # @see Imagekitio::Resources::CustomMetadataFields#delete
    class CustomMetadataFieldDeleteParams < Imagekitio::Internal::Type::BaseModel
      extend Imagekitio::Internal::Type::RequestParameters::Converter
      include Imagekitio::Internal::Type::RequestParameters

      # @!attribute id
      #
      #   @return [String]
      required :id, String

      # @!method initialize(id:, request_options: {})
      #   @param id [String]
      #   @param request_options [Imagekitio::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
