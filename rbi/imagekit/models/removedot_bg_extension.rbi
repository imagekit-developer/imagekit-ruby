# typed: strong

module Imagekit
  module Models
    class RemovedotBgExtension < Imagekit::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(Imagekit::RemovedotBgExtension, Imagekit::Internal::AnyHash)
        end

      # Specifies the background removal extension.
      sig { returns(Imagekit::RemovedotBgExtension::Name::OrSymbol) }
      attr_accessor :name

      sig { returns(T.nilable(Imagekit::RemovedotBgExtension::Options)) }
      attr_reader :options

      sig do
        params(options: Imagekit::RemovedotBgExtension::Options::OrHash).void
      end
      attr_writer :options

      sig do
        params(
          name: Imagekit::RemovedotBgExtension::Name::OrSymbol,
          options: Imagekit::RemovedotBgExtension::Options::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        # Specifies the background removal extension.
        name:,
        options: nil
      )
      end

      sig do
        override.returns(
          {
            name: Imagekit::RemovedotBgExtension::Name::OrSymbol,
            options: Imagekit::RemovedotBgExtension::Options
          }
        )
      end
      def to_hash
      end

      # Specifies the background removal extension.
      module Name
        extend Imagekit::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias { T.all(Symbol, Imagekit::RemovedotBgExtension::Name) }
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        REMOVE_BG =
          T.let(
            :"remove-bg",
            Imagekit::RemovedotBgExtension::Name::TaggedSymbol
          )

        sig do
          override.returns(
            T::Array[Imagekit::RemovedotBgExtension::Name::TaggedSymbol]
          )
        end
        def self.values
        end
      end

      class Options < Imagekit::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Imagekit::RemovedotBgExtension::Options,
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
  end
end
