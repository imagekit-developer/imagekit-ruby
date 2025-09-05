# frozen_string_literal: true

module Imagekit
  module Models
    # @see Imagekit::Resources::Files#update
    class FileUpdateParams < Imagekit::Internal::Type::BaseModel
      extend Imagekit::Internal::Type::RequestParameters::Converter
      include Imagekit::Internal::Type::RequestParameters

      # @!attribute update_file_details_request
      #
      #   @return [Imagekit::Models::UpdateFileDetailsRequest::UpdateFileDetails, Imagekit::Models::UpdateFileDetailsRequest::ChangePublicationStatus]
      required :update_file_details_request, union: -> { Imagekit::UpdateFileDetailsRequest }

      # @!method initialize(update_file_details_request:, request_options: {})
      #   @param update_file_details_request [Imagekit::Models::UpdateFileDetailsRequest::UpdateFileDetails, Imagekit::Models::UpdateFileDetailsRequest::ChangePublicationStatus]
      #   @param request_options [Imagekit::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
