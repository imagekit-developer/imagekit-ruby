# frozen_string_literal: true

module Imagekitio
  module Models
    class VersionInfo < Imagekitio::Internal::Type::BaseModel
      # @!attribute id
      #   Unique identifier of the file version.
      #
      #   @return [String, nil]
      optional :id, String

      # @!attribute name
      #   Name of the file version.
      #
      #   @return [String, nil]
      optional :name, String

      # @!method initialize(id: nil, name: nil)
      #   An object containing the file or file version's `id` (versionId) and `name`.
      #
      #   @param id [String] Unique identifier of the file version.
      #
      #   @param name [String] Name of the file version.
    end
  end
end
