# frozen_string_literal: true

module Imagekit
  module Models
    module Accounts
      # @type [Imagekit::Internal::Type::Converter]
      URLEndpointListResponse =
        Imagekit::Internal::Type::ArrayOf[-> { Imagekit::Accounts::URLEndpointResponse }]
    end
  end
end
