# frozen_string_literal: true

module Imagekit
  module Models
    module Accounts
      # @type [Imagekit::Internal::Type::Converter]
      OriginListResponse = Imagekit::Internal::Type::ArrayOf[union: -> { Imagekit::Accounts::Origin }]
    end
  end
end
