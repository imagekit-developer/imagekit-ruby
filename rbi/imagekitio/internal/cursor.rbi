# typed: strong

module Imagekitio
  module Internal
    class Cursor
      include Imagekitio::Internal::Type::BasePage

      Elem = type_member

      sig { returns(T.nilable(T::Array[Elem])) }
      attr_accessor :tags

      sig { returns(T.nilable(String)) }
      attr_accessor :next_cursor

      # @api private
      sig { returns(String) }
      def inspect
      end
    end
  end
end
