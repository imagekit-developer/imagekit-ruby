# frozen_string_literal: true

module Imagekitio
  module Models
    # @see Imagekitio::Resources::SavedExtensions#update
    class SavedExtensionUpdateParams < Imagekitio::Internal::Type::BaseModel
      extend Imagekitio::Internal::Type::RequestParameters::Converter
      include Imagekitio::Internal::Type::RequestParameters

      # @!attribute config
      #   Configuration object for an extension (base extensions only, not saved extension
      #   references).
      #
      #   @return [Imagekitio::Models::ExtensionConfig::RemoveBg, Imagekitio::Models::ExtensionConfig::AIAutoDescription, Imagekitio::Models::ExtensionConfig::AITasks, Imagekitio::Models::ExtensionConfig::AutoTaggingExtension, nil]
      optional :config, union: -> { Imagekitio::ExtensionConfig }

      # @!attribute description
      #   Updated description of the saved extension.
      #
      #   @return [String, nil]
      optional :description, String

      # @!attribute name
      #   Updated name of the saved extension.
      #
      #   @return [String, nil]
      optional :name, String

      # @!method initialize(config: nil, description: nil, name: nil, request_options: {})
      #   Some parameter documentations has been truncated, see
      #   {Imagekitio::Models::SavedExtensionUpdateParams} for more details.
      #
      #   @param config [Imagekitio::Models::ExtensionConfig::RemoveBg, Imagekitio::Models::ExtensionConfig::AIAutoDescription, Imagekitio::Models::ExtensionConfig::AITasks, Imagekitio::Models::ExtensionConfig::AutoTaggingExtension] Configuration object for an extension (base extensions only, not saved extension
      #
      #   @param description [String] Updated description of the saved extension.
      #
      #   @param name [String] Updated name of the saved extension.
      #
      #   @param request_options [Imagekitio::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
