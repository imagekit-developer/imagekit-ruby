# typed: strong

module Imagekitio
  module Models
    class SavedExtensionUpdateParams < Imagekitio::Internal::Type::BaseModel
      extend Imagekitio::Internal::Type::RequestParameters::Converter
      include Imagekitio::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(
            Imagekitio::SavedExtensionUpdateParams,
            Imagekitio::Internal::AnyHash
          )
        end

      # Configuration object for an extension (base extensions only, not saved extension
      # references).
      sig do
        returns(
          T.nilable(
            T.any(
              Imagekitio::ExtensionConfig::RemoveBg,
              Imagekitio::ExtensionConfig::AIAutoDescription,
              Imagekitio::ExtensionConfig::AITasks,
              Imagekitio::ExtensionConfig::AutoTaggingExtension
            )
          )
        )
      end
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

      # Updated description of the saved extension.
      sig { returns(T.nilable(String)) }
      attr_reader :description

      sig { params(description: String).void }
      attr_writer :description

      # Updated name of the saved extension.
      sig { returns(T.nilable(String)) }
      attr_reader :name

      sig { params(name: String).void }
      attr_writer :name

      sig do
        params(
          config:
            T.any(
              Imagekitio::ExtensionConfig::RemoveBg::OrHash,
              Imagekitio::ExtensionConfig::AIAutoDescription::OrHash,
              Imagekitio::ExtensionConfig::AITasks::OrHash,
              Imagekitio::ExtensionConfig::AutoTaggingExtension::OrHash
            ),
          description: String,
          name: String,
          request_options: Imagekitio::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        # Configuration object for an extension (base extensions only, not saved extension
        # references).
        config: nil,
        # Updated description of the saved extension.
        description: nil,
        # Updated name of the saved extension.
        name: nil,
        request_options: {}
      )
      end

      sig do
        override.returns(
          {
            config:
              T.any(
                Imagekitio::ExtensionConfig::RemoveBg,
                Imagekitio::ExtensionConfig::AIAutoDescription,
                Imagekitio::ExtensionConfig::AITasks,
                Imagekitio::ExtensionConfig::AutoTaggingExtension
              ),
            description: String,
            name: String,
            request_options: Imagekitio::RequestOptions
          }
        )
      end
      def to_hash
      end
    end
  end
end
