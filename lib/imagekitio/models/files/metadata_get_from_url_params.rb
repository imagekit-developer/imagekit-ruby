# frozen_string_literal: true

module Imagekitio
  module Models
    module Files
      # @see Imagekitio::Resources::Files::Metadata#get_from_url
      class MetadataGetFromURLParams < Imagekitio::Internal::Type::BaseModel
        extend Imagekitio::Internal::Type::RequestParameters::Converter
        include Imagekitio::Internal::Type::RequestParameters

        # @!attribute url
        #   Should be a valid file URL. It should be accessible using your ImageKit.io
        #   account.
        #
        #   @return [String]
        required :url, String

        # @!method initialize(url:, request_options: {})
        #   Some parameter documentations has been truncated, see
        #   {Imagekitio::Models::Files::MetadataGetFromURLParams} for more details.
        #
        #   @param url [String] Should be a valid file URL. It should be accessible using your ImageKit.io accou
        #
        #   @param request_options [Imagekitio::RequestOptions, Hash{Symbol=>Object}]
      end
    end
  end
end
