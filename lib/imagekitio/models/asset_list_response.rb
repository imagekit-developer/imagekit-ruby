# frozen_string_literal: true

module Imagekitio
  module Models
    # Object containing details of a file or file version.
    module AssetListResponseItem
      extend Imagekitio::Internal::Type::Union

      discriminator :type

      variant :folder, -> { Imagekitio::Folder }

      # Object containing details of a file or file version.
      variant -> { Imagekitio::File }

      # @!method self.variants
      #   @return [Array(Imagekitio::Models::Folder, Imagekitio::Models::File)]
    end

    # @type [Imagekitio::Internal::Type::Converter]
    AssetListResponse =
      Imagekitio::Internal::Type::ArrayOf[union: -> { Imagekitio::Models::AssetListResponseItem }]
  end
end
