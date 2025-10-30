# frozen_string_literal: true

module Imagekitio
  module Models
    module Files
      # @see Imagekitio::Resources::Files::Bulk#add_tags
      class BulkAddTagsParams < Imagekitio::Internal::Type::BaseModel
        extend Imagekitio::Internal::Type::RequestParameters::Converter
        include Imagekitio::Internal::Type::RequestParameters

        # @!attribute file_ids
        #   An array of fileIds to which you want to add tags.
        #
        #   @return [Array<String>]
        required :file_ids, Imagekitio::Internal::Type::ArrayOf[String], api_name: :fileIds

        # @!attribute tags
        #   An array of tags that you want to add to the files.
        #
        #   @return [Array<String>]
        required :tags, Imagekitio::Internal::Type::ArrayOf[String]

        # @!method initialize(file_ids:, tags:, request_options: {})
        #   Some parameter documentations has been truncated, see
        #   {Imagekitio::Models::Files::BulkAddTagsParams} for more details.
        #
        #   @param file_ids [Array<String>] An array of fileIds to which you want to add tags.
        #
        #   @param tags [Array<String>] An array of tags that you want to add to the files.
        #
        #   @param request_options [Imagekitio::RequestOptions, Hash{Symbol=>Object}]
      end
    end
  end
end
