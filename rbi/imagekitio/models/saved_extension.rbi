# typed: strong

module Imagekitio
  module Models
    class SavedExtension < Imagekitio::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(Imagekitio::SavedExtension, Imagekitio::Internal::AnyHash)
        end

      # Unique identifier of the saved extension.
      sig { returns(T.nilable(String)) }
      attr_reader :id

      sig { params(id: String).void }
      attr_writer :id

      # Configuration object for an extension (base extensions only, not saved extension
      # references).
      sig { returns(T.nilable(Imagekitio::ExtensionConfig::Variants)) }
      attr_reader :config

      sig do
        params(
          config:
            T.any(
              Imagekitio::ExtensionConfig::RemoveBg::OrHash,
              Imagekitio::ExtensionConfig::AIAutoDescription::OrHash,
              Imagekitio::ExtensionConfig::AITasks::OrHash,
              Imagekitio::ExtensionConfig::AutoTaggingExtension::OrHash
            )
        ).void
      end
      attr_writer :config

      # Timestamp when the saved extension was created.
      sig { returns(T.nilable(Time)) }
      attr_reader :created_at

      sig { params(created_at: Time).void }
      attr_writer :created_at

      # Description of the saved extension.
      sig { returns(T.nilable(String)) }
      attr_reader :description

      sig { params(description: String).void }
      attr_writer :description

      # Name of the saved extension.
      sig { returns(T.nilable(String)) }
      attr_reader :name

      sig { params(name: String).void }
      attr_writer :name

      # Timestamp when the saved extension was last updated.
      sig { returns(T.nilable(Time)) }
      attr_reader :updated_at

      sig { params(updated_at: Time).void }
      attr_writer :updated_at

      # Saved extension object containing extension configuration.
      sig do
        params(
          id: String,
          config:
            T.any(
              Imagekitio::ExtensionConfig::RemoveBg::OrHash,
              Imagekitio::ExtensionConfig::AIAutoDescription::OrHash,
              Imagekitio::ExtensionConfig::AITasks::OrHash,
              Imagekitio::ExtensionConfig::AutoTaggingExtension::OrHash
            ),
          created_at: Time,
          description: String,
          name: String,
          updated_at: Time
        ).returns(T.attached_class)
      end
      def self.new(
        # Unique identifier of the saved extension.
        id: nil,
        # Configuration object for an extension (base extensions only, not saved extension
        # references).
        config: nil,
        # Timestamp when the saved extension was created.
        created_at: nil,
        # Description of the saved extension.
        description: nil,
        # Name of the saved extension.
        name: nil,
        # Timestamp when the saved extension was last updated.
        updated_at: nil
      )
      end

      sig do
        override.returns(
          {
            id: String,
            config: Imagekitio::ExtensionConfig::Variants,
            created_at: Time,
            description: String,
            name: String,
            updated_at: Time
          }
        )
      end
      def to_hash
      end
    end
  end
end
