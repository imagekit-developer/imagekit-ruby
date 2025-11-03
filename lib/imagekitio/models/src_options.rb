# frozen_string_literal: true

module Imagekitio
  module Models
    class SrcOptions < Imagekitio::Internal::Type::BaseModel
      # @!attribute src
      #   Accepts a relative or absolute path of the resource. If a relative path is
      #   provided, it is appended to the `urlEndpoint`. If an absolute path is provided,
      #   `urlEndpoint` is ignored.
      #
      #   @return [String]
      required :src, String

      # @!attribute url_endpoint
      #   Get your urlEndpoint from the
      #   [ImageKit dashboard](https://imagekit.io/dashboard/url-endpoints).
      #
      #   @return [String]
      required :url_endpoint, String, api_name: :urlEndpoint

      # @!attribute expires_in
      #   When you want the signed URL to expire, specified in seconds. If `expiresIn` is
      #   anything above 0, the URL will always be signed even if `signed` is set to
      #   false. If not specified and `signed` is `true`, the signed URL will not expire
      #   (valid indefinitely).
      #
      #   Example: Setting `expiresIn: 3600` will make the URL expire 1 hour from
      #   generation time. After the expiry time, the signed URL will no longer be valid
      #   and ImageKit will return a 401 Unauthorized status code.
      #
      #   [Learn more](https://imagekit.io/docs/media-delivery-basic-security#how-to-generate-signed-urls).
      #
      #   @return [Float, nil]
      optional :expires_in, Float, api_name: :expiresIn

      # @!attribute query_parameters
      #   These are additional query parameters that you want to add to the final URL.
      #   They can be any query parameters and not necessarily related to ImageKit. This
      #   is especially useful if you want to add a versioning parameter to your URLs.
      #
      #   @return [Hash{Symbol=>String}, nil]
      optional :query_parameters, Imagekitio::Internal::Type::HashOf[String], api_name: :queryParameters

      # @!attribute signed
      #   Whether to sign the URL or not. Set this to `true` if you want to generate a
      #   signed URL. If `signed` is `true` and `expiresIn` is not specified, the signed
      #   URL will not expire (valid indefinitely). Note: If `expiresIn` is set to any
      #   value above 0, the URL will always be signed regardless of this setting.
      #   [Learn more](https://imagekit.io/docs/media-delivery-basic-security#how-to-generate-signed-urls).
      #
      #   @return [Boolean, nil]
      optional :signed, Imagekitio::Internal::Type::Boolean

      # @!attribute transformation
      #   An array of objects specifying the transformations to be applied in the URL. If
      #   more than one transformation is specified, they are applied in the order they
      #   are specified as chained transformations. See
      #   [Chained transformations](https://imagekit.io/docs/transformations#chained-transformations).
      #
      #   @return [Array<Imagekitio::Models::Transformation>, nil]
      optional :transformation, -> { Imagekitio::Internal::Type::ArrayOf[Imagekitio::Transformation] }

      # @!attribute transformation_position
      #   By default, the transformation string is added as a query parameter in the URL,
      #   e.g., `?tr=w-100,h-100`. If you want to add the transformation string in the
      #   path of the URL, set this to `path`. Learn more in the
      #   [Transformations guide](https://imagekit.io/docs/transformations).
      #
      #   @return [Symbol, Imagekitio::Models::TransformationPosition, nil]
      optional :transformation_position,
               enum: -> { Imagekitio::TransformationPosition },
               api_name: :transformationPosition

      # @!method initialize(src:, url_endpoint:, expires_in: nil, query_parameters: nil, signed: nil, transformation: nil, transformation_position: nil)
      #   Some parameter documentations has been truncated, see
      #   {Imagekitio::Models::SrcOptions} for more details.
      #
      #   Options for generating ImageKit URLs with transformations. See the
      #   [Transformations guide](https://imagekit.io/docs/transformations).
      #
      #   @param src [String] Accepts a relative or absolute path of the resource. If a relative path is provi
      #
      #   @param url_endpoint [String] Get your urlEndpoint from the [ImageKit dashboard](https://imagekit.io/dashboard
      #
      #   @param expires_in [Float] When you want the signed URL to expire, specified in seconds. If `expiresIn` is
      #
      #   @param query_parameters [Hash{Symbol=>String}] These are additional query parameters that you want to add to the final URL.
      #
      #   @param signed [Boolean] Whether to sign the URL or not. Set this to `true` if you want to generate a sig
      #
      #   @param transformation [Array<Imagekitio::Models::Transformation>] An array of objects specifying the transformations to be applied in the URL. If
      #
      #   @param transformation_position [Symbol, Imagekitio::Models::TransformationPosition] By default, the transformation string is added as a query parameter in the URL,
    end
  end
end
