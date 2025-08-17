# frozen_string_literal: true

module Imagekit
  module Resources
    class Beta
      class V2
        # @return [Imagekit::Resources::Beta::V2::Files]
        attr_reader :files

        # @api private
        #
        # @param client [Imagekit::Client]
        def initialize(client:)
          @client = client
          @files = Imagekit::Resources::Beta::V2::Files.new(client: client)
        end
      end
    end
  end
end
