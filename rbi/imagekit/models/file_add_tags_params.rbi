# typed: strong

module Imagekit
  module Models
    class FileAddTagsParams < Imagekit::Internal::Type::BaseModel
      extend Imagekit::Internal::Type::RequestParameters::Converter
      include Imagekit::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(Imagekit::FileAddTagsParams, Imagekit::Internal::AnyHash)
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
          request_options: Imagekit::RequestOptions::OrHash
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
            request_options: Imagekit::RequestOptions
          }
        )
      end
      def to_hash
      end
    end
  end
end
