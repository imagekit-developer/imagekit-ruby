# frozen_string_literal: true

module Imagekitio
  module Models
    # @type [Imagekitio::Internal::Type::Converter]
    Extensions = Imagekitio::Internal::Type::ArrayOf[union: -> { Imagekitio::ExtensionItem }]
  end
end
