# frozen_string_literal: true

module Imagekitio
  module Models
    module Folders
      # @see Imagekitio::Resources::Folders::Job#get
      class JobGetParams < Imagekitio::Internal::Type::BaseModel
        extend Imagekitio::Internal::Type::RequestParameters::Converter
        include Imagekitio::Internal::Type::RequestParameters

        # @!attribute job_id
        #
        #   @return [String]
        required :job_id, String

        # @!method initialize(job_id:, request_options: {})
        #   @param job_id [String]
        #   @param request_options [Imagekitio::RequestOptions, Hash{Symbol=>Object}]
      end
    end
  end
end
