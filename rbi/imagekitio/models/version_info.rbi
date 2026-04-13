# typed: strong

module Imagekitio
  module Models
    class VersionInfo < Imagekitio::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(Imagekitio::VersionInfo, Imagekitio::Internal::AnyHash)
        end

      # Unique identifier of the file version.
      sig { returns(T.nilable(String)) }
      attr_reader :id

      sig { params(id: String).void }
      attr_writer :id

      # Name of the file version.
      sig { returns(T.nilable(String)) }
      attr_reader :name

      sig { params(name: String).void }
      attr_writer :name

      # An object containing the file or file version's `id` (versionId) and `name`.
      sig { params(id: String, name: String).returns(T.attached_class) }
      def self.new(
        # Unique identifier of the file version.
        id: nil,
        # Name of the file version.
        name: nil
      )
      end

      sig { override.returns({ id: String, name: String }) }
      def to_hash
      end
    end
  end
end
