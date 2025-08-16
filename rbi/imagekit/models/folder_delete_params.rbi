# typed: strong

module Imagekit
  module Models
    class FolderDeleteParams < Imagekit::Internal::Type::BaseModel
      extend Imagekit::Internal::Type::RequestParameters::Converter
      include Imagekit::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(Imagekit::FolderDeleteParams, Imagekit::Internal::AnyHash)
        end

      # Full path to the folder you want to delete. For example `/folder/to/delete/`.
      sig { returns(String) }
      attr_accessor :folder_path

      sig do
        params(
          folder_path: String,
          request_options: Imagekit::RequestOptions::OrHash
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
          { folder_path: String, request_options: Imagekit::RequestOptions }
        )
      end
      def to_hash
      end
    end
  end
end
