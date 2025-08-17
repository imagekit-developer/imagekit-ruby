# typed: strong

module Imagekit
  module Models
    class AutoTaggingExtension < Imagekit::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(Imagekit::AutoTaggingExtension, Imagekit::Internal::AnyHash)
        end

      # Maximum number of tags to attach to the asset.
      sig { returns(Integer) }
      attr_accessor :max_tags

      # Minimum confidence level for tags to be considered valid.
      sig { returns(Integer) }
      attr_accessor :min_confidence

      # Specifies the auto-tagging extension used.
      sig { returns(Imagekit::AutoTaggingExtension::Name::OrSymbol) }
      attr_accessor :name

      sig do
        params(
          max_tags: Integer,
          min_confidence: Integer,
          name: Imagekit::AutoTaggingExtension::Name::OrSymbol
        ).returns(T.attached_class)
      end
      def self.new(
        # Maximum number of tags to attach to the asset.
        max_tags:,
        # Minimum confidence level for tags to be considered valid.
        min_confidence:,
        # Specifies the auto-tagging extension used.
        name:
      )
      end

      sig do
        override.returns(
          {
            max_tags: Integer,
            min_confidence: Integer,
            name: Imagekit::AutoTaggingExtension::Name::OrSymbol
          }
        )
      end
      def to_hash
      end

      # Specifies the auto-tagging extension used.
      module Name
        extend Imagekit::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias { T.all(Symbol, Imagekit::AutoTaggingExtension::Name) }
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        GOOGLE_AUTO_TAGGING =
          T.let(
            :"google-auto-tagging",
            Imagekit::AutoTaggingExtension::Name::TaggedSymbol
          )
        AWS_AUTO_TAGGING =
          T.let(
            :"aws-auto-tagging",
            Imagekit::AutoTaggingExtension::Name::TaggedSymbol
          )

        sig do
          override.returns(
            T::Array[Imagekit::AutoTaggingExtension::Name::TaggedSymbol]
          )
        end
        def self.values
        end
      end
    end
  end
end
