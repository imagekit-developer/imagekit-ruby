# typed: strong

module Imagekit
  module Models
    class FileAddTagsResponse < Imagekit::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            Imagekit::Models::FileAddTagsResponse,
            Imagekit::Internal::AnyHash
          )
        end

      # An array of fileIds that in which tags were successfully added.
      sig { returns(T.nilable(T::Array[String])) }
      attr_reader :successfully_updated_file_ids

      sig { params(successfully_updated_file_ids: T::Array[String]).void }
      attr_writer :successfully_updated_file_ids

      sig do
        params(successfully_updated_file_ids: T::Array[String]).returns(
          T.attached_class
        )
      end
      def self.new(
        # An array of fileIds that in which tags were successfully added.
        successfully_updated_file_ids: nil
      )
      end

      sig do
        override.returns({ successfully_updated_file_ids: T::Array[String] })
      end
      def to_hash
      end
    end
  end
end
