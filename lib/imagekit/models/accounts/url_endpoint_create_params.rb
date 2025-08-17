# frozen_string_literal: true

module Imagekit
  module Models
    module Accounts
      # @see Imagekit::Resources::Accounts::URLEndpoints#create
      class URLEndpointCreateParams < Imagekit::Internal::Type::BaseModel
        extend Imagekit::Internal::Type::RequestParameters::Converter
        include Imagekit::Internal::Type::RequestParameters

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
        optional :origins, Imagekit::Internal::Type::ArrayOf[String]

        # @!attribute url_prefix
        #   Path segment appended to your base URL to form the endpoint (letters, digits,
        #   and hyphens only — or empty for the default endpoint).
        #
        #   @return [String, nil]
        optional :url_prefix, String, api_name: :urlPrefix

        # @!attribute url_rewriter
        #   Configuration for third-party URL rewriting.
        #
        #   @return [Imagekit::Models::Accounts::URLEndpointCreateParams::URLRewriter::CloudinaryURLRewriter, Imagekit::Models::Accounts::URLEndpointCreateParams::URLRewriter::ImgixURLRewriter, Imagekit::Models::Accounts::URLEndpointCreateParams::URLRewriter::AkamaiURLRewriter, nil]
        optional :url_rewriter,
                 union: -> { Imagekit::Accounts::URLEndpointCreateParams::URLRewriter },
                 api_name: :urlRewriter

        # @!method initialize(description:, origins: nil, url_prefix: nil, url_rewriter: nil, request_options: {})
        #   Some parameter documentations has been truncated, see
        #   {Imagekit::Models::Accounts::URLEndpointCreateParams} for more details.
        #
        #   @param description [String] Description of the URL endpoint.
        #
        #   @param origins [Array<String>] Ordered list of origin IDs to try when the file isn’t in the Media Library; Imag
        #
        #   @param url_prefix [String] Path segment appended to your base URL to form the endpoint (letters, digits, an
        #
        #   @param url_rewriter [Imagekit::Models::Accounts::URLEndpointCreateParams::URLRewriter::CloudinaryURLRewriter, Imagekit::Models::Accounts::URLEndpointCreateParams::URLRewriter::ImgixURLRewriter, Imagekit::Models::Accounts::URLEndpointCreateParams::URLRewriter::AkamaiURLRewriter] Configuration for third-party URL rewriting.
        #
        #   @param request_options [Imagekit::RequestOptions, Hash{Symbol=>Object}]

        # Configuration for third-party URL rewriting.
        module URLRewriter
          extend Imagekit::Internal::Type::Union

          variant -> { Imagekit::Accounts::URLEndpointCreateParams::URLRewriter::CloudinaryURLRewriter }

          variant -> { Imagekit::Accounts::URLEndpointCreateParams::URLRewriter::ImgixURLRewriter }

          variant -> { Imagekit::Accounts::URLEndpointCreateParams::URLRewriter::AkamaiURLRewriter }

          class CloudinaryURLRewriter < Imagekit::Internal::Type::BaseModel
            # @!attribute type
            #
            #   @return [Symbol, Imagekit::Models::Accounts::URLEndpointCreateParams::URLRewriter::CloudinaryURLRewriter::Type]
            required :type,
                     enum: -> {
                       Imagekit::Accounts::URLEndpointCreateParams::URLRewriter::CloudinaryURLRewriter::Type
                     }

            # @!attribute preserve_asset_delivery_types
            #   Whether to preserve `<asset_type>/<delivery_type>` in the rewritten URL.
            #
            #   @return [Boolean, nil]
            optional :preserve_asset_delivery_types,
                     Imagekit::Internal::Type::Boolean,
                     api_name: :preserveAssetDeliveryTypes

            # @!method initialize(type:, preserve_asset_delivery_types: nil)
            #   @param type [Symbol, Imagekit::Models::Accounts::URLEndpointCreateParams::URLRewriter::CloudinaryURLRewriter::Type]
            #
            #   @param preserve_asset_delivery_types [Boolean] Whether to preserve `<asset_type>/<delivery_type>` in the rewritten URL.

            # @see Imagekit::Models::Accounts::URLEndpointCreateParams::URLRewriter::CloudinaryURLRewriter#type
            module Type
              extend Imagekit::Internal::Type::Enum

              CLOUDINARY = :CLOUDINARY

              # @!method self.values
              #   @return [Array<Symbol>]
            end
          end

          class ImgixURLRewriter < Imagekit::Internal::Type::BaseModel
            # @!attribute type
            #
            #   @return [Symbol, Imagekit::Models::Accounts::URLEndpointCreateParams::URLRewriter::ImgixURLRewriter::Type]
            required :type,
                     enum: -> {
                       Imagekit::Accounts::URLEndpointCreateParams::URLRewriter::ImgixURLRewriter::Type
                     }

            # @!method initialize(type:)
            #   @param type [Symbol, Imagekit::Models::Accounts::URLEndpointCreateParams::URLRewriter::ImgixURLRewriter::Type]

            # @see Imagekit::Models::Accounts::URLEndpointCreateParams::URLRewriter::ImgixURLRewriter#type
            module Type
              extend Imagekit::Internal::Type::Enum

              IMGIX = :IMGIX

              # @!method self.values
              #   @return [Array<Symbol>]
            end
          end

          class AkamaiURLRewriter < Imagekit::Internal::Type::BaseModel
            # @!attribute type
            #
            #   @return [Symbol, Imagekit::Models::Accounts::URLEndpointCreateParams::URLRewriter::AkamaiURLRewriter::Type]
            required :type,
                     enum: -> {
                       Imagekit::Accounts::URLEndpointCreateParams::URLRewriter::AkamaiURLRewriter::Type
                     }

            # @!method initialize(type:)
            #   @param type [Symbol, Imagekit::Models::Accounts::URLEndpointCreateParams::URLRewriter::AkamaiURLRewriter::Type]

            # @see Imagekit::Models::Accounts::URLEndpointCreateParams::URLRewriter::AkamaiURLRewriter#type
            module Type
              extend Imagekit::Internal::Type::Enum

              AKAMAI = :AKAMAI

              # @!method self.values
              #   @return [Array<Symbol>]
            end
          end

          # @!method self.variants
          #   @return [Array(Imagekit::Models::Accounts::URLEndpointCreateParams::URLRewriter::CloudinaryURLRewriter, Imagekit::Models::Accounts::URLEndpointCreateParams::URLRewriter::ImgixURLRewriter, Imagekit::Models::Accounts::URLEndpointCreateParams::URLRewriter::AkamaiURLRewriter)]
        end
      end
    end
  end
end
