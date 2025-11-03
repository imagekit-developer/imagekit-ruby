# frozen_string_literal: true

module Imagekitio
  module Models
    module Files
      # @see Imagekitio::Resources::Files::Bulk#delete
      class BulkDeleteParams < Imagekitio::Internal::Type::BaseModel
        extend Imagekitio::Internal::Type::RequestParameters::Converter
        include Imagekitio::Internal::Type::RequestParameters

        # @!attribute file_ids
        #   An array of fileIds which you want to delete.
        #
        #   @return [Array<String>]
        required :file_ids, Imagekitio::Internal::Type::ArrayOf[String], api_name: :fileIds

        # @!method initialize(file_ids:, request_options: {})
        #   Some parameter documentations has been truncated, see
        #   {Imagekitio::Models::Files::BulkDeleteParams} for more details.
        #
        #   @param file_ids [Array<String>] An array of fileIds which you want to delete.
        #
        #   @param request_options [Imagekitio::RequestOptions, Hash{Symbol=>Object}]
      end
    end
  end
end
