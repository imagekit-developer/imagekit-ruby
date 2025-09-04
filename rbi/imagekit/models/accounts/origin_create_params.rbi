# typed: strong

module Imagekit
  module Models
    module Accounts
      class OriginCreateParams < Imagekit::Internal::Type::BaseModel
        extend Imagekit::Internal::Type::RequestParameters::Converter
        include Imagekit::Internal::Type::RequestParameters

        OrHash =
          T.type_alias do
            T.any(
              Imagekit::Accounts::OriginCreateParams,
              Imagekit::Internal::AnyHash
            )
          end

        # Schema for origin request resources.
        sig do
          returns(
            T.any(
              Imagekit::Accounts::OriginRequest::S3,
              Imagekit::Accounts::OriginRequest::S3Compatible,
              Imagekit::Accounts::OriginRequest::CloudinaryBackup,
              Imagekit::Accounts::OriginRequest::WebFolder,
              Imagekit::Accounts::OriginRequest::WebProxy,
              Imagekit::Accounts::OriginRequest::Gcs,
              Imagekit::Accounts::OriginRequest::AzureBlob,
              Imagekit::Accounts::OriginRequest::AkeneoPim
            )
          )
        end
        attr_accessor :origin_request

        sig do
          params(
            origin_request:
              T.any(
                Imagekit::Accounts::OriginRequest::S3::OrHash,
                Imagekit::Accounts::OriginRequest::S3Compatible::OrHash,
                Imagekit::Accounts::OriginRequest::CloudinaryBackup::OrHash,
                Imagekit::Accounts::OriginRequest::WebFolder::OrHash,
                Imagekit::Accounts::OriginRequest::WebProxy::OrHash,
                Imagekit::Accounts::OriginRequest::Gcs::OrHash,
                Imagekit::Accounts::OriginRequest::AzureBlob::OrHash,
                Imagekit::Accounts::OriginRequest::AkeneoPim::OrHash
              ),
            request_options: Imagekit::RequestOptions::OrHash
          ).returns(T.attached_class)
        end
        def self.new(
          # Schema for origin request resources.
          origin_request:,
          request_options: {}
        )
        end

        sig do
          override.returns(
            {
              origin_request:
                T.any(
                  Imagekit::Accounts::OriginRequest::S3,
                  Imagekit::Accounts::OriginRequest::S3Compatible,
                  Imagekit::Accounts::OriginRequest::CloudinaryBackup,
                  Imagekit::Accounts::OriginRequest::WebFolder,
                  Imagekit::Accounts::OriginRequest::WebProxy,
                  Imagekit::Accounts::OriginRequest::Gcs,
                  Imagekit::Accounts::OriginRequest::AzureBlob,
                  Imagekit::Accounts::OriginRequest::AkeneoPim
                ),
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
