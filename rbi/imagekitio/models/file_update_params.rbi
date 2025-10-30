# typed: strong

module Imagekitio
  module Models
    class FileUpdateParams < Imagekitio::Internal::Type::BaseModel
      extend Imagekitio::Internal::Type::RequestParameters::Converter
      include Imagekitio::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(Imagekitio::FileUpdateParams, Imagekitio::Internal::AnyHash)
        end

      # Schema for update file update request.
      sig do
        returns(
          T.any(
            Imagekitio::UpdateFileRequest::UpdateFileDetails,
            Imagekitio::UpdateFileRequest::ChangePublicationStatus
          )
        )
      end
      attr_accessor :update_file_request

      sig do
        params(
          update_file_request:
            T.any(
              Imagekitio::UpdateFileRequest::UpdateFileDetails::OrHash,
              Imagekitio::UpdateFileRequest::ChangePublicationStatus::OrHash
            ),
          request_options: Imagekitio::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        # Schema for update file update request.
        update_file_request:,
        request_options: {}
      )
      end

      sig do
        override.returns(
          {
            update_file_request:
              T.any(
                Imagekitio::UpdateFileRequest::UpdateFileDetails,
                Imagekitio::UpdateFileRequest::ChangePublicationStatus
              ),
            request_options: Imagekitio::RequestOptions
          }
        )
      end
      def to_hash
      end
    end
  end
end
