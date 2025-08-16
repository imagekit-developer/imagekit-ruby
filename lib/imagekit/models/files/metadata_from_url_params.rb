# frozen_string_literal: true

module Imagekit
  module Models
    module Files
      # @see Imagekit::Resources::Files::Metadata#from_url
      class MetadataFromURLParams < Imagekit::Internal::Type::BaseModel
        extend Imagekit::Internal::Type::RequestParameters::Converter
        include Imagekit::Internal::Type::RequestParameters

        # @!attribute url
        #   Should be a valid file URL. It should be accessible using your ImageKit.io
        #   account.
        #
        #   @return [String]
        required :url, String

        # @!method initialize(url:, request_options: {})
        #   Some parameter documentations has been truncated, see
        #   {Imagekit::Models::Files::MetadataFromURLParams} for more details.
        #
        #   @param url [String] Should be a valid file URL. It should be accessible using your ImageKit.io accou
        #
        #   @param request_options [Imagekit::RequestOptions, Hash{Symbol=>Object}]
      end
    end
  end
end
