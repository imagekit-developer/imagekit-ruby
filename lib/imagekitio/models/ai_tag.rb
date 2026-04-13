# frozen_string_literal: true

module Imagekitio
  module Models
    class AITag < Imagekitio::Internal::Type::BaseModel
      # @!attribute confidence
      #   Confidence score of the tag.
      #
      #   @return [Float, nil]
      optional :confidence, Float

      # @!attribute name
      #   Name of the tag.
      #
      #   @return [String, nil]
      optional :name, String

      # @!attribute source
      #   Source of the tag. Possible values are `google-auto-tagging` and
      #   `aws-auto-tagging`.
      #
      #   @return [String, nil]
      optional :source, String

      # @!method initialize(confidence: nil, name: nil, source: nil)
      #   Some parameter documentations has been truncated, see
      #   {Imagekitio::Models::AITag} for more details.
      #
      #   AI-generated tag associated with an image. These tags can be added using the
      #   `google-auto-tagging` or `aws-auto-tagging` extensions.
      #
      #   @param confidence [Float] Confidence score of the tag.
      #
      #   @param name [String] Name of the tag.
      #
      #   @param source [String] Source of the tag. Possible values are `google-auto-tagging` and `aws-auto-taggi
    end
  end
end
