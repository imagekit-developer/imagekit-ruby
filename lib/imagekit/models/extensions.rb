# frozen_string_literal: true

module Imagekit
  module Models
    module ExtensionItem
      extend Imagekit::Internal::Type::Union

      discriminator :name

      variant :"remove-bg", -> { Imagekit::ExtensionItem::RemoveBg }

      variant :"ai-auto-description", -> { Imagekit::ExtensionItem::AIAutoDescription }

      variant -> { Imagekit::ExtensionItem::AutoTaggingExtension }

      class RemoveBg < Imagekit::Internal::Type::BaseModel
        # @!attribute name
        #   Specifies the background removal extension.
        #
        #   @return [Symbol, :"remove-bg"]
        required :name, const: :"remove-bg"

        # @!attribute options
        #
        #   @return [Imagekit::Models::ExtensionItem::RemoveBg::Options, nil]
        optional :options, -> { Imagekit::ExtensionItem::RemoveBg::Options }

        # @!method initialize(options: nil, name: :"remove-bg")
        #   @param options [Imagekit::Models::ExtensionItem::RemoveBg::Options]
        #
        #   @param name [Symbol, :"remove-bg"] Specifies the background removal extension.

        # @see Imagekit::Models::ExtensionItem::RemoveBg#options
        class Options < Imagekit::Internal::Type::BaseModel
          # @!attribute add_shadow
          #   Whether to add an artificial shadow to the result. Default is false. Note:
          #   Adding shadows is currently only supported for car photos.
          #
          #   @return [Boolean, nil]
          optional :add_shadow, Imagekit::Internal::Type::Boolean

          # @!attribute bg_color
          #   Specifies a solid color background using hex code (e.g., "81d4fa", "fff") or
          #   color name (e.g., "green"). If this parameter is set, `bg_image_url` must be
          #   empty.
          #
          #   @return [String, nil]
          optional :bg_color, String

          # @!attribute bg_image_url
          #   Sets a background image from a URL. If this parameter is set, `bg_color` must be
          #   empty.
          #
          #   @return [String, nil]
          optional :bg_image_url, String

          # @!attribute semitransparency
          #   Allows semi-transparent regions in the result. Default is true. Note:
          #   Semitransparency is currently only supported for car windows.
          #
          #   @return [Boolean, nil]
          optional :semitransparency, Imagekit::Internal::Type::Boolean

          # @!method initialize(add_shadow: nil, bg_color: nil, bg_image_url: nil, semitransparency: nil)
          #   Some parameter documentations has been truncated, see
          #   {Imagekit::Models::ExtensionItem::RemoveBg::Options} for more details.
          #
          #   @param add_shadow [Boolean] Whether to add an artificial shadow to the result. Default is false. Note: Addin
          #
          #   @param bg_color [String] Specifies a solid color background using hex code (e.g., "81d4fa", "fff") or col
          #
          #   @param bg_image_url [String] Sets a background image from a URL. If this parameter is set, `bg_color` must be
          #
          #   @param semitransparency [Boolean] Allows semi-transparent regions in the result. Default is true. Note: Semitransp
        end
      end

      class AutoTaggingExtension < Imagekit::Internal::Type::BaseModel
        # @!attribute max_tags
        #   Maximum number of tags to attach to the asset.
        #
        #   @return [Integer]
        required :max_tags, Integer, api_name: :maxTags

        # @!attribute min_confidence
        #   Minimum confidence level for tags to be considered valid.
        #
        #   @return [Integer]
        required :min_confidence, Integer, api_name: :minConfidence

        # @!attribute name
        #   Specifies the auto-tagging extension used.
        #
        #   @return [Symbol, Imagekit::Models::ExtensionItem::AutoTaggingExtension::Name]
        required :name, enum: -> { Imagekit::ExtensionItem::AutoTaggingExtension::Name }

        # @!method initialize(max_tags:, min_confidence:, name:)
        #   @param max_tags [Integer] Maximum number of tags to attach to the asset.
        #
        #   @param min_confidence [Integer] Minimum confidence level for tags to be considered valid.
        #
        #   @param name [Symbol, Imagekit::Models::ExtensionItem::AutoTaggingExtension::Name] Specifies the auto-tagging extension used.

        # Specifies the auto-tagging extension used.
        #
        # @see Imagekit::Models::ExtensionItem::AutoTaggingExtension#name
        module Name
          extend Imagekit::Internal::Type::Enum

          GOOGLE_AUTO_TAGGING = :"google-auto-tagging"
          AWS_AUTO_TAGGING = :"aws-auto-tagging"

          # @!method self.values
          #   @return [Array<Symbol>]
        end
      end

      class AIAutoDescription < Imagekit::Internal::Type::BaseModel
        # @!attribute name
        #   Specifies the auto description extension.
        #
        #   @return [Symbol, :"ai-auto-description"]
        required :name, const: :"ai-auto-description"

        # @!method initialize(name: :"ai-auto-description")
        #   @param name [Symbol, :"ai-auto-description"] Specifies the auto description extension.
      end

      # @!method self.variants
      #   @return [Array(Imagekit::Models::ExtensionItem::RemoveBg, Imagekit::Models::ExtensionItem::AIAutoDescription, Imagekit::Models::ExtensionItem::AutoTaggingExtension)]
    end

    # @type [Imagekit::Internal::Type::Converter]
    Extensions = Imagekit::Internal::Type::ArrayOf[union: -> { Imagekit::ExtensionItem }]
  end
end
