# typed: strong

module Imagekitio
  module Models
    module Accounts
      # Schema for origin request resources.
      module OriginRequest
        extend Imagekitio::Internal::Type::Union

        Variants =
          T.type_alias do
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
          end

        class S3 < Imagekitio::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Imagekitio::Accounts::OriginRequest::S3,
                Imagekitio::Internal::AnyHash
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

        class S3Compatible < Imagekitio::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Imagekitio::Accounts::OriginRequest::S3Compatible,
                Imagekitio::Internal::AnyHash
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

        class CloudinaryBackup < Imagekitio::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Imagekitio::Accounts::OriginRequest::CloudinaryBackup,
                Imagekitio::Internal::AnyHash
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

        class WebFolder < Imagekitio::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Imagekitio::Accounts::OriginRequest::WebFolder,
                Imagekitio::Internal::AnyHash
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

        class WebProxy < Imagekitio::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Imagekitio::Accounts::OriginRequest::WebProxy,
                Imagekitio::Internal::AnyHash
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

        class Gcs < Imagekitio::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Imagekitio::Accounts::OriginRequest::Gcs,
                Imagekitio::Internal::AnyHash
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

        class AzureBlob < Imagekitio::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Imagekitio::Accounts::OriginRequest::AzureBlob,
                Imagekitio::Internal::AnyHash
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

        class AkeneoPim < Imagekitio::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Imagekitio::Accounts::OriginRequest::AkeneoPim,
                Imagekitio::Internal::AnyHash
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
            T::Array[Imagekitio::Accounts::OriginRequest::Variants]
          )
        end
        def self.variants
        end
      end
    end
  end
end
