# frozen_string_literal: true

module Imagekit
  module Resources
    class Cache
      # @return [Imagekit::Resources::Cache::Invalidation]
      attr_reader :invalidation

      # @api private
      #
      # @param client [Imagekit::Client]
      def initialize(client:)
        @client = client
        @invalidation = Imagekit::Resources::Cache::Invalidation.new(client: client)
      end
    end
  end
end
