# frozen_string_literal: true

module Imagekit
  module Models
    # By default, the transformation string is added as a query parameter in the URL,
    # e.g., `?tr=w-100,h-100`. If you want to add the transformation string in the
    # path of the URL, set this to `path`. Learn more in the
    # [Transformations guide](https://imagekit.io/docs/transformations).
    module TransformationPosition
      extend Imagekit::Internal::Type::Enum

      PATH = :path
      QUERY = :query

      # @!method self.values
      #   @return [Array<Symbol>]
    end
  end
end
