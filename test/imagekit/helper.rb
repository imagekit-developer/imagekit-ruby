require 'simplecov'
SimpleCov.start 'rails'

require 'codecov'
SimpleCov.formatter = SimpleCov::Formatter::Codecov

require 'base64'
require 'webmock/rspec'
require_relative '../../lib/imagekitio/client'
require_relative "../../lib/imagekitio/request"
require_relative "../../lib/imagekitio/file"
require_relative "../../lib/imagekitio/url"
require_relative "../../lib/imagekitio/utils/calculation"

PRIVATE_KEY = "private_xyz"
PUBLIC_KEY = "public_xyz"
URL_ENDPOINT = "imagekit.io/your-imgekit-id/"
