# frozen_string_literal: true

module Imagekit
  module Models
    class SrcOptions < Imagekit::Internal::Type::BaseModel
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

      # @!attribute query_parameters
      #   These are additional query parameters that you want to add to the final URL.
      #   They can be any query parameters and not necessarily related to ImageKit. This
      #   is especially useful if you want to add a versioning parameter to your URLs.
      #
      #   @return [Hash{Symbol=>String, Float}, nil]
      optional :query_parameters,
               -> { Imagekit::Internal::Type::HashOf[union: Imagekit::SrcOptions::QueryParameter] },
               api_name: :queryParameters

      # @!attribute transformation
      #   An array of objects specifying the transformations to be applied in the URL. If
      #   more than one transformation is specified, they are applied in the order they
      #   are specified as chained transformations.
      #
      #   @return [Array<Imagekit::Models::Transformation>, nil]
      optional :transformation, -> { Imagekit::Internal::Type::ArrayOf[Imagekit::Transformation] }

      # @!attribute transformation_position
      #   By default, the transformation string is added as a query parameter in the URL,
      #   e.g., `?tr=w-100,h-100`. If you want to add the transformation string in the
      #   path of the URL, set this to `path`.
      #
      #   @return [Symbol, Imagekit::Models::TransformationPosition, nil]
      optional :transformation_position,
               enum: -> { Imagekit::TransformationPosition },
               api_name: :transformationPosition

      # @!method initialize(src:, url_endpoint:, query_parameters: nil, transformation: nil, transformation_position: nil)
      #   Some parameter documentations has been truncated, see
      #   {Imagekit::Models::SrcOptions} for more details.
      #
      #   Options for generating ImageKit URLs with transformations
      #
      #   @param src [String] Accepts a relative or absolute path of the resource. If a relative path is provi
      #
      #   @param url_endpoint [String] Get your urlEndpoint from the [ImageKit dashboard](https://imagekit.io/dashboard
      #
      #   @param query_parameters [Hash{Symbol=>String, Float}] These are additional query parameters that you want to add to the final URL.
      #
      #   @param transformation [Array<Imagekit::Models::Transformation>] An array of objects specifying the transformations to be applied in the URL. If
      #
      #   @param transformation_position [Symbol, Imagekit::Models::TransformationPosition] By default, the transformation string is added as a query parameter in the URL,

      module QueryParameter
        extend Imagekit::Internal::Type::Union

        variant String

        variant Float

        # @!method self.variants
        #   @return [Array(String, Float)]
      end
    end
  end
end
