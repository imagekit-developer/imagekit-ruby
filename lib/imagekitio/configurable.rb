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
      AVAILABLE_SERVICE = [:carrierwave, :active_storage]
      attr_accessor :public_key, :private_key, :url_endpoint, :service

      def service
        @service.to_sym || :carrierwave
      end
    end
  end
end
