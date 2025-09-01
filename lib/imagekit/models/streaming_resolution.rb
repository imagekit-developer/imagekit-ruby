# frozen_string_literal: true

module Imagekit
  module Models
    # Available streaming resolutions for
    # [adaptive bitrate streaming](https://imagekit.io/docs/adaptive-bitrate-streaming)
    module StreamingResolution
      extend Imagekit::Internal::Type::Enum

      STREAMING_RESOLUTION_240 = :"240"
      STREAMING_RESOLUTION_360 = :"360"
      STREAMING_RESOLUTION_480 = :"480"
      STREAMING_RESOLUTION_720 = :"720"
      STREAMING_RESOLUTION_1080 = :"1080"
      STREAMING_RESOLUTION_1440 = :"1440"
      STREAMING_RESOLUTION_2160 = :"2160"

      # @!method self.values
      #   @return [Array<Symbol>]
    end
  end
end
