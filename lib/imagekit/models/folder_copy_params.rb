# frozen_string_literal: true

module Imagekit
  module Models
    # @see Imagekit::Resources::Folders#copy
    class FolderCopyParams < Imagekit::Internal::Type::BaseModel
      extend Imagekit::Internal::Type::RequestParameters::Converter
      include Imagekit::Internal::Type::RequestParameters

      # @!attribute destination_path
      #   Full path to the destination folder where you want to copy the source folder
      #   into.
      #
      #   @return [String]
      required :destination_path, String, api_name: :destinationPath

      # @!attribute source_folder_path
      #   The full path to the source folder you want to copy.
      #
      #   @return [String]
      required :source_folder_path, String, api_name: :sourceFolderPath

      # @!attribute include_versions
      #   Option to copy all versions of files that are nested inside the selected folder.
      #   By default, only the current version of each file will be copied. When set to
      #   true, all versions of each file will be copied. Default value - `false`.
      #
      #   @return [Boolean, nil]
      optional :include_versions, Imagekit::Internal::Type::Boolean, api_name: :includeVersions

      # @!method initialize(destination_path:, source_folder_path:, include_versions: nil, request_options: {})
      #   Some parameter documentations has been truncated, see
      #   {Imagekit::Models::FolderCopyParams} for more details.
      #
      #   @param destination_path [String] Full path to the destination folder where you want to copy the source folder int
      #
      #   @param source_folder_path [String] The full path to the source folder you want to copy.
      #
      #   @param include_versions [Boolean] Option to copy all versions of files that are nested inside the selected folder.
      #
      #   @param request_options [Imagekit::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
