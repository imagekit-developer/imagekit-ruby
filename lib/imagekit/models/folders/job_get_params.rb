# frozen_string_literal: true

module Imagekit
  module Models
    module Folders
      # @see Imagekit::Resources::Folders::Job#get
      class JobGetParams < Imagekit::Internal::Type::BaseModel
        extend Imagekit::Internal::Type::RequestParameters::Converter
        include Imagekit::Internal::Type::RequestParameters

        # @!method initialize(request_options: {})
        #   @param request_options [Imagekit::RequestOptions, Hash{Symbol=>Object}]
      end
    end
  end
end
