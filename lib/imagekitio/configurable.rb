module ImageKitIo
  module Configurable
    def self.included(klass)
      klass.extend ClassMethods
    end

    module ClassMethods
      def config
        @config ||= Configuration.new
      end

      def configure
        yield config
      end
    end

    class Configuration
      attr_accessor :public_key, :private_key, :url_endpoint
    end
  end
end
