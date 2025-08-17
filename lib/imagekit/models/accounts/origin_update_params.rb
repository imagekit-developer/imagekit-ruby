# frozen_string_literal: true

module Imagekit
  module Models
    module Accounts
      # @see Imagekit::Resources::Accounts::Origins#update
      class OriginUpdateParams < Imagekit::Internal::Type::BaseModel
        extend Imagekit::Internal::Type::RequestParameters::Converter
        include Imagekit::Internal::Type::RequestParameters

        # @!attribute access_key
        #   Access key for the bucket.
        #
        #   @return [String]
        required :access_key, String, api_name: :accessKey

        # @!attribute bucket
        #
        #   @return [String]
        required :bucket, String

        # @!attribute name
        #   Display name of the origin.
        #
        #   @return [String]
        required :name, String

        # @!attribute secret_key
        #   Secret key for the bucket.
        #
        #   @return [String]
        required :secret_key, String, api_name: :secretKey

        # @!attribute type
        #
        #   @return [Symbol, Imagekit::Models::Accounts::OriginUpdateParams::Type]
        required :type, enum: -> { Imagekit::Accounts::OriginUpdateParams::Type }

        # @!attribute base_url_for_canonical_header
        #   URL used in the Canonical header (if enabled).
        #
        #   @return [String, nil]
        optional :base_url_for_canonical_header, String, api_name: :baseUrlForCanonicalHeader

        # @!attribute include_canonical_header
        #   Whether to send a Canonical header.
        #
        #   @return [Boolean, nil]
        optional :include_canonical_header,
                 Imagekit::Internal::Type::Boolean,
                 api_name: :includeCanonicalHeader

        # @!attribute prefix
        #
        #   @return [String, nil]
        optional :prefix, String

        # @!attribute endpoint
        #   Custom S3-compatible endpoint.
        #
        #   @return [String]
        required :endpoint, String

        # @!attribute s3_force_path_style
        #   Use path-style S3 URLs?
        #
        #   @return [Boolean, nil]
        optional :s3_force_path_style, Imagekit::Internal::Type::Boolean, api_name: :s3ForcePathStyle

        # @!attribute base_url
        #   Akeneo instance base URL.
        #
        #   @return [String]
        required :base_url, String, api_name: :baseUrl

        # @!attribute forward_host_header_to_origin
        #   Forward the Host header to origin?
        #
        #   @return [Boolean, nil]
        optional :forward_host_header_to_origin,
                 Imagekit::Internal::Type::Boolean,
                 api_name: :forwardHostHeaderToOrigin

        # @!attribute client_email
        #
        #   @return [String]
        required :client_email, String, api_name: :clientEmail

        # @!attribute private_key
        #
        #   @return [String]
        required :private_key, String, api_name: :privateKey

        # @!attribute account_name
        #
        #   @return [String]
        required :account_name, String, api_name: :accountName

        # @!attribute container
        #
        #   @return [String]
        required :container, String

        # @!attribute sas_token
        #
        #   @return [String]
        required :sas_token, String, api_name: :sasToken

        # @!attribute client_id
        #   Akeneo API client ID.
        #
        #   @return [String]
        required :client_id, String, api_name: :clientId

        # @!attribute client_secret
        #   Akeneo API client secret.
        #
        #   @return [String]
        required :client_secret, String, api_name: :clientSecret

        # @!attribute password
        #   Akeneo API password.
        #
        #   @return [String]
        required :password, String

        # @!attribute username
        #   Akeneo API username.
        #
        #   @return [String]
        required :username, String

        # @!method initialize(access_key:, bucket:, name:, secret_key:, type:, endpoint:, base_url:, client_email:, private_key:, account_name:, container:, sas_token:, client_id:, client_secret:, password:, username:, base_url_for_canonical_header: nil, include_canonical_header: nil, prefix: nil, s3_force_path_style: nil, forward_host_header_to_origin: nil, request_options: {})
        #   @param access_key [String] Access key for the bucket.
        #
        #   @param bucket [String]
        #
        #   @param name [String] Display name of the origin.
        #
        #   @param secret_key [String] Secret key for the bucket.
        #
        #   @param type [Symbol, Imagekit::Models::Accounts::OriginUpdateParams::Type]
        #
        #   @param endpoint [String] Custom S3-compatible endpoint.
        #
        #   @param base_url [String] Akeneo instance base URL.
        #
        #   @param client_email [String]
        #
        #   @param private_key [String]
        #
        #   @param account_name [String]
        #
        #   @param container [String]
        #
        #   @param sas_token [String]
        #
        #   @param client_id [String] Akeneo API client ID.
        #
        #   @param client_secret [String] Akeneo API client secret.
        #
        #   @param password [String] Akeneo API password.
        #
        #   @param username [String] Akeneo API username.
        #
        #   @param base_url_for_canonical_header [String] URL used in the Canonical header (if enabled).
        #
        #   @param include_canonical_header [Boolean] Whether to send a Canonical header.
        #
        #   @param prefix [String]
        #
        #   @param s3_force_path_style [Boolean] Use path-style S3 URLs?
        #
        #   @param forward_host_header_to_origin [Boolean] Forward the Host header to origin?
        #
        #   @param request_options [Imagekit::RequestOptions, Hash{Symbol=>Object}]

        module Type
          extend Imagekit::Internal::Type::Enum

          AKENEO_PIM = :AKENEO_PIM

          # @!method self.values
          #   @return [Array<Symbol>]
        end
      end
    end
  end
end
