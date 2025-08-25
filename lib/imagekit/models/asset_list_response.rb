# frozen_string_literal: true

module Imagekit
  module Models
    # Object containing details of a file or file version.
    module AssetListResponseItem
      extend Imagekit::Internal::Type::Union

      discriminator :type

      variant :folder, -> { Imagekit::Folder }

      # Object containing details of a file or file version.
      variant -> { Imagekit::File }

      # @!method self.variants
      #   @return [Array(Imagekit::Models::Folder, Imagekit::Models::File)]
    end

    # @type [Imagekit::Internal::Type::Converter]
    AssetListResponse =
      Imagekit::Internal::Type::ArrayOf[union: -> { Imagekit::Models::AssetListResponseItem }]
  end
end
