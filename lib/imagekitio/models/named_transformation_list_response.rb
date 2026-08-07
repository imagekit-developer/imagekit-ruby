# frozen_string_literal: true

module Imagekitio
  module Models
    # @type [Imagekitio::Internal::Type::Converter]
    NamedTransformationListResponse =
      Imagekitio::Internal::Type::ArrayOf[-> { Imagekitio::NamedTransformation }]
  end
end
