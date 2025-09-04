# typed: strong

module Imagekit
  module Models
    module ExtensionItem
      extend Imagekit::Internal::Type::Union

      Variants =
        T.type_alias do
          T.any(
            Imagekit::ExtensionItem::RemoveBg,
            Imagekit::ExtensionItem::AIAutoDescription,
            Imagekit::ExtensionItem::AutoTaggingExtension
          )
        end

      class RemoveBg < Imagekit::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Imagekit::ExtensionItem::RemoveBg,
              Imagekit::Internal::AnyHash
            )
          end

        # Specifies the background removal extension.
        sig { returns(Symbol) }
        attr_accessor :name

        sig { returns(T.nilable(Imagekit::ExtensionItem::RemoveBg::Options)) }
        attr_reader :options

        sig do
          params(
            options: Imagekit::ExtensionItem::RemoveBg::Options::OrHash
          ).void
        end
        attr_writer :options

        sig do
          params(
            options: Imagekit::ExtensionItem::RemoveBg::Options::OrHash,
            name: Symbol
          ).returns(T.attached_class)
        end
        def self.new(
          options: nil,
          # Specifies the background removal extension.
          name: :"remove-bg"
        )
        end

        sig do
          override.returns(
            {
              name: Symbol,
              options: Imagekit::ExtensionItem::RemoveBg::Options
            }
          )
        end
        def to_hash
        end

        class Options < Imagekit::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Imagekit::ExtensionItem::RemoveBg::Options,
                Imagekit::Internal::AnyHash
              )
            end

          # Whether to add an artificial shadow to the result. Default is false. Note:
          # Adding shadows is currently only supported for car photos.
          sig { returns(T.nilable(T::Boolean)) }
          attr_reader :add_shadow

          sig { params(add_shadow: T::Boolean).void }
          attr_writer :add_shadow

          # Specifies a solid color background using hex code (e.g., "81d4fa", "fff") or
          # color name (e.g., "green"). If this parameter is set, `bg_image_url` must be
          # empty.
          sig { returns(T.nilable(String)) }
          attr_reader :bg_color

          sig { params(bg_color: String).void }
          attr_writer :bg_color

          # Sets a background image from a URL. If this parameter is set, `bg_color` must be
          # empty.
          sig { returns(T.nilable(String)) }
          attr_reader :bg_image_url

          sig { params(bg_image_url: String).void }
          attr_writer :bg_image_url

          # Allows semi-transparent regions in the result. Default is true. Note:
          # Semitransparency is currently only supported for car windows.
          sig { returns(T.nilable(T::Boolean)) }
          attr_reader :semitransparency

          sig { params(semitransparency: T::Boolean).void }
          attr_writer :semitransparency

          sig do
            params(
              add_shadow: T::Boolean,
              bg_color: String,
              bg_image_url: String,
              semitransparency: T::Boolean
            ).returns(T.attached_class)
          end
          def self.new(
            # Whether to add an artificial shadow to the result. Default is false. Note:
            # Adding shadows is currently only supported for car photos.
            add_shadow: nil,
            # Specifies a solid color background using hex code (e.g., "81d4fa", "fff") or
            # color name (e.g., "green"). If this parameter is set, `bg_image_url` must be
            # empty.
            bg_color: nil,
            # Sets a background image from a URL. If this parameter is set, `bg_color` must be
            # empty.
            bg_image_url: nil,
            # Allows semi-transparent regions in the result. Default is true. Note:
            # Semitransparency is currently only supported for car windows.
            semitransparency: nil
          )
          end

          sig do
            override.returns(
              {
                add_shadow: T::Boolean,
                bg_color: String,
                bg_image_url: String,
                semitransparency: T::Boolean
              }
            )
          end
          def to_hash
          end
        end
      end

      class AutoTaggingExtension < Imagekit::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Imagekit::ExtensionItem::AutoTaggingExtension,
              Imagekit::Internal::AnyHash
            )
          end

        # Maximum number of tags to attach to the asset.
        sig { returns(Integer) }
        attr_accessor :max_tags

        # Minimum confidence level for tags to be considered valid.
        sig { returns(Integer) }
        attr_accessor :min_confidence

        # Specifies the auto-tagging extension used.
        sig do
          returns(Imagekit::ExtensionItem::AutoTaggingExtension::Name::OrSymbol)
        end
        attr_accessor :name

        sig do
          params(
            max_tags: Integer,
            min_confidence: Integer,
            name: Imagekit::ExtensionItem::AutoTaggingExtension::Name::OrSymbol
          ).returns(T.attached_class)
        end
        def self.new(
          # Maximum number of tags to attach to the asset.
          max_tags:,
          # Minimum confidence level for tags to be considered valid.
          min_confidence:,
          # Specifies the auto-tagging extension used.
          name:
        )
        end

        sig do
          override.returns(
            {
              max_tags: Integer,
              min_confidence: Integer,
              name:
                Imagekit::ExtensionItem::AutoTaggingExtension::Name::OrSymbol
            }
          )
        end
        def to_hash
        end

        # Specifies the auto-tagging extension used.
        module Name
          extend Imagekit::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(Symbol, Imagekit::ExtensionItem::AutoTaggingExtension::Name)
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          GOOGLE_AUTO_TAGGING =
            T.let(
              :"google-auto-tagging",
              Imagekit::ExtensionItem::AutoTaggingExtension::Name::TaggedSymbol
            )
          AWS_AUTO_TAGGING =
            T.let(
              :"aws-auto-tagging",
              Imagekit::ExtensionItem::AutoTaggingExtension::Name::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                Imagekit::ExtensionItem::AutoTaggingExtension::Name::TaggedSymbol
              ]
            )
          end
          def self.values
          end
        end
      end

      class AIAutoDescription < Imagekit::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Imagekit::ExtensionItem::AIAutoDescription,
              Imagekit::Internal::AnyHash
            )
          end

        # Specifies the auto description extension.
        sig { returns(Symbol) }
        attr_accessor :name

        sig { params(name: Symbol).returns(T.attached_class) }
        def self.new(
          # Specifies the auto description extension.
          name: :"ai-auto-description"
        )
        end

        sig { override.returns({ name: Symbol }) }
        def to_hash
        end
      end

      sig { override.returns(T::Array[Imagekit::ExtensionItem::Variants]) }
      def self.variants
      end
    end

    Extensions =
      T.let(
        Imagekit::Internal::Type::ArrayOf[union: Imagekit::ExtensionItem],
        Imagekit::Internal::Type::Converter
      )
  end
end
