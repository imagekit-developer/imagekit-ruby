# frozen_string_literal: true

module Imagekit
  module Models
    module Files
      # @type [Imagekit::Internal::Type::Converter]
      VersionListResponse = Imagekit::Internal::Type::ArrayOf[-> { Imagekit::File }]
    end
  end
end
