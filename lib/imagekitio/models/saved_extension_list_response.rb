# frozen_string_literal: true

module Imagekitio
  module Models
    # @type [Imagekitio::Internal::Type::Converter]
    SavedExtensionListResponse = Imagekitio::Internal::Type::ArrayOf[-> { Imagekitio::SavedExtension }]
  end
end
