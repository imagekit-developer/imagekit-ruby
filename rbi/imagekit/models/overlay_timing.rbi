# typed: strong

module Imagekit
  module Models
    class OverlayTiming < Imagekit::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(Imagekit::OverlayTiming, Imagekit::Internal::AnyHash)
        end

      # Specifies the duration (in seconds) during which the overlay should appear on
      # the base video. Accepts a positive number up to two decimal places (e.g., `20`
      # or `20.50`) and arithmetic expressions such as `bdu_mul_0.4` or `bdu_sub_idu`.
      # Applies only if the base asset is a video. Maps to `ldu` in the URL.
      sig { returns(T.nilable(Imagekit::OverlayTiming::Duration::Variants)) }
      attr_reader :duration

      sig { params(duration: Imagekit::OverlayTiming::Duration::Variants).void }
      attr_writer :duration

      # Specifies the end time (in seconds) for when the overlay should disappear from
      # the base video. If both end and duration are provided, duration is ignored.
      # Accepts a positive number up to two decimal places (e.g., `20` or `20.50`) and
      # arithmetic expressions such as `bdu_mul_0.4` or `bdu_sub_idu`. Applies only if
      # the base asset is a video. Maps to `leo` in the URL.
      sig { returns(T.nilable(Imagekit::OverlayTiming::End::Variants)) }
      attr_reader :end_

      sig { params(end_: Imagekit::OverlayTiming::End::Variants).void }
      attr_writer :end_

      # Specifies the start time (in seconds) for when the overlay should appear on the
      # base video. Accepts a positive number up to two decimal places (e.g., `20` or
      # `20.50`) and arithmetic expressions such as `bdu_mul_0.4` or `bdu_sub_idu`.
      # Applies only if the base asset is a video. Maps to `lso` in the URL.
      sig { returns(T.nilable(Imagekit::OverlayTiming::Start::Variants)) }
      attr_reader :start

      sig { params(start: Imagekit::OverlayTiming::Start::Variants).void }
      attr_writer :start

      sig do
        params(
          duration: Imagekit::OverlayTiming::Duration::Variants,
          end_: Imagekit::OverlayTiming::End::Variants,
          start: Imagekit::OverlayTiming::Start::Variants
        ).returns(T.attached_class)
      end
      def self.new(
        # Specifies the duration (in seconds) during which the overlay should appear on
        # the base video. Accepts a positive number up to two decimal places (e.g., `20`
        # or `20.50`) and arithmetic expressions such as `bdu_mul_0.4` or `bdu_sub_idu`.
        # Applies only if the base asset is a video. Maps to `ldu` in the URL.
        duration: nil,
        # Specifies the end time (in seconds) for when the overlay should disappear from
        # the base video. If both end and duration are provided, duration is ignored.
        # Accepts a positive number up to two decimal places (e.g., `20` or `20.50`) and
        # arithmetic expressions such as `bdu_mul_0.4` or `bdu_sub_idu`. Applies only if
        # the base asset is a video. Maps to `leo` in the URL.
        end_: nil,
        # Specifies the start time (in seconds) for when the overlay should appear on the
        # base video. Accepts a positive number up to two decimal places (e.g., `20` or
        # `20.50`) and arithmetic expressions such as `bdu_mul_0.4` or `bdu_sub_idu`.
        # Applies only if the base asset is a video. Maps to `lso` in the URL.
        start: nil
      )
      end

      sig do
        override.returns(
          {
            duration: Imagekit::OverlayTiming::Duration::Variants,
            end_: Imagekit::OverlayTiming::End::Variants,
            start: Imagekit::OverlayTiming::Start::Variants
          }
        )
      end
      def to_hash
      end

      # Specifies the duration (in seconds) during which the overlay should appear on
      # the base video. Accepts a positive number up to two decimal places (e.g., `20`
      # or `20.50`) and arithmetic expressions such as `bdu_mul_0.4` or `bdu_sub_idu`.
      # Applies only if the base asset is a video. Maps to `ldu` in the URL.
      module Duration
        extend Imagekit::Internal::Type::Union

        Variants = T.type_alias { T.any(Float, String) }

        sig do
          override.returns(
            T::Array[Imagekit::OverlayTiming::Duration::Variants]
          )
        end
        def self.variants
        end
      end

      # Specifies the end time (in seconds) for when the overlay should disappear from
      # the base video. If both end and duration are provided, duration is ignored.
      # Accepts a positive number up to two decimal places (e.g., `20` or `20.50`) and
      # arithmetic expressions such as `bdu_mul_0.4` or `bdu_sub_idu`. Applies only if
      # the base asset is a video. Maps to `leo` in the URL.
      module End
        extend Imagekit::Internal::Type::Union

        Variants = T.type_alias { T.any(Float, String) }

        sig do
          override.returns(T::Array[Imagekit::OverlayTiming::End::Variants])
        end
        def self.variants
        end
      end

      # Specifies the start time (in seconds) for when the overlay should appear on the
      # base video. Accepts a positive number up to two decimal places (e.g., `20` or
      # `20.50`) and arithmetic expressions such as `bdu_mul_0.4` or `bdu_sub_idu`.
      # Applies only if the base asset is a video. Maps to `lso` in the URL.
      module Start
        extend Imagekit::Internal::Type::Union

        Variants = T.type_alias { T.any(Float, String) }

        sig do
          override.returns(T::Array[Imagekit::OverlayTiming::Start::Variants])
        end
        def self.variants
        end
      end
    end
  end
end
