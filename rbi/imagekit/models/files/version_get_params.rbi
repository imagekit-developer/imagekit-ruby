# typed: strong

module Imagekit
  module Models
    module Files
      class VersionGetParams < Imagekit::Internal::Type::BaseModel
        extend Imagekit::Internal::Type::RequestParameters::Converter
        include Imagekit::Internal::Type::RequestParameters

        OrHash =
          T.type_alias do
            T.any(
              Imagekit::Files::VersionGetParams,
              Imagekit::Internal::AnyHash
            )
          end

        sig { returns(String) }
        attr_accessor :file_id

        sig do
          params(
            file_id: String,
            request_options: Imagekit::RequestOptions::OrHash
          ).returns(T.attached_class)
        end
        def self.new(file_id:, request_options: {})
        end

        sig do
          override.returns(
            { file_id: String, request_options: Imagekit::RequestOptions }
          )
        end
        def to_hash
        end
      end
    end
  end
end
