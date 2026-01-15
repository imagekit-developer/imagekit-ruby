# frozen_string_literal: true

module Imagekitio
  module Models
    # @see Imagekitio::Resources::SavedExtensions#list
    class SavedExtensionListParams < Imagekitio::Internal::Type::BaseModel
      extend Imagekitio::Internal::Type::RequestParameters::Converter
      include Imagekitio::Internal::Type::RequestParameters

      # @!method initialize(request_options: {})
      #   @param request_options [Imagekitio::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
