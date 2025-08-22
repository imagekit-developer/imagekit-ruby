# typed: strong

module Imagekit
  module Models
    module Accounts
      class OriginUpdateParams < Imagekit::Internal::Type::BaseModel
        extend Imagekit::Internal::Type::RequestParameters::Converter
        include Imagekit::Internal::Type::RequestParameters

        OrHash =
          T.type_alias do
            T.any(
              Imagekit::Accounts::OriginUpdateParams,
              Imagekit::Internal::AnyHash
            )
          end

        # Access key for the bucket.
        sig { returns(String) }
        attr_accessor :access_key

        sig { returns(String) }
        attr_accessor :bucket

        # Display name of the origin.
        sig { returns(String) }
        attr_accessor :name

        # Secret key for the bucket.
        sig { returns(String) }
        attr_accessor :secret_key

        sig { returns(Imagekit::Accounts::OriginUpdateParams::Type::OrSymbol) }
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

        # Custom S3-compatible endpoint.
        sig { returns(String) }
        attr_accessor :endpoint

        # Use path-style S3 URLs?
        sig { returns(T.nilable(T::Boolean)) }
        attr_reader :s3_force_path_style

        sig { params(s3_force_path_style: T::Boolean).void }
        attr_writer :s3_force_path_style

        # Akeneo instance base URL.
        sig { returns(String) }
        attr_accessor :base_url

        # Forward the Host header to origin?
        sig { returns(T.nilable(T::Boolean)) }
        attr_reader :forward_host_header_to_origin

        sig { params(forward_host_header_to_origin: T::Boolean).void }
        attr_writer :forward_host_header_to_origin

        sig { returns(String) }
        attr_accessor :client_email

        sig { returns(String) }
        attr_accessor :private_key

        sig { returns(String) }
        attr_accessor :account_name

        sig { returns(String) }
        attr_accessor :container

        sig { returns(String) }
        attr_accessor :sas_token

        # Akeneo API client ID.
        sig { returns(String) }
        attr_accessor :client_id

        # Akeneo API client secret.
        sig { returns(String) }
        attr_accessor :client_secret

        # Akeneo API password.
        sig { returns(String) }
        attr_accessor :password

        # Akeneo API username.
        sig { returns(String) }
        attr_accessor :username

        sig do
          params(
            access_key: String,
            bucket: String,
            name: String,
            secret_key: String,
            type: Imagekit::Accounts::OriginUpdateParams::Type::OrSymbol,
            endpoint: String,
            base_url: String,
            client_email: String,
            private_key: String,
            account_name: String,
            container: String,
            sas_token: String,
            client_id: String,
            client_secret: String,
            password: String,
            username: String,
            base_url_for_canonical_header: String,
            include_canonical_header: T::Boolean,
            prefix: String,
            s3_force_path_style: T::Boolean,
            forward_host_header_to_origin: T::Boolean,
            request_options: Imagekit::RequestOptions::OrHash
          ).returns(T.attached_class)
        end
        def self.new(
          # Access key for the bucket.
          access_key:,
          bucket:,
          # Display name of the origin.
          name:,
          # Secret key for the bucket.
          secret_key:,
          type:,
          # Custom S3-compatible endpoint.
          endpoint:,
          # Akeneo instance base URL.
          base_url:,
          client_email:,
          private_key:,
          account_name:,
          container:,
          sas_token:,
          # Akeneo API client ID.
          client_id:,
          # Akeneo API client secret.
          client_secret:,
          # Akeneo API password.
          password:,
          # Akeneo API username.
          username:,
          # URL used in the Canonical header (if enabled).
          base_url_for_canonical_header: nil,
          # Whether to send a Canonical header.
          include_canonical_header: nil,
          prefix: nil,
          # Use path-style S3 URLs?
          s3_force_path_style: nil,
          # Forward the Host header to origin?
          forward_host_header_to_origin: nil,
          request_options: {}
        )
        end

        sig do
          override.returns(
            {
              access_key: String,
              bucket: String,
              name: String,
              secret_key: String,
              type: Imagekit::Accounts::OriginUpdateParams::Type::OrSymbol,
              base_url_for_canonical_header: String,
              include_canonical_header: T::Boolean,
              prefix: String,
              endpoint: String,
              s3_force_path_style: T::Boolean,
              base_url: String,
              forward_host_header_to_origin: T::Boolean,
              client_email: String,
              private_key: String,
              account_name: String,
              container: String,
              sas_token: String,
              client_id: String,
              client_secret: String,
              password: String,
              username: String,
              request_options: Imagekit::RequestOptions
            }
          )
        end
        def to_hash
        end

        module Type
          extend Imagekit::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(Symbol, Imagekit::Accounts::OriginUpdateParams::Type)
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          AKENEO_PIM =
            T.let(
              :AKENEO_PIM,
              Imagekit::Accounts::OriginUpdateParams::Type::TaggedSymbol
            )
          S3 =
            T.let(
              :S3,
              Imagekit::Accounts::OriginUpdateParams::Type::TaggedSymbol
            )
          S3_COMPATIBLE =
            T.let(
              :S3_COMPATIBLE,
              Imagekit::Accounts::OriginUpdateParams::Type::TaggedSymbol
            )
          CLOUDINARY_BACKUP =
            T.let(
              :CLOUDINARY_BACKUP,
              Imagekit::Accounts::OriginUpdateParams::Type::TaggedSymbol
            )
          WEB_FOLDER =
            T.let(
              :WEB_FOLDER,
              Imagekit::Accounts::OriginUpdateParams::Type::TaggedSymbol
            )
          WEB_PROXY =
            T.let(
              :WEB_PROXY,
              Imagekit::Accounts::OriginUpdateParams::Type::TaggedSymbol
            )
          GCS =
            T.let(
              :GCS,
              Imagekit::Accounts::OriginUpdateParams::Type::TaggedSymbol
            )
          AZURE_BLOB =
            T.let(
              :AZURE_BLOB,
              Imagekit::Accounts::OriginUpdateParams::Type::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                Imagekit::Accounts::OriginUpdateParams::Type::TaggedSymbol
              ]
            )
          end
          def self.values
          end
        end
      end
    end
  end
end
