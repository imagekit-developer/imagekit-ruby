# typed: strong

module Imagekitio
  module Models
    class FileMoveParams < Imagekitio::Internal::Type::BaseModel
      extend Imagekitio::Internal::Type::RequestParameters::Converter
      include Imagekitio::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(Imagekitio::FileMoveParams, Imagekitio::Internal::AnyHash)
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
          request_options: Imagekitio::RequestOptions::OrHash
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
            request_options: Imagekitio::RequestOptions
          }
        )
      end
      def to_hash
      end
    end
  end
end
