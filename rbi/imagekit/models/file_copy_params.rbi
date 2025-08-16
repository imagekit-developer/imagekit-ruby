# typed: strong

module Imagekit
  module Models
    class FileCopyParams < Imagekit::Internal::Type::BaseModel
      extend Imagekit::Internal::Type::RequestParameters::Converter
      include Imagekit::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(Imagekit::FileCopyParams, Imagekit::Internal::AnyHash)
        end

      # Full path to the folder you want to copy the above file into.
      sig { returns(String) }
      attr_accessor :destination_path

      # The full path of the file you want to copy.
      sig { returns(String) }
      attr_accessor :source_file_path

      # Option to copy all versions of a file. By default, only the current version of
      # the file is copied. When set to true, all versions of the file will be copied.
      # Default value - `false`.
      sig { returns(T.nilable(T::Boolean)) }
      attr_reader :include_file_versions

      sig { params(include_file_versions: T::Boolean).void }
      attr_writer :include_file_versions

      sig do
        params(
          destination_path: String,
          source_file_path: String,
          include_file_versions: T::Boolean,
          request_options: Imagekit::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        # Full path to the folder you want to copy the above file into.
        destination_path:,
        # The full path of the file you want to copy.
        source_file_path:,
        # Option to copy all versions of a file. By default, only the current version of
        # the file is copied. When set to true, all versions of the file will be copied.
        # Default value - `false`.
        include_file_versions: nil,
        request_options: {}
      )
      end

      sig do
        override.returns(
          {
            destination_path: String,
            source_file_path: String,
            include_file_versions: T::Boolean,
            request_options: Imagekit::RequestOptions
          }
        )
      end
      def to_hash
      end
    end
  end
end
