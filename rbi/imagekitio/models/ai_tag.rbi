# typed: strong

module Imagekitio
  module Models
    class AITag < Imagekitio::Internal::Type::BaseModel
      OrHash =
        T.type_alias { T.any(Imagekitio::AITag, Imagekitio::Internal::AnyHash) }

      # Confidence score of the tag.
      sig { returns(T.nilable(Float)) }
      attr_reader :confidence

      sig { params(confidence: Float).void }
      attr_writer :confidence

      # Name of the tag.
      sig { returns(T.nilable(String)) }
      attr_reader :name

      sig { params(name: String).void }
      attr_writer :name

      # Source of the tag. Possible values are `google-auto-tagging` and
      # `aws-auto-tagging`.
      sig { returns(T.nilable(String)) }
      attr_reader :source

      sig { params(source: String).void }
      attr_writer :source

      # AI-generated tag associated with an image. These tags can be added using the
      # `google-auto-tagging` or `aws-auto-tagging` extensions.
      sig do
        params(confidence: Float, name: String, source: String).returns(
          T.attached_class
        )
      end
      def self.new(
        # Confidence score of the tag.
        confidence: nil,
        # Name of the tag.
        name: nil,
        # Source of the tag. Possible values are `google-auto-tagging` and
        # `aws-auto-tagging`.
        source: nil
      )
      end

      sig do
        override.returns({ confidence: Float, name: String, source: String })
      end
      def to_hash
      end
    end
  end
end
