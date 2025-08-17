# frozen_string_literal: true

module Imagekit
  module Resources
    class Beta
      # @return [Imagekit::Resources::Beta::V2]
      attr_reader :v2

      # @api private
      #
      # @param client [Imagekit::Client]
      def initialize(client:)
        @client = client
        @v2 = Imagekit::Resources::Beta::V2.new(client: client)
      end
    end
  end
end
