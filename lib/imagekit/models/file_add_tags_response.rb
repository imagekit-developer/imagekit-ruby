# frozen_string_literal: true

module Imagekit
  module Models
    # @see Imagekit::Resources::Files#add_tags
    class FileAddTagsResponse < Imagekit::Internal::Type::BaseModel
      # @!attribute successfully_updated_file_ids
      #   An array of fileIds that in which tags were successfully added.
      #
      #   @return [Array<String>, nil]
      optional :successfully_updated_file_ids,
               Imagekit::Internal::Type::ArrayOf[String],
               api_name: :successfullyUpdatedFileIds

      # @!method initialize(successfully_updated_file_ids: nil)
      #   Some parameter documentations has been truncated, see
      #   {Imagekit::Models::FileAddTagsResponse} for more details.
      #
      #   @param successfully_updated_file_ids [Array<String>] An array of fileIds that in which tags were successfully added.
    end
  end
end
