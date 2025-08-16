# typed: strong

module Imagekit
  module Models
    module Files
      class BatchDeleteResponse < Imagekit::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Imagekit::Models::Files::BatchDeleteResponse,
              Imagekit::Internal::AnyHash
            )
          end

        # An array of fileIds that were successfully deleted.
        sig { returns(T.nilable(T::Array[String])) }
        attr_reader :successfully_deleted_file_ids

        sig { params(successfully_deleted_file_ids: T::Array[String]).void }
        attr_writer :successfully_deleted_file_ids

        sig do
          params(successfully_deleted_file_ids: T::Array[String]).returns(
            T.attached_class
          )
        end
        def self.new(
          # An array of fileIds that were successfully deleted.
          successfully_deleted_file_ids: nil
        )
        end

        sig do
          override.returns({ successfully_deleted_file_ids: T::Array[String] })
        end
        def to_hash
        end
      end
    end
  end
end
