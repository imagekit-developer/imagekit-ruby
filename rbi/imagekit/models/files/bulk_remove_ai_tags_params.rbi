# typed: strong

module Imagekit
  module Models
    module Files
      class BulkRemoveAITagsParams < Imagekit::Internal::Type::BaseModel
        extend Imagekit::Internal::Type::RequestParameters::Converter
        include Imagekit::Internal::Type::RequestParameters

        OrHash =
          T.type_alias do
            T.any(
              Imagekit::Files::BulkRemoveAITagsParams,
              Imagekit::Internal::AnyHash
            )
          end

        # An array of AITags that you want to remove from the files.
        sig { returns(T::Array[String]) }
        attr_accessor :ai_tags

        # An array of fileIds from which you want to remove AITags.
        sig { returns(T::Array[String]) }
        attr_accessor :file_ids

        sig do
          params(
            ai_tags: T::Array[String],
            file_ids: T::Array[String],
            request_options: Imagekit::RequestOptions::OrHash
          ).returns(T.attached_class)
        end
        def self.new(
          # An array of AITags that you want to remove from the files.
          ai_tags:,
          # An array of fileIds from which you want to remove AITags.
          file_ids:,
          request_options: {}
        )
        end

        sig do
          override.returns(
            {
              ai_tags: T::Array[String],
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
