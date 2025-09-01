# frozen_string_literal: true

module Imagekit
  module Models
    module Files
      # @see Imagekit::Resources::Files::Bulk#delete
      class BulkDeleteParams < Imagekit::Internal::Type::BaseModel
        extend Imagekit::Internal::Type::RequestParameters::Converter
        include Imagekit::Internal::Type::RequestParameters

        # @!attribute file_ids
        #   An array of fileIds which you want to delete.
        #
        #   @return [Array<String>]
        required :file_ids, Imagekit::Internal::Type::ArrayOf[String], api_name: :fileIds

        # @!method initialize(file_ids:, request_options: {})
        #   Some parameter documentations has been truncated, see
        #   {Imagekit::Models::Files::BulkDeleteParams} for more details.
        #
        #   @param file_ids [Array<String>] An array of fileIds which you want to delete.
        #
        #   @param request_options [Imagekit::RequestOptions, Hash{Symbol=>Object}]
      end
    end
  end
end
