# frozen_string_literal: true

module Imagekitio
  module Resources
    class Beta
      class V2
        # @return [Imagekitio::Resources::Beta::V2::Files]
        attr_reader :files

        # @api private
        #
        # @param client [Imagekitio::Client]
        def initialize(client:)
          @client = client
          @files = Imagekitio::Resources::Beta::V2::Files.new(client: client)
        end
      end
    end
  end
end
