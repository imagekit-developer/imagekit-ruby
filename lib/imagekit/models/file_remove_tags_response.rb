# frozen_string_literal: true

module Imagekit
  module Models
    # @see Imagekit::Resources::Files#remove_tags
    class FileRemoveTagsResponse < Imagekit::Internal::Type::BaseModel
      # @!attribute successfully_updated_file_ids
      #   An array of fileIds that in which tags were successfully removed.
      #
      #   @return [Array<String>, nil]
      optional :successfully_updated_file_ids,
               Imagekit::Internal::Type::ArrayOf[String],
               api_name: :successfullyUpdatedFileIds

      # @!method initialize(successfully_updated_file_ids: nil)
      #   Some parameter documentations has been truncated, see
      #   {Imagekit::Models::FileRemoveTagsResponse} for more details.
      #
      #   @param successfully_updated_file_ids [Array<String>] An array of fileIds that in which tags were successfully removed.
    end
  end
end
