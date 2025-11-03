# frozen_string_literal: true

module Imagekitio
  module Models
    module ExtensionItem
      extend Imagekitio::Internal::Type::Union

      discriminator :name

      variant :"remove-bg", -> { Imagekitio::ExtensionItem::RemoveBg }

      variant :"ai-auto-description", -> { Imagekitio::ExtensionItem::AIAutoDescription }

      variant -> { Imagekitio::ExtensionItem::AutoTaggingExtension }

      class RemoveBg < Imagekitio::Internal::Type::BaseModel
        # @!attribute name
        #   Specifies the background removal extension.
        #
        #   @return [Symbol, :"remove-bg"]
        required :name, const: :"remove-bg"

        # @!attribute options
        #
        #   @return [Imagekitio::Models::ExtensionItem::RemoveBg::Options, nil]
        optional :options, -> { Imagekitio::ExtensionItem::RemoveBg::Options }

        # @!method initialize(options: nil, name: :"remove-bg")
        #   @param options [Imagekitio::Models::ExtensionItem::RemoveBg::Options]
        #
        #   @param name [Symbol, :"remove-bg"] Specifies the background removal extension.

        # @see Imagekitio::Models::ExtensionItem::RemoveBg#options
        class Options < Imagekitio::Internal::Type::BaseModel
          # @!attribute add_shadow
          #   Whether to add an artificial shadow to the result. Default is false. Note:
          #   Adding shadows is currently only supported for car photos.
          #
          #   @return [Boolean, nil]
          optional :add_shadow, Imagekitio::Internal::Type::Boolean

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
          optional :semitransparency, Imagekitio::Internal::Type::Boolean

          # @!method initialize(add_shadow: nil, bg_color: nil, bg_image_url: nil, semitransparency: nil)
          #   Some parameter documentations has been truncated, see
          #   {Imagekitio::Models::ExtensionItem::RemoveBg::Options} for more details.
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

      class AutoTaggingExtension < Imagekitio::Internal::Type::BaseModel
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
        #   @return [Symbol, Imagekitio::Models::ExtensionItem::AutoTaggingExtension::Name]
        required :name, enum: -> { Imagekitio::ExtensionItem::AutoTaggingExtension::Name }

        # @!method initialize(max_tags:, min_confidence:, name:)
        #   @param max_tags [Integer] Maximum number of tags to attach to the asset.
        #
        #   @param min_confidence [Integer] Minimum confidence level for tags to be considered valid.
        #
        #   @param name [Symbol, Imagekitio::Models::ExtensionItem::AutoTaggingExtension::Name] Specifies the auto-tagging extension used.

        # Specifies the auto-tagging extension used.
        #
        # @see Imagekitio::Models::ExtensionItem::AutoTaggingExtension#name
        module Name
          extend Imagekitio::Internal::Type::Enum

          GOOGLE_AUTO_TAGGING = :"google-auto-tagging"
          AWS_AUTO_TAGGING = :"aws-auto-tagging"

          # @!method self.values
          #   @return [Array<Symbol>]
        end
      end

      class AIAutoDescription < Imagekitio::Internal::Type::BaseModel
        # @!attribute name
        #   Specifies the auto description extension.
        #
        #   @return [Symbol, :"ai-auto-description"]
        required :name, const: :"ai-auto-description"

        # @!method initialize(name: :"ai-auto-description")
        #   @param name [Symbol, :"ai-auto-description"] Specifies the auto description extension.
      end

      # @!method self.variants
      #   @return [Array(Imagekitio::Models::ExtensionItem::RemoveBg, Imagekitio::Models::ExtensionItem::AIAutoDescription, Imagekitio::Models::ExtensionItem::AutoTaggingExtension)]
    end

    # @type [Imagekitio::Internal::Type::Converter]
    Extensions = Imagekitio::Internal::Type::ArrayOf[union: -> { Imagekitio::ExtensionItem }]
  end
end
