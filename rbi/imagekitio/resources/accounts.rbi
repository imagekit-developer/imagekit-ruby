# typed: strong

module Imagekitio
  module Resources
    class Accounts
      sig { returns(Imagekitio::Resources::Accounts::Usage) }
      attr_reader :usage

      sig { returns(Imagekitio::Resources::Accounts::Origins) }
      attr_reader :origins

      sig { returns(Imagekitio::Resources::Accounts::URLEndpoints) }
      attr_reader :url_endpoints

      # @api private
      sig { params(client: Imagekitio::Client).returns(T.attached_class) }
      def self.new(client:)
      end
    end
  end
end
