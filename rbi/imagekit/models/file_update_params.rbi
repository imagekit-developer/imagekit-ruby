# typed: strong

module Imagekit
  module Models
    class FileUpdateParams < Imagekit::Internal::Type::BaseModel
      extend Imagekit::Internal::Type::RequestParameters::Converter
      include Imagekit::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(Imagekit::FileUpdateParams, Imagekit::Internal::AnyHash)
        end

      # Schema for update file update request.
      sig do
        returns(
          T.any(
            Imagekit::UpdateFileRequest::UpdateFileDetails,
            Imagekit::UpdateFileRequest::ChangePublicationStatus
          )
        )
      end
      attr_accessor :update_file_request

      sig do
        params(
          update_file_request:
            T.any(
              Imagekit::UpdateFileRequest::UpdateFileDetails::OrHash,
              Imagekit::UpdateFileRequest::ChangePublicationStatus::OrHash
            ),
          request_options: Imagekit::RequestOptions::OrHash
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
                Imagekit::UpdateFileRequest::UpdateFileDetails,
                Imagekit::UpdateFileRequest::ChangePublicationStatus
              ),
            request_options: Imagekit::RequestOptions
          }
        )
      end
      def to_hash
      end
    end
  end
end
