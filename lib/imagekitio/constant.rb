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

    class << self
      def method_missing(symbol, *args)
        method_name = symbol.to_s.gsub('=', '')
        if self.const_defined? method_name
          return self.const_get(method_name) unless args.present?
          self.const_set(method_name, args.first)
        else
          super
        end
      end
    end
  end
end
