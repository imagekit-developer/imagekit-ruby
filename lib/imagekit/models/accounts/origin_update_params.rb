# frozen_string_literal: true

module Imagekit
  module Models
    module Accounts
      # @see Imagekit::Resources::Accounts::Origins#update
      class OriginUpdateParams < Imagekit::Internal::Type::BaseModel
        extend Imagekit::Internal::Type::RequestParameters::Converter
        include Imagekit::Internal::Type::RequestParameters

        # @!attribute origin
        #   Schema for origin request resources.
        #
        #   @return [Imagekit::Models::Accounts::OriginUpdateParams::Origin::S3, Imagekit::Models::Accounts::OriginUpdateParams::Origin::S3Compatible, Imagekit::Models::Accounts::OriginUpdateParams::Origin::CloudinaryBackup, Imagekit::Models::Accounts::OriginUpdateParams::Origin::WebFolder, Imagekit::Models::Accounts::OriginUpdateParams::Origin::WebProxy, Imagekit::Models::Accounts::OriginUpdateParams::Origin::Gcs, Imagekit::Models::Accounts::OriginUpdateParams::Origin::AzureBlob, Imagekit::Models::Accounts::OriginUpdateParams::Origin::AkeneoPim]
        required :origin, union: -> { Imagekit::Accounts::OriginUpdateParams::Origin }

        # @!method initialize(origin:, request_options: {})
        #   @param origin [Imagekit::Models::Accounts::OriginUpdateParams::Origin::S3, Imagekit::Models::Accounts::OriginUpdateParams::Origin::S3Compatible, Imagekit::Models::Accounts::OriginUpdateParams::Origin::CloudinaryBackup, Imagekit::Models::Accounts::OriginUpdateParams::Origin::WebFolder, Imagekit::Models::Accounts::OriginUpdateParams::Origin::WebProxy, Imagekit::Models::Accounts::OriginUpdateParams::Origin::Gcs, Imagekit::Models::Accounts::OriginUpdateParams::Origin::AzureBlob, Imagekit::Models::Accounts::OriginUpdateParams::Origin::AkeneoPim] Schema for origin request resources.
        #
        #   @param request_options [Imagekit::RequestOptions, Hash{Symbol=>Object}]

        # Schema for origin request resources.
        module Origin
          extend Imagekit::Internal::Type::Union

          discriminator :type

          variant :S3, -> { Imagekit::Accounts::OriginUpdateParams::Origin::S3 }

          variant :S3_COMPATIBLE, -> { Imagekit::Accounts::OriginUpdateParams::Origin::S3Compatible }

          variant :CLOUDINARY_BACKUP, -> { Imagekit::Accounts::OriginUpdateParams::Origin::CloudinaryBackup }

          variant :WEB_FOLDER, -> { Imagekit::Accounts::OriginUpdateParams::Origin::WebFolder }

          variant :WEB_PROXY, -> { Imagekit::Accounts::OriginUpdateParams::Origin::WebProxy }

          variant :GCS, -> { Imagekit::Accounts::OriginUpdateParams::Origin::Gcs }

          variant :AZURE_BLOB, -> { Imagekit::Accounts::OriginUpdateParams::Origin::AzureBlob }

          variant :AKENEO_PIM, -> { Imagekit::Accounts::OriginUpdateParams::Origin::AkeneoPim }

          class S3 < Imagekit::Internal::Type::BaseModel
            # @!attribute access_key
            #   Access key for the bucket.
            #
            #   @return [String]
            required :access_key, String, api_name: :accessKey

            # @!attribute bucket
            #   S3 bucket name.
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
            #   @return [Symbol, :S3]
            required :type, const: :S3

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
            #   Path prefix inside the bucket.
            #
            #   @return [String, nil]
            optional :prefix, String

            # @!method initialize(access_key:, bucket:, name:, secret_key:, base_url_for_canonical_header: nil, include_canonical_header: nil, prefix: nil, type: :S3)
            #   @param access_key [String] Access key for the bucket.
            #
            #   @param bucket [String] S3 bucket name.
            #
            #   @param name [String] Display name of the origin.
            #
            #   @param secret_key [String] Secret key for the bucket.
            #
            #   @param base_url_for_canonical_header [String] URL used in the Canonical header (if enabled).
            #
            #   @param include_canonical_header [Boolean] Whether to send a Canonical header.
            #
            #   @param prefix [String] Path prefix inside the bucket.
            #
            #   @param type [Symbol, :S3]
          end

          class S3Compatible < Imagekit::Internal::Type::BaseModel
            # @!attribute access_key
            #   Access key for the bucket.
            #
            #   @return [String]
            required :access_key, String, api_name: :accessKey

            # @!attribute bucket
            #   S3 bucket name.
            #
            #   @return [String]
            required :bucket, String

            # @!attribute endpoint
            #   Custom S3-compatible endpoint.
            #
            #   @return [String]
            required :endpoint, String

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
            #   @return [Symbol, :S3_COMPATIBLE]
            required :type, const: :S3_COMPATIBLE

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
            #   Path prefix inside the bucket.
            #
            #   @return [String, nil]
            optional :prefix, String

            # @!attribute s3_force_path_style
            #   Use path-style S3 URLs?
            #
            #   @return [Boolean, nil]
            optional :s3_force_path_style, Imagekit::Internal::Type::Boolean, api_name: :s3ForcePathStyle

            # @!method initialize(access_key:, bucket:, endpoint:, name:, secret_key:, base_url_for_canonical_header: nil, include_canonical_header: nil, prefix: nil, s3_force_path_style: nil, type: :S3_COMPATIBLE)
            #   @param access_key [String] Access key for the bucket.
            #
            #   @param bucket [String] S3 bucket name.
            #
            #   @param endpoint [String] Custom S3-compatible endpoint.
            #
            #   @param name [String] Display name of the origin.
            #
            #   @param secret_key [String] Secret key for the bucket.
            #
            #   @param base_url_for_canonical_header [String] URL used in the Canonical header (if enabled).
            #
            #   @param include_canonical_header [Boolean] Whether to send a Canonical header.
            #
            #   @param prefix [String] Path prefix inside the bucket.
            #
            #   @param s3_force_path_style [Boolean] Use path-style S3 URLs?
            #
            #   @param type [Symbol, :S3_COMPATIBLE]
          end

          class CloudinaryBackup < Imagekit::Internal::Type::BaseModel
            # @!attribute access_key
            #   Access key for the bucket.
            #
            #   @return [String]
            required :access_key, String, api_name: :accessKey

            # @!attribute bucket
            #   S3 bucket name.
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
            #   @return [Symbol, :CLOUDINARY_BACKUP]
            required :type, const: :CLOUDINARY_BACKUP

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
            #   Path prefix inside the bucket.
            #
            #   @return [String, nil]
            optional :prefix, String

            # @!method initialize(access_key:, bucket:, name:, secret_key:, base_url_for_canonical_header: nil, include_canonical_header: nil, prefix: nil, type: :CLOUDINARY_BACKUP)
            #   @param access_key [String] Access key for the bucket.
            #
            #   @param bucket [String] S3 bucket name.
            #
            #   @param name [String] Display name of the origin.
            #
            #   @param secret_key [String] Secret key for the bucket.
            #
            #   @param base_url_for_canonical_header [String] URL used in the Canonical header (if enabled).
            #
            #   @param include_canonical_header [Boolean] Whether to send a Canonical header.
            #
            #   @param prefix [String] Path prefix inside the bucket.
            #
            #   @param type [Symbol, :CLOUDINARY_BACKUP]
          end

          class WebFolder < Imagekit::Internal::Type::BaseModel
            # @!attribute base_url
            #   Root URL for the web folder origin.
            #
            #   @return [String]
            required :base_url, String, api_name: :baseUrl

            # @!attribute name
            #   Display name of the origin.
            #
            #   @return [String]
            required :name, String

            # @!attribute type
            #
            #   @return [Symbol, :WEB_FOLDER]
            required :type, const: :WEB_FOLDER

            # @!attribute base_url_for_canonical_header
            #   URL used in the Canonical header (if enabled).
            #
            #   @return [String, nil]
            optional :base_url_for_canonical_header, String, api_name: :baseUrlForCanonicalHeader

            # @!attribute forward_host_header_to_origin
            #   Forward the Host header to origin?
            #
            #   @return [Boolean, nil]
            optional :forward_host_header_to_origin,
                     Imagekit::Internal::Type::Boolean,
                     api_name: :forwardHostHeaderToOrigin

            # @!attribute include_canonical_header
            #   Whether to send a Canonical header.
            #
            #   @return [Boolean, nil]
            optional :include_canonical_header,
                     Imagekit::Internal::Type::Boolean,
                     api_name: :includeCanonicalHeader

            # @!method initialize(base_url:, name:, base_url_for_canonical_header: nil, forward_host_header_to_origin: nil, include_canonical_header: nil, type: :WEB_FOLDER)
            #   @param base_url [String] Root URL for the web folder origin.
            #
            #   @param name [String] Display name of the origin.
            #
            #   @param base_url_for_canonical_header [String] URL used in the Canonical header (if enabled).
            #
            #   @param forward_host_header_to_origin [Boolean] Forward the Host header to origin?
            #
            #   @param include_canonical_header [Boolean] Whether to send a Canonical header.
            #
            #   @param type [Symbol, :WEB_FOLDER]
          end

          class WebProxy < Imagekit::Internal::Type::BaseModel
            # @!attribute name
            #   Display name of the origin.
            #
            #   @return [String]
            required :name, String

            # @!attribute type
            #
            #   @return [Symbol, :WEB_PROXY]
            required :type, const: :WEB_PROXY

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

            # @!method initialize(name:, base_url_for_canonical_header: nil, include_canonical_header: nil, type: :WEB_PROXY)
            #   @param name [String] Display name of the origin.
            #
            #   @param base_url_for_canonical_header [String] URL used in the Canonical header (if enabled).
            #
            #   @param include_canonical_header [Boolean] Whether to send a Canonical header.
            #
            #   @param type [Symbol, :WEB_PROXY]
          end

          class Gcs < Imagekit::Internal::Type::BaseModel
            # @!attribute bucket
            #
            #   @return [String]
            required :bucket, String

            # @!attribute client_email
            #
            #   @return [String]
            required :client_email, String, api_name: :clientEmail

            # @!attribute name
            #   Display name of the origin.
            #
            #   @return [String]
            required :name, String

            # @!attribute private_key
            #
            #   @return [String]
            required :private_key, String, api_name: :privateKey

            # @!attribute type
            #
            #   @return [Symbol, :GCS]
            required :type, const: :GCS

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

            # @!method initialize(bucket:, client_email:, name:, private_key:, base_url_for_canonical_header: nil, include_canonical_header: nil, prefix: nil, type: :GCS)
            #   @param bucket [String]
            #
            #   @param client_email [String]
            #
            #   @param name [String] Display name of the origin.
            #
            #   @param private_key [String]
            #
            #   @param base_url_for_canonical_header [String] URL used in the Canonical header (if enabled).
            #
            #   @param include_canonical_header [Boolean] Whether to send a Canonical header.
            #
            #   @param prefix [String]
            #
            #   @param type [Symbol, :GCS]
          end

          class AzureBlob < Imagekit::Internal::Type::BaseModel
            # @!attribute account_name
            #
            #   @return [String]
            required :account_name, String, api_name: :accountName

            # @!attribute container
            #
            #   @return [String]
            required :container, String

            # @!attribute name
            #   Display name of the origin.
            #
            #   @return [String]
            required :name, String

            # @!attribute sas_token
            #
            #   @return [String]
            required :sas_token, String, api_name: :sasToken

            # @!attribute type
            #
            #   @return [Symbol, :AZURE_BLOB]
            required :type, const: :AZURE_BLOB

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

            # @!method initialize(account_name:, container:, name:, sas_token:, base_url_for_canonical_header: nil, include_canonical_header: nil, prefix: nil, type: :AZURE_BLOB)
            #   @param account_name [String]
            #
            #   @param container [String]
            #
            #   @param name [String] Display name of the origin.
            #
            #   @param sas_token [String]
            #
            #   @param base_url_for_canonical_header [String] URL used in the Canonical header (if enabled).
            #
            #   @param include_canonical_header [Boolean] Whether to send a Canonical header.
            #
            #   @param prefix [String]
            #
            #   @param type [Symbol, :AZURE_BLOB]
          end

          class AkeneoPim < Imagekit::Internal::Type::BaseModel
            # @!attribute base_url
            #   Akeneo instance base URL.
            #
            #   @return [String]
            required :base_url, String, api_name: :baseUrl

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

            # @!attribute name
            #   Display name of the origin.
            #
            #   @return [String]
            required :name, String

            # @!attribute password
            #   Akeneo API password.
            #
            #   @return [String]
            required :password, String

            # @!attribute type
            #
            #   @return [Symbol, :AKENEO_PIM]
            required :type, const: :AKENEO_PIM

            # @!attribute username
            #   Akeneo API username.
            #
            #   @return [String]
            required :username, String

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

            # @!method initialize(base_url:, client_id:, client_secret:, name:, password:, username:, base_url_for_canonical_header: nil, include_canonical_header: nil, type: :AKENEO_PIM)
            #   @param base_url [String] Akeneo instance base URL.
            #
            #   @param client_id [String] Akeneo API client ID.
            #
            #   @param client_secret [String] Akeneo API client secret.
            #
            #   @param name [String] Display name of the origin.
            #
            #   @param password [String] Akeneo API password.
            #
            #   @param username [String] Akeneo API username.
            #
            #   @param base_url_for_canonical_header [String] URL used in the Canonical header (if enabled).
            #
            #   @param include_canonical_header [Boolean] Whether to send a Canonical header.
            #
            #   @param type [Symbol, :AKENEO_PIM]
          end

          # @!method self.variants
          #   @return [Array(Imagekit::Models::Accounts::OriginUpdateParams::Origin::S3, Imagekit::Models::Accounts::OriginUpdateParams::Origin::S3Compatible, Imagekit::Models::Accounts::OriginUpdateParams::Origin::CloudinaryBackup, Imagekit::Models::Accounts::OriginUpdateParams::Origin::WebFolder, Imagekit::Models::Accounts::OriginUpdateParams::Origin::WebProxy, Imagekit::Models::Accounts::OriginUpdateParams::Origin::Gcs, Imagekit::Models::Accounts::OriginUpdateParams::Origin::AzureBlob, Imagekit::Models::Accounts::OriginUpdateParams::Origin::AkeneoPim)]
        end
      end
    end
  end
end
