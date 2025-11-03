# frozen_string_literal: true

module Imagekitio
  module Models
    # @see Imagekitio::Resources::Folders#delete
    class FolderDeleteParams < Imagekitio::Internal::Type::BaseModel
      extend Imagekitio::Internal::Type::RequestParameters::Converter
      include Imagekitio::Internal::Type::RequestParameters

      # @!attribute folder_path
      #   Full path to the folder you want to delete. For example `/folder/to/delete/`.
      #
      #   @return [String]
      required :folder_path, String, api_name: :folderPath

      # @!method initialize(folder_path:, request_options: {})
      #   Some parameter documentations has been truncated, see
      #   {Imagekitio::Models::FolderDeleteParams} for more details.
      #
      #   @param folder_path [String] Full path to the folder you want to delete. For example `/folder/to/delete/`.
      #
      #   @param request_options [Imagekitio::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
