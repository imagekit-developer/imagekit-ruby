# frozen_string_literal: true

module Imagekitio
  module Models
    class OverlayTiming < Imagekitio::Internal::Type::BaseModel
      # @!attribute duration
      #   Specifies the duration (in seconds) during which the overlay should appear on
      #   the base video. Accepts a positive number up to two decimal places (e.g., `20`
      #   or `20.50`) and arithmetic expressions such as `bdu_mul_0.4` or `bdu_sub_idu`.
      #   Applies only if the base asset is a video. Maps to `ldu` in the URL.
      #
      #   @return [Float, String, nil]
      optional :duration, union: -> { Imagekitio::OverlayTiming::Duration }

      # @!attribute end_
      #   Specifies the end time (in seconds) for when the overlay should disappear from
      #   the base video. If both end and duration are provided, duration is ignored.
      #   Accepts a positive number up to two decimal places (e.g., `20` or `20.50`) and
      #   arithmetic expressions such as `bdu_mul_0.4` or `bdu_sub_idu`. Applies only if
      #   the base asset is a video. Maps to `leo` in the URL.
      #
      #   @return [Float, String, nil]
      optional :end_, union: -> { Imagekitio::OverlayTiming::End }, api_name: :end

      # @!attribute start
      #   Specifies the start time (in seconds) for when the overlay should appear on the
      #   base video. Accepts a positive number up to two decimal places (e.g., `20` or
      #   `20.50`) and arithmetic expressions such as `bdu_mul_0.4` or `bdu_sub_idu`.
      #   Applies only if the base asset is a video. Maps to `lso` in the URL.
      #
      #   @return [Float, String, nil]
      optional :start, union: -> { Imagekitio::OverlayTiming::Start }

      # @!method initialize(duration: nil, end_: nil, start: nil)
      #   Some parameter documentations has been truncated, see
      #   {Imagekitio::Models::OverlayTiming} for more details.
      #
      #   @param duration [Float, String] Specifies the duration (in seconds) during which the overlay should appear on th
      #
      #   @param end_ [Float, String] Specifies the end time (in seconds) for when the overlay should disappear from t
      #
      #   @param start [Float, String] Specifies the start time (in seconds) for when the overlay should appear on the

      # Specifies the duration (in seconds) during which the overlay should appear on
      # the base video. Accepts a positive number up to two decimal places (e.g., `20`
      # or `20.50`) and arithmetic expressions such as `bdu_mul_0.4` or `bdu_sub_idu`.
      # Applies only if the base asset is a video. Maps to `ldu` in the URL.
      #
      # @see Imagekitio::Models::OverlayTiming#duration
      module Duration
        extend Imagekitio::Internal::Type::Union

        variant Float

        variant String

        # @!method self.variants
        #   @return [Array(Float, String)]
      end

      # Specifies the end time (in seconds) for when the overlay should disappear from
      # the base video. If both end and duration are provided, duration is ignored.
      # Accepts a positive number up to two decimal places (e.g., `20` or `20.50`) and
      # arithmetic expressions such as `bdu_mul_0.4` or `bdu_sub_idu`. Applies only if
      # the base asset is a video. Maps to `leo` in the URL.
      #
      # @see Imagekitio::Models::OverlayTiming#end_
      module End
        extend Imagekitio::Internal::Type::Union

        variant Float

        variant String

        # @!method self.variants
        #   @return [Array(Float, String)]
      end

      # Specifies the start time (in seconds) for when the overlay should appear on the
      # base video. Accepts a positive number up to two decimal places (e.g., `20` or
      # `20.50`) and arithmetic expressions such as `bdu_mul_0.4` or `bdu_sub_idu`.
      # Applies only if the base asset is a video. Maps to `lso` in the URL.
      #
      # @see Imagekitio::Models::OverlayTiming#start
      module Start
        extend Imagekitio::Internal::Type::Union

        variant Float

        variant String

        # @!method self.variants
        #   @return [Array(Float, String)]
      end
    end
  end
end
