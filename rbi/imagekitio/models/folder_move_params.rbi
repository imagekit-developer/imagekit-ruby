# typed: strong

module Imagekitio
  module Models
    class FolderMoveParams < Imagekitio::Internal::Type::BaseModel
      extend Imagekitio::Internal::Type::RequestParameters::Converter
      include Imagekitio::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(Imagekitio::FolderMoveParams, Imagekitio::Internal::AnyHash)
        end

      # Full path to the destination folder where you want to move the source folder
      # into.
      sig { returns(String) }
      attr_accessor :destination_path

      # The full path to the source folder you want to move.
      sig { returns(String) }
      attr_accessor :source_folder_path

      sig do
        params(
          destination_path: String,
          source_folder_path: String,
          request_options: Imagekitio::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        # Full path to the destination folder where you want to move the source folder
        # into.
        destination_path:,
        # The full path to the source folder you want to move.
        source_folder_path:,
        request_options: {}
      )
      end

      sig do
        override.returns(
          {
            destination_path: String,
            source_folder_path: String,
            request_options: Imagekitio::RequestOptions
          }
        )
      end
      def to_hash
      end
    end
  end
end
