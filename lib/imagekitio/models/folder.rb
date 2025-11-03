# frozen_string_literal: true

module Imagekitio
  module Models
    class Folder < Imagekitio::Internal::Type::BaseModel
      # @!attribute created_at
      #   Date and time when the folder was created. The date and time is in ISO8601
      #   format.
      #
      #   @return [Time, nil]
      optional :created_at, Time, api_name: :createdAt

      # @!attribute folder_id
      #   Unique identifier of the asset.
      #
      #   @return [String, nil]
      optional :folder_id, String, api_name: :folderId

      # @!attribute folder_path
      #   Path of the folder. This is the path you would use in the URL to access the
      #   folder. For example, if the folder is at the root of the media library, the path
      #   will be /folder. If the folder is inside another folder named images, the path
      #   will be /images/folder.
      #
      #   @return [String, nil]
      optional :folder_path, String, api_name: :folderPath

      # @!attribute name
      #   Name of the asset.
      #
      #   @return [String, nil]
      optional :name, String

      # @!attribute type
      #   Type of the asset.
      #
      #   @return [Symbol, Imagekitio::Models::Folder::Type, nil]
      optional :type, enum: -> { Imagekitio::Folder::Type }

      # @!attribute updated_at
      #   Date and time when the folder was last updated. The date and time is in ISO8601
      #   format.
      #
      #   @return [Time, nil]
      optional :updated_at, Time, api_name: :updatedAt

      # @!method initialize(created_at: nil, folder_id: nil, folder_path: nil, name: nil, type: nil, updated_at: nil)
      #   Some parameter documentations has been truncated, see
      #   {Imagekitio::Models::Folder} for more details.
      #
      #   @param created_at [Time] Date and time when the folder was created. The date and time is in ISO8601 forma
      #
      #   @param folder_id [String] Unique identifier of the asset.
      #
      #   @param folder_path [String] Path of the folder. This is the path you would use in the URL to access the fold
      #
      #   @param name [String] Name of the asset.
      #
      #   @param type [Symbol, Imagekitio::Models::Folder::Type] Type of the asset.
      #
      #   @param updated_at [Time] Date and time when the folder was last updated. The date and time is in ISO8601

      # Type of the asset.
      #
      # @see Imagekitio::Models::Folder#type
      module Type
        extend Imagekitio::Internal::Type::Enum

        FOLDER = :folder

        # @!method self.values
        #   @return [Array<Symbol>]
      end
    end
  end
end
