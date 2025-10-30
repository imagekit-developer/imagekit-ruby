# frozen_string_literal: true

module Imagekitio
  module Models
    class BaseOverlay < Imagekitio::Internal::Type::BaseModel
      # @!attribute position
      #
      #   @return [Imagekitio::Models::OverlayPosition, nil]
      optional :position, -> { Imagekitio::OverlayPosition }

      # @!attribute timing
      #
      #   @return [Imagekitio::Models::OverlayTiming, nil]
      optional :timing, -> { Imagekitio::OverlayTiming }

      # @!method initialize(position: nil, timing: nil)
      #   @param position [Imagekitio::Models::OverlayPosition]
      #   @param timing [Imagekitio::Models::OverlayTiming]
    end
  end
end
