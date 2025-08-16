# frozen_string_literal: true

module Imagekit
  module Models
    module Files
      # @see Imagekit::Resources::Files::Purge#status
      class PurgeStatusResponse < Imagekit::Internal::Type::BaseModel
        # @!attribute status
        #   Status of the purge request.
        #
        #   @return [Symbol, Imagekit::Models::Files::PurgeStatusResponse::Status, nil]
        optional :status, enum: -> { Imagekit::Models::Files::PurgeStatusResponse::Status }

        # @!method initialize(status: nil)
        #   Some parameter documentations has been truncated, see
        #   {Imagekit::Models::Files::PurgeStatusResponse} for more details.
        #
        #   @param status [Symbol, Imagekit::Models::Files::PurgeStatusResponse::Status] Status of the purge request.

        # Status of the purge request.
        #
        # @see Imagekit::Models::Files::PurgeStatusResponse#status
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
