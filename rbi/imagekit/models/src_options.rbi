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

      # These are additional query parameters that you want to add to the final URL.
      # They can be any query parameters and not necessarily related to ImageKit. This
      # is especially useful if you want to add a versioning parameter to your URLs.
      sig { returns(T.nilable(T::Hash[Symbol, String])) }
      attr_reader :query_parameters

      sig { params(query_parameters: T::Hash[Symbol, String]).void }
      attr_writer :query_parameters

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
      sig { returns(T.nilable(Imagekit::TransformationPosition::OrSymbol)) }
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
          query_parameters: T::Hash[Symbol, String],
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
        # These are additional query parameters that you want to add to the final URL.
        # They can be any query parameters and not necessarily related to ImageKit. This
        # is especially useful if you want to add a versioning parameter to your URLs.
        query_parameters: nil,
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
            query_parameters: T::Hash[Symbol, String],
            transformation: T::Array[Imagekit::Transformation],
            transformation_position: Imagekit::TransformationPosition::OrSymbol
          }
        )
      end
      def to_hash
      end
    end
  end
end
