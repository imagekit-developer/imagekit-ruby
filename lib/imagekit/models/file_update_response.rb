# frozen_string_literal: true

module Imagekit
  module Models
    # @see Imagekit::Resources::Files#update
    class FileUpdateResponse < Imagekit::Models::File
      # @!attribute extension_status
      #
      #   @return [Imagekit::Models::FileUpdateResponse::ExtensionStatus, nil]
      optional :extension_status,
               -> { Imagekit::Models::FileUpdateResponse::ExtensionStatus },
               api_name: :extensionStatus

      # @!method initialize(extension_status: nil)
      #   Object containing details of a file or file version.
      #
      #   @param extension_status [Imagekit::Models::FileUpdateResponse::ExtensionStatus]

      class ExtensionStatus < Imagekit::Internal::Type::BaseModel
        # @!attribute ai_auto_description
        #
        #   @return [Symbol, Imagekit::Models::FileUpdateResponse::ExtensionStatus::AIAutoDescription, nil]
        optional :ai_auto_description,
                 enum: -> { Imagekit::Models::FileUpdateResponse::ExtensionStatus::AIAutoDescription },
                 api_name: :"ai-auto-description"

        # @!attribute aws_auto_tagging
        #
        #   @return [Symbol, Imagekit::Models::FileUpdateResponse::ExtensionStatus::AwsAutoTagging, nil]
        optional :aws_auto_tagging,
                 enum: -> { Imagekit::Models::FileUpdateResponse::ExtensionStatus::AwsAutoTagging },
                 api_name: :"aws-auto-tagging"

        # @!attribute google_auto_tagging
        #
        #   @return [Symbol, Imagekit::Models::FileUpdateResponse::ExtensionStatus::GoogleAutoTagging, nil]
        optional :google_auto_tagging,
                 enum: -> { Imagekit::Models::FileUpdateResponse::ExtensionStatus::GoogleAutoTagging },
                 api_name: :"google-auto-tagging"

        # @!attribute remove_bg
        #
        #   @return [Symbol, Imagekit::Models::FileUpdateResponse::ExtensionStatus::RemoveBg, nil]
        optional :remove_bg,
                 enum: -> { Imagekit::Models::FileUpdateResponse::ExtensionStatus::RemoveBg },
                 api_name: :"remove-bg"

        # @!method initialize(ai_auto_description: nil, aws_auto_tagging: nil, google_auto_tagging: nil, remove_bg: nil)
        #   @param ai_auto_description [Symbol, Imagekit::Models::FileUpdateResponse::ExtensionStatus::AIAutoDescription]
        #   @param aws_auto_tagging [Symbol, Imagekit::Models::FileUpdateResponse::ExtensionStatus::AwsAutoTagging]
        #   @param google_auto_tagging [Symbol, Imagekit::Models::FileUpdateResponse::ExtensionStatus::GoogleAutoTagging]
        #   @param remove_bg [Symbol, Imagekit::Models::FileUpdateResponse::ExtensionStatus::RemoveBg]

        # @see Imagekit::Models::FileUpdateResponse::ExtensionStatus#ai_auto_description
        module AIAutoDescription
          extend Imagekit::Internal::Type::Enum

          SUCCESS = :success
          PENDING = :pending
          FAILED = :failed

          # @!method self.values
          #   @return [Array<Symbol>]
        end

        # @see Imagekit::Models::FileUpdateResponse::ExtensionStatus#aws_auto_tagging
        module AwsAutoTagging
          extend Imagekit::Internal::Type::Enum

          SUCCESS = :success
          PENDING = :pending
          FAILED = :failed

          # @!method self.values
          #   @return [Array<Symbol>]
        end

        # @see Imagekit::Models::FileUpdateResponse::ExtensionStatus#google_auto_tagging
        module GoogleAutoTagging
          extend Imagekit::Internal::Type::Enum

          SUCCESS = :success
          PENDING = :pending
          FAILED = :failed

          # @!method self.values
          #   @return [Array<Symbol>]
        end

        # @see Imagekit::Models::FileUpdateResponse::ExtensionStatus#remove_bg
        module RemoveBg
          extend Imagekit::Internal::Type::Enum

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
