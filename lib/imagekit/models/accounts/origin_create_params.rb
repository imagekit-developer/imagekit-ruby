# frozen_string_literal: true

module Imagekit
  module Models
    module Accounts
      # @see Imagekit::Resources::Accounts::Origins#create
      class OriginCreateParams < Imagekit::Internal::Type::BaseModel
        extend Imagekit::Internal::Type::RequestParameters::Converter
        include Imagekit::Internal::Type::RequestParameters

        # @!attribute origin_request
        #   Schema for origin request resources.
        #
        #   @return [Imagekit::Models::Accounts::OriginRequest::S3, Imagekit::Models::Accounts::OriginRequest::S3Compatible, Imagekit::Models::Accounts::OriginRequest::CloudinaryBackup, Imagekit::Models::Accounts::OriginRequest::WebFolder, Imagekit::Models::Accounts::OriginRequest::WebProxy, Imagekit::Models::Accounts::OriginRequest::Gcs, Imagekit::Models::Accounts::OriginRequest::AzureBlob, Imagekit::Models::Accounts::OriginRequest::AkeneoPim]
        required :origin_request, union: -> { Imagekit::Accounts::OriginRequest }

        # @!method initialize(origin_request:, request_options: {})
        #   @param origin_request [Imagekit::Models::Accounts::OriginRequest::S3, Imagekit::Models::Accounts::OriginRequest::S3Compatible, Imagekit::Models::Accounts::OriginRequest::CloudinaryBackup, Imagekit::Models::Accounts::OriginRequest::WebFolder, Imagekit::Models::Accounts::OriginRequest::WebProxy, Imagekit::Models::Accounts::OriginRequest::Gcs, Imagekit::Models::Accounts::OriginRequest::AzureBlob, Imagekit::Models::Accounts::OriginRequest::AkeneoPim] Schema for origin request resources.
        #
        #   @param request_options [Imagekit::RequestOptions, Hash{Symbol=>Object}]
      end
    end
  end
end
