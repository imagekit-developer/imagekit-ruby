# typed: strong

module Imagekitio
  module Resources
    class Cache
      sig { returns(Imagekitio::Resources::Cache::Invalidation) }
      attr_reader :invalidation

      # @api private
      sig { params(client: Imagekitio::Client).returns(T.attached_class) }
      def self.new(client:)
      end
    end
  end
end
