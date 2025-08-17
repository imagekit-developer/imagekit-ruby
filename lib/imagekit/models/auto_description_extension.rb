# frozen_string_literal: true

module Imagekit
  module Models
    class AutoDescriptionExtension < Imagekit::Internal::Type::BaseModel
      # @!attribute name
      #   Specifies the auto description extension.
      #
      #   @return [Symbol, Imagekit::Models::AutoDescriptionExtension::Name]
      required :name, enum: -> { Imagekit::AutoDescriptionExtension::Name }

      # @!method initialize(name:)
      #   @param name [Symbol, Imagekit::Models::AutoDescriptionExtension::Name] Specifies the auto description extension.

      # Specifies the auto description extension.
      #
      # @see Imagekit::Models::AutoDescriptionExtension#name
      module Name
        extend Imagekit::Internal::Type::Enum

        AI_AUTO_DESCRIPTION = :"ai-auto-description"

        # @!method self.values
        #   @return [Array<Symbol>]
      end
    end
  end
end
