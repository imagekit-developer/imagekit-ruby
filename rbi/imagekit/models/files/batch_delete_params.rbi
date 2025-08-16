# typed: strong

module Imagekit
  module Models
    module Files
      class BatchDeleteParams < Imagekit::Internal::Type::BaseModel
        extend Imagekit::Internal::Type::RequestParameters::Converter
        include Imagekit::Internal::Type::RequestParameters

        OrHash =
          T.type_alias do
            T.any(
              Imagekit::Files::BatchDeleteParams,
              Imagekit::Internal::AnyHash
            )
          end

        # An array of fileIds which you want to delete.
        sig { returns(T::Array[String]) }
        attr_accessor :file_ids

        sig do
          params(
            file_ids: T::Array[String],
            request_options: Imagekit::RequestOptions::OrHash
          ).returns(T.attached_class)
        end
        def self.new(
          # An array of fileIds which you want to delete.
          file_ids:,
          request_options: {}
        )
        end

        sig do
          override.returns(
            {
              file_ids: T::Array[String],
              request_options: Imagekit::RequestOptions
            }
          )
        end
        def to_hash
        end
      end
    end
  end
end
