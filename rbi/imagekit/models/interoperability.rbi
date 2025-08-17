# typed: strong

module Imagekit
  module Models
    class Interoperability < Imagekit::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(Imagekit::Interoperability, Imagekit::Internal::AnyHash)
        end

      sig { returns(T.nilable(String)) }
      attr_reader :interop_index

      sig { params(interop_index: String).void }
      attr_writer :interop_index

      sig { returns(T.nilable(String)) }
      attr_reader :interop_version

      sig { params(interop_version: String).void }
      attr_writer :interop_version

      # JSON object.
      sig do
        params(interop_index: String, interop_version: String).returns(
          T.attached_class
        )
      end
      def self.new(interop_index: nil, interop_version: nil)
      end

      sig do
        override.returns({ interop_index: String, interop_version: String })
      end
      def to_hash
      end
    end
  end
end
