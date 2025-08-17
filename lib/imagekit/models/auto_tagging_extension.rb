# frozen_string_literal: true

module Imagekit
  module Models
    class AutoTaggingExtension < Imagekit::Internal::Type::BaseModel
      # @!attribute max_tags
      #   Maximum number of tags to attach to the asset.
      #
      #   @return [Integer]
      required :max_tags, Integer, api_name: :maxTags

      # @!attribute min_confidence
      #   Minimum confidence level for tags to be considered valid.
      #
      #   @return [Integer]
      required :min_confidence, Integer, api_name: :minConfidence

      # @!attribute name
      #   Specifies the auto-tagging extension used.
      #
      #   @return [Symbol, Imagekit::Models::AutoTaggingExtension::Name]
      required :name, enum: -> { Imagekit::AutoTaggingExtension::Name }

      # @!method initialize(max_tags:, min_confidence:, name:)
      #   @param max_tags [Integer] Maximum number of tags to attach to the asset.
      #
      #   @param min_confidence [Integer] Minimum confidence level for tags to be considered valid.
      #
      #   @param name [Symbol, Imagekit::Models::AutoTaggingExtension::Name] Specifies the auto-tagging extension used.

      # Specifies the auto-tagging extension used.
      #
      # @see Imagekit::Models::AutoTaggingExtension#name
      module Name
        extend Imagekit::Internal::Type::Enum

        GOOGLE_AUTO_TAGGING = :"google-auto-tagging"
        AWS_AUTO_TAGGING = :"aws-auto-tagging"

        # @!method self.values
        #   @return [Array<Symbol>]
      end
    end
  end
end
