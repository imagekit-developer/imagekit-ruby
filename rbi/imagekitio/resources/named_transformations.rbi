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
      sig do
        params(
          name: String,
          transformation: String,
          disabled: T::Boolean,
          request_options: Imagekitio::RequestOptions::OrHash
        ).returns(Imagekitio::NamedTransformation)
      end
      def create(
        # Name of the named transformation. This is the alias used to refer to the
        # transformation string in image and video URLs, for example `tr:n-<name>`. Can
        # only contain alphanumeric characters, `_` and `-`, and must be unique for your
        # account (case-insensitive).
        name:,
        # The transformation string this name refers to. It must start with `tr:` followed
        # by one or more transformation parameters, for example
        # `tr:w-150,h-150,fo-center,cm-resize`. Learn more about the
        # [transformation syntax](https://imagekit.io/docs/transformations).
        transformation:,
        # Whether this named transformation is disabled. Set to `true` to temporarily
        # disable it without deleting it — requests using a disabled named transformation
        # fail at delivery time.
        disabled: nil,
        request_options: {}
      )
      end

      # Updates the named transformation identified by `id` and returns the updated
      # object. Only the fields present in the request body are updated; omitted fields
      # are left unchanged.
      sig do
        params(
          id: String,
          disabled: T::Boolean,
          name: String,
          transformation: String,
          request_options: Imagekitio::RequestOptions::OrHash
        ).returns(Imagekitio::NamedTransformation)
      end
      def update(
        # Unique identifier of the named transformation. This is the `id` returned when
        # the named transformation was created.
        id,
        # Whether this named transformation is disabled.
        disabled: nil,
        # Updated name of the named transformation. Can only contain alphanumeric
        # characters, `_` and `-`, and must be unique for your account (case-insensitive).
        name: nil,
        # Updated transformation string. It must start with `tr:` followed by one or more
        # transformation parameters.
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
      # - If another named transformation, or your account's upload
      #   pre-transformation/post-transformation settings, reference this named
      #   transformation (via the `n-<name>` token), the request fails with a `409`
      #   error whose `message` describes what it is referenced by. Remove those
      #   references first, then retry the deletion. This is a best-effort check and
      #   cannot detect references baked into your own application code or previously
      #   generated URLs.
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
