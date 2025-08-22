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

        # Schema for origin resources.
        sig do
          returns(
            T.any(
              Imagekit::Accounts::OriginCreateParams::Origin::S3,
              Imagekit::Accounts::OriginCreateParams::Origin::S3Compatible,
              Imagekit::Accounts::OriginCreateParams::Origin::CloudinaryBackup,
              Imagekit::Accounts::OriginCreateParams::Origin::WebFolder,
              Imagekit::Accounts::OriginCreateParams::Origin::WebProxy,
              Imagekit::Accounts::OriginCreateParams::Origin::GoogleCloudStorageGcs,
              Imagekit::Accounts::OriginCreateParams::Origin::AzureBlobStorage,
              Imagekit::Accounts::OriginCreateParams::Origin::AkeneoPim
            )
          )
        end
        attr_accessor :origin

        sig do
          params(
            origin:
              T.any(
                Imagekit::Accounts::OriginCreateParams::Origin::S3::OrHash,
                Imagekit::Accounts::OriginCreateParams::Origin::S3Compatible::OrHash,
                Imagekit::Accounts::OriginCreateParams::Origin::CloudinaryBackup::OrHash,
                Imagekit::Accounts::OriginCreateParams::Origin::WebFolder::OrHash,
                Imagekit::Accounts::OriginCreateParams::Origin::WebProxy::OrHash,
                Imagekit::Accounts::OriginCreateParams::Origin::GoogleCloudStorageGcs::OrHash,
                Imagekit::Accounts::OriginCreateParams::Origin::AzureBlobStorage::OrHash,
                Imagekit::Accounts::OriginCreateParams::Origin::AkeneoPim::OrHash
              ),
            request_options: Imagekit::RequestOptions::OrHash
          ).returns(T.attached_class)
        end
        def self.new(
          # Schema for origin resources.
          origin:,
          request_options: {}
        )
        end

        sig do
          override.returns(
            {
              origin:
                T.any(
                  Imagekit::Accounts::OriginCreateParams::Origin::S3,
                  Imagekit::Accounts::OriginCreateParams::Origin::S3Compatible,
                  Imagekit::Accounts::OriginCreateParams::Origin::CloudinaryBackup,
                  Imagekit::Accounts::OriginCreateParams::Origin::WebFolder,
                  Imagekit::Accounts::OriginCreateParams::Origin::WebProxy,
                  Imagekit::Accounts::OriginCreateParams::Origin::GoogleCloudStorageGcs,
                  Imagekit::Accounts::OriginCreateParams::Origin::AzureBlobStorage,
                  Imagekit::Accounts::OriginCreateParams::Origin::AkeneoPim
                ),
              request_options: Imagekit::RequestOptions
            }
          )
        end
        def to_hash
        end

        # Schema for origin resources.
        module Origin
          extend Imagekit::Internal::Type::Union

          Variants =
            T.type_alias do
              T.any(
                Imagekit::Accounts::OriginCreateParams::Origin::S3,
                Imagekit::Accounts::OriginCreateParams::Origin::S3Compatible,
                Imagekit::Accounts::OriginCreateParams::Origin::CloudinaryBackup,
                Imagekit::Accounts::OriginCreateParams::Origin::WebFolder,
                Imagekit::Accounts::OriginCreateParams::Origin::WebProxy,
                Imagekit::Accounts::OriginCreateParams::Origin::GoogleCloudStorageGcs,
                Imagekit::Accounts::OriginCreateParams::Origin::AzureBlobStorage,
                Imagekit::Accounts::OriginCreateParams::Origin::AkeneoPim
              )
            end

          class S3 < Imagekit::Internal::Type::BaseModel
            OrHash =
              T.type_alias do
                T.any(
                  Imagekit::Accounts::OriginCreateParams::Origin::S3,
                  Imagekit::Internal::AnyHash
                )
              end

            # Access key for the bucket.
            sig { returns(String) }
            attr_accessor :access_key

            # S3 bucket name.
            sig { returns(String) }
            attr_accessor :bucket

            # Display name of the origin.
            sig { returns(String) }
            attr_accessor :name

            # Secret key for the bucket.
            sig { returns(String) }
            attr_accessor :secret_key

            sig { returns(Symbol) }
            attr_accessor :type

            # URL used in the Canonical header (if enabled).
            sig { returns(T.nilable(String)) }
            attr_reader :base_url_for_canonical_header

            sig { params(base_url_for_canonical_header: String).void }
            attr_writer :base_url_for_canonical_header

            # Whether to send a Canonical header.
            sig { returns(T.nilable(T::Boolean)) }
            attr_reader :include_canonical_header

            sig { params(include_canonical_header: T::Boolean).void }
            attr_writer :include_canonical_header

            # Path prefix inside the bucket.
            sig { returns(T.nilable(String)) }
            attr_reader :prefix

            sig { params(prefix: String).void }
            attr_writer :prefix

            sig do
              params(
                access_key: String,
                bucket: String,
                name: String,
                secret_key: String,
                base_url_for_canonical_header: String,
                include_canonical_header: T::Boolean,
                prefix: String,
                type: Symbol
              ).returns(T.attached_class)
            end
            def self.new(
              # Access key for the bucket.
              access_key:,
              # S3 bucket name.
              bucket:,
              # Display name of the origin.
              name:,
              # Secret key for the bucket.
              secret_key:,
              # URL used in the Canonical header (if enabled).
              base_url_for_canonical_header: nil,
              # Whether to send a Canonical header.
              include_canonical_header: nil,
              # Path prefix inside the bucket.
              prefix: nil,
              type: :S3
            )
            end

            sig do
              override.returns(
                {
                  access_key: String,
                  bucket: String,
                  name: String,
                  secret_key: String,
                  type: Symbol,
                  base_url_for_canonical_header: String,
                  include_canonical_header: T::Boolean,
                  prefix: String
                }
              )
            end
            def to_hash
            end
          end

          class S3Compatible < Imagekit::Internal::Type::BaseModel
            OrHash =
              T.type_alias do
                T.any(
                  Imagekit::Accounts::OriginCreateParams::Origin::S3Compatible,
                  Imagekit::Internal::AnyHash
                )
              end

            # Access key for the bucket.
            sig { returns(String) }
            attr_accessor :access_key

            # S3 bucket name.
            sig { returns(String) }
            attr_accessor :bucket

            # Custom S3-compatible endpoint.
            sig { returns(String) }
            attr_accessor :endpoint

            # Display name of the origin.
            sig { returns(String) }
            attr_accessor :name

            # Secret key for the bucket.
            sig { returns(String) }
            attr_accessor :secret_key

            sig { returns(Symbol) }
            attr_accessor :type

            # URL used in the Canonical header (if enabled).
            sig { returns(T.nilable(String)) }
            attr_reader :base_url_for_canonical_header

            sig { params(base_url_for_canonical_header: String).void }
            attr_writer :base_url_for_canonical_header

            # Whether to send a Canonical header.
            sig { returns(T.nilable(T::Boolean)) }
            attr_reader :include_canonical_header

            sig { params(include_canonical_header: T::Boolean).void }
            attr_writer :include_canonical_header

            # Path prefix inside the bucket.
            sig { returns(T.nilable(String)) }
            attr_reader :prefix

            sig { params(prefix: String).void }
            attr_writer :prefix

            # Use path-style S3 URLs?
            sig { returns(T.nilable(T::Boolean)) }
            attr_reader :s3_force_path_style

            sig { params(s3_force_path_style: T::Boolean).void }
            attr_writer :s3_force_path_style

            sig do
              params(
                access_key: String,
                bucket: String,
                endpoint: String,
                name: String,
                secret_key: String,
                base_url_for_canonical_header: String,
                include_canonical_header: T::Boolean,
                prefix: String,
                s3_force_path_style: T::Boolean,
                type: Symbol
              ).returns(T.attached_class)
            end
            def self.new(
              # Access key for the bucket.
              access_key:,
              # S3 bucket name.
              bucket:,
              # Custom S3-compatible endpoint.
              endpoint:,
              # Display name of the origin.
              name:,
              # Secret key for the bucket.
              secret_key:,
              # URL used in the Canonical header (if enabled).
              base_url_for_canonical_header: nil,
              # Whether to send a Canonical header.
              include_canonical_header: nil,
              # Path prefix inside the bucket.
              prefix: nil,
              # Use path-style S3 URLs?
              s3_force_path_style: nil,
              type: :S3_COMPATIBLE
            )
            end

            sig do
              override.returns(
                {
                  access_key: String,
                  bucket: String,
                  endpoint: String,
                  name: String,
                  secret_key: String,
                  type: Symbol,
                  base_url_for_canonical_header: String,
                  include_canonical_header: T::Boolean,
                  prefix: String,
                  s3_force_path_style: T::Boolean
                }
              )
            end
            def to_hash
            end
          end

          class CloudinaryBackup < Imagekit::Internal::Type::BaseModel
            OrHash =
              T.type_alias do
                T.any(
                  Imagekit::Accounts::OriginCreateParams::Origin::CloudinaryBackup,
                  Imagekit::Internal::AnyHash
                )
              end

            # Access key for the bucket.
            sig { returns(String) }
            attr_accessor :access_key

            # S3 bucket name.
            sig { returns(String) }
            attr_accessor :bucket

            # Display name of the origin.
            sig { returns(String) }
            attr_accessor :name

            # Secret key for the bucket.
            sig { returns(String) }
            attr_accessor :secret_key

            sig { returns(Symbol) }
            attr_accessor :type

            # URL used in the Canonical header (if enabled).
            sig { returns(T.nilable(String)) }
            attr_reader :base_url_for_canonical_header

            sig { params(base_url_for_canonical_header: String).void }
            attr_writer :base_url_for_canonical_header

            # Whether to send a Canonical header.
            sig { returns(T.nilable(T::Boolean)) }
            attr_reader :include_canonical_header

            sig { params(include_canonical_header: T::Boolean).void }
            attr_writer :include_canonical_header

            # Path prefix inside the bucket.
            sig { returns(T.nilable(String)) }
            attr_reader :prefix

            sig { params(prefix: String).void }
            attr_writer :prefix

            sig do
              params(
                access_key: String,
                bucket: String,
                name: String,
                secret_key: String,
                base_url_for_canonical_header: String,
                include_canonical_header: T::Boolean,
                prefix: String,
                type: Symbol
              ).returns(T.attached_class)
            end
            def self.new(
              # Access key for the bucket.
              access_key:,
              # S3 bucket name.
              bucket:,
              # Display name of the origin.
              name:,
              # Secret key for the bucket.
              secret_key:,
              # URL used in the Canonical header (if enabled).
              base_url_for_canonical_header: nil,
              # Whether to send a Canonical header.
              include_canonical_header: nil,
              # Path prefix inside the bucket.
              prefix: nil,
              type: :CLOUDINARY_BACKUP
            )
            end

            sig do
              override.returns(
                {
                  access_key: String,
                  bucket: String,
                  name: String,
                  secret_key: String,
                  type: Symbol,
                  base_url_for_canonical_header: String,
                  include_canonical_header: T::Boolean,
                  prefix: String
                }
              )
            end
            def to_hash
            end
          end

          class WebFolder < Imagekit::Internal::Type::BaseModel
            OrHash =
              T.type_alias do
                T.any(
                  Imagekit::Accounts::OriginCreateParams::Origin::WebFolder,
                  Imagekit::Internal::AnyHash
                )
              end

            # Root URL for the web folder origin.
            sig { returns(String) }
            attr_accessor :base_url

            # Display name of the origin.
            sig { returns(String) }
            attr_accessor :name

            sig { returns(Symbol) }
            attr_accessor :type

            # URL used in the Canonical header (if enabled).
            sig { returns(T.nilable(String)) }
            attr_reader :base_url_for_canonical_header

            sig { params(base_url_for_canonical_header: String).void }
            attr_writer :base_url_for_canonical_header

            # Forward the Host header to origin?
            sig { returns(T.nilable(T::Boolean)) }
            attr_reader :forward_host_header_to_origin

            sig { params(forward_host_header_to_origin: T::Boolean).void }
            attr_writer :forward_host_header_to_origin

            # Whether to send a Canonical header.
            sig { returns(T.nilable(T::Boolean)) }
            attr_reader :include_canonical_header

            sig { params(include_canonical_header: T::Boolean).void }
            attr_writer :include_canonical_header

            sig do
              params(
                base_url: String,
                name: String,
                base_url_for_canonical_header: String,
                forward_host_header_to_origin: T::Boolean,
                include_canonical_header: T::Boolean,
                type: Symbol
              ).returns(T.attached_class)
            end
            def self.new(
              # Root URL for the web folder origin.
              base_url:,
              # Display name of the origin.
              name:,
              # URL used in the Canonical header (if enabled).
              base_url_for_canonical_header: nil,
              # Forward the Host header to origin?
              forward_host_header_to_origin: nil,
              # Whether to send a Canonical header.
              include_canonical_header: nil,
              type: :WEB_FOLDER
            )
            end

            sig do
              override.returns(
                {
                  base_url: String,
                  name: String,
                  type: Symbol,
                  base_url_for_canonical_header: String,
                  forward_host_header_to_origin: T::Boolean,
                  include_canonical_header: T::Boolean
                }
              )
            end
            def to_hash
            end
          end

          class WebProxy < Imagekit::Internal::Type::BaseModel
            OrHash =
              T.type_alias do
                T.any(
                  Imagekit::Accounts::OriginCreateParams::Origin::WebProxy,
                  Imagekit::Internal::AnyHash
                )
              end

            # Display name of the origin.
            sig { returns(String) }
            attr_accessor :name

            sig { returns(Symbol) }
            attr_accessor :type

            # URL used in the Canonical header (if enabled).
            sig { returns(T.nilable(String)) }
            attr_reader :base_url_for_canonical_header

            sig { params(base_url_for_canonical_header: String).void }
            attr_writer :base_url_for_canonical_header

            # Whether to send a Canonical header.
            sig { returns(T.nilable(T::Boolean)) }
            attr_reader :include_canonical_header

            sig { params(include_canonical_header: T::Boolean).void }
            attr_writer :include_canonical_header

            sig do
              params(
                name: String,
                base_url_for_canonical_header: String,
                include_canonical_header: T::Boolean,
                type: Symbol
              ).returns(T.attached_class)
            end
            def self.new(
              # Display name of the origin.
              name:,
              # URL used in the Canonical header (if enabled).
              base_url_for_canonical_header: nil,
              # Whether to send a Canonical header.
              include_canonical_header: nil,
              type: :WEB_PROXY
            )
            end

            sig do
              override.returns(
                {
                  name: String,
                  type: Symbol,
                  base_url_for_canonical_header: String,
                  include_canonical_header: T::Boolean
                }
              )
            end
            def to_hash
            end
          end

          class GoogleCloudStorageGcs < Imagekit::Internal::Type::BaseModel
            OrHash =
              T.type_alias do
                T.any(
                  Imagekit::Accounts::OriginCreateParams::Origin::GoogleCloudStorageGcs,
                  Imagekit::Internal::AnyHash
                )
              end

            sig { returns(String) }
            attr_accessor :bucket

            sig { returns(String) }
            attr_accessor :client_email

            # Display name of the origin.
            sig { returns(String) }
            attr_accessor :name

            sig { returns(String) }
            attr_accessor :private_key

            sig { returns(Symbol) }
            attr_accessor :type

            # URL used in the Canonical header (if enabled).
            sig { returns(T.nilable(String)) }
            attr_reader :base_url_for_canonical_header

            sig { params(base_url_for_canonical_header: String).void }
            attr_writer :base_url_for_canonical_header

            # Whether to send a Canonical header.
            sig { returns(T.nilable(T::Boolean)) }
            attr_reader :include_canonical_header

            sig { params(include_canonical_header: T::Boolean).void }
            attr_writer :include_canonical_header

            sig { returns(T.nilable(String)) }
            attr_reader :prefix

            sig { params(prefix: String).void }
            attr_writer :prefix

            sig do
              params(
                bucket: String,
                client_email: String,
                name: String,
                private_key: String,
                base_url_for_canonical_header: String,
                include_canonical_header: T::Boolean,
                prefix: String,
                type: Symbol
              ).returns(T.attached_class)
            end
            def self.new(
              bucket:,
              client_email:,
              # Display name of the origin.
              name:,
              private_key:,
              # URL used in the Canonical header (if enabled).
              base_url_for_canonical_header: nil,
              # Whether to send a Canonical header.
              include_canonical_header: nil,
              prefix: nil,
              type: :GCS
            )
            end

            sig do
              override.returns(
                {
                  bucket: String,
                  client_email: String,
                  name: String,
                  private_key: String,
                  type: Symbol,
                  base_url_for_canonical_header: String,
                  include_canonical_header: T::Boolean,
                  prefix: String
                }
              )
            end
            def to_hash
            end
          end

          class AzureBlobStorage < Imagekit::Internal::Type::BaseModel
            OrHash =
              T.type_alias do
                T.any(
                  Imagekit::Accounts::OriginCreateParams::Origin::AzureBlobStorage,
                  Imagekit::Internal::AnyHash
                )
              end

            sig { returns(String) }
            attr_accessor :account_name

            sig { returns(String) }
            attr_accessor :container

            # Display name of the origin.
            sig { returns(String) }
            attr_accessor :name

            sig { returns(String) }
            attr_accessor :sas_token

            sig { returns(Symbol) }
            attr_accessor :type

            # URL used in the Canonical header (if enabled).
            sig { returns(T.nilable(String)) }
            attr_reader :base_url_for_canonical_header

            sig { params(base_url_for_canonical_header: String).void }
            attr_writer :base_url_for_canonical_header

            # Whether to send a Canonical header.
            sig { returns(T.nilable(T::Boolean)) }
            attr_reader :include_canonical_header

            sig { params(include_canonical_header: T::Boolean).void }
            attr_writer :include_canonical_header

            sig { returns(T.nilable(String)) }
            attr_reader :prefix

            sig { params(prefix: String).void }
            attr_writer :prefix

            sig do
              params(
                account_name: String,
                container: String,
                name: String,
                sas_token: String,
                base_url_for_canonical_header: String,
                include_canonical_header: T::Boolean,
                prefix: String,
                type: Symbol
              ).returns(T.attached_class)
            end
            def self.new(
              account_name:,
              container:,
              # Display name of the origin.
              name:,
              sas_token:,
              # URL used in the Canonical header (if enabled).
              base_url_for_canonical_header: nil,
              # Whether to send a Canonical header.
              include_canonical_header: nil,
              prefix: nil,
              type: :AZURE_BLOB
            )
            end

            sig do
              override.returns(
                {
                  account_name: String,
                  container: String,
                  name: String,
                  sas_token: String,
                  type: Symbol,
                  base_url_for_canonical_header: String,
                  include_canonical_header: T::Boolean,
                  prefix: String
                }
              )
            end
            def to_hash
            end
          end

          class AkeneoPim < Imagekit::Internal::Type::BaseModel
            OrHash =
              T.type_alias do
                T.any(
                  Imagekit::Accounts::OriginCreateParams::Origin::AkeneoPim,
                  Imagekit::Internal::AnyHash
                )
              end

            # Akeneo instance base URL.
            sig { returns(String) }
            attr_accessor :base_url

            # Akeneo API client ID.
            sig { returns(String) }
            attr_accessor :client_id

            # Akeneo API client secret.
            sig { returns(String) }
            attr_accessor :client_secret

            # Display name of the origin.
            sig { returns(String) }
            attr_accessor :name

            # Akeneo API password.
            sig { returns(String) }
            attr_accessor :password

            sig { returns(Symbol) }
            attr_accessor :type

            # Akeneo API username.
            sig { returns(String) }
            attr_accessor :username

            # URL used in the Canonical header (if enabled).
            sig { returns(T.nilable(String)) }
            attr_reader :base_url_for_canonical_header

            sig { params(base_url_for_canonical_header: String).void }
            attr_writer :base_url_for_canonical_header

            # Whether to send a Canonical header.
            sig { returns(T.nilable(T::Boolean)) }
            attr_reader :include_canonical_header

            sig { params(include_canonical_header: T::Boolean).void }
            attr_writer :include_canonical_header

            sig do
              params(
                base_url: String,
                client_id: String,
                client_secret: String,
                name: String,
                password: String,
                username: String,
                base_url_for_canonical_header: String,
                include_canonical_header: T::Boolean,
                type: Symbol
              ).returns(T.attached_class)
            end
            def self.new(
              # Akeneo instance base URL.
              base_url:,
              # Akeneo API client ID.
              client_id:,
              # Akeneo API client secret.
              client_secret:,
              # Display name of the origin.
              name:,
              # Akeneo API password.
              password:,
              # Akeneo API username.
              username:,
              # URL used in the Canonical header (if enabled).
              base_url_for_canonical_header: nil,
              # Whether to send a Canonical header.
              include_canonical_header: nil,
              type: :AKENEO_PIM
            )
            end

            sig do
              override.returns(
                {
                  base_url: String,
                  client_id: String,
                  client_secret: String,
                  name: String,
                  password: String,
                  type: Symbol,
                  username: String,
                  base_url_for_canonical_header: String,
                  include_canonical_header: T::Boolean
                }
              )
            end
            def to_hash
            end
          end

          sig do
            override.returns(
              T::Array[Imagekit::Accounts::OriginCreateParams::Origin::Variants]
            )
          end
          def self.variants
          end
        end
      end
    end
  end
end
