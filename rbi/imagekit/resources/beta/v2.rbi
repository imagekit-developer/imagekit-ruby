# typed: strong

module Imagekit
  module Resources
    class Beta
      class V2
        sig { returns(Imagekit::Resources::Beta::V2::Files) }
        attr_reader :files

        # @api private
        sig { params(client: Imagekit::Client).returns(T.attached_class) }
        def self.new(client:)
        end
      end
    end
  end
end
