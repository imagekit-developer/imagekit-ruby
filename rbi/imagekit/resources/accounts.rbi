# typed: strong

module Imagekit
  module Resources
    class Accounts
      sig { returns(Imagekit::Resources::Accounts::Usage) }
      attr_reader :usage

      sig { returns(Imagekit::Resources::Accounts::Origins) }
      attr_reader :origins

      sig { returns(Imagekit::Resources::Accounts::URLEndpoints) }
      attr_reader :url_endpoints

      # @api private
      sig { params(client: Imagekit::Client).returns(T.attached_class) }
      def self.new(client:)
      end
    end
  end
end
