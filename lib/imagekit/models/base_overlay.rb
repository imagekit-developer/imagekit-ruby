# frozen_string_literal: true

module Imagekit
  module Models
    class BaseOverlay < Imagekit::Internal::Type::BaseModel
      # @!attribute position
      #
      #   @return [Imagekit::Models::OverlayPosition, nil]
      optional :position, -> { Imagekit::OverlayPosition }

      # @!attribute timing
      #
      #   @return [Imagekit::Models::OverlayTiming, nil]
      optional :timing, -> { Imagekit::OverlayTiming }

      # @!method initialize(position: nil, timing: nil)
      #   @param position [Imagekit::Models::OverlayPosition]
      #   @param timing [Imagekit::Models::OverlayTiming]
    end
  end
end
