# frozen_string_literal: true

module Imagekitio
  module Models
    module Files
      # @see Imagekitio::Resources::Files::Bulk#remove_ai_tags
      class BulkRemoveAITagsParams < Imagekitio::Internal::Type::BaseModel
        extend Imagekitio::Internal::Type::RequestParameters::Converter
        include Imagekitio::Internal::Type::RequestParameters

        # @!attribute ai_tags
        #   An array of AITags that you want to remove from the files.
        #
        #   @return [Array<String>]
        required :ai_tags, Imagekitio::Internal::Type::ArrayOf[String], api_name: :AITags

        # @!attribute file_ids
        #   An array of fileIds from which you want to remove AITags.
        #
        #   @return [Array<String>]
        required :file_ids, Imagekitio::Internal::Type::ArrayOf[String], api_name: :fileIds

        # @!method initialize(ai_tags:, file_ids:, request_options: {})
        #   Some parameter documentations has been truncated, see
        #   {Imagekitio::Models::Files::BulkRemoveAITagsParams} for more details.
        #
        #   @param ai_tags [Array<String>] An array of AITags that you want to remove from the files.
        #
        #   @param file_ids [Array<String>] An array of fileIds from which you want to remove AITags.
        #
        #   @param request_options [Imagekitio::RequestOptions, Hash{Symbol=>Object}]
      end
    end
  end
end
