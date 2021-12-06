require_relative './configurable'

module ImageKitIo
  include ImageKitIo::Configurable

  class << self
    def client
      ik_config = config
      @client ||= ImageKitIo::Client.new(ik_config.private_key, ik_config.public_key, ik_config.url_endpoint)
    end
  end
end
