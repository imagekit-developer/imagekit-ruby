# typed: strong

module Imagekit
  module Models
    module Files
      class MetadataFromURLParams < Imagekit::Internal::Type::BaseModel
        extend Imagekit::Internal::Type::RequestParameters::Converter
        include Imagekit::Internal::Type::RequestParameters

        OrHash =
          T.type_alias do
            T.any(
              Imagekit::Files::MetadataFromURLParams,
              Imagekit::Internal::AnyHash
            )
          end

        # Should be a valid file URL. It should be accessible using your ImageKit.io
        # account.
        sig { returns(String) }
        attr_accessor :url

        sig do
          params(
            url: String,
            request_options: Imagekit::RequestOptions::OrHash
          ).returns(T.attached_class)
        end
        def self.new(
          # Should be a valid file URL. It should be accessible using your ImageKit.io
          # account.
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
