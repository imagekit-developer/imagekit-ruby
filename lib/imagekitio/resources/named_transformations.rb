# frozen_string_literal: true

module Imagekitio
  module Resources
    class NamedTransformations
      # Some parameter documentations has been truncated, see
      # {Imagekitio::Models::NamedTransformationCreateParams} for more details.
      #
      # Creates a new named transformation and returns the created object.
      #
      # Named transformations let you assign a short, reusable name to a complex
      # transformation string, so it can be applied in image and video URLs as
      # `tr:n-<name>` and later updated without changing any existing URLs.
      #
      # Learn more about
      # [named transformations](https://imagekit.io/docs/transformations#named-transformations).
      #
      # **Note:** You can create up to 250 named transformations per account. Once this
      # limit is reached, the request fails with a `400` error.
      #
      # @overload create(name:, transformation:, enabled: nil, request_options: {})
      #
      # @param name [String] Name of the named transformation. This is the alias used to refer to the transfo
      #
      # @param transformation [String] The transformation this name refers to, expressed as one or more comma-separated
      #
      # @param enabled [Boolean] Whether this named transformation is enabled. Set to `false` to temporarily disa
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
      # object. Only the fields present in the request body are updated; omitted fields
      # are left unchanged.
      #
      # **Note:**
      #
      # - If you rename this named transformation, or set `enabled` to `false`, and
      #   another _enabled_ named transformation, or your account's upload
      #   pre-transformation/post-transformation settings, reference it (via the
      #   `n-<name>` token), the request fails with a `409` error whose `message`
      #   describes what it is referenced by. A reference from a named transformation
      #   that is itself disabled does not block this request. Remove or disable those
      #   references first, then retry. This is a best-effort check and cannot detect
      #   references baked into your own application code or previously generated URLs.
      #
      # @overload update(id, enabled: nil, name: nil, transformation: nil, request_options: {})
      #
      # @param id [String] Unique identifier of the named transformation. This is the `id` returned when th
      #
      # @param enabled [Boolean] Whether this named transformation is enabled. If omitted, the existing value is
      #
      # @param name [String] Updated name of the named transformation. Can only contain alphanumeric characte
      #
      # @param transformation [String] Updated transformation, expressed as one or more comma-separated transformation
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

      # Some parameter documentations has been truncated, see
      # {Imagekitio::Models::NamedTransformationDeleteParams} for more details.
      #
      # Permanently deletes the named transformation identified by `id` and returns the
      # deleted object.
      #
      # **Note:**
      #
      # - If another _enabled_ named transformation, or your account's upload
      #   pre-transformation/post-transformation settings, reference this named
      #   transformation (via the `n-<name>` token), the request fails with a `409`
      #   error whose `message` describes what it is referenced by. A reference from a
      #   named transformation that is itself disabled does not block this request.
      #   Remove or disable those references first, then retry the deletion. This is a
      #   best-effort check and cannot detect references baked into your own application
      #   code or previously generated URLs.
      #
      # @overload delete(id, request_options: {})
      #
      # @param id [String] Unique identifier of the named transformation. This is the `id` returned when th
      #
      # @param request_options [Imagekitio::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Imagekitio::Models::NamedTransformation]
      #
      # @see Imagekitio::Models::NamedTransformationDeleteParams
      def delete(id, params = {})
        @client.request(
          method: :delete,
          path: ["v1/named-transformations/%1$s", id],
          model: Imagekitio::NamedTransformation,
          options: params[:request_options]
        )
      end

      # Some parameter documentations has been truncated, see
      # {Imagekitio::Models::NamedTransformationGetParams} for more details.
      #
      # Retrieves the named transformation identified by `id`.
      #
      # @overload get(id, request_options: {})
      #
      # @param id [String] Unique identifier of the named transformation. This is the `id` returned when th
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
