# frozen_string_literal: true

require "openssl"
require "digest"

module Imagekit
  module Helpers
    # Crypto utilities for ImageKit SDK
    # Provides HMAC-SHA1 functionality for URL signing and authentication
    module CryptoUtils
      class << self
        # Creates an HMAC-SHA1 hash
        #
        # @param key [String] The secret key for HMAC generation
        # @param data [String] The data to be signed
        # @return [String] Hex-encoded HMAC-SHA1 hash
        # @raise [StandardError] if HMAC generation fails
        def create_hmac_sha1(key, data)
          OpenSSL::HMAC.hexdigest("SHA1", key, data)
        rescue StandardError => e
          raise StandardError, "Failed to generate HMAC-SHA1 signature: #{e.message}"
        end
      end
    end
  end
end
