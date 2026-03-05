# typed: strong

module Imagekitio
  module Models
    module Folders
      class JobGetParams < Imagekitio::Internal::Type::BaseModel
        extend Imagekitio::Internal::Type::RequestParameters::Converter
        include Imagekitio::Internal::Type::RequestParameters

        OrHash =
          T.type_alias do
            T.any(
              Imagekitio::Folders::JobGetParams,
              Imagekitio::Internal::AnyHash
            )
          end

        sig { returns(String) }
        attr_accessor :job_id

        sig do
          params(
            job_id: String,
            request_options: Imagekitio::RequestOptions::OrHash
          ).returns(T.attached_class)
        end
        def self.new(job_id:, request_options: {})
        end

        sig do
          override.returns(
            { job_id: String, request_options: Imagekitio::RequestOptions }
          )
        end
        def to_hash
        end
      end
    end
  end
end
