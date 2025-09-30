# frozen_string_literal: true

module Imagekit
  module Models
    # @see Imagekit::Resources::CustomMetadataFields#list
    class CustomMetadataFieldListParams < Imagekit::Internal::Type::BaseModel
      extend Imagekit::Internal::Type::RequestParameters::Converter
      include Imagekit::Internal::Type::RequestParameters

      # @!attribute folder_path
      #   The folder path (e.g., `/path/to/folder`) for which to retrieve applicable
      #   custom metadata fields. Useful for determining path-specific field selections
      #   when the [Path policy](https://imagekit.io/docs/dam/path-policy) feature is in
      #   use.
      #
      #   @return [String, nil]
      optional :folder_path, String

      # @!attribute include_deleted
      #   Set it to `true` to include deleted field objects in the API response.
      #
      #   @return [Boolean, nil]
      optional :include_deleted, Imagekit::Internal::Type::Boolean

      # @!method initialize(folder_path: nil, include_deleted: nil, request_options: {})
      #   Some parameter documentations has been truncated, see
      #   {Imagekit::Models::CustomMetadataFieldListParams} for more details.
      #
      #   @param folder_path [String] The folder path (e.g., `/path/to/folder`) for which to retrieve applicable custo
      #
      #   @param include_deleted [Boolean] Set it to `true` to include deleted field objects in the API response.
      #
      #   @param request_options [Imagekit::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
