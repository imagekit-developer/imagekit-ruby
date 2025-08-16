# frozen_string_literal: true

module Imagekit
  module Models
    class Interoperability < Imagekit::Internal::Type::BaseModel
      # @!attribute interop_index
      #
      #   @return [String, nil]
      optional :interop_index, String, api_name: :InteropIndex

      # @!attribute interop_version
      #
      #   @return [String, nil]
      optional :interop_version, String, api_name: :InteropVersion

      # @!method initialize(interop_index: nil, interop_version: nil)
      #   JSON object.
      #
      #   @param interop_index [String]
      #   @param interop_version [String]
    end
  end
end
