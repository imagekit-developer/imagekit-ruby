# typed: strong

module Imagekitio
  module Models
    module Accounts
      class URLEndpointRequest < Imagekitio::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Imagekitio::Accounts::URLEndpointRequest,
              Imagekitio::Internal::AnyHash
            )
          end

        # Description of the URL endpoint.
        sig { returns(String) }
        attr_accessor :description

        # Ordered list of origin IDs to try when the file isn’t in the Media Library;
        # ImageKit checks them in the sequence provided. Origin must be created before it
        # can be used in a URL endpoint.
        sig { returns(T.nilable(T::Array[String])) }
        attr_reader :origins

        sig { params(origins: T::Array[String]).void }
        attr_writer :origins

        # Path segment appended to your base URL to form the endpoint (letters, digits,
        # and hyphens only — or empty for the default endpoint).
        sig { returns(T.nilable(String)) }
        attr_reader :url_prefix

        sig { params(url_prefix: String).void }
        attr_writer :url_prefix

        # Configuration for third-party URL rewriting.
        sig do
          returns(
            T.nilable(
              T.any(
                Imagekitio::Accounts::URLEndpointRequest::URLRewriter::Cloudinary,
                Imagekitio::Accounts::URLEndpointRequest::URLRewriter::Imgix,
                Imagekitio::Accounts::URLEndpointRequest::URLRewriter::Akamai
              )
            )
          )
        end
        attr_reader :url_rewriter

        sig do
          params(
            url_rewriter:
              T.any(
                Imagekitio::Accounts::URLEndpointRequest::URLRewriter::Cloudinary::OrHash,
                Imagekitio::Accounts::URLEndpointRequest::URLRewriter::Imgix::OrHash,
                Imagekitio::Accounts::URLEndpointRequest::URLRewriter::Akamai::OrHash
              )
          ).void
        end
        attr_writer :url_rewriter

        # Schema for URL endpoint resource.
        sig do
          params(
            description: String,
            origins: T::Array[String],
            url_prefix: String,
            url_rewriter:
              T.any(
                Imagekitio::Accounts::URLEndpointRequest::URLRewriter::Cloudinary::OrHash,
                Imagekitio::Accounts::URLEndpointRequest::URLRewriter::Imgix::OrHash,
                Imagekitio::Accounts::URLEndpointRequest::URLRewriter::Akamai::OrHash
              )
          ).returns(T.attached_class)
        end
        def self.new(
          # Description of the URL endpoint.
          description:,
          # Ordered list of origin IDs to try when the file isn’t in the Media Library;
          # ImageKit checks them in the sequence provided. Origin must be created before it
          # can be used in a URL endpoint.
          origins: nil,
          # Path segment appended to your base URL to form the endpoint (letters, digits,
          # and hyphens only — or empty for the default endpoint).
          url_prefix: nil,
          # Configuration for third-party URL rewriting.
          url_rewriter: nil
        )
        end

        sig do
          override.returns(
            {
              description: String,
              origins: T::Array[String],
              url_prefix: String,
              url_rewriter:
                T.any(
                  Imagekitio::Accounts::URLEndpointRequest::URLRewriter::Cloudinary,
                  Imagekitio::Accounts::URLEndpointRequest::URLRewriter::Imgix,
                  Imagekitio::Accounts::URLEndpointRequest::URLRewriter::Akamai
                )
            }
          )
        end
        def to_hash
        end

        # Configuration for third-party URL rewriting.
        module URLRewriter
          extend Imagekitio::Internal::Type::Union

          Variants =
            T.type_alias do
              T.any(
                Imagekitio::Accounts::URLEndpointRequest::URLRewriter::Cloudinary,
                Imagekitio::Accounts::URLEndpointRequest::URLRewriter::Imgix,
                Imagekitio::Accounts::URLEndpointRequest::URLRewriter::Akamai
              )
            end

          class Cloudinary < Imagekitio::Internal::Type::BaseModel
            OrHash =
              T.type_alias do
                T.any(
                  Imagekitio::Accounts::URLEndpointRequest::URLRewriter::Cloudinary,
                  Imagekitio::Internal::AnyHash
                )
              end

            sig { returns(Symbol) }
            attr_accessor :type

            # Whether to preserve `<asset_type>/<delivery_type>` in the rewritten URL.
            sig { returns(T.nilable(T::Boolean)) }
            attr_reader :preserve_asset_delivery_types

            sig { params(preserve_asset_delivery_types: T::Boolean).void }
            attr_writer :preserve_asset_delivery_types

            sig do
              params(
                preserve_asset_delivery_types: T::Boolean,
                type: Symbol
              ).returns(T.attached_class)
            end
            def self.new(
              # Whether to preserve `<asset_type>/<delivery_type>` in the rewritten URL.
              preserve_asset_delivery_types: nil,
              type: :CLOUDINARY
            )
            end

            sig do
              override.returns(
                { type: Symbol, preserve_asset_delivery_types: T::Boolean }
              )
            end
            def to_hash
            end
          end

          class Imgix < Imagekitio::Internal::Type::BaseModel
            OrHash =
              T.type_alias do
                T.any(
                  Imagekitio::Accounts::URLEndpointRequest::URLRewriter::Imgix,
                  Imagekitio::Internal::AnyHash
                )
              end

            sig { returns(Symbol) }
            attr_accessor :type

            sig { params(type: Symbol).returns(T.attached_class) }
            def self.new(type: :IMGIX)
            end

            sig { override.returns({ type: Symbol }) }
            def to_hash
            end
          end

          class Akamai < Imagekitio::Internal::Type::BaseModel
            OrHash =
              T.type_alias do
                T.any(
                  Imagekitio::Accounts::URLEndpointRequest::URLRewriter::Akamai,
                  Imagekitio::Internal::AnyHash
                )
              end

            sig { returns(Symbol) }
            attr_accessor :type

            sig { params(type: Symbol).returns(T.attached_class) }
            def self.new(type: :AKAMAI)
            end

            sig { override.returns({ type: Symbol }) }
            def to_hash
            end
          end

          sig do
            override.returns(
              T::Array[
                Imagekitio::Accounts::URLEndpointRequest::URLRewriter::Variants
              ]
            )
          end
          def self.variants
          end
        end
      end
    end
  end
end
