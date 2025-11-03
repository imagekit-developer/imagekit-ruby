# frozen_string_literal: true

module Imagekitio
  module Models
    module Accounts
      # @see Imagekitio::Resources::Accounts::Origins#create
      class OriginCreateParams < Imagekitio::Internal::Type::BaseModel
        extend Imagekitio::Internal::Type::RequestParameters::Converter
        include Imagekitio::Internal::Type::RequestParameters

        # @!attribute origin_request
        #   Schema for origin request resources.
        #
        #   @return [Imagekitio::Models::Accounts::OriginRequest::S3, Imagekitio::Models::Accounts::OriginRequest::S3Compatible, Imagekitio::Models::Accounts::OriginRequest::CloudinaryBackup, Imagekitio::Models::Accounts::OriginRequest::WebFolder, Imagekitio::Models::Accounts::OriginRequest::WebProxy, Imagekitio::Models::Accounts::OriginRequest::Gcs, Imagekitio::Models::Accounts::OriginRequest::AzureBlob, Imagekitio::Models::Accounts::OriginRequest::AkeneoPim]
        required :origin_request, union: -> { Imagekitio::Accounts::OriginRequest }

        # @!method initialize(origin_request:, request_options: {})
        #   @param origin_request [Imagekitio::Models::Accounts::OriginRequest::S3, Imagekitio::Models::Accounts::OriginRequest::S3Compatible, Imagekitio::Models::Accounts::OriginRequest::CloudinaryBackup, Imagekitio::Models::Accounts::OriginRequest::WebFolder, Imagekitio::Models::Accounts::OriginRequest::WebProxy, Imagekitio::Models::Accounts::OriginRequest::Gcs, Imagekitio::Models::Accounts::OriginRequest::AzureBlob, Imagekitio::Models::Accounts::OriginRequest::AkeneoPim] Schema for origin request resources.
        #
        #   @param request_options [Imagekitio::RequestOptions, Hash{Symbol=>Object}]
      end
    end
  end
end
