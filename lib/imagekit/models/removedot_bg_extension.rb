# frozen_string_literal: true

module Imagekit
  module Models
    class RemovedotBgExtension < Imagekit::Internal::Type::BaseModel
      # @!attribute name
      #   Specifies the background removal extension.
      #
      #   @return [Symbol, Imagekit::Models::RemovedotBgExtension::Name]
      required :name, enum: -> { Imagekit::RemovedotBgExtension::Name }

      # @!attribute options
      #
      #   @return [Imagekit::Models::RemovedotBgExtension::Options, nil]
      optional :options, -> { Imagekit::RemovedotBgExtension::Options }

      # @!method initialize(name:, options: nil)
      #   @param name [Symbol, Imagekit::Models::RemovedotBgExtension::Name] Specifies the background removal extension.
      #
      #   @param options [Imagekit::Models::RemovedotBgExtension::Options]

      # Specifies the background removal extension.
      #
      # @see Imagekit::Models::RemovedotBgExtension#name
      module Name
        extend Imagekit::Internal::Type::Enum

        REMOVE_BG = :"remove-bg"

        # @!method self.values
        #   @return [Array<Symbol>]
      end

      # @see Imagekit::Models::RemovedotBgExtension#options
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
        #   {Imagekit::Models::RemovedotBgExtension::Options} for more details.
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
  end
end
