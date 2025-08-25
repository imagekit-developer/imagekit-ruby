# typed: strong

module Imagekit
  module Models
    module Accounts
      class URLEndpointUpdateParams < Imagekit::Models::Accounts::URLEndpoint
        extend Imagekit::Internal::Type::RequestParameters::Converter
        include Imagekit::Internal::Type::RequestParameters

        OrHash =
          T.type_alias do
            T.any(
              Imagekit::Accounts::URLEndpointUpdateParams,
              Imagekit::Internal::AnyHash
            )
          end

        sig do
          params(request_options: Imagekit::RequestOptions::OrHash).returns(
            T.attached_class
          )
        end
        def self.new(request_options: {})
        end

        sig { override.returns({ request_options: Imagekit::RequestOptions }) }
        def to_hash
        end
      end
    end
  end
end
