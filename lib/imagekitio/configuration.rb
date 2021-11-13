module ImageKitIo
  class << self
    def config
      @config ||= Configuration.new
    end

    def configure
      yield config
    end

    def client
      ik_config = config
      @client ||= ImageKitIo::Client.new(ik_config.private_key, ik_config.public_key, ik_config.url_endpoint)
    end
  end

  class Configuration
    attr_accessor :public_key, :private_key, :url_endpoint
  end
end
