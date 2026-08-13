# frozen_string_literal: true

module Imagekitio
  module Resources
    class NamedTransformations
      # Some parameter documentations has been truncated, see
      # {Imagekitio::Models::NamedTransformationCreateParams} for more details.
      #
      # Creates a new named transformation and returns the created object.
      #
      # A named transformation is a short, reusable name for a transformation string.
      # Use it in image and video URLs as `tr:n-<name>`, and update the underlying
      # transformation later without changing existing URLs. Learn more about
      # [named transformations](https://imagekit.io/docs/transformations#named-transformations).
      #
      # You can create up to 250 named transformations per account.
      #
      # @overload create(name:, transformation:, enabled: nil, request_options: {})
      #
      # @param name [String] Alias for the transformation string, used in URLs as `tr:n-<name>`. This is case
      #
      # @param transformation [String] The transformation string this named transformation refers to. Learn more about
      #
      # @param enabled [Boolean] Whether the named transformation is currently enabled. When set to `false`, requ
      #
      # @param request_options [Imagekitio::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Imagekitio::Models::NamedTransformation]
      #
      # @see Imagekitio::Models::NamedTransformationCreateParams
      def create(params)
        parsed, options = Imagekitio::NamedTransformationCreateParams.dump_request(params)
        @client.request(
          method: :post,
          path: "v1/named-transformations",
          body: parsed,
          model: Imagekitio::NamedTransformation,
          options: options
        )
      end

      # Some parameter documentations has been truncated, see
      # {Imagekitio::Models::NamedTransformationUpdateParams} for more details.
      #
      # Updates the named transformation identified by `id` and returns the updated
      # object. Only the fields present in the request body are updated; other fields
      # stay unchanged.
      #
      # Renaming or disabling a named transformation fails with a `409` error if it is
      # still referenced (via the `n-<name>` token) by an upload pre-transformation or
      # post-transformation setting. This check is best-effort and can't detect
      # references in your own application code or in previously generated URLs.
      #
      # @overload update(id, enabled: nil, name: nil, transformation: nil, request_options: {})
      #
      # @param id [String] Unique identifier for a named transformation.
      #
      # @param enabled [Boolean] Whether the named transformation is enabled. Omit to leave the current value unc
      #
      # @param name [String] Alias for the transformation string, used in URLs as `tr:n-<name>`. This is case
      #
      # @param transformation [String] The transformation string this named transformation refers to. Learn more about
      #
      # @param request_options [Imagekitio::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Imagekitio::Models::NamedTransformation]
      #
      # @see Imagekitio::Models::NamedTransformationUpdateParams
      def update(id, params = {})
        parsed, options = Imagekitio::NamedTransformationUpdateParams.dump_request(params)
        @client.request(
          method: :patch,
          path: ["v1/named-transformations/%1$s", id],
          body: parsed,
          model: Imagekitio::NamedTransformation,
          options: options
        )
      end

      # Returns an array of all named transformations configured for your account.
      #
      # @overload list(request_options: {})
      #
      # @param request_options [Imagekitio::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Array<Imagekitio::Models::NamedTransformation>]
      #
      # @see Imagekitio::Models::NamedTransformationListParams
      def list(params = {})
        @client.request(
          method: :get,
          path: "v1/named-transformations",
          model: Imagekitio::Internal::Type::ArrayOf[Imagekitio::NamedTransformation],
          options: params[:request_options]
        )
      end

      # Permanently deletes the named transformation identified by `id`.
      #
      # Deletion fails with a `409` error if the named transformation is still
      # referenced (via the `n-<name>` token) by an upload pre-transformation or
      # post-transformation setting. This check is best-effort and can't detect
      # references in your own application code or in previously generated URLs.
      #
      # @overload delete(id, request_options: {})
      #
      # @param id [String] Unique identifier for a named transformation.
      #
      # @param request_options [Imagekitio::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Imagekitio::Models::NamedTransformationDeleteResponse]
      #
      # @see Imagekitio::Models::NamedTransformationDeleteParams
      def delete(id, params = {})
        @client.request(
          method: :delete,
          path: ["v1/named-transformations/%1$s", id],
          model: Imagekitio::Models::NamedTransformationDeleteResponse,
          options: params[:request_options]
        )
      end

      # Retrieves the named transformation identified by `id`.
      #
      # @overload get(id, request_options: {})
      #
      # @param id [String] Unique identifier for a named transformation.
      #
      # @param request_options [Imagekitio::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Imagekitio::Models::NamedTransformation]
      #
      # @see Imagekitio::Models::NamedTransformationGetParams
      def get(id, params = {})
        @client.request(
          method: :get,
          path: ["v1/named-transformations/%1$s", id],
          model: Imagekitio::NamedTransformation,
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
