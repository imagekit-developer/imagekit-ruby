# frozen_string_literal: true

module Imagekitio
  module Models
    # @see Imagekitio::Resources::Files#update
    class FileUpdateResponse < Imagekitio::Models::File
      # @!attribute extension_status
      #
      #   @return [Imagekitio::Models::FileUpdateResponse::ExtensionStatus, nil]
      optional :extension_status,
               -> { Imagekitio::Models::FileUpdateResponse::ExtensionStatus },
               api_name: :extensionStatus

      # @!method initialize(extension_status: nil)
      #   Object containing details of a file or file version.
      #
      #   @param extension_status [Imagekitio::Models::FileUpdateResponse::ExtensionStatus]

      class ExtensionStatus < Imagekitio::Internal::Type::BaseModel
        # @!attribute ai_auto_description
        #
        #   @return [Symbol, Imagekitio::Models::FileUpdateResponse::ExtensionStatus::AIAutoDescription, nil]
        optional :ai_auto_description,
                 enum: -> { Imagekitio::Models::FileUpdateResponse::ExtensionStatus::AIAutoDescription },
                 api_name: :"ai-auto-description"

        # @!attribute aws_auto_tagging
        #
        #   @return [Symbol, Imagekitio::Models::FileUpdateResponse::ExtensionStatus::AwsAutoTagging, nil]
        optional :aws_auto_tagging,
                 enum: -> { Imagekitio::Models::FileUpdateResponse::ExtensionStatus::AwsAutoTagging },
                 api_name: :"aws-auto-tagging"

        # @!attribute google_auto_tagging
        #
        #   @return [Symbol, Imagekitio::Models::FileUpdateResponse::ExtensionStatus::GoogleAutoTagging, nil]
        optional :google_auto_tagging,
                 enum: -> { Imagekitio::Models::FileUpdateResponse::ExtensionStatus::GoogleAutoTagging },
                 api_name: :"google-auto-tagging"

        # @!attribute remove_bg
        #
        #   @return [Symbol, Imagekitio::Models::FileUpdateResponse::ExtensionStatus::RemoveBg, nil]
        optional :remove_bg,
                 enum: -> { Imagekitio::Models::FileUpdateResponse::ExtensionStatus::RemoveBg },
                 api_name: :"remove-bg"

        # @!method initialize(ai_auto_description: nil, aws_auto_tagging: nil, google_auto_tagging: nil, remove_bg: nil)
        #   @param ai_auto_description [Symbol, Imagekitio::Models::FileUpdateResponse::ExtensionStatus::AIAutoDescription]
        #   @param aws_auto_tagging [Symbol, Imagekitio::Models::FileUpdateResponse::ExtensionStatus::AwsAutoTagging]
        #   @param google_auto_tagging [Symbol, Imagekitio::Models::FileUpdateResponse::ExtensionStatus::GoogleAutoTagging]
        #   @param remove_bg [Symbol, Imagekitio::Models::FileUpdateResponse::ExtensionStatus::RemoveBg]

        # @see Imagekitio::Models::FileUpdateResponse::ExtensionStatus#ai_auto_description
        module AIAutoDescription
          extend Imagekitio::Internal::Type::Enum

          SUCCESS = :success
          PENDING = :pending
          FAILED = :failed

          # @!method self.values
          #   @return [Array<Symbol>]
        end

        # @see Imagekitio::Models::FileUpdateResponse::ExtensionStatus#aws_auto_tagging
        module AwsAutoTagging
          extend Imagekitio::Internal::Type::Enum

          SUCCESS = :success
          PENDING = :pending
          FAILED = :failed

          # @!method self.values
          #   @return [Array<Symbol>]
        end

        # @see Imagekitio::Models::FileUpdateResponse::ExtensionStatus#google_auto_tagging
        module GoogleAutoTagging
          extend Imagekitio::Internal::Type::Enum

          SUCCESS = :success
          PENDING = :pending
          FAILED = :failed

          # @!method self.values
          #   @return [Array<Symbol>]
        end

        # @see Imagekitio::Models::FileUpdateResponse::ExtensionStatus#remove_bg
        module RemoveBg
          extend Imagekitio::Internal::Type::Enum

          SUCCESS = :success
          PENDING = :pending
          FAILED = :failed

          # @!method self.values
          #   @return [Array<Symbol>]
        end
      end
    end
  end
end
