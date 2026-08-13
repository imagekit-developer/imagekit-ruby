# typed: strong

module Imagekitio
  module Resources
    class NamedTransformations
      # Creates a new named transformation and returns the created object.
      #
      # A named transformation is a short, reusable name for a transformation string.
      # Use it in image and video URLs as `tr:n-<name>`, and update the underlying
      # transformation later without changing existing URLs. Learn more about
      # [named transformations](https://imagekit.io/docs/transformations#named-transformations).
      #
      # You can create up to 250 named transformations per account.
      sig do
        params(
          name: String,
          transformation: String,
          enabled: T::Boolean,
          request_options: Imagekitio::RequestOptions::OrHash
        ).returns(Imagekitio::NamedTransformation)
      end
      def create(
        # Alias for the transformation string, used in URLs as `tr:n-<name>`. Must contain
        # only alphanumeric characters or `_` (no hyphens), and be unique for your
        # account. Name matching is case-sensitive.
        name:,
        # The transformation string this name refers to, for example
        # `w-150,h-150,fo-center,cm-resize`. The `tr:` prefix is optional; if present, it
        # is validated. The string must be a valid ImageKit transformation and cannot
        # itself reference another named transformation (no nesting). Learn more about the
        # [transformation syntax](https://imagekit.io/docs/transformations).
        transformation:,
        # Whether the named transformation is currently enabled. When this is set to
        # `false`, requests using such disabled named transformations fail at delivery
        # time.
        enabled: nil,
        request_options: {}
      )
      end

      # Updates the named transformation identified by `id` and returns the updated
      # object. Only the fields present in the request body are updated; other fields
      # stay unchanged.
      #
      # Renaming or disabling a named transformation fails with a `409` error if it is
      # still referenced (via the `n-<name>` token) by an upload pre-transformation or
      # post-transformation setting. This check is best-effort and can't detect
      # references in your own application code or in previously generated URLs.
      sig do
        params(
          id: String,
          enabled: T::Boolean,
          name: String,
          transformation: String,
          request_options: Imagekitio::RequestOptions::OrHash
        ).returns(Imagekitio::NamedTransformation)
      end
      def update(
        # Unique identifier for a named transformation.
        id,
        # Whether the named transformation is enabled. Omit to leave the current value
        # unchanged.
        enabled: nil,
        # Alias for the transformation string, used in URLs as `tr:n-<name>`. Must contain
        # only alphanumeric characters or `_` (no hyphens), and be unique for your
        # account. Name matching is case-sensitive.
        name: nil,
        # The transformation string this name refers to, for example
        # `w-150,h-150,fo-center,cm-resize`. The `tr:` prefix is optional; if present, it
        # is validated. The string must be a valid ImageKit transformation and cannot
        # itself reference another named transformation (no nesting). Learn more about the
        # [transformation syntax](https://imagekit.io/docs/transformations).
        transformation: nil,
        request_options: {}
      )
      end

      # Returns an array of all named transformations configured for your account.
      sig do
        params(request_options: Imagekitio::RequestOptions::OrHash).returns(
          T::Array[Imagekitio::NamedTransformation]
        )
      end
      def list(request_options: {})
      end

      # Permanently deletes the named transformation identified by `id`.
      #
      # Deletion fails with a `409` error if the named transformation is still
      # referenced (via the `n-<name>` token) by an upload pre-transformation or
      # post-transformation setting. This check is best-effort and can't detect
      # references in your own application code or in previously generated URLs.
      sig do
        params(
          id: String,
          request_options: Imagekitio::RequestOptions::OrHash
        ).returns(Imagekitio::Models::NamedTransformationDeleteResponse)
      end
      def delete(
        # Unique identifier for a named transformation.
        id,
        request_options: {}
      )
      end

      # Retrieves the named transformation identified by `id`.
      sig do
        params(
          id: String,
          request_options: Imagekitio::RequestOptions::OrHash
        ).returns(Imagekitio::NamedTransformation)
      end
      def get(
        # Unique identifier for a named transformation.
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
