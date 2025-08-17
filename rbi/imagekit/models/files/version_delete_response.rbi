# typed: strong

module Imagekit
  module Models
    module Files
      class VersionDeleteResponse < Imagekit::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Imagekit::Models::Files::VersionDeleteResponse,
              Imagekit::Internal::AnyHash
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
end
