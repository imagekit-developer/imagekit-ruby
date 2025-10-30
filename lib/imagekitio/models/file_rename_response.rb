# frozen_string_literal: true

module Imagekitio
  module Models
    # @see Imagekitio::Resources::Files#rename
    class FileRenameResponse < Imagekitio::Internal::Type::BaseModel
      # @!attribute purge_request_id
      #   Unique identifier of the purge request. This can be used to check the status of
      #   the purge request.
      #
      #   @return [String, nil]
      optional :purge_request_id, String, api_name: :purgeRequestId

      # @!method initialize(purge_request_id: nil)
      #   Some parameter documentations has been truncated, see
      #   {Imagekitio::Models::FileRenameResponse} for more details.
      #
      #   @param purge_request_id [String] Unique identifier of the purge request. This can be used to check the status of
    end
  end
end
