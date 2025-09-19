# frozen_string_literal: true

module Imagekit
  module Models
    # @see Imagekit::Resources::Files#update
    class FileUpdateParams < Imagekit::Internal::Type::BaseModel
      extend Imagekit::Internal::Type::RequestParameters::Converter
      include Imagekit::Internal::Type::RequestParameters

      # @!attribute update_file_request
      #   Schema for update file update request.
      #
      #   @return [Imagekit::Models::UpdateFileRequest::UpdateFileDetails, Imagekit::Models::UpdateFileRequest::ChangePublicationStatus]
      required :update_file_request, union: -> { Imagekit::UpdateFileRequest }

      # @!method initialize(update_file_request:, request_options: {})
      #   @param update_file_request [Imagekit::Models::UpdateFileRequest::UpdateFileDetails, Imagekit::Models::UpdateFileRequest::ChangePublicationStatus] Schema for update file update request.
      #
      #   @param request_options [Imagekit::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
