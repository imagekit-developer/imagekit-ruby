# typed: strong

module Imagekitio
  module Resources
    class Beta
      class V2
        sig { returns(Imagekitio::Resources::Beta::V2::Files) }
        attr_reader :files

        # @api private
        sig { params(client: Imagekitio::Client).returns(T.attached_class) }
        def self.new(client:)
        end
      end
    end
  end
end
