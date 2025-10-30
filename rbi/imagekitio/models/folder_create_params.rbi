# typed: strong

module Imagekitio
  module Models
    class FolderCreateParams < Imagekitio::Internal::Type::BaseModel
      extend Imagekitio::Internal::Type::RequestParameters::Converter
      include Imagekitio::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(Imagekitio::FolderCreateParams, Imagekitio::Internal::AnyHash)
        end

      # The folder will be created with this name.
      #
      # All characters except alphabets and numbers (inclusive of unicode letters,
      # marks, and numerals in other languages) will be replaced by an underscore i.e.
      # `_`.
      sig { returns(String) }
      attr_accessor :folder_name

      # The folder where the new folder should be created, for root use `/` else the
      # path e.g. `containing/folder/`.
      #
      # Note: If any folder(s) is not present in the parentFolderPath parameter, it will
      # be automatically created. For example, if you pass `/product/images/summer`,
      # then `product`, `images`, and `summer` folders will be created if they don't
      # already exist.
      sig { returns(String) }
      attr_accessor :parent_folder_path

      sig do
        params(
          folder_name: String,
          parent_folder_path: String,
          request_options: Imagekitio::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        # The folder will be created with this name.
        #
        # All characters except alphabets and numbers (inclusive of unicode letters,
        # marks, and numerals in other languages) will be replaced by an underscore i.e.
        # `_`.
        folder_name:,
        # The folder where the new folder should be created, for root use `/` else the
        # path e.g. `containing/folder/`.
        #
        # Note: If any folder(s) is not present in the parentFolderPath parameter, it will
        # be automatically created. For example, if you pass `/product/images/summer`,
        # then `product`, `images`, and `summer` folders will be created if they don't
        # already exist.
        parent_folder_path:,
        request_options: {}
      )
      end

      sig do
        override.returns(
          {
            folder_name: String,
            parent_folder_path: String,
            request_options: Imagekitio::RequestOptions
          }
        )
      end
      def to_hash
      end
    end
  end
end
