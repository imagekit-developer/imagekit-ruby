# frozen_string_literal: true

module Imagekitio
  module Models
    module Accounts
      class URLEndpointRequest < Imagekitio::Internal::Type::BaseModel
        # @!attribute description
        #   Description of the URL endpoint.
        #
        #   @return [String]
        required :description, String

        # @!attribute origins
        #   Ordered list of origin IDs to try when the file isn’t in the Media Library;
        #   ImageKit checks them in the sequence provided. Origin must be created before it
        #   can be used in a URL endpoint.
        #
        #   @return [Array<String>, nil]
        optional :origins, Imagekitio::Internal::Type::ArrayOf[String]

        # @!attribute url_prefix
        #   Path segment appended to your base URL to form the endpoint (letters, digits,
        #   and hyphens only — or empty for the default endpoint).
        #
        #   @return [String, nil]
        optional :url_prefix, String, api_name: :urlPrefix

        # @!attribute url_rewriter
        #   Configuration for third-party URL rewriting.
        #
        #   @return [Imagekitio::Models::Accounts::URLEndpointRequest::URLRewriter::Cloudinary, Imagekitio::Models::Accounts::URLEndpointRequest::URLRewriter::Imgix, Imagekitio::Models::Accounts::URLEndpointRequest::URLRewriter::Akamai, nil]
        optional :url_rewriter,
                 union: -> { Imagekitio::Accounts::URLEndpointRequest::URLRewriter },
                 api_name: :urlRewriter

        # @!method initialize(description:, origins: nil, url_prefix: nil, url_rewriter: nil)
        #   Some parameter documentations has been truncated, see
        #   {Imagekitio::Models::Accounts::URLEndpointRequest} for more details.
        #
        #   Schema for URL endpoint resource.
        #
        #   @param description [String] Description of the URL endpoint.
        #
        #   @param origins [Array<String>] Ordered list of origin IDs to try when the file isn’t in the Media Library; Imag
        #
        #   @param url_prefix [String] Path segment appended to your base URL to form the endpoint (letters, digits, an
        #
        #   @param url_rewriter [Imagekitio::Models::Accounts::URLEndpointRequest::URLRewriter::Cloudinary, Imagekitio::Models::Accounts::URLEndpointRequest::URLRewriter::Imgix, Imagekitio::Models::Accounts::URLEndpointRequest::URLRewriter::Akamai] Configuration for third-party URL rewriting.

        # Configuration for third-party URL rewriting.
        #
        # @see Imagekitio::Models::Accounts::URLEndpointRequest#url_rewriter
        module URLRewriter
          extend Imagekitio::Internal::Type::Union

          discriminator :type

          variant :CLOUDINARY, -> { Imagekitio::Accounts::URLEndpointRequest::URLRewriter::Cloudinary }

          variant :IMGIX, -> { Imagekitio::Accounts::URLEndpointRequest::URLRewriter::Imgix }

          variant :AKAMAI, -> { Imagekitio::Accounts::URLEndpointRequest::URLRewriter::Akamai }

          class Cloudinary < Imagekitio::Internal::Type::BaseModel
            # @!attribute type
            #
            #   @return [Symbol, :CLOUDINARY]
            required :type, const: :CLOUDINARY

            # @!attribute preserve_asset_delivery_types
            #   Whether to preserve `<asset_type>/<delivery_type>` in the rewritten URL.
            #
            #   @return [Boolean, nil]
            optional :preserve_asset_delivery_types,
                     Imagekitio::Internal::Type::Boolean,
                     api_name: :preserveAssetDeliveryTypes

            # @!method initialize(preserve_asset_delivery_types: nil, type: :CLOUDINARY)
            #   @param preserve_asset_delivery_types [Boolean] Whether to preserve `<asset_type>/<delivery_type>` in the rewritten URL.
            #
            #   @param type [Symbol, :CLOUDINARY]
          end

          class Imgix < Imagekitio::Internal::Type::BaseModel
            # @!attribute type
            #
            #   @return [Symbol, :IMGIX]
            required :type, const: :IMGIX

            # @!method initialize(type: :IMGIX)
            #   @param type [Symbol, :IMGIX]
          end

          class Akamai < Imagekitio::Internal::Type::BaseModel
            # @!attribute type
            #
            #   @return [Symbol, :AKAMAI]
            required :type, const: :AKAMAI

            # @!method initialize(type: :AKAMAI)
            #   @param type [Symbol, :AKAMAI]
          end

          # @!method self.variants
          #   @return [Array(Imagekitio::Models::Accounts::URLEndpointRequest::URLRewriter::Cloudinary, Imagekitio::Models::Accounts::URLEndpointRequest::URLRewriter::Imgix, Imagekitio::Models::Accounts::URLEndpointRequest::URLRewriter::Akamai)]
        end
      end
    end
  end
end
