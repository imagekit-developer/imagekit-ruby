# typed: strong

module Imagekitio
  module Models
    # By default, the transformation string is added as a query parameter in the URL,
    # e.g., `?tr=w-100,h-100`. If you want to add the transformation string in the
    # path of the URL, set this to `path`. Learn more in the
    # [Transformations guide](https://imagekit.io/docs/transformations).
    module TransformationPosition
      extend Imagekitio::Internal::Type::Enum

      TaggedSymbol =
        T.type_alias { T.all(Symbol, Imagekitio::TransformationPosition) }
      OrSymbol = T.type_alias { T.any(Symbol, String) }

      PATH = T.let(:path, Imagekitio::TransformationPosition::TaggedSymbol)
      QUERY = T.let(:query, Imagekitio::TransformationPosition::TaggedSymbol)

      sig do
        override.returns(
          T::Array[Imagekitio::TransformationPosition::TaggedSymbol]
        )
      end
      def self.values
      end
    end
  end
end
