# typed: strong

module Imagekitio
  module Models
    class BaseOverlay < Imagekitio::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(Imagekitio::BaseOverlay, Imagekitio::Internal::AnyHash)
        end

      sig { returns(T.nilable(Imagekitio::OverlayPosition)) }
      attr_reader :position

      sig { params(position: Imagekitio::OverlayPosition::OrHash).void }
      attr_writer :position

      sig { returns(T.nilable(Imagekitio::OverlayTiming)) }
      attr_reader :timing

      sig { params(timing: Imagekitio::OverlayTiming::OrHash).void }
      attr_writer :timing

      sig do
        params(
          position: Imagekitio::OverlayPosition::OrHash,
          timing: Imagekitio::OverlayTiming::OrHash
        ).returns(T.attached_class)
      end
      def self.new(position: nil, timing: nil)
      end

      sig do
        override.returns(
          {
            position: Imagekitio::OverlayPosition,
            timing: Imagekitio::OverlayTiming
          }
        )
      end
      def to_hash
      end
    end
  end
end
