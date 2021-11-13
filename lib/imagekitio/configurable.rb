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
        initialize_service
      end

      def initialize_service
        if config.service == :carrierwave
          require_relative '../carrierwave/carrierwave'
        elsif config.service == :active_storage
          require_relative '../active_storage/active_storage'
        end
      end

      def constants
        config.constants
      end
    end

    class Configuration
      AVAILABLE_SERVICE = [:carrierwave, :active_storage]
      attr_accessor :public_key, :private_key, :url_endpoint, :service

      def service
        @service&.to_sym || :carrierwave
      end

      def constants
        @constants ||= ImageKitIo::Constant
      end
    end
  end
end
