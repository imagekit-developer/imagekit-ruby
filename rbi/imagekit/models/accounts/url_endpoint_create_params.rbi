# typed: strong

module Imagekit
  module Models
    module Accounts
      class URLEndpointCreateParams < Imagekit::Internal::Type::BaseModel
        extend Imagekit::Internal::Type::RequestParameters::Converter
        include Imagekit::Internal::Type::RequestParameters

        OrHash =
          T.type_alias do
            T.any(
              Imagekit::Accounts::URLEndpointCreateParams,
              Imagekit::Internal::AnyHash
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
                Imagekit::Accounts::URLEndpointCreateParams::URLRewriter::CloudinaryURLRewriter,
                Imagekit::Accounts::URLEndpointCreateParams::URLRewriter::ImgixURLRewriter,
                Imagekit::Accounts::URLEndpointCreateParams::URLRewriter::AkamaiURLRewriter
              )
            )
          )
        end
        attr_reader :url_rewriter

        sig do
          params(
            url_rewriter:
              T.any(
                Imagekit::Accounts::URLEndpointCreateParams::URLRewriter::CloudinaryURLRewriter::OrHash,
                Imagekit::Accounts::URLEndpointCreateParams::URLRewriter::ImgixURLRewriter::OrHash,
                Imagekit::Accounts::URLEndpointCreateParams::URLRewriter::AkamaiURLRewriter::OrHash
              )
          ).void
        end
        attr_writer :url_rewriter

        sig do
          params(
            description: String,
            origins: T::Array[String],
            url_prefix: String,
            url_rewriter:
              T.any(
                Imagekit::Accounts::URLEndpointCreateParams::URLRewriter::CloudinaryURLRewriter::OrHash,
                Imagekit::Accounts::URLEndpointCreateParams::URLRewriter::ImgixURLRewriter::OrHash,
                Imagekit::Accounts::URLEndpointCreateParams::URLRewriter::AkamaiURLRewriter::OrHash
              ),
            request_options: Imagekit::RequestOptions::OrHash
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
          url_rewriter: nil,
          request_options: {}
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
                  Imagekit::Accounts::URLEndpointCreateParams::URLRewriter::CloudinaryURLRewriter,
                  Imagekit::Accounts::URLEndpointCreateParams::URLRewriter::ImgixURLRewriter,
                  Imagekit::Accounts::URLEndpointCreateParams::URLRewriter::AkamaiURLRewriter
                ),
              request_options: Imagekit::RequestOptions
            }
          )
        end
        def to_hash
        end

        # Configuration for third-party URL rewriting.
        module URLRewriter
          extend Imagekit::Internal::Type::Union

          Variants =
            T.type_alias do
              T.any(
                Imagekit::Accounts::URLEndpointCreateParams::URLRewriter::CloudinaryURLRewriter,
                Imagekit::Accounts::URLEndpointCreateParams::URLRewriter::ImgixURLRewriter,
                Imagekit::Accounts::URLEndpointCreateParams::URLRewriter::AkamaiURLRewriter
              )
            end

          class CloudinaryURLRewriter < Imagekit::Internal::Type::BaseModel
            OrHash =
              T.type_alias do
                T.any(
                  Imagekit::Accounts::URLEndpointCreateParams::URLRewriter::CloudinaryURLRewriter,
                  Imagekit::Internal::AnyHash
                )
              end

            sig do
              returns(
                Imagekit::Accounts::URLEndpointCreateParams::URLRewriter::CloudinaryURLRewriter::Type::OrSymbol
              )
            end
            attr_accessor :type

            # Whether to preserve `<asset_type>/<delivery_type>` in the rewritten URL.
            sig { returns(T.nilable(T::Boolean)) }
            attr_reader :preserve_asset_delivery_types

            sig { params(preserve_asset_delivery_types: T::Boolean).void }
            attr_writer :preserve_asset_delivery_types

            sig do
              params(
                type:
                  Imagekit::Accounts::URLEndpointCreateParams::URLRewriter::CloudinaryURLRewriter::Type::OrSymbol,
                preserve_asset_delivery_types: T::Boolean
              ).returns(T.attached_class)
            end
            def self.new(
              type:,
              # Whether to preserve `<asset_type>/<delivery_type>` in the rewritten URL.
              preserve_asset_delivery_types: nil
            )
            end

            sig do
              override.returns(
                {
                  type:
                    Imagekit::Accounts::URLEndpointCreateParams::URLRewriter::CloudinaryURLRewriter::Type::OrSymbol,
                  preserve_asset_delivery_types: T::Boolean
                }
              )
            end
            def to_hash
            end

            module Type
              extend Imagekit::Internal::Type::Enum

              TaggedSymbol =
                T.type_alias do
                  T.all(
                    Symbol,
                    Imagekit::Accounts::URLEndpointCreateParams::URLRewriter::CloudinaryURLRewriter::Type
                  )
                end
              OrSymbol = T.type_alias { T.any(Symbol, String) }

              CLOUDINARY =
                T.let(
                  :CLOUDINARY,
                  Imagekit::Accounts::URLEndpointCreateParams::URLRewriter::CloudinaryURLRewriter::Type::TaggedSymbol
                )

              sig do
                override.returns(
                  T::Array[
                    Imagekit::Accounts::URLEndpointCreateParams::URLRewriter::CloudinaryURLRewriter::Type::TaggedSymbol
                  ]
                )
              end
              def self.values
              end
            end
          end

          class ImgixURLRewriter < Imagekit::Internal::Type::BaseModel
            OrHash =
              T.type_alias do
                T.any(
                  Imagekit::Accounts::URLEndpointCreateParams::URLRewriter::ImgixURLRewriter,
                  Imagekit::Internal::AnyHash
                )
              end

            sig do
              returns(
                Imagekit::Accounts::URLEndpointCreateParams::URLRewriter::ImgixURLRewriter::Type::OrSymbol
              )
            end
            attr_accessor :type

            sig do
              params(
                type:
                  Imagekit::Accounts::URLEndpointCreateParams::URLRewriter::ImgixURLRewriter::Type::OrSymbol
              ).returns(T.attached_class)
            end
            def self.new(type:)
            end

            sig do
              override.returns(
                {
                  type:
                    Imagekit::Accounts::URLEndpointCreateParams::URLRewriter::ImgixURLRewriter::Type::OrSymbol
                }
              )
            end
            def to_hash
            end

            module Type
              extend Imagekit::Internal::Type::Enum

              TaggedSymbol =
                T.type_alias do
                  T.all(
                    Symbol,
                    Imagekit::Accounts::URLEndpointCreateParams::URLRewriter::ImgixURLRewriter::Type
                  )
                end
              OrSymbol = T.type_alias { T.any(Symbol, String) }

              IMGIX =
                T.let(
                  :IMGIX,
                  Imagekit::Accounts::URLEndpointCreateParams::URLRewriter::ImgixURLRewriter::Type::TaggedSymbol
                )

              sig do
                override.returns(
                  T::Array[
                    Imagekit::Accounts::URLEndpointCreateParams::URLRewriter::ImgixURLRewriter::Type::TaggedSymbol
                  ]
                )
              end
              def self.values
              end
            end
          end

          class AkamaiURLRewriter < Imagekit::Internal::Type::BaseModel
            OrHash =
              T.type_alias do
                T.any(
                  Imagekit::Accounts::URLEndpointCreateParams::URLRewriter::AkamaiURLRewriter,
                  Imagekit::Internal::AnyHash
                )
              end

            sig do
              returns(
                Imagekit::Accounts::URLEndpointCreateParams::URLRewriter::AkamaiURLRewriter::Type::OrSymbol
              )
            end
            attr_accessor :type

            sig do
              params(
                type:
                  Imagekit::Accounts::URLEndpointCreateParams::URLRewriter::AkamaiURLRewriter::Type::OrSymbol
              ).returns(T.attached_class)
            end
            def self.new(type:)
            end

            sig do
              override.returns(
                {
                  type:
                    Imagekit::Accounts::URLEndpointCreateParams::URLRewriter::AkamaiURLRewriter::Type::OrSymbol
                }
              )
            end
            def to_hash
            end

            module Type
              extend Imagekit::Internal::Type::Enum

              TaggedSymbol =
                T.type_alias do
                  T.all(
                    Symbol,
                    Imagekit::Accounts::URLEndpointCreateParams::URLRewriter::AkamaiURLRewriter::Type
                  )
                end
              OrSymbol = T.type_alias { T.any(Symbol, String) }

              AKAMAI =
                T.let(
                  :AKAMAI,
                  Imagekit::Accounts::URLEndpointCreateParams::URLRewriter::AkamaiURLRewriter::Type::TaggedSymbol
                )

              sig do
                override.returns(
                  T::Array[
                    Imagekit::Accounts::URLEndpointCreateParams::URLRewriter::AkamaiURLRewriter::Type::TaggedSymbol
                  ]
                )
              end
              def self.values
              end
            end
          end

          sig do
            override.returns(
              T::Array[
                Imagekit::Accounts::URLEndpointCreateParams::URLRewriter::Variants
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
