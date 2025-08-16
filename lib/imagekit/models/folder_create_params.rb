# frozen_string_literal: true

module Imagekit
  module Models
    # @see Imagekit::Resources::Folder#create
    class FolderCreateParams < Imagekit::Internal::Type::BaseModel
      extend Imagekit::Internal::Type::RequestParameters::Converter
      include Imagekit::Internal::Type::RequestParameters

      # @!attribute folder_name
      #   The folder will be created with this name.
      #
      #   All characters except alphabets and numbers (inclusive of unicode letters,
      #   marks, and numerals in other languages) will be replaced by an underscore i.e.
      #   `_`.
      #
      #   @return [String]
      required :folder_name, String, api_name: :folderName

      # @!attribute parent_folder_path
      #   The folder where the new folder should be created, for root use `/` else the
      #   path e.g. `containing/folder/`.
      #
      #   Note: If any folder(s) is not present in the parentFolderPath parameter, it will
      #   be automatically created. For example, if you pass `/product/images/summer`,
      #   then `product`, `images`, and `summer` folders will be created if they don't
      #   already exist.
      #
      #   @return [String]
      required :parent_folder_path, String, api_name: :parentFolderPath

      # @!method initialize(folder_name:, parent_folder_path:, request_options: {})
      #   Some parameter documentations has been truncated, see
      #   {Imagekit::Models::FolderCreateParams} for more details.
      #
      #   @param folder_name [String] The folder will be created with this name.
      #
      #   @param parent_folder_path [String] The folder where the new folder should be created, for root use `/` else the pat
      #
      #   @param request_options [Imagekit::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
