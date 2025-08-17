# frozen_string_literal: true

module Imagekit
  module Models
    module Files
      # @see Imagekit::Resources::Files::Bulk#remove_ai_tags
      class BulkRemoveAITagsParams < Imagekit::Internal::Type::BaseModel
        extend Imagekit::Internal::Type::RequestParameters::Converter
        include Imagekit::Internal::Type::RequestParameters

        # @!attribute ai_tags
        #   An array of AITags that you want to remove from the files.
        #
        #   @return [Array<String>]
        required :ai_tags, Imagekit::Internal::Type::ArrayOf[String], api_name: :AITags

        # @!attribute file_ids
        #   An array of fileIds from which you want to remove AITags.
        #
        #   @return [Array<String>]
        required :file_ids, Imagekit::Internal::Type::ArrayOf[String], api_name: :fileIds

        # @!method initialize(ai_tags:, file_ids:, request_options: {})
        #   Some parameter documentations has been truncated, see
        #   {Imagekit::Models::Files::BulkRemoveAITagsParams} for more details.
        #
        #   @param ai_tags [Array<String>] An array of AITags that you want to remove from the files.
        #
        #   @param file_ids [Array<String>] An array of fileIds from which you want to remove AITags.
        #
        #   @param request_options [Imagekit::RequestOptions, Hash{Symbol=>Object}]
      end
    end
  end
end
