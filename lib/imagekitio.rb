require "imagekitio/railtie" if defined? Rails

require 'base64'

require_relative './imagekitio/constant'
require_relative './imagekitio/base'
require_relative './imagekitio/configurable'
require_relative './imagekitio/client'
require_relative "./imagekitio/request"
require_relative "./imagekitio/url"
require_relative './imagekitio/api_service/custom_metadata_field'
require_relative './imagekitio/api_service/file'
require_relative './imagekitio/api_service/folder'
