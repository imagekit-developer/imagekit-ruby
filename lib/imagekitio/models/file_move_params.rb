# frozen_string_literal: true

module Imagekitio
  module Models
    # @see Imagekitio::Resources::Files#move
    class FileMoveParams < Imagekitio::Internal::Type::BaseModel
      extend Imagekitio::Internal::Type::RequestParameters::Converter
      include Imagekitio::Internal::Type::RequestParameters

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
      #   {Imagekitio::Models::FileMoveParams} for more details.
      #
      #   @param destination_path [String] Full path to the folder you want to move the above file into.
      #
      #   @param source_file_path [String] The full path of the file you want to move.
      #
      #   @param request_options [Imagekitio::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
