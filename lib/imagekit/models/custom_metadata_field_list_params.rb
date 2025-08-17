# frozen_string_literal: true

module Imagekit
  module Models
    # @see Imagekit::Resources::CustomMetadataFields#list
    class CustomMetadataFieldListParams < Imagekit::Internal::Type::BaseModel
      extend Imagekit::Internal::Type::RequestParameters::Converter
      include Imagekit::Internal::Type::RequestParameters

      # @!attribute include_deleted
      #   Set it to `true` to include deleted field objects in the API response.
      #
      #   @return [Boolean, nil]
      optional :include_deleted, Imagekit::Internal::Type::Boolean

      # @!method initialize(include_deleted: nil, request_options: {})
      #   Some parameter documentations has been truncated, see
      #   {Imagekit::Models::CustomMetadataFieldListParams} for more details.
      #
      #   @param include_deleted [Boolean] Set it to `true` to include deleted field objects in the API response.
      #
      #   @param request_options [Imagekit::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
