# typed: strong

module Imagekit
  module Resources
    class Cache
      sig { returns(Imagekit::Resources::Cache::Invalidation) }
      attr_reader :invalidation

      # @api private
      sig { params(client: Imagekit::Client).returns(T.attached_class) }
      def self.new(client:)
      end
    end
  end
end
