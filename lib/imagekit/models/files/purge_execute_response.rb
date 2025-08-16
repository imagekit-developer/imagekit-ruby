# frozen_string_literal: true

module Imagekit
  module Models
    module Files
      # @see Imagekit::Resources::Files::Purge#execute
      class PurgeExecuteResponse < Imagekit::Internal::Type::BaseModel
        # @!attribute request_id
        #   Unique identifier of the purge request. This can be used to check the status of
        #   the purge request.
        #
        #   @return [String, nil]
        optional :request_id, String, api_name: :requestId

        # @!method initialize(request_id: nil)
        #   Some parameter documentations has been truncated, see
        #   {Imagekit::Models::Files::PurgeExecuteResponse} for more details.
        #
        #   @param request_id [String] Unique identifier of the purge request. This can be used to check the status of
      end
    end
  end
end
