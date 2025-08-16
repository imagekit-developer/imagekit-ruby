# typed: strong

module Imagekit
  module Models
    class FileMoveParams < Imagekit::Internal::Type::BaseModel
      extend Imagekit::Internal::Type::RequestParameters::Converter
      include Imagekit::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(Imagekit::FileMoveParams, Imagekit::Internal::AnyHash)
        end

      # Full path to the folder you want to move the above file into.
      sig { returns(String) }
      attr_accessor :destination_path

      # The full path of the file you want to move.
      sig { returns(String) }
      attr_accessor :source_file_path

      sig do
        params(
          destination_path: String,
          source_file_path: String,
          request_options: Imagekit::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        # Full path to the folder you want to move the above file into.
        destination_path:,
        # The full path of the file you want to move.
        source_file_path:,
        request_options: {}
      )
      end

      sig do
        override.returns(
          {
            destination_path: String,
            source_file_path: String,
            request_options: Imagekit::RequestOptions
          }
        )
      end
      def to_hash
      end
    end
  end
end
