# frozen_string_literal: true

module Imagekitio
  module Resources
    class Accounts
      # @return [Imagekitio::Resources::Accounts::Usage]
      attr_reader :usage

      # @return [Imagekitio::Resources::Accounts::Origins]
      attr_reader :origins

      # @return [Imagekitio::Resources::Accounts::URLEndpoints]
      attr_reader :url_endpoints

      # @api private
      #
      # @param client [Imagekitio::Client]
      def initialize(client:)
        @client = client
        @usage = Imagekitio::Resources::Accounts::Usage.new(client: client)
        @origins = Imagekitio::Resources::Accounts::Origins.new(client: client)
        @url_endpoints = Imagekitio::Resources::Accounts::URLEndpoints.new(client: client)
      end
    end
  end
end
