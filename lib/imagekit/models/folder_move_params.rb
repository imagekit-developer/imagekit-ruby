# frozen_string_literal: true

module Imagekit
  module Models
    # @see Imagekit::Resources::Folders#move
    class FolderMoveParams < Imagekit::Internal::Type::BaseModel
      extend Imagekit::Internal::Type::RequestParameters::Converter
      include Imagekit::Internal::Type::RequestParameters

      # @!attribute destination_path
      #   Full path to the destination folder where you want to move the source folder
      #   into.
      #
      #   @return [String]
      required :destination_path, String, api_name: :destinationPath

      # @!attribute source_folder_path
      #   The full path to the source folder you want to move.
      #
      #   @return [String]
      required :source_folder_path, String, api_name: :sourceFolderPath

      # @!method initialize(destination_path:, source_folder_path:, request_options: {})
      #   Some parameter documentations has been truncated, see
      #   {Imagekit::Models::FolderMoveParams} for more details.
      #
      #   @param destination_path [String] Full path to the destination folder where you want to move the source folder int
      #
      #   @param source_folder_path [String] The full path to the source folder you want to move.
      #
      #   @param request_options [Imagekit::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
