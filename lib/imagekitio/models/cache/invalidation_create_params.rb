# frozen_string_literal: true

module Imagekitio
  module Models
    module Cache
      # @see Imagekitio::Resources::Cache::Invalidation#create
      class InvalidationCreateParams < Imagekitio::Internal::Type::BaseModel
        extend Imagekitio::Internal::Type::RequestParameters::Converter
        include Imagekitio::Internal::Type::RequestParameters

        # @!attribute url
        #   The full URL of the file to be purged.
        #
        #   @return [String]
        required :url, String

        # @!method initialize(url:, request_options: {})
        #   Some parameter documentations has been truncated, see
        #   {Imagekitio::Models::Cache::InvalidationCreateParams} for more details.
        #
        #   @param url [String] The full URL of the file to be purged.
        #
        #   @param request_options [Imagekitio::RequestOptions, Hash{Symbol=>Object}]
      end
    end
  end
end
