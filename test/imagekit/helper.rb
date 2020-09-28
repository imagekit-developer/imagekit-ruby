require 'base64'
require_relative '../../lib/imagekit/imagekit.rb'
require_relative "../../lib/imagekit/resource"
require_relative "../../lib/imagekit/file"
require_relative "../../lib/imagekit/url"
require_relative "../../lib/imagekit/utils/calculation"

require 'simplecov'
SimpleCov.start

require 'codecov'
SimpleCov.formatter = SimpleCov::Formatter::Codecov

PRIVATE_KEY = "private_xyz"
PUBLIC_KEY = "public_xyz"
URL_ENDPOINT = "imagekit.io/your-imgekit-id/"
