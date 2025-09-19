# typed: strong

module Imagekit
  module Models
    class FileUpdateParams < Imagekit::Models::UpdateFileRequest
      extend Imagekit::Internal::Type::RequestParameters::Converter
      include Imagekit::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(Imagekit::FileUpdateParams, Imagekit::Internal::AnyHash)
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
