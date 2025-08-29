# typed: strong

module Imagekit
  module Models
    # By default, the transformation string is added as a query parameter in the URL,
    # e.g., `?tr=w-100,h-100`. If you want to add the transformation string in the
    # path of the URL, set this to `path`.
    module TransformationPosition
      extend Imagekit::Internal::Type::Enum

      TaggedSymbol =
        T.type_alias { T.all(Symbol, Imagekit::TransformationPosition) }
      OrSymbol = T.type_alias { T.any(Symbol, String) }

      PATH = T.let(:path, Imagekit::TransformationPosition::TaggedSymbol)
      QUERY = T.let(:query, Imagekit::TransformationPosition::TaggedSymbol)

      sig do
        override.returns(
          T::Array[Imagekit::TransformationPosition::TaggedSymbol]
        )
      end
      def self.values
      end
    end
  end
end
