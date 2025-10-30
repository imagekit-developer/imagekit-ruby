# frozen_string_literal: true

module Imagekitio
  module Resources
    class Cache
      # @return [Imagekitio::Resources::Cache::Invalidation]
      attr_reader :invalidation

      # @api private
      #
      # @param client [Imagekitio::Client]
      def initialize(client:)
        @client = client
        @invalidation = Imagekitio::Resources::Cache::Invalidation.new(client: client)
      end
    end
  end
end
