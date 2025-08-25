# frozen_string_literal: true

module Imagekit
  module Models
    # @type [Imagekit::Internal::Type::Converter]
    CustomMetadataFieldListResponse = Imagekit::Internal::Type::ArrayOf[-> { Imagekit::CustomMetadataField }]
  end
end
