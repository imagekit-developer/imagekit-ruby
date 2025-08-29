# typed: strong

module Imagekit
  module Models
    class SolidColorOverlayTransformation < Imagekit::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            Imagekit::SolidColorOverlayTransformation,
            Imagekit::Internal::AnyHash
          )
        end

      # Alpha transparency level
      sig { returns(T.nilable(Float)) }
      attr_reader :alpha

      sig { params(alpha: Float).void }
      attr_writer :alpha

      # Background color
      sig { returns(T.nilable(String)) }
      attr_reader :background

      sig { params(background: String).void }
      attr_writer :background

      # Gradient effect for the overlay
      sig do
        returns(
          T.nilable(
            T.any(
              Imagekit::SolidColorOverlayTransformation::Gradient::OrBoolean,
              String
            )
          )
        )
      end
      attr_reader :gradient

      sig do
        params(
          gradient:
            T.any(
              Imagekit::SolidColorOverlayTransformation::Gradient::OrBoolean,
              String
            )
        ).void
      end
      attr_writer :gradient

      # Height of the solid color overlay
      sig do
        returns(
          T.nilable(Imagekit::SolidColorOverlayTransformation::Height::Variants)
        )
      end
      attr_reader :height

      sig do
        params(
          height: Imagekit::SolidColorOverlayTransformation::Height::Variants
        ).void
      end
      attr_writer :height

      # Corner radius of the solid color overlay
      sig do
        returns(
          T.nilable(
            T.any(
              Float,
              Imagekit::SolidColorOverlayTransformation::Radius::OrSymbol
            )
          )
        )
      end
      attr_reader :radius

      sig do
        params(
          radius:
            T.any(
              Float,
              Imagekit::SolidColorOverlayTransformation::Radius::OrSymbol
            )
        ).void
      end
      attr_writer :radius

      # Width of the solid color overlay
      sig do
        returns(
          T.nilable(Imagekit::SolidColorOverlayTransformation::Width::Variants)
        )
      end
      attr_reader :width

      sig do
        params(
          width: Imagekit::SolidColorOverlayTransformation::Width::Variants
        ).void
      end
      attr_writer :width

      sig do
        params(
          alpha: Float,
          background: String,
          gradient:
            T.any(
              Imagekit::SolidColorOverlayTransformation::Gradient::OrBoolean,
              String
            ),
          height: Imagekit::SolidColorOverlayTransformation::Height::Variants,
          radius:
            T.any(
              Float,
              Imagekit::SolidColorOverlayTransformation::Radius::OrSymbol
            ),
          width: Imagekit::SolidColorOverlayTransformation::Width::Variants
        ).returns(T.attached_class)
      end
      def self.new(
        # Alpha transparency level
        alpha: nil,
        # Background color
        background: nil,
        # Gradient effect for the overlay
        gradient: nil,
        # Height of the solid color overlay
        height: nil,
        # Corner radius of the solid color overlay
        radius: nil,
        # Width of the solid color overlay
        width: nil
      )
      end

      sig do
        override.returns(
          {
            alpha: Float,
            background: String,
            gradient:
              T.any(
                Imagekit::SolidColorOverlayTransformation::Gradient::OrBoolean,
                String
              ),
            height: Imagekit::SolidColorOverlayTransformation::Height::Variants,
            radius:
              T.any(
                Float,
                Imagekit::SolidColorOverlayTransformation::Radius::OrSymbol
              ),
            width: Imagekit::SolidColorOverlayTransformation::Width::Variants
          }
        )
      end
      def to_hash
      end

      # Gradient effect for the overlay
      module Gradient
        extend Imagekit::Internal::Type::Union

        Variants =
          T.type_alias do
            T.any(
              Imagekit::SolidColorOverlayTransformation::Gradient::TaggedBoolean,
              String
            )
          end

        sig do
          override.returns(
            T::Array[
              Imagekit::SolidColorOverlayTransformation::Gradient::Variants
            ]
          )
        end
        def self.variants
        end

        TaggedBoolean =
          T.type_alias do
            T.all(
              T::Boolean,
              Imagekit::SolidColorOverlayTransformation::Gradient
            )
          end
        OrBoolean = T.type_alias { T::Boolean }

        TRUE =
          T.let(
            true,
            Imagekit::SolidColorOverlayTransformation::Gradient::TaggedBoolean
          )
      end

      # Height of the solid color overlay
      module Height
        extend Imagekit::Internal::Type::Union

        Variants = T.type_alias { T.any(Float, String) }

        sig do
          override.returns(
            T::Array[
              Imagekit::SolidColorOverlayTransformation::Height::Variants
            ]
          )
        end
        def self.variants
        end
      end

      # Corner radius of the solid color overlay
      module Radius
        extend Imagekit::Internal::Type::Union

        Variants =
          T.type_alias do
            T.any(
              Float,
              Imagekit::SolidColorOverlayTransformation::Radius::TaggedSymbol
            )
          end

        sig do
          override.returns(
            T::Array[
              Imagekit::SolidColorOverlayTransformation::Radius::Variants
            ]
          )
        end
        def self.variants
        end

        TaggedSymbol =
          T.type_alias do
            T.all(Symbol, Imagekit::SolidColorOverlayTransformation::Radius)
          end
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        MAX =
          T.let(
            :max,
            Imagekit::SolidColorOverlayTransformation::Radius::TaggedSymbol
          )
      end

      # Width of the solid color overlay
      module Width
        extend Imagekit::Internal::Type::Union

        Variants = T.type_alias { T.any(Float, String) }

        sig do
          override.returns(
            T::Array[Imagekit::SolidColorOverlayTransformation::Width::Variants]
          )
        end
        def self.variants
        end
      end
    end
  end
end
