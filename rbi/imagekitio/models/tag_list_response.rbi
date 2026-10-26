# typed: strong

module Imagekitio
  module Models
    class TagListResponse < Imagekitio::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            Imagekitio::Models::TagListResponse,
            Imagekitio::Internal::AnyHash
          )
        end

      # Cursor for the next page, or `null` when there are no more tags.
      sig { returns(T.nilable(String)) }
      attr_accessor :next_cursor

      # Tags matching the request, in the requested order.
      sig { returns(T::Array[Imagekitio::Tag]) }
      attr_accessor :tags

      sig do
        params(
          next_cursor: T.nilable(String),
          tags: T::Array[Imagekitio::Tag::OrHash]
        ).returns(T.attached_class)
      end
      def self.new(
        # Cursor for the next page, or `null` when there are no more tags.
        next_cursor:,
        # Tags matching the request, in the requested order.
        tags:
      )
      end

      sig do
        override.returns(
          { next_cursor: T.nilable(String), tags: T::Array[Imagekitio::Tag] }
        )
      end
      def to_hash
      end
    end
  end
end
