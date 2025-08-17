# frozen_string_literal: true

module Imagekit
  module Models
    module Files
      # @see Imagekit::Resources::Files::Versions#get
      class VersionGetParams < Imagekit::Internal::Type::BaseModel
        extend Imagekit::Internal::Type::RequestParameters::Converter
        include Imagekit::Internal::Type::RequestParameters

        # @!attribute file_id
        #
        #   @return [String]
        required :file_id, String

        # @!method initialize(file_id:, request_options: {})
        #   @param file_id [String]
        #   @param request_options [Imagekit::RequestOptions, Hash{Symbol=>Object}]
      end
    end
  end
end
