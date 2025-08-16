# frozen_string_literal: true

module Imagekit
  module Models
    # @see Imagekit::Resources::Folder#delete
    class FolderDeleteParams < Imagekit::Internal::Type::BaseModel
      extend Imagekit::Internal::Type::RequestParameters::Converter
      include Imagekit::Internal::Type::RequestParameters

      # @!attribute folder_path
      #   Full path to the folder you want to delete. For example `/folder/to/delete/`.
      #
      #   @return [String]
      required :folder_path, String, api_name: :folderPath

      # @!method initialize(folder_path:, request_options: {})
      #   Some parameter documentations has been truncated, see
      #   {Imagekit::Models::FolderDeleteParams} for more details.
      #
      #   @param folder_path [String] Full path to the folder you want to delete. For example `/folder/to/delete/`.
      #
      #   @param request_options [Imagekit::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
