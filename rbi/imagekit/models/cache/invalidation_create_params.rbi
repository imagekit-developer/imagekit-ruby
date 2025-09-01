# typed: strong

module Imagekit
  module Models
    module Cache
      class InvalidationCreateParams < Imagekit::Internal::Type::BaseModel
        extend Imagekit::Internal::Type::RequestParameters::Converter
        include Imagekit::Internal::Type::RequestParameters

        OrHash =
          T.type_alias do
            T.any(
              Imagekit::Cache::InvalidationCreateParams,
              Imagekit::Internal::AnyHash
            )
          end

        # The full URL of the file to be purged.
        sig { returns(String) }
        attr_accessor :url

        sig do
          params(
            url: String,
            request_options: Imagekit::RequestOptions::OrHash
          ).returns(T.attached_class)
        end
        def self.new(
          # The full URL of the file to be purged.
          url:,
          request_options: {}
        )
        end

        sig do
          override.returns(
            { url: String, request_options: Imagekit::RequestOptions }
          )
        end
        def to_hash
        end
      end
    end
  end
end
