# typed: strong

module Imagekit
  module Models
    class SrcOptions < Imagekit::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(Imagekit::SrcOptions, Imagekit::Internal::AnyHash)
        end

      # Accepts a relative or absolute path of the resource. If a relative path is
      # provided, it is appended to the `urlEndpoint`. If an absolute path is provided,
      # `urlEndpoint` is ignored.
      sig { returns(String) }
      attr_accessor :src

      # Get your urlEndpoint from the
      # [ImageKit dashboard](https://imagekit.io/dashboard/url-endpoints).
      sig { returns(String) }
      attr_accessor :url_endpoint

      # When you want the signed URL to expire, specified in seconds. If `expiresIn` is
      # anything above 0, the URL will always be signed even if `signed` is set to
      # false. If not specified and `signed` is `true`, the signed URL will not expire
      # (valid indefinitely).
      #
      # Example: Setting `expiresIn: 3600` will make the URL expire 1 hour from
      # generation time. After the expiry time, the signed URL will no longer be valid
      # and ImageKit will return a 401 Unauthorized status code.
      #
      # [Learn more](https://imagekit.io/docs/media-delivery-basic-security#how-to-generate-signed-urls).
      sig { returns(T.nilable(Float)) }
      attr_reader :expires_in

      sig { params(expires_in: Float).void }
      attr_writer :expires_in

      # These are additional query parameters that you want to add to the final URL.
      # They can be any query parameters and not necessarily related to ImageKit. This
      # is especially useful if you want to add a versioning parameter to your URLs.
      sig { returns(T.nilable(T::Hash[Symbol, String])) }
      attr_reader :query_parameters

      sig { params(query_parameters: T::Hash[Symbol, String]).void }
      attr_writer :query_parameters

      # Whether to sign the URL or not. Set this to `true` if you want to generate a
      # signed URL. If `signed` is `true` and `expiresIn` is not specified, the signed
      # URL will not expire (valid indefinitely). Note: If `expiresIn` is set to any
      # value above 0, the URL will always be signed regardless of this setting.
      # [Learn more](https://imagekit.io/docs/media-delivery-basic-security#how-to-generate-signed-urls).
      sig { returns(T.nilable(T::Boolean)) }
      attr_reader :signed

      sig { params(signed: T::Boolean).void }
      attr_writer :signed

      # An array of objects specifying the transformations to be applied in the URL. If
      # more than one transformation is specified, they are applied in the order they
      # are specified as chained transformations. See
      # [Chained transformations](https://imagekit.io/docs/transformations#chained-transformations).
      sig { returns(T.nilable(T::Array[Imagekit::Transformation])) }
      attr_reader :transformation

      sig do
        params(transformation: T::Array[Imagekit::Transformation::OrHash]).void
      end
      attr_writer :transformation

      # By default, the transformation string is added as a query parameter in the URL,
      # e.g., `?tr=w-100,h-100`. If you want to add the transformation string in the
      # path of the URL, set this to `path`. Learn more in the
      # [Transformations guide](https://imagekit.io/docs/transformations).
      sig { returns(T.nilable(Imagekit::TransformationPosition::TaggedSymbol)) }
      attr_reader :transformation_position

      sig do
        params(
          transformation_position: Imagekit::TransformationPosition::OrSymbol
        ).void
      end
      attr_writer :transformation_position

      # Options for generating ImageKit URLs with transformations. See the
      # [Transformations guide](https://imagekit.io/docs/transformations).
      sig do
        params(
          src: String,
          url_endpoint: String,
          expires_in: Float,
          query_parameters: T::Hash[Symbol, String],
          signed: T::Boolean,
          transformation: T::Array[Imagekit::Transformation::OrHash],
          transformation_position: Imagekit::TransformationPosition::OrSymbol
        ).returns(T.attached_class)
      end
      def self.new(
        # Accepts a relative or absolute path of the resource. If a relative path is
        # provided, it is appended to the `urlEndpoint`. If an absolute path is provided,
        # `urlEndpoint` is ignored.
        src:,
        # Get your urlEndpoint from the
        # [ImageKit dashboard](https://imagekit.io/dashboard/url-endpoints).
        url_endpoint:,
        # When you want the signed URL to expire, specified in seconds. If `expiresIn` is
        # anything above 0, the URL will always be signed even if `signed` is set to
        # false. If not specified and `signed` is `true`, the signed URL will not expire
        # (valid indefinitely).
        #
        # Example: Setting `expiresIn: 3600` will make the URL expire 1 hour from
        # generation time. After the expiry time, the signed URL will no longer be valid
        # and ImageKit will return a 401 Unauthorized status code.
        #
        # [Learn more](https://imagekit.io/docs/media-delivery-basic-security#how-to-generate-signed-urls).
        expires_in: nil,
        # These are additional query parameters that you want to add to the final URL.
        # They can be any query parameters and not necessarily related to ImageKit. This
        # is especially useful if you want to add a versioning parameter to your URLs.
        query_parameters: nil,
        # Whether to sign the URL or not. Set this to `true` if you want to generate a
        # signed URL. If `signed` is `true` and `expiresIn` is not specified, the signed
        # URL will not expire (valid indefinitely). Note: If `expiresIn` is set to any
        # value above 0, the URL will always be signed regardless of this setting.
        # [Learn more](https://imagekit.io/docs/media-delivery-basic-security#how-to-generate-signed-urls).
        signed: nil,
        # An array of objects specifying the transformations to be applied in the URL. If
        # more than one transformation is specified, they are applied in the order they
        # are specified as chained transformations. See
        # [Chained transformations](https://imagekit.io/docs/transformations#chained-transformations).
        transformation: nil,
        # By default, the transformation string is added as a query parameter in the URL,
        # e.g., `?tr=w-100,h-100`. If you want to add the transformation string in the
        # path of the URL, set this to `path`. Learn more in the
        # [Transformations guide](https://imagekit.io/docs/transformations).
        transformation_position: nil
      )
      end

      sig do
        override.returns(
          {
            src: String,
            url_endpoint: String,
            expires_in: Float,
            query_parameters: T::Hash[Symbol, String],
            signed: T::Boolean,
            transformation: T::Array[Imagekit::Transformation],
            transformation_position:
              Imagekit::TransformationPosition::TaggedSymbol
          }
        )
      end
      def to_hash
      end
    end
  end
end
