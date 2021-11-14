require 'simplecov'
SimpleCov.start 'rails'

require 'codecov'
SimpleCov.formatter = SimpleCov::Formatter::Codecov

require 'base64'
require 'webmock/rspec'
require 'carrierwave'
require 'byebug'

require_relative '../../lib/imagekitio/constant'
require_relative '../../lib/imagekitio/base'
require_relative '../../lib/imagekitio/configurable'
require_relative '../../lib/imagekitio/client'
require_relative "../../lib/imagekitio/request"
require_relative "../../lib/imagekitio/file"
require_relative "../../lib/imagekitio/url"
require_relative "../../lib/imagekitio/utils/calculation"

ImageKitIo.configure do |config|
  config.public_key = 'public_key_xyz'
  config.private_key = 'private_key_xyz'
  config.url_endpoint = 'https://ik.imagekit.io/xyz'
end
