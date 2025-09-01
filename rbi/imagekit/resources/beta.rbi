# typed: strong

module Imagekit
  module Resources
    class Beta
      sig { returns(Imagekit::Resources::Beta::V2) }
      attr_reader :v2

      # @api private
      sig { params(client: Imagekit::Client).returns(T.attached_class) }
      def self.new(client:)
      end
    end
  end
end
