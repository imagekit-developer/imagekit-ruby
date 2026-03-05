# frozen_string_literal: true

module Imagekitio
  module Models
    module Cache
      # @see Imagekitio::Resources::Cache::Invalidation#get
      class InvalidationGetParams < Imagekitio::Internal::Type::BaseModel
        extend Imagekitio::Internal::Type::RequestParameters::Converter
        include Imagekitio::Internal::Type::RequestParameters

        # @!attribute request_id
        #
        #   @return [String]
        required :request_id, String

        # @!method initialize(request_id:, request_options: {})
        #   @param request_id [String]
        #   @param request_options [Imagekitio::RequestOptions, Hash{Symbol=>Object}]
      end
    end
  end
end
