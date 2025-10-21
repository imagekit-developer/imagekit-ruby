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

      # Specifies the transparency level of the solid color overlay. Accepts integers
      # from `1` to `9`.
      sig { returns(T.nilable(Float)) }
      attr_reader :alpha

      sig { params(alpha: Float).void }
      attr_writer :alpha

      # Specifies the background color of the solid color overlay. Accepts an RGB hex
      # code (e.g., `FF0000`), an RGBA code (e.g., `FFAABB50`), or a color name.
      sig { returns(T.nilable(String)) }
      attr_reader :background

      sig { params(background: String).void }
      attr_writer :background

      # Creates a linear gradient with two colors. Pass `true` for a default gradient,
      # or provide a string for a custom gradient. Only works if the base asset is an
      # image. See
      # [gradient](https://imagekit.io/docs/effects-and-enhancements#gradient---e-gradient).
      sig { returns(T.nilable(T.any(T::Boolean, String))) }
      attr_reader :gradient

      sig { params(gradient: T.any(T::Boolean, String)).void }
      attr_writer :gradient

      # Controls the height of the solid color overlay. Accepts a numeric value or an
      # arithmetic expression. Learn about
      # [arithmetic expressions](https://imagekit.io/docs/arithmetic-expressions-in-transformations).
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

      # Specifies the corner radius of the solid color overlay. Set to `max` for
      # circular or oval shape. See
      # [radius](https://imagekit.io/docs/effects-and-enhancements#radius---r).
      sig { returns(T.nilable(T.any(Float, Symbol))) }
      attr_reader :radius

      sig { params(radius: T.any(Float, Symbol)).void }
      attr_writer :radius

      # Controls the width of the solid color overlay. Accepts a numeric value or an
      # arithmetic expression (e.g., `bw_mul_0.2` or `bh_div_2`). Learn about
      # [arithmetic expressions](https://imagekit.io/docs/arithmetic-expressions-in-transformations).
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
          gradient: T.any(T::Boolean, String),
          height: Imagekit::SolidColorOverlayTransformation::Height::Variants,
          radius: T.any(Float, Symbol),
          width: Imagekit::SolidColorOverlayTransformation::Width::Variants
        ).returns(T.attached_class)
      end
      def self.new(
        # Specifies the transparency level of the solid color overlay. Accepts integers
        # from `1` to `9`.
        alpha: nil,
        # Specifies the background color of the solid color overlay. Accepts an RGB hex
        # code (e.g., `FF0000`), an RGBA code (e.g., `FFAABB50`), or a color name.
        background: nil,
        # Creates a linear gradient with two colors. Pass `true` for a default gradient,
        # or provide a string for a custom gradient. Only works if the base asset is an
        # image. See
        # [gradient](https://imagekit.io/docs/effects-and-enhancements#gradient---e-gradient).
        gradient: nil,
        # Controls the height of the solid color overlay. Accepts a numeric value or an
        # arithmetic expression. Learn about
        # [arithmetic expressions](https://imagekit.io/docs/arithmetic-expressions-in-transformations).
        height: nil,
        # Specifies the corner radius of the solid color overlay. Set to `max` for
        # circular or oval shape. See
        # [radius](https://imagekit.io/docs/effects-and-enhancements#radius---r).
        radius: nil,
        # Controls the width of the solid color overlay. Accepts a numeric value or an
        # arithmetic expression (e.g., `bw_mul_0.2` or `bh_div_2`). Learn about
        # [arithmetic expressions](https://imagekit.io/docs/arithmetic-expressions-in-transformations).
        width: nil
      )
      end

      sig do
        override.returns(
          {
            alpha: Float,
            background: String,
            gradient: T.any(T::Boolean, String),
            height: Imagekit::SolidColorOverlayTransformation::Height::Variants,
            radius: T.any(Float, Symbol),
            width: Imagekit::SolidColorOverlayTransformation::Width::Variants
          }
        )
      end
      def to_hash
      end

      # Creates a linear gradient with two colors. Pass `true` for a default gradient,
      # or provide a string for a custom gradient. Only works if the base asset is an
      # image. See
      # [gradient](https://imagekit.io/docs/effects-and-enhancements#gradient---e-gradient).
      module Gradient
        extend Imagekit::Internal::Type::Union

        Variants = T.type_alias { T.any(T::Boolean, String) }

        sig do
          override.returns(
            T::Array[
              Imagekit::SolidColorOverlayTransformation::Gradient::Variants
            ]
          )
        end
        def self.variants
        end
      end

      # Controls the height of the solid color overlay. Accepts a numeric value or an
      # arithmetic expression. Learn about
      # [arithmetic expressions](https://imagekit.io/docs/arithmetic-expressions-in-transformations).
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

      # Specifies the corner radius of the solid color overlay. Set to `max` for
      # circular or oval shape. See
      # [radius](https://imagekit.io/docs/effects-and-enhancements#radius---r).
      module Radius
        extend Imagekit::Internal::Type::Union

        Variants = T.type_alias { T.any(Float, Symbol) }

        sig do
          override.returns(
            T::Array[
              Imagekit::SolidColorOverlayTransformation::Radius::Variants
            ]
          )
        end
        def self.variants
        end
      end

      # Controls the width of the solid color overlay. Accepts a numeric value or an
      # arithmetic expression (e.g., `bw_mul_0.2` or `bh_div_2`). Learn about
      # [arithmetic expressions](https://imagekit.io/docs/arithmetic-expressions-in-transformations).
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
