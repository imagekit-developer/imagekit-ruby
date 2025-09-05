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

      sig do
        returns(
          T.any(
            Imagekit::UpdateFileDetailsRequest::UpdateFileDetails,
            Imagekit::UpdateFileDetailsRequest::ChangePublicationStatus
          )
        )
      end
      attr_accessor :update_file_details_request

      sig do
        params(
          update_file_details_request:
            T.any(
              Imagekit::UpdateFileDetailsRequest::UpdateFileDetails::OrHash,
              Imagekit::UpdateFileDetailsRequest::ChangePublicationStatus::OrHash
            ),
          request_options: Imagekit::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(update_file_details_request:, request_options: {})
      end

      sig do
        override.returns(
          {
            update_file_details_request:
              T.any(
                Imagekit::UpdateFileDetailsRequest::UpdateFileDetails,
                Imagekit::UpdateFileDetailsRequest::ChangePublicationStatus
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
