# frozen_string_literal: true

require "securerandom"

module Imagekitio
  # @api private
  # UUID utilities for ImageKit SDK
  module UuidUtils
    class << self
      # Generates a UUID v4 string
      #
      # @return [String] A UUID v4 string
      def uuid4
        SecureRandom.uuid
      end
    end
  end
end
