# typed: strong

module Imagekit
  module Models
    class AutoDescriptionExtension < Imagekit::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(Imagekit::AutoDescriptionExtension, Imagekit::Internal::AnyHash)
        end

      # Specifies the auto description extension.
      sig { returns(Imagekit::AutoDescriptionExtension::Name::OrSymbol) }
      attr_accessor :name

      sig do
        params(
          name: Imagekit::AutoDescriptionExtension::Name::OrSymbol
        ).returns(T.attached_class)
      end
      def self.new(
        # Specifies the auto description extension.
        name:
      )
      end

      sig do
        override.returns(
          { name: Imagekit::AutoDescriptionExtension::Name::OrSymbol }
        )
      end
      def to_hash
      end

      # Specifies the auto description extension.
      module Name
        extend Imagekit::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias do
            T.all(Symbol, Imagekit::AutoDescriptionExtension::Name)
          end
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        AI_AUTO_DESCRIPTION =
          T.let(
            :"ai-auto-description",
            Imagekit::AutoDescriptionExtension::Name::TaggedSymbol
          )

        sig do
          override.returns(
            T::Array[Imagekit::AutoDescriptionExtension::Name::TaggedSymbol]
          )
        end
        def self.values
        end
      end
    end
  end
end
