# typed: strong

module Imagekitio
  module Models
    # Object containing details of a file or file version.
    module AssetListResponseItem
      extend Imagekitio::Internal::Type::Union

      Variants = T.type_alias { T.any(Imagekitio::Folder, Imagekitio::File) }

      sig do
        override.returns(
          T::Array[Imagekitio::Models::AssetListResponseItem::Variants]
        )
      end
      def self.variants
      end
    end

    AssetListResponse =
      T.let(
        Imagekitio::Internal::Type::ArrayOf[
          union: Imagekitio::Models::AssetListResponseItem
        ],
        Imagekitio::Internal::Type::Converter
      )
  end
end
