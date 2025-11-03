# typed: strong

module Imagekitio
  module Models
    module Files
      class BulkAddTagsParams < Imagekitio::Internal::Type::BaseModel
        extend Imagekitio::Internal::Type::RequestParameters::Converter
        include Imagekitio::Internal::Type::RequestParameters

        OrHash =
          T.type_alias do
            T.any(
              Imagekitio::Files::BulkAddTagsParams,
              Imagekitio::Internal::AnyHash
            )
          end

        # An array of fileIds to which you want to add tags.
        sig { returns(T::Array[String]) }
        attr_accessor :file_ids

        # An array of tags that you want to add to the files.
        sig { returns(T::Array[String]) }
        attr_accessor :tags

        sig do
          params(
            file_ids: T::Array[String],
            tags: T::Array[String],
            request_options: Imagekitio::RequestOptions::OrHash
          ).returns(T.attached_class)
        end
        def self.new(
          # An array of fileIds to which you want to add tags.
          file_ids:,
          # An array of tags that you want to add to the files.
          tags:,
          request_options: {}
        )
        end

        sig do
          override.returns(
            {
              file_ids: T::Array[String],
              tags: T::Array[String],
              request_options: Imagekitio::RequestOptions
            }
          )
        end
        def to_hash
        end
      end
    end
  end
end
