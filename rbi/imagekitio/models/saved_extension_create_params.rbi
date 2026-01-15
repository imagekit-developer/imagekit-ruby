# typed: strong

module Imagekitio
  module Models
    class SavedExtensionCreateParams < Imagekitio::Internal::Type::BaseModel
      extend Imagekitio::Internal::Type::RequestParameters::Converter
      include Imagekitio::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(
            Imagekitio::SavedExtensionCreateParams,
            Imagekitio::Internal::AnyHash
          )
        end

      # Configuration object for an extension (base extensions only, not saved extension
      # references).
      sig do
        returns(
          T.any(
            Imagekitio::ExtensionConfig::RemoveBg,
            Imagekitio::ExtensionConfig::AIAutoDescription,
            Imagekitio::ExtensionConfig::AITasks,
            Imagekitio::ExtensionConfig::AutoTaggingExtension
          )
        )
      end
      attr_accessor :config

      # Description of what the saved extension does.
      sig { returns(String) }
      attr_accessor :description

      # Name of the saved extension.
      sig { returns(String) }
      attr_accessor :name

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
        config:,
        # Description of what the saved extension does.
        description:,
        # Name of the saved extension.
        name:,
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
