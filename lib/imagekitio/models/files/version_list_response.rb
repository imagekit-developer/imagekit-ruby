# frozen_string_literal: true

module Imagekitio
  module Models
    module Files
      # @type [Imagekitio::Internal::Type::Converter]
      VersionListResponse = Imagekitio::Internal::Type::ArrayOf[-> { Imagekitio::File }]
    end
  end
end
