# frozen_string_literal: true

module Imagekitio
  module Models
    # @see Imagekitio::Resources::SavedExtensions#create
    class SavedExtensionCreateParams < Imagekitio::Internal::Type::BaseModel
      extend Imagekitio::Internal::Type::RequestParameters::Converter
      include Imagekitio::Internal::Type::RequestParameters

      # @!attribute config
      #   Configuration object for an extension (base extensions only, not saved extension
      #   references).
      #
      #   @return [Imagekitio::Models::ExtensionConfig::RemoveBg, Imagekitio::Models::ExtensionConfig::AIAutoDescription, Imagekitio::Models::ExtensionConfig::AITasks, Imagekitio::Models::ExtensionConfig::AutoTaggingExtension]
      required :config, union: -> { Imagekitio::ExtensionConfig }

      # @!attribute description
      #   Description of what the saved extension does.
      #
      #   @return [String]
      required :description, String

      # @!attribute name
      #   Name of the saved extension.
      #
      #   @return [String]
      required :name, String

      # @!method initialize(config:, description:, name:, request_options: {})
      #   Some parameter documentations has been truncated, see
      #   {Imagekitio::Models::SavedExtensionCreateParams} for more details.
      #
      #   @param config [Imagekitio::Models::ExtensionConfig::RemoveBg, Imagekitio::Models::ExtensionConfig::AIAutoDescription, Imagekitio::Models::ExtensionConfig::AITasks, Imagekitio::Models::ExtensionConfig::AutoTaggingExtension] Configuration object for an extension (base extensions only, not saved extension
      #
      #   @param description [String] Description of what the saved extension does.
      #
      #   @param name [String] Name of the saved extension.
      #
      #   @param request_options [Imagekitio::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
