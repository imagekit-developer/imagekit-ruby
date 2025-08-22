# frozen_string_literal: true

module Imagekit
  module Models
    module Accounts
      # @see Imagekit::Resources::Accounts::Origins#create
      class OriginCreateParams < Imagekit::Internal::Type::BaseModel
        extend Imagekit::Internal::Type::RequestParameters::Converter
        include Imagekit::Internal::Type::RequestParameters

        # @!attribute body
        #
        #   @return [Imagekit::Models::Accounts::OriginCreateParams::Body]
        required :body, -> { Imagekit::Accounts::OriginCreateParams::Body }

        # @!method initialize(body:, request_options: {})
        #   @param body [Imagekit::Models::Accounts::OriginCreateParams::Body]
        #   @param request_options [Imagekit::RequestOptions, Hash{Symbol=>Object}]

        class Body < Imagekit::Internal::Type::BaseModel
        end
      end
    end
  end
end
