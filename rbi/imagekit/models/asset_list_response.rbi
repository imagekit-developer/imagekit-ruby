# typed: strong

module Imagekit
  module Models
    # Object containing details of a file or file version.
    module AssetListResponseItem
      extend Imagekit::Internal::Type::Union

      Variants = T.type_alias { T.any(Imagekit::Folder, Imagekit::File) }

      sig do
        override.returns(
          T::Array[Imagekit::Models::AssetListResponseItem::Variants]
        )
      end
      def self.variants
      end
    end

    AssetListResponse =
      T.let(
        Imagekit::Internal::Type::ArrayOf[
          union: Imagekit::Models::AssetListResponseItem
        ],
        Imagekit::Internal::Type::Converter
      )
  end
end
