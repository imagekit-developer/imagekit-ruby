# typed: strong

module Imagekitio
  module Models
    class FolderCopyParams < Imagekitio::Internal::Type::BaseModel
      extend Imagekitio::Internal::Type::RequestParameters::Converter
      include Imagekitio::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(Imagekitio::FolderCopyParams, Imagekitio::Internal::AnyHash)
        end

      # Full path to the destination folder where you want to copy the source folder
      # into.
      sig { returns(String) }
      attr_accessor :destination_path

      # The full path to the source folder you want to copy.
      sig { returns(String) }
      attr_accessor :source_folder_path

      # Option to copy all versions of files that are nested inside the selected folder.
      # By default, only the current version of each file will be copied. When set to
      # true, all versions of each file will be copied. Default value - `false`.
      sig { returns(T.nilable(T::Boolean)) }
      attr_reader :include_versions

      sig { params(include_versions: T::Boolean).void }
      attr_writer :include_versions

      sig do
        params(
          destination_path: String,
          source_folder_path: String,
          include_versions: T::Boolean,
          request_options: Imagekitio::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        # Full path to the destination folder where you want to copy the source folder
        # into.
        destination_path:,
        # The full path to the source folder you want to copy.
        source_folder_path:,
        # Option to copy all versions of files that are nested inside the selected folder.
        # By default, only the current version of each file will be copied. When set to
        # true, all versions of each file will be copied. Default value - `false`.
        include_versions: nil,
        request_options: {}
      )
      end

      sig do
        override.returns(
          {
            destination_path: String,
            source_folder_path: String,
            include_versions: T::Boolean,
            request_options: Imagekitio::RequestOptions
          }
        )
      end
      def to_hash
      end
    end
  end
end
