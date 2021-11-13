require_relative './constants/default'
require_relative './constants/error'
require_relative './constants/file'
require_relative './constants/supported_transformation'
require_relative './constants/url'

module ImageKitIo
  module Constantable
    def self.included(base)
      def constants
        ImageKitIo.constants
      end
    end
  end
  class Constant
    include Constants::Default
    include Constants::Error
    include Constants::File
    include Constants::SupportedTransformation
    include Constants::URL
  end
end
