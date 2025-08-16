# frozen_string_literal: true

module Imagekit
  module Models
    # @see Imagekit::Resources::Files#move
    class FileMoveParams < Imagekit::Internal::Type::BaseModel
      extend Imagekit::Internal::Type::RequestParameters::Converter
      include Imagekit::Internal::Type::RequestParameters

      # @!attribute destination_path
      #   Full path to the folder you want to move the above file into.
      #
      #   @return [String]
      required :destination_path, String, api_name: :destinationPath

      # @!attribute source_file_path
      #   The full path of the file you want to move.
      #
      #   @return [String]
      required :source_file_path, String, api_name: :sourceFilePath

      # @!method initialize(destination_path:, source_file_path:, request_options: {})
      #   Some parameter documentations has been truncated, see
      #   {Imagekit::Models::FileMoveParams} for more details.
      #
      #   @param destination_path [String] Full path to the folder you want to move the above file into.
      #
      #   @param source_file_path [String] The full path of the file you want to move.
      #
      #   @param request_options [Imagekit::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
