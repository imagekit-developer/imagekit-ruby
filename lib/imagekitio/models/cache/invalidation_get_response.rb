# frozen_string_literal: true

module Imagekitio
  module Models
    module Cache
      # @see Imagekitio::Resources::Cache::Invalidation#get
      class InvalidationGetResponse < Imagekitio::Internal::Type::BaseModel
        # @!attribute status
        #   Status of the purge request.
        #
        #   @return [Symbol, Imagekitio::Models::Cache::InvalidationGetResponse::Status, nil]
        optional :status, enum: -> { Imagekitio::Models::Cache::InvalidationGetResponse::Status }

        # @!method initialize(status: nil)
        #   Some parameter documentations has been truncated, see
        #   {Imagekitio::Models::Cache::InvalidationGetResponse} for more details.
        #
        #   @param status [Symbol, Imagekitio::Models::Cache::InvalidationGetResponse::Status] Status of the purge request.

        # Status of the purge request.
        #
        # @see Imagekitio::Models::Cache::InvalidationGetResponse#status
        module Status
          extend Imagekitio::Internal::Type::Enum

          PENDING = :Pending
          COMPLETED = :Completed

          # @!method self.values
          #   @return [Array<Symbol>]
        end
      end
    end
  end
end
