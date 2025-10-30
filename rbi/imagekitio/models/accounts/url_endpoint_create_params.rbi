# typed: strong

module Imagekitio
  module Models
    module Accounts
      class URLEndpointCreateParams < Imagekitio::Models::Accounts::URLEndpointRequest
        extend Imagekitio::Internal::Type::RequestParameters::Converter
        include Imagekitio::Internal::Type::RequestParameters

        OrHash =
          T.type_alias do
            T.any(
              Imagekitio::Accounts::URLEndpointCreateParams,
              Imagekitio::Internal::AnyHash
            )
          end

        sig do
          params(request_options: Imagekitio::RequestOptions::OrHash).returns(
            T.attached_class
          )
        end
        def self.new(request_options: {})
        end

        sig do
          override.returns({ request_options: Imagekitio::RequestOptions })
        end
        def to_hash
        end
      end
    end
  end
end
