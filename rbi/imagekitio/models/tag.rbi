# typed: strong

module Imagekitio
  module Models
    class Tag < Imagekitio::Internal::Type::BaseModel
      OrHash =
        T.type_alias { T.any(Imagekitio::Tag, Imagekitio::Internal::AnyHash) }

      # The number of assets carrying the tag, counted across both tag sources
      # (user-generated tags and AI-generated tags) and all file types regardless of the
      # request's filters.
      sig { returns(Integer) }
      attr_accessor :asset_count

      # The tag as it was spelled when it was last applied to any asset. Use it for
      # display.
      sig { returns(String) }
      attr_accessor :label

      # When the tag was last applied to an asset matching the `tagSource` and
      # `fileType` filters of the request, in ISO 8601 format.
      sig { returns(Time) }
      attr_accessor :last_used_at

      # The tag in lowercase. Tags are case-insensitive, so this is the unique key of
      # the tag within your account.
      sig { returns(String) }
      attr_accessor :name

      # A tag in use in your media library, aggregated case-insensitively across the
      # assets that carry it.
      sig do
        params(
          asset_count: Integer,
          label: String,
          last_used_at: Time,
          name: String
        ).returns(T.attached_class)
      end
      def self.new(
        # The number of assets carrying the tag, counted across both tag sources
        # (user-generated tags and AI-generated tags) and all file types regardless of the
        # request's filters.
        asset_count:,
        # The tag as it was spelled when it was last applied to any asset. Use it for
        # display.
        label:,
        # When the tag was last applied to an asset matching the `tagSource` and
        # `fileType` filters of the request, in ISO 8601 format.
        last_used_at:,
        # The tag in lowercase. Tags are case-insensitive, so this is the unique key of
        # the tag within your account.
        name:
      )
      end

      sig do
        override.returns(
          {
            asset_count: Integer,
            label: String,
            last_used_at: Time,
            name: String
          }
        )
      end
      def to_hash
      end
    end
  end
end
