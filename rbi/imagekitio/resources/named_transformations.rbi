# typed: strong

module Imagekitio
  module Resources
    class NamedTransformations
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
      sig do
        params(
          name: String,
          transformation: String,
          enabled: T::Boolean,
          request_options: Imagekitio::RequestOptions::OrHash
        ).returns(Imagekitio::NamedTransformation)
      end
      def create(
        # Name of the named transformation. This is the alias used to refer to the
        # transformation string in image and video URLs, for example `tr:n-<name>`. Can
        # only contain alphanumeric characters or `_` (hyphens are not allowed), and must
        # be unique for your account. Name matching is case-sensitive, so
        # `Small_Thumbnail` and `small_thumbnail` are treated as different names.
        name:,
        # The transformation this name refers to, expressed as one or more comma-separated
        # transformation parameters, for example `w-150,h-150,fo-center,cm-resize`. You do
        # not need to prefix this with `tr:` — it is added automatically. If you do
        # include it, it must appear in lowercase at the start of the string, or the
        # request is rejected. Learn more about the
        # [transformation syntax](https://imagekit.io/docs/transformations).
        transformation:,
        # Whether this named transformation is enabled. Set to `false` to temporarily
        # disable it without deleting it — requests using a disabled named transformation
        # fail at delivery time.
        enabled: nil,
        request_options: {}
      )
      end

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
        # Unique identifier of the named transformation. This is the `id` returned when
        # the named transformation was created.
        id,
        # Whether this named transformation is enabled. If omitted, the existing value is
        # left unchanged.
        enabled: nil,
        # Updated name of the named transformation. Can only contain alphanumeric
        # characters and `_`, and must be unique for your account. Name matching is
        # case-sensitive, so `Small_Thumbnail` and `small_thumbnail` are treated as
        # different names.
        name: nil,
        # Updated transformation, expressed as one or more comma-separated transformation
        # parameters. You do not need to prefix this with `tr:` — it is added
        # automatically. If you do include it, it must appear in lowercase at the start of
        # the string, or the request is rejected.
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
      sig do
        params(
          id: String,
          request_options: Imagekitio::RequestOptions::OrHash
        ).returns(Imagekitio::NamedTransformation)
      end
      def delete(
        # Unique identifier of the named transformation. This is the `id` returned when
        # the named transformation was created.
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
        # Unique identifier of the named transformation. This is the `id` returned when
        # the named transformation was created.
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
