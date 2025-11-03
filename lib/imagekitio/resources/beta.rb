# frozen_string_literal: true

module Imagekitio
  module Resources
    class Beta
      # @return [Imagekitio::Resources::Beta::V2]
      attr_reader :v2

      # @api private
      #
      # @param client [Imagekitio::Client]
      def initialize(client:)
        @client = client
        @v2 = Imagekitio::Resources::Beta::V2.new(client: client)
      end
    end
  end
end
