# frozen_string_literal: true

module Imagekit
  module Resources
    class Accounts
      # @return [Imagekit::Resources::Accounts::Usage]
      attr_reader :usage

      # @return [Imagekit::Resources::Accounts::Origins]
      attr_reader :origins

      # @return [Imagekit::Resources::Accounts::URLEndpoints]
      attr_reader :url_endpoints

      # @api private
      #
      # @param client [Imagekit::Client]
      def initialize(client:)
        @client = client
        @usage = Imagekit::Resources::Accounts::Usage.new(client: client)
        @origins = Imagekit::Resources::Accounts::Origins.new(client: client)
        @url_endpoints = Imagekit::Resources::Accounts::URLEndpoints.new(client: client)
      end
    end
  end
end
