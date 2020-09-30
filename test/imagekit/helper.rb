# Insert token for imagekitio/imagekit-ruby repo's token from codecov
# ENV["CODECOV_TOKEN"] = ""

require 'simplecov'
SimpleCov.start 'rails'

# uncomment once the correct token has been placed in first line
# require 'codecov'
# SimpleCov.formatter = SimpleCov::Formatter::Codecov

require 'base64'
require 'webmock/rspec'
require_relative '../../lib/imagekit/imagekit.rb'
require_relative "../../lib/imagekit/resource"
require_relative "../../lib/imagekit/file"
require_relative "../../lib/imagekit/url"
require_relative "../../lib/imagekit/utils/calculation"

PRIVATE_KEY = "private_xyz"
PUBLIC_KEY = "public_xyz"
URL_ENDPOINT = "imagekit.io/your-imgekit-id/"
