# frozen_string_literal: true

module Imagekitio
  module Models
    module Files
      # @see Imagekitio::Resources::Files::Bulk#remove_ai_tags
      class BulkRemoveAITagsResponse < Imagekitio::Internal::Type::BaseModel
        # @!attribute successfully_updated_file_ids
        #   An array of fileIds that in which AITags were successfully removed.
        #
        #   @return [Array<String>, nil]
        optional :successfully_updated_file_ids,
                 Imagekitio::Internal::Type::ArrayOf[String],
                 api_name: :successfullyUpdatedFileIds

        # @!method initialize(successfully_updated_file_ids: nil)
        #   Some parameter documentations has been truncated, see
        #   {Imagekitio::Models::Files::BulkRemoveAITagsResponse} for more details.
        #
        #   @param successfully_updated_file_ids [Array<String>] An array of fileIds that in which AITags were successfully removed.
      end
    end
  end
end
