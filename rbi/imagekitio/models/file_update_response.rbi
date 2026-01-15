# typed: strong

module Imagekitio
  module Models
    class FileUpdateResponse < Imagekitio::Models::File
      OrHash =
        T.type_alias do
          T.any(
            Imagekitio::Models::FileUpdateResponse,
            Imagekitio::Internal::AnyHash
          )
        end

      sig do
        returns(
          T.nilable(Imagekitio::Models::FileUpdateResponse::ExtensionStatus)
        )
      end
      attr_reader :extension_status

      sig do
        params(
          extension_status:
            Imagekitio::Models::FileUpdateResponse::ExtensionStatus::OrHash
        ).void
      end
      attr_writer :extension_status

      # Object containing details of a file or file version.
      sig do
        params(
          extension_status:
            Imagekitio::Models::FileUpdateResponse::ExtensionStatus::OrHash
        ).returns(T.attached_class)
      end
      def self.new(extension_status: nil)
      end

      sig do
        override.returns(
          {
            extension_status:
              Imagekitio::Models::FileUpdateResponse::ExtensionStatus
          }
        )
      end
      def to_hash
      end

      class ExtensionStatus < Imagekitio::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Imagekitio::Models::FileUpdateResponse::ExtensionStatus,
              Imagekitio::Internal::AnyHash
            )
          end

        sig do
          returns(
            T.nilable(
              Imagekitio::Models::FileUpdateResponse::ExtensionStatus::AIAutoDescription::TaggedSymbol
            )
          )
        end
        attr_reader :ai_auto_description

        sig do
          params(
            ai_auto_description:
              Imagekitio::Models::FileUpdateResponse::ExtensionStatus::AIAutoDescription::OrSymbol
          ).void
        end
        attr_writer :ai_auto_description

        sig do
          returns(
            T.nilable(
              Imagekitio::Models::FileUpdateResponse::ExtensionStatus::AITasks::TaggedSymbol
            )
          )
        end
        attr_reader :ai_tasks

        sig do
          params(
            ai_tasks:
              Imagekitio::Models::FileUpdateResponse::ExtensionStatus::AITasks::OrSymbol
          ).void
        end
        attr_writer :ai_tasks

        sig do
          returns(
            T.nilable(
              Imagekitio::Models::FileUpdateResponse::ExtensionStatus::AwsAutoTagging::TaggedSymbol
            )
          )
        end
        attr_reader :aws_auto_tagging

        sig do
          params(
            aws_auto_tagging:
              Imagekitio::Models::FileUpdateResponse::ExtensionStatus::AwsAutoTagging::OrSymbol
          ).void
        end
        attr_writer :aws_auto_tagging

        sig do
          returns(
            T.nilable(
              Imagekitio::Models::FileUpdateResponse::ExtensionStatus::GoogleAutoTagging::TaggedSymbol
            )
          )
        end
        attr_reader :google_auto_tagging

        sig do
          params(
            google_auto_tagging:
              Imagekitio::Models::FileUpdateResponse::ExtensionStatus::GoogleAutoTagging::OrSymbol
          ).void
        end
        attr_writer :google_auto_tagging

        sig do
          returns(
            T.nilable(
              Imagekitio::Models::FileUpdateResponse::ExtensionStatus::RemoveBg::TaggedSymbol
            )
          )
        end
        attr_reader :remove_bg

        sig do
          params(
            remove_bg:
              Imagekitio::Models::FileUpdateResponse::ExtensionStatus::RemoveBg::OrSymbol
          ).void
        end
        attr_writer :remove_bg

        sig do
          params(
            ai_auto_description:
              Imagekitio::Models::FileUpdateResponse::ExtensionStatus::AIAutoDescription::OrSymbol,
            ai_tasks:
              Imagekitio::Models::FileUpdateResponse::ExtensionStatus::AITasks::OrSymbol,
            aws_auto_tagging:
              Imagekitio::Models::FileUpdateResponse::ExtensionStatus::AwsAutoTagging::OrSymbol,
            google_auto_tagging:
              Imagekitio::Models::FileUpdateResponse::ExtensionStatus::GoogleAutoTagging::OrSymbol,
            remove_bg:
              Imagekitio::Models::FileUpdateResponse::ExtensionStatus::RemoveBg::OrSymbol
          ).returns(T.attached_class)
        end
        def self.new(
          ai_auto_description: nil,
          ai_tasks: nil,
          aws_auto_tagging: nil,
          google_auto_tagging: nil,
          remove_bg: nil
        )
        end

        sig do
          override.returns(
            {
              ai_auto_description:
                Imagekitio::Models::FileUpdateResponse::ExtensionStatus::AIAutoDescription::TaggedSymbol,
              ai_tasks:
                Imagekitio::Models::FileUpdateResponse::ExtensionStatus::AITasks::TaggedSymbol,
              aws_auto_tagging:
                Imagekitio::Models::FileUpdateResponse::ExtensionStatus::AwsAutoTagging::TaggedSymbol,
              google_auto_tagging:
                Imagekitio::Models::FileUpdateResponse::ExtensionStatus::GoogleAutoTagging::TaggedSymbol,
              remove_bg:
                Imagekitio::Models::FileUpdateResponse::ExtensionStatus::RemoveBg::TaggedSymbol
            }
          )
        end
        def to_hash
        end

        module AIAutoDescription
          extend Imagekitio::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(
                Symbol,
                Imagekitio::Models::FileUpdateResponse::ExtensionStatus::AIAutoDescription
              )
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          SUCCESS =
            T.let(
              :success,
              Imagekitio::Models::FileUpdateResponse::ExtensionStatus::AIAutoDescription::TaggedSymbol
            )
          PENDING =
            T.let(
              :pending,
              Imagekitio::Models::FileUpdateResponse::ExtensionStatus::AIAutoDescription::TaggedSymbol
            )
          FAILED =
            T.let(
              :failed,
              Imagekitio::Models::FileUpdateResponse::ExtensionStatus::AIAutoDescription::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                Imagekitio::Models::FileUpdateResponse::ExtensionStatus::AIAutoDescription::TaggedSymbol
              ]
            )
          end
          def self.values
          end
        end

        module AITasks
          extend Imagekitio::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(
                Symbol,
                Imagekitio::Models::FileUpdateResponse::ExtensionStatus::AITasks
              )
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          SUCCESS =
            T.let(
              :success,
              Imagekitio::Models::FileUpdateResponse::ExtensionStatus::AITasks::TaggedSymbol
            )
          PENDING =
            T.let(
              :pending,
              Imagekitio::Models::FileUpdateResponse::ExtensionStatus::AITasks::TaggedSymbol
            )
          FAILED =
            T.let(
              :failed,
              Imagekitio::Models::FileUpdateResponse::ExtensionStatus::AITasks::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                Imagekitio::Models::FileUpdateResponse::ExtensionStatus::AITasks::TaggedSymbol
              ]
            )
          end
          def self.values
          end
        end

        module AwsAutoTagging
          extend Imagekitio::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(
                Symbol,
                Imagekitio::Models::FileUpdateResponse::ExtensionStatus::AwsAutoTagging
              )
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          SUCCESS =
            T.let(
              :success,
              Imagekitio::Models::FileUpdateResponse::ExtensionStatus::AwsAutoTagging::TaggedSymbol
            )
          PENDING =
            T.let(
              :pending,
              Imagekitio::Models::FileUpdateResponse::ExtensionStatus::AwsAutoTagging::TaggedSymbol
            )
          FAILED =
            T.let(
              :failed,
              Imagekitio::Models::FileUpdateResponse::ExtensionStatus::AwsAutoTagging::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                Imagekitio::Models::FileUpdateResponse::ExtensionStatus::AwsAutoTagging::TaggedSymbol
              ]
            )
          end
          def self.values
          end
        end

        module GoogleAutoTagging
          extend Imagekitio::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(
                Symbol,
                Imagekitio::Models::FileUpdateResponse::ExtensionStatus::GoogleAutoTagging
              )
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          SUCCESS =
            T.let(
              :success,
              Imagekitio::Models::FileUpdateResponse::ExtensionStatus::GoogleAutoTagging::TaggedSymbol
            )
          PENDING =
            T.let(
              :pending,
              Imagekitio::Models::FileUpdateResponse::ExtensionStatus::GoogleAutoTagging::TaggedSymbol
            )
          FAILED =
            T.let(
              :failed,
              Imagekitio::Models::FileUpdateResponse::ExtensionStatus::GoogleAutoTagging::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                Imagekitio::Models::FileUpdateResponse::ExtensionStatus::GoogleAutoTagging::TaggedSymbol
              ]
            )
          end
          def self.values
          end
        end

        module RemoveBg
          extend Imagekitio::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(
                Symbol,
                Imagekitio::Models::FileUpdateResponse::ExtensionStatus::RemoveBg
              )
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          SUCCESS =
            T.let(
              :success,
              Imagekitio::Models::FileUpdateResponse::ExtensionStatus::RemoveBg::TaggedSymbol
            )
          PENDING =
            T.let(
              :pending,
              Imagekitio::Models::FileUpdateResponse::ExtensionStatus::RemoveBg::TaggedSymbol
            )
          FAILED =
            T.let(
              :failed,
              Imagekitio::Models::FileUpdateResponse::ExtensionStatus::RemoveBg::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                Imagekitio::Models::FileUpdateResponse::ExtensionStatus::RemoveBg::TaggedSymbol
              ]
            )
          end
          def self.values
          end
        end
      end
    end
  end
end
