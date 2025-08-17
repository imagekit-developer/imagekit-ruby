# typed: strong

module Imagekit
  module Models
    class Gps < Imagekit::Internal::Type::BaseModel
      OrHash =
        T.type_alias { T.any(Imagekit::Gps, Imagekit::Internal::AnyHash) }

      sig { returns(T.nilable(T::Array[Integer])) }
      attr_reader :gps_version_id

      sig { params(gps_version_id: T::Array[Integer]).void }
      attr_writer :gps_version_id

      # Object containing GPS information.
      sig do
        params(gps_version_id: T::Array[Integer]).returns(T.attached_class)
      end
      def self.new(gps_version_id: nil)
      end

      sig { override.returns({ gps_version_id: T::Array[Integer] }) }
      def to_hash
      end
    end
  end
end
