# typed: strong

module Imagekitio
  module Models
    module Files
      class VersionRestoreParams < Imagekitio::Internal::Type::BaseModel
        extend Imagekitio::Internal::Type::RequestParameters::Converter
        include Imagekitio::Internal::Type::RequestParameters

        OrHash =
          T.type_alias do
            T.any(
              Imagekitio::Files::VersionRestoreParams,
              Imagekitio::Internal::AnyHash
            )
          end

        sig { returns(String) }
        attr_accessor :file_id

        sig do
          params(
            file_id: String,
            request_options: Imagekitio::RequestOptions::OrHash
          ).returns(T.attached_class)
        end
        def self.new(file_id:, request_options: {})
        end

        sig do
          override.returns(
            { file_id: String, request_options: Imagekitio::RequestOptions }
          )
        end
        def to_hash
        end
      end
    end
  end
end
