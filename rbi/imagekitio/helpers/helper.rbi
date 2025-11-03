# typed: strong

module Imagekitio
  class Helper
    sig { params(client: Imagekitio::Client).void }
    def initialize(client:)
    end

    # Builds a URL with transformations applied
    sig { params(options: Imagekitio::Models::SrcOptions).returns(String) }
    def build_url(options)
    end

    # Generates transformation string from transformation objects
    sig do
      params(
        transformations: T::Array[Imagekitio::Models::Transformation]
      ).returns(String)
    end
    def build_transformation_string(transformations)
    end

    # Generates authentication parameters for client-side file uploads
    sig do
      params(token: T.nilable(String), expire: T.nilable(Integer)).returns(
        T::Hash[Symbol, T.any(String, Integer)]
      )
    end
    def get_authentication_parameters(token = nil, expire = nil)
    end

    # Generates responsive image attributes for use in HTML <img> tags
    sig do
      params(options: Imagekitio::Models::GetImageAttributesOptions).returns(
        Imagekitio::Models::ResponsiveImageAttributes
      )
    end
    def get_responsive_image_attributes(options)
    end
  end
end
