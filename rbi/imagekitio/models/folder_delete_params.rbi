# typed: strong

module Imagekitio
  module Models
    class FolderDeleteParams < Imagekitio::Internal::Type::BaseModel
      extend Imagekitio::Internal::Type::RequestParameters::Converter
      include Imagekitio::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(Imagekitio::FolderDeleteParams, Imagekitio::Internal::AnyHash)
        end

      # Full path to the folder you want to delete. For example `/folder/to/delete/`.
      sig { returns(String) }
      attr_accessor :folder_path

      sig do
        params(
          folder_path: String,
          request_options: Imagekitio::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        # Full path to the folder you want to delete. For example `/folder/to/delete/`.
        folder_path:,
        request_options: {}
      )
      end

      sig do
        override.returns(
          { folder_path: String, request_options: Imagekitio::RequestOptions }
        )
      end
      def to_hash
      end
    end
  end
end
