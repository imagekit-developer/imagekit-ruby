# frozen_string_literal: true

module Imagekitio
  module Models
    # @type [Imagekitio::Internal::Type::Converter]
    CustomMetadataFieldListResponse =
      Imagekitio::Internal::Type::ArrayOf[-> { Imagekitio::CustomMetadataField }]
  end
end
