# typed: strong

module Imagekit
  module Models
    class BaseOverlay < Imagekit::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(Imagekit::BaseOverlay, Imagekit::Internal::AnyHash)
        end

      sig { returns(T.nilable(Imagekit::OverlayPosition)) }
      attr_reader :position

      sig { params(position: Imagekit::OverlayPosition::OrHash).void }
      attr_writer :position

      sig { returns(T.nilable(Imagekit::OverlayTiming)) }
      attr_reader :timing

      sig { params(timing: Imagekit::OverlayTiming::OrHash).void }
      attr_writer :timing

      sig do
        params(
          position: Imagekit::OverlayPosition::OrHash,
          timing: Imagekit::OverlayTiming::OrHash
        ).returns(T.attached_class)
      end
      def self.new(position: nil, timing: nil)
      end

      sig do
        override.returns(
          {
            position: Imagekit::OverlayPosition,
            timing: Imagekit::OverlayTiming
          }
        )
      end
      def to_hash
      end
    end
  end
end
