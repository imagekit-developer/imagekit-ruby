# frozen_string_literal: true

module Imagekit
  module Models
    module Cache
      # @see Imagekit::Resources::Cache::Invalidation#get
      class InvalidationGetResponse < Imagekit::Internal::Type::BaseModel
        # @!attribute status
        #   Status of the purge request.
        #
        #   @return [Symbol, Imagekit::Models::Cache::InvalidationGetResponse::Status, nil]
        optional :status, enum: -> { Imagekit::Models::Cache::InvalidationGetResponse::Status }

        # @!method initialize(status: nil)
        #   Some parameter documentations has been truncated, see
        #   {Imagekit::Models::Cache::InvalidationGetResponse} for more details.
        #
        #   @param status [Symbol, Imagekit::Models::Cache::InvalidationGetResponse::Status] Status of the purge request.

        # Status of the purge request.
        #
        # @see Imagekit::Models::Cache::InvalidationGetResponse#status
        module Status
          extend Imagekit::Internal::Type::Enum

          PENDING = :Pending
          COMPLETED = :Completed

          # @!method self.values
          #   @return [Array<Symbol>]
        end
      end
    end
  end
end
