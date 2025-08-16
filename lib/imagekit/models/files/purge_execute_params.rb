# frozen_string_literal: true

module Imagekit
  module Models
    module Files
      # @see Imagekit::Resources::Files::Purge#execute
      class PurgeExecuteParams < Imagekit::Internal::Type::BaseModel
        extend Imagekit::Internal::Type::RequestParameters::Converter
        include Imagekit::Internal::Type::RequestParameters

        # @!attribute url
        #   The full URL of the file to be purged.
        #
        #   @return [String]
        required :url, String

        # @!method initialize(url:, request_options: {})
        #   Some parameter documentations has been truncated, see
        #   {Imagekit::Models::Files::PurgeExecuteParams} for more details.
        #
        #   @param url [String] The full URL of the file to be purged.
        #
        #   @param request_options [Imagekit::RequestOptions, Hash{Symbol=>Object}]
      end
    end
  end
end
