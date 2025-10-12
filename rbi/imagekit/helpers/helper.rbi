# typed: strong

module Imagekit
  module Helpers
    class Helper
      sig { params(client: Imagekit::Client).void }
      def initialize(client:); end

      # Builds a URL with transformations applied
      sig do
        params(
          transformations: T::Array[Imagekit::Models::Transformation]
        ).returns(String)
      end
      def buildURL(transformations); end

      # Generates transformation string from transformation objects
      sig do
        params(
          transformations: T::Array[Imagekit::Models::Transformation]
        ).returns(String)
      end
      def buildTransformationString(transformations); end

      # Gets authentication parameters for ImageKit requests
      sig do
        params(token: T.nilable(String)).returns(
          T::Hash[Symbol, T.any(String, Integer)]
        )
      end
      def GetAuthenticationParameters(token = nil); end
    end
  end
end
