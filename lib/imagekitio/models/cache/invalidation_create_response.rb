# frozen_string_literal: true

module Imagekitio
  module Models
    module Cache
      # @see Imagekitio::Resources::Cache::Invalidation#create
      class InvalidationCreateResponse < Imagekitio::Internal::Type::BaseModel
        # @!attribute request_id
        #   Unique identifier of the purge request. This can be used to check the status of
        #   the purge request.
        #
        #   @return [String, nil]
        optional :request_id, String, api_name: :requestId

        # @!method initialize(request_id: nil)
        #   Some parameter documentations has been truncated, see
        #   {Imagekitio::Models::Cache::InvalidationCreateResponse} for more details.
        #
        #   @param request_id [String] Unique identifier of the purge request. This can be used to check the status of
      end
    end
  end
end
