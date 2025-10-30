# frozen_string_literal: true

module Imagekitio
  module Models
    module Files
      # @see Imagekitio::Resources::Files::Bulk#delete
      class BulkDeleteResponse < Imagekitio::Internal::Type::BaseModel
        # @!attribute successfully_deleted_file_ids
        #   An array of fileIds that were successfully deleted.
        #
        #   @return [Array<String>, nil]
        optional :successfully_deleted_file_ids,
                 Imagekitio::Internal::Type::ArrayOf[String],
                 api_name: :successfullyDeletedFileIds

        # @!method initialize(successfully_deleted_file_ids: nil)
        #   Some parameter documentations has been truncated, see
        #   {Imagekitio::Models::Files::BulkDeleteResponse} for more details.
        #
        #   @param successfully_deleted_file_ids [Array<String>] An array of fileIds that were successfully deleted.
      end
    end
  end
end
