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

        sig { returns(Imagekit::Accounts::OriginCreateParams::Body) }
        attr_reader :body

        sig do
          params(
            body: Imagekit::Accounts::OriginCreateParams::Body::OrHash
          ).void
        end
        attr_writer :body

        sig do
          params(
            body: Imagekit::Accounts::OriginCreateParams::Body::OrHash,
            request_options: Imagekit::RequestOptions::OrHash
          ).returns(T.attached_class)
        end
        def self.new(body:, request_options: {})
        end

        sig do
          override.returns(
            {
              body: Imagekit::Accounts::OriginCreateParams::Body,
              request_options: Imagekit::RequestOptions
            }
          )
        end
        def to_hash
        end

        class Body < Imagekit::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Imagekit::Accounts::OriginCreateParams::Body,
                Imagekit::Internal::AnyHash
              )
            end

          sig { override.returns({}) }
          def to_hash
          end
        end
      end
    end
  end
end
