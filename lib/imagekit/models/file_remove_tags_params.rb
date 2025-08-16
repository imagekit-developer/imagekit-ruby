# frozen_string_literal: true

module Imagekit
  module Models
    # @see Imagekit::Resources::Files#remove_tags
    class FileRemoveTagsParams < Imagekit::Internal::Type::BaseModel
      extend Imagekit::Internal::Type::RequestParameters::Converter
      include Imagekit::Internal::Type::RequestParameters

      # @!attribute file_ids
      #   An array of fileIds from which you want to remove tags.
      #
      #   @return [Array<String>]
      required :file_ids, Imagekit::Internal::Type::ArrayOf[String], api_name: :fileIds

      # @!attribute tags
      #   An array of tags that you want to remove from the files.
      #
      #   @return [Array<String>]
      required :tags, Imagekit::Internal::Type::ArrayOf[String]

      # @!method initialize(file_ids:, tags:, request_options: {})
      #   Some parameter documentations has been truncated, see
      #   {Imagekit::Models::FileRemoveTagsParams} for more details.
      #
      #   @param file_ids [Array<String>] An array of fileIds from which you want to remove tags.
      #
      #   @param tags [Array<String>] An array of tags that you want to remove from the files.
      #
      #   @param request_options [Imagekit::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
