# frozen_string_literal: true

module Imagekitio
  module Resources
    class SavedExtensions
      # Some parameter documentations has been truncated, see
      # {Imagekitio::Models::SavedExtensionCreateParams} for more details.
      #
      # This API creates a new saved extension. Saved extensions allow you to save
      # complex extension configurations (like AI tasks) and reuse them by referencing
      # the ID in upload or update file APIs.
      #
      # **Saved extension limit** \
      # You can create a maximum of 100 saved extensions per account.
      #
      # @overload create(config:, description:, name:, request_options: {})
      #
      # @param config [Imagekitio::Models::ExtensionConfig::RemoveBg, Imagekitio::Models::ExtensionConfig::AIAutoDescription, Imagekitio::Models::ExtensionConfig::AITasks, Imagekitio::Models::ExtensionConfig::AutoTaggingExtension] Configuration object for an extension (base extensions only, not saved extension
      #
      # @param description [String] Description of what the saved extension does.
      #
      # @param name [String] Name of the saved extension.
      #
      # @param request_options [Imagekitio::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Imagekitio::Models::SavedExtension]
      #
      # @see Imagekitio::Models::SavedExtensionCreateParams
      def create(params)
        parsed, options = Imagekitio::SavedExtensionCreateParams.dump_request(params)
        @client.request(
          method: :post,
          path: "v1/saved-extensions",
          body: parsed,
          model: Imagekitio::SavedExtension,
          options: options
        )
      end

      # Some parameter documentations has been truncated, see
      # {Imagekitio::Models::SavedExtensionUpdateParams} for more details.
      #
      # This API updates an existing saved extension. You can update the name,
      # description, or config.
      #
      # @overload update(id, config: nil, description: nil, name: nil, request_options: {})
      #
      # @param id [String] The unique ID of the saved extension.
      #
      # @param config [Imagekitio::Models::ExtensionConfig::RemoveBg, Imagekitio::Models::ExtensionConfig::AIAutoDescription, Imagekitio::Models::ExtensionConfig::AITasks, Imagekitio::Models::ExtensionConfig::AutoTaggingExtension] Configuration object for an extension (base extensions only, not saved extension
      #
      # @param description [String] Updated description of the saved extension.
      #
      # @param name [String] Updated name of the saved extension.
      #
      # @param request_options [Imagekitio::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Imagekitio::Models::SavedExtension]
      #
      # @see Imagekitio::Models::SavedExtensionUpdateParams
      def update(id, params = {})
        parsed, options = Imagekitio::SavedExtensionUpdateParams.dump_request(params)
        @client.request(
          method: :patch,
          path: ["v1/saved-extensions/%1$s", id],
          body: parsed,
          model: Imagekitio::SavedExtension,
          options: options
        )
      end

      # This API returns an array of all saved extensions for your account. Saved
      # extensions allow you to save complex extension configurations and reuse them by
      # referencing them by ID in upload or update file APIs.
      #
      # @overload list(request_options: {})
      #
      # @param request_options [Imagekitio::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Array<Imagekitio::Models::SavedExtension>]
      #
      # @see Imagekitio::Models::SavedExtensionListParams
      def list(params = {})
        @client.request(
          method: :get,
          path: "v1/saved-extensions",
          model: Imagekitio::Internal::Type::ArrayOf[Imagekitio::SavedExtension],
          options: params[:request_options]
        )
      end

      # Some parameter documentations has been truncated, see
      # {Imagekitio::Models::SavedExtensionDeleteParams} for more details.
      #
      # This API deletes a saved extension permanently.
      #
      # @overload delete(id, request_options: {})
      #
      # @param id [String] The unique ID of the saved extension.
      #
      # @param request_options [Imagekitio::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [nil]
      #
      # @see Imagekitio::Models::SavedExtensionDeleteParams
      def delete(id, params = {})
        @client.request(
          method: :delete,
          path: ["v1/saved-extensions/%1$s", id],
          model: NilClass,
          options: params[:request_options]
        )
      end

      # Some parameter documentations has been truncated, see
      # {Imagekitio::Models::SavedExtensionGetParams} for more details.
      #
      # This API returns details of a specific saved extension by ID.
      #
      # @overload get(id, request_options: {})
      #
      # @param id [String] The unique ID of the saved extension.
      #
      # @param request_options [Imagekitio::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Imagekitio::Models::SavedExtension]
      #
      # @see Imagekitio::Models::SavedExtensionGetParams
      def get(id, params = {})
        @client.request(
          method: :get,
          path: ["v1/saved-extensions/%1$s", id],
          model: Imagekitio::SavedExtension,
          options: params[:request_options]
        )
      end

      # @api private
      #
      # @param client [Imagekitio::Client]
      def initialize(client:)
        @client = client
      end
    end
  end
end
