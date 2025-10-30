# typed: strong

module Imagekitio
  module Models
    class FolderDeleteResponse < Imagekitio::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            Imagekitio::Models::FolderDeleteResponse,
            Imagekitio::Internal::AnyHash
          )
        end

      sig { returns(T.attached_class) }
      def self.new
      end

      sig { override.returns({}) }
      def to_hash
      end
    end
  end
end
