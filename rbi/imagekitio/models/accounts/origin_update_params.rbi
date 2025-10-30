# typed: strong

module Imagekitio
  module Models
    module Accounts
      class OriginUpdateParams < Imagekitio::Internal::Type::BaseModel
        extend Imagekitio::Internal::Type::RequestParameters::Converter
        include Imagekitio::Internal::Type::RequestParameters

        OrHash =
          T.type_alias do
            T.any(
              Imagekitio::Accounts::OriginUpdateParams,
              Imagekitio::Internal::AnyHash
            )
          end

        # Schema for origin request resources.
        sig do
          returns(
            T.any(
              Imagekitio::Accounts::OriginRequest::S3,
              Imagekitio::Accounts::OriginRequest::S3Compatible,
              Imagekitio::Accounts::OriginRequest::CloudinaryBackup,
              Imagekitio::Accounts::OriginRequest::WebFolder,
              Imagekitio::Accounts::OriginRequest::WebProxy,
              Imagekitio::Accounts::OriginRequest::Gcs,
              Imagekitio::Accounts::OriginRequest::AzureBlob,
              Imagekitio::Accounts::OriginRequest::AkeneoPim
            )
          )
        end
        attr_accessor :origin_request

        sig do
          params(
            origin_request:
              T.any(
                Imagekitio::Accounts::OriginRequest::S3::OrHash,
                Imagekitio::Accounts::OriginRequest::S3Compatible::OrHash,
                Imagekitio::Accounts::OriginRequest::CloudinaryBackup::OrHash,
                Imagekitio::Accounts::OriginRequest::WebFolder::OrHash,
                Imagekitio::Accounts::OriginRequest::WebProxy::OrHash,
                Imagekitio::Accounts::OriginRequest::Gcs::OrHash,
                Imagekitio::Accounts::OriginRequest::AzureBlob::OrHash,
                Imagekitio::Accounts::OriginRequest::AkeneoPim::OrHash
              ),
            request_options: Imagekitio::RequestOptions::OrHash
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
                  Imagekitio::Accounts::OriginRequest::S3,
                  Imagekitio::Accounts::OriginRequest::S3Compatible,
                  Imagekitio::Accounts::OriginRequest::CloudinaryBackup,
                  Imagekitio::Accounts::OriginRequest::WebFolder,
                  Imagekitio::Accounts::OriginRequest::WebProxy,
                  Imagekitio::Accounts::OriginRequest::Gcs,
                  Imagekitio::Accounts::OriginRequest::AzureBlob,
                  Imagekitio::Accounts::OriginRequest::AkeneoPim
                ),
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
