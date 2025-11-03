# typed: strong

module Imagekitio
  module Resources
    class Beta
      sig { returns(Imagekitio::Resources::Beta::V2) }
      attr_reader :v2

      # @api private
      sig { params(client: Imagekitio::Client).returns(T.attached_class) }
      def self.new(client:)
      end
    end
  end
end
