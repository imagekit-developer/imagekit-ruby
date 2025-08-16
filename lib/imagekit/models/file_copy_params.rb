# frozen_string_literal: true

module Imagekit
  module Models
    # @see Imagekit::Resources::Files#copy
    class FileCopyParams < Imagekit::Internal::Type::BaseModel
      extend Imagekit::Internal::Type::RequestParameters::Converter
      include Imagekit::Internal::Type::RequestParameters

      # @!attribute destination_path
      #   Full path to the folder you want to copy the above file into.
      #
      #   @return [String]
      required :destination_path, String, api_name: :destinationPath

      # @!attribute source_file_path
      #   The full path of the file you want to copy.
      #
      #   @return [String]
      required :source_file_path, String, api_name: :sourceFilePath

      # @!attribute include_file_versions
      #   Option to copy all versions of a file. By default, only the current version of
      #   the file is copied. When set to true, all versions of the file will be copied.
      #   Default value - `false`.
      #
      #   @return [Boolean, nil]
      optional :include_file_versions, Imagekit::Internal::Type::Boolean, api_name: :includeFileVersions

      # @!method initialize(destination_path:, source_file_path:, include_file_versions: nil, request_options: {})
      #   Some parameter documentations has been truncated, see
      #   {Imagekit::Models::FileCopyParams} for more details.
      #
      #   @param destination_path [String] Full path to the folder you want to copy the above file into.
      #
      #   @param source_file_path [String] The full path of the file you want to copy.
      #
      #   @param include_file_versions [Boolean] Option to copy all versions of a file. By default, only the current version of t
      #
      #   @param request_options [Imagekit::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
