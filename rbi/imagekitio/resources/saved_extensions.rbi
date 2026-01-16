# typed: strong

module Imagekitio
  module Resources
    class SavedExtensions
      # This API creates a new saved extension. Saved extensions allow you to save
      # complex extension configurations (like AI tasks) and reuse them by referencing
      # the ID in upload or update file APIs.
      #
      # **Saved extension limit** \
      # You can create a maximum of 100 saved extensions per account.
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
        ).returns(Imagekitio::SavedExtension)
      end
      def create(
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

      # This API updates an existing saved extension. You can update the name,
      # description, or config.
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
          description: String,
          name: String,
          request_options: Imagekitio::RequestOptions::OrHash
        ).returns(Imagekitio::SavedExtension)
      end
      def update(
        # The unique ID of the saved extension.
        id,
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

      # This API returns an array of all saved extensions for your account. Saved
      # extensions allow you to save complex extension configurations and reuse them by
      # referencing them by ID in upload or update file APIs.
      sig do
        params(request_options: Imagekitio::RequestOptions::OrHash).returns(
          T::Array[Imagekitio::SavedExtension]
        )
      end
      def list(request_options: {})
      end

      # This API deletes a saved extension permanently.
      sig do
        params(
          id: String,
          request_options: Imagekitio::RequestOptions::OrHash
        ).void
      end
      def delete(
        # The unique ID of the saved extension.
        id,
        request_options: {}
      )
      end

      # This API returns details of a specific saved extension by ID.
      sig do
        params(
          id: String,
          request_options: Imagekitio::RequestOptions::OrHash
        ).returns(Imagekitio::SavedExtension)
      end
      def get(
        # The unique ID of the saved extension.
        id,
        request_options: {}
      )
      end

      # @api private
      sig { params(client: Imagekitio::Client).returns(T.attached_class) }
      def self.new(client:)
      end
    end
  end
end
