# frozen_string_literal: true

module Imagekit
  module Models
    class SubtitleOverlayTransformation < Imagekit::Internal::Type::BaseModel
      # @!attribute background
      #   Background color for subtitles
      #
      #   @return [String, nil]
      optional :background, String

      # @!attribute color
      #   Text color for subtitles
      #
      #   @return [String, nil]
      optional :color, String

      # @!attribute font_family
      #   Font family for subtitles
      #
      #   @return [String, nil]
      optional :font_family, String, api_name: :fontFamily

      # @!attribute font_outline
      #   Font outline for subtitles
      #
      #   @return [String, nil]
      optional :font_outline, String, api_name: :fontOutline

      # @!attribute font_shadow
      #   Font shadow for subtitles
      #
      #   @return [String, nil]
      optional :font_shadow, String, api_name: :fontShadow

      # @!attribute font_size
      #   Font size for subtitles
      #
      #   @return [Float, String, nil]
      optional :font_size,
               union: -> {
                 Imagekit::SubtitleOverlayTransformation::FontSize
               },
               api_name: :fontSize

      # @!attribute typography
      #   Typography style for subtitles
      #
      #   @return [Symbol, Imagekit::Models::SubtitleOverlayTransformation::Typography, nil]
      optional :typography, enum: -> { Imagekit::SubtitleOverlayTransformation::Typography }

      # @!method initialize(background: nil, color: nil, font_family: nil, font_outline: nil, font_shadow: nil, font_size: nil, typography: nil)
      #   @param background [String] Background color for subtitles
      #
      #   @param color [String] Text color for subtitles
      #
      #   @param font_family [String] Font family for subtitles
      #
      #   @param font_outline [String] Font outline for subtitles
      #
      #   @param font_shadow [String] Font shadow for subtitles
      #
      #   @param font_size [Float, String] Font size for subtitles
      #
      #   @param typography [Symbol, Imagekit::Models::SubtitleOverlayTransformation::Typography] Typography style for subtitles

      # Font size for subtitles
      #
      # @see Imagekit::Models::SubtitleOverlayTransformation#font_size
      module FontSize
        extend Imagekit::Internal::Type::Union

        variant Float

        variant String

        # @!method self.variants
        #   @return [Array(Float, String)]
      end

      # Typography style for subtitles
      #
      # @see Imagekit::Models::SubtitleOverlayTransformation#typography
      module Typography
        extend Imagekit::Internal::Type::Enum

        B = :b
        I = :i
        B_I = :b_i

        # @!method self.values
        #   @return [Array<Symbol>]
      end
    end
  end
end
