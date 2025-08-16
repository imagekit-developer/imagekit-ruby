# frozen_string_literal: true

module Imagekit
  module Models
    module Files
      # @see Imagekit::Resources::Files::Batch#delete
      class BatchDeleteResponse < Imagekit::Internal::Type::BaseModel
        # @!attribute successfully_deleted_file_ids
        #   An array of fileIds that were successfully deleted.
        #
        #   @return [Array<String>, nil]
        optional :successfully_deleted_file_ids,
                 Imagekit::Internal::Type::ArrayOf[String],
                 api_name: :successfullyDeletedFileIds

        # @!method initialize(successfully_deleted_file_ids: nil)
        #   Some parameter documentations has been truncated, see
        #   {Imagekit::Models::Files::BatchDeleteResponse} for more details.
        #
        #   @param successfully_deleted_file_ids [Array<String>] An array of fileIds that were successfully deleted.
      end
    end
  end
end
