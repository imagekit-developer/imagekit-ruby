# frozen_string_literal: true

module Imagekitio
  module Models
    class SavedExtension < Imagekitio::Internal::Type::BaseModel
      # @!attribute id
      #   Unique identifier of the saved extension.
      #
      #   @return [String, nil]
      optional :id, String

      # @!attribute config
      #   Configuration object for an extension (base extensions only, not saved extension
      #   references).
      #
      #   @return [Imagekitio::Models::ExtensionConfig::RemoveBg, Imagekitio::Models::ExtensionConfig::AIAutoDescription, Imagekitio::Models::ExtensionConfig::AITasks, Imagekitio::Models::ExtensionConfig::AutoTaggingExtension, nil]
      optional :config, union: -> { Imagekitio::ExtensionConfig }

      # @!attribute created_at
      #   Timestamp when the saved extension was created.
      #
      #   @return [Time, nil]
      optional :created_at, Time, api_name: :createdAt

      # @!attribute description
      #   Description of the saved extension.
      #
      #   @return [String, nil]
      optional :description, String

      # @!attribute name
      #   Name of the saved extension.
      #
      #   @return [String, nil]
      optional :name, String

      # @!attribute updated_at
      #   Timestamp when the saved extension was last updated.
      #
      #   @return [Time, nil]
      optional :updated_at, Time, api_name: :updatedAt

      # @!method initialize(id: nil, config: nil, created_at: nil, description: nil, name: nil, updated_at: nil)
      #   Some parameter documentations has been truncated, see
      #   {Imagekitio::Models::SavedExtension} for more details.
      #
      #   Saved extension object containing extension configuration.
      #
      #   @param id [String] Unique identifier of the saved extension.
      #
      #   @param config [Imagekitio::Models::ExtensionConfig::RemoveBg, Imagekitio::Models::ExtensionConfig::AIAutoDescription, Imagekitio::Models::ExtensionConfig::AITasks, Imagekitio::Models::ExtensionConfig::AutoTaggingExtension] Configuration object for an extension (base extensions only, not saved extension
      #
      #   @param created_at [Time] Timestamp when the saved extension was created.
      #
      #   @param description [String] Description of the saved extension.
      #
      #   @param name [String] Name of the saved extension.
      #
      #   @param updated_at [Time] Timestamp when the saved extension was last updated.
    end
  end
end
