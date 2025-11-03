# frozen_string_literal: true

module Imagekitio
  module Models
    # @see Imagekitio::Resources::Files#update
    class FileUpdateParams < Imagekitio::Internal::Type::BaseModel
      extend Imagekitio::Internal::Type::RequestParameters::Converter
      include Imagekitio::Internal::Type::RequestParameters

      # @!attribute update_file_request
      #   Schema for update file update request.
      #
      #   @return [Imagekitio::Models::UpdateFileRequest::UpdateFileDetails, Imagekitio::Models::UpdateFileRequest::ChangePublicationStatus]
      required :update_file_request, union: -> { Imagekitio::UpdateFileRequest }

      # @!method initialize(update_file_request:, request_options: {})
      #   @param update_file_request [Imagekitio::Models::UpdateFileRequest::UpdateFileDetails, Imagekitio::Models::UpdateFileRequest::ChangePublicationStatus] Schema for update file update request.
      #
      #   @param request_options [Imagekitio::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
