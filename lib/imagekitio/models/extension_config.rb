# frozen_string_literal: true

module Imagekitio
  module Models
    # Configuration object for an extension (base extensions only, not saved extension
    # references).
    module ExtensionConfig
      extend Imagekitio::Internal::Type::Union

      discriminator :name

      variant :"remove-bg", -> { Imagekitio::ExtensionConfig::RemoveBg }

      variant :"ai-auto-description", -> { Imagekitio::ExtensionConfig::AIAutoDescription }

      variant :"ai-tasks", -> { Imagekitio::ExtensionConfig::AITasks }

      variant -> { Imagekitio::ExtensionConfig::AutoTaggingExtension }

      class RemoveBg < Imagekitio::Internal::Type::BaseModel
        # @!attribute name
        #   Specifies the background removal extension.
        #
        #   @return [Symbol, :"remove-bg"]
        required :name, const: :"remove-bg"

        # @!attribute options
        #
        #   @return [Imagekitio::Models::ExtensionConfig::RemoveBg::Options, nil]
        optional :options, -> { Imagekitio::ExtensionConfig::RemoveBg::Options }

        # @!method initialize(options: nil, name: :"remove-bg")
        #   @param options [Imagekitio::Models::ExtensionConfig::RemoveBg::Options]
        #
        #   @param name [Symbol, :"remove-bg"] Specifies the background removal extension.

        # @see Imagekitio::Models::ExtensionConfig::RemoveBg#options
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
          #   {Imagekitio::Models::ExtensionConfig::RemoveBg::Options} for more details.
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
        #   @return [Symbol, Imagekitio::Models::ExtensionConfig::AutoTaggingExtension::Name]
        required :name, enum: -> { Imagekitio::ExtensionConfig::AutoTaggingExtension::Name }

        # @!method initialize(max_tags:, min_confidence:, name:)
        #   @param max_tags [Integer] Maximum number of tags to attach to the asset.
        #
        #   @param min_confidence [Integer] Minimum confidence level for tags to be considered valid.
        #
        #   @param name [Symbol, Imagekitio::Models::ExtensionConfig::AutoTaggingExtension::Name] Specifies the auto-tagging extension used.

        # Specifies the auto-tagging extension used.
        #
        # @see Imagekitio::Models::ExtensionConfig::AutoTaggingExtension#name
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

      class AITasks < Imagekitio::Internal::Type::BaseModel
        # @!attribute name
        #   Specifies the AI tasks extension for automated image analysis using AI models.
        #
        #   @return [Symbol, :"ai-tasks"]
        required :name, const: :"ai-tasks"

        # @!attribute tasks
        #   Array of task objects defining AI operations to perform on the asset.
        #
        #   @return [Array<Imagekitio::Models::ExtensionConfig::AITasks::Task::SelectTags, Imagekitio::Models::ExtensionConfig::AITasks::Task::SelectMetadata, Imagekitio::Models::ExtensionConfig::AITasks::Task::YesNo>]
        required :tasks,
                 -> { Imagekitio::Internal::Type::ArrayOf[union: Imagekitio::ExtensionConfig::AITasks::Task] }

        # @!method initialize(tasks:, name: :"ai-tasks")
        #   @param tasks [Array<Imagekitio::Models::ExtensionConfig::AITasks::Task::SelectTags, Imagekitio::Models::ExtensionConfig::AITasks::Task::SelectMetadata, Imagekitio::Models::ExtensionConfig::AITasks::Task::YesNo>] Array of task objects defining AI operations to perform on the asset.
        #
        #   @param name [Symbol, :"ai-tasks"] Specifies the AI tasks extension for automated image analysis using AI models.

        module Task
          extend Imagekitio::Internal::Type::Union

          discriminator :type

          variant :select_tags, -> { Imagekitio::ExtensionConfig::AITasks::Task::SelectTags }

          variant :select_metadata, -> { Imagekitio::ExtensionConfig::AITasks::Task::SelectMetadata }

          variant :yes_no, -> { Imagekitio::ExtensionConfig::AITasks::Task::YesNo }

          class SelectTags < Imagekitio::Internal::Type::BaseModel
            # @!attribute instruction
            #   The question or instruction for the AI to analyze the image.
            #
            #   @return [String]
            required :instruction, String

            # @!attribute type
            #   Task type that analyzes the image and adds matching tags from a vocabulary.
            #
            #   @return [Symbol, :select_tags]
            required :type, const: :select_tags

            # @!attribute max_selections
            #   Maximum number of tags to select from the vocabulary.
            #
            #   @return [Integer, nil]
            optional :max_selections, Integer

            # @!attribute min_selections
            #   Minimum number of tags to select from the vocabulary.
            #
            #   @return [Integer, nil]
            optional :min_selections, Integer

            # @!attribute vocabulary
            #   Array of possible tag values. Combined length of all strings must not exceed 500
            #   characters. Cannot contain the `%` character.
            #
            #   @return [Array<String>, nil]
            optional :vocabulary, Imagekitio::Internal::Type::ArrayOf[String]

            # @!method initialize(instruction:, max_selections: nil, min_selections: nil, vocabulary: nil, type: :select_tags)
            #   Some parameter documentations has been truncated, see
            #   {Imagekitio::Models::ExtensionConfig::AITasks::Task::SelectTags} for more
            #   details.
            #
            #   @param instruction [String] The question or instruction for the AI to analyze the image.
            #
            #   @param max_selections [Integer] Maximum number of tags to select from the vocabulary.
            #
            #   @param min_selections [Integer] Minimum number of tags to select from the vocabulary.
            #
            #   @param vocabulary [Array<String>] Array of possible tag values. Combined length of all strings must not exceed 500
            #
            #   @param type [Symbol, :select_tags] Task type that analyzes the image and adds matching tags from a vocabulary.
          end

          class SelectMetadata < Imagekitio::Internal::Type::BaseModel
            # @!attribute field
            #   Name of the custom metadata field to set. The field must exist in your account.
            #
            #   @return [String]
            required :field, String

            # @!attribute instruction
            #   The question or instruction for the AI to analyze the image.
            #
            #   @return [String]
            required :instruction, String

            # @!attribute type
            #   Task type that analyzes the image and sets a custom metadata field value from a
            #   vocabulary.
            #
            #   @return [Symbol, :select_metadata]
            required :type, const: :select_metadata

            # @!attribute max_selections
            #   Maximum number of values to select from the vocabulary.
            #
            #   @return [Integer, nil]
            optional :max_selections, Integer

            # @!attribute min_selections
            #   Minimum number of values to select from the vocabulary.
            #
            #   @return [Integer, nil]
            optional :min_selections, Integer

            # @!attribute vocabulary
            #   Array of possible values matching the custom metadata field type.
            #
            #   @return [Array<String, Float, Boolean>, nil]
            optional :vocabulary,
                     -> { Imagekitio::Internal::Type::ArrayOf[union: Imagekitio::ExtensionConfig::AITasks::Task::SelectMetadata::Vocabulary] }

            # @!method initialize(field:, instruction:, max_selections: nil, min_selections: nil, vocabulary: nil, type: :select_metadata)
            #   Some parameter documentations has been truncated, see
            #   {Imagekitio::Models::ExtensionConfig::AITasks::Task::SelectMetadata} for more
            #   details.
            #
            #   @param field [String] Name of the custom metadata field to set. The field must exist in your account.
            #
            #   @param instruction [String] The question or instruction for the AI to analyze the image.
            #
            #   @param max_selections [Integer] Maximum number of values to select from the vocabulary.
            #
            #   @param min_selections [Integer] Minimum number of values to select from the vocabulary.
            #
            #   @param vocabulary [Array<String, Float, Boolean>] Array of possible values matching the custom metadata field type.
            #
            #   @param type [Symbol, :select_metadata] Task type that analyzes the image and sets a custom metadata field value from a

            module Vocabulary
              extend Imagekitio::Internal::Type::Union

              variant String

              variant Float

              variant Imagekitio::Internal::Type::Boolean

              # @!method self.variants
              #   @return [Array(String, Float, Boolean)]
            end
          end

          class YesNo < Imagekitio::Internal::Type::BaseModel
            # @!attribute instruction
            #   The yes/no question for the AI to answer about the image.
            #
            #   @return [String]
            required :instruction, String

            # @!attribute type
            #   Task type that asks a yes/no question and executes actions based on the answer.
            #
            #   @return [Symbol, :yes_no]
            required :type, const: :yes_no

            # @!attribute on_no
            #   Actions to execute if the AI answers no.
            #
            #   @return [Imagekitio::Models::ExtensionConfig::AITasks::Task::YesNo::OnNo, nil]
            optional :on_no, -> { Imagekitio::ExtensionConfig::AITasks::Task::YesNo::OnNo }

            # @!attribute on_unknown
            #   Actions to execute if the AI cannot determine the answer.
            #
            #   @return [Imagekitio::Models::ExtensionConfig::AITasks::Task::YesNo::OnUnknown, nil]
            optional :on_unknown, -> { Imagekitio::ExtensionConfig::AITasks::Task::YesNo::OnUnknown }

            # @!attribute on_yes
            #   Actions to execute if the AI answers yes.
            #
            #   @return [Imagekitio::Models::ExtensionConfig::AITasks::Task::YesNo::OnYes, nil]
            optional :on_yes, -> { Imagekitio::ExtensionConfig::AITasks::Task::YesNo::OnYes }

            # @!method initialize(instruction:, on_no: nil, on_unknown: nil, on_yes: nil, type: :yes_no)
            #   @param instruction [String] The yes/no question for the AI to answer about the image.
            #
            #   @param on_no [Imagekitio::Models::ExtensionConfig::AITasks::Task::YesNo::OnNo] Actions to execute if the AI answers no.
            #
            #   @param on_unknown [Imagekitio::Models::ExtensionConfig::AITasks::Task::YesNo::OnUnknown] Actions to execute if the AI cannot determine the answer.
            #
            #   @param on_yes [Imagekitio::Models::ExtensionConfig::AITasks::Task::YesNo::OnYes] Actions to execute if the AI answers yes.
            #
            #   @param type [Symbol, :yes_no] Task type that asks a yes/no question and executes actions based on the answer.

            # @see Imagekitio::Models::ExtensionConfig::AITasks::Task::YesNo#on_no
            class OnNo < Imagekitio::Internal::Type::BaseModel
              # @!attribute add_tags
              #   Array of tag strings to add to the asset.
              #
              #   @return [Array<String>, nil]
              optional :add_tags, Imagekitio::Internal::Type::ArrayOf[String]

              # @!attribute remove_tags
              #   Array of tag strings to remove from the asset.
              #
              #   @return [Array<String>, nil]
              optional :remove_tags, Imagekitio::Internal::Type::ArrayOf[String]

              # @!attribute set_metadata
              #   Array of custom metadata field updates.
              #
              #   @return [Array<Imagekitio::Models::ExtensionConfig::AITasks::Task::YesNo::OnNo::SetMetadata>, nil]
              optional :set_metadata,
                       -> { Imagekitio::Internal::Type::ArrayOf[Imagekitio::ExtensionConfig::AITasks::Task::YesNo::OnNo::SetMetadata] }

              # @!attribute unset_metadata
              #   Array of custom metadata fields to remove.
              #
              #   @return [Array<Imagekitio::Models::ExtensionConfig::AITasks::Task::YesNo::OnNo::UnsetMetadata>, nil]
              optional :unset_metadata,
                       -> { Imagekitio::Internal::Type::ArrayOf[Imagekitio::ExtensionConfig::AITasks::Task::YesNo::OnNo::UnsetMetadata] }

              # @!method initialize(add_tags: nil, remove_tags: nil, set_metadata: nil, unset_metadata: nil)
              #   Actions to execute if the AI answers no.
              #
              #   @param add_tags [Array<String>] Array of tag strings to add to the asset.
              #
              #   @param remove_tags [Array<String>] Array of tag strings to remove from the asset.
              #
              #   @param set_metadata [Array<Imagekitio::Models::ExtensionConfig::AITasks::Task::YesNo::OnNo::SetMetadata>] Array of custom metadata field updates.
              #
              #   @param unset_metadata [Array<Imagekitio::Models::ExtensionConfig::AITasks::Task::YesNo::OnNo::UnsetMetadata>] Array of custom metadata fields to remove.

              class SetMetadata < Imagekitio::Internal::Type::BaseModel
                # @!attribute field
                #   Name of the custom metadata field to set.
                #
                #   @return [String]
                required :field, String

                # @!attribute value
                #   Value to set for the custom metadata field. The value type should match the
                #   custom metadata field type.
                #
                #   @return [String, Float, Boolean, Array<String, Float, Boolean>]
                required :value, union: -> { Imagekitio::ExtensionConfig::AITasks::Task::YesNo::OnNo::SetMetadata::Value }

                # @!method initialize(field:, value:)
                #   Some parameter documentations has been truncated, see
                #   {Imagekitio::Models::ExtensionConfig::AITasks::Task::YesNo::OnNo::SetMetadata}
                #   for more details.
                #
                #   @param field [String] Name of the custom metadata field to set.
                #
                #   @param value [String, Float, Boolean, Array<String, Float, Boolean>] Value to set for the custom metadata field. The value type should match the cust

                # Value to set for the custom metadata field. The value type should match the
                # custom metadata field type.
                #
                # @see Imagekitio::Models::ExtensionConfig::AITasks::Task::YesNo::OnNo::SetMetadata#value
                module Value
                  extend Imagekitio::Internal::Type::Union

                  variant String

                  variant Float

                  variant Imagekitio::Internal::Type::Boolean

                  variant -> { Imagekitio::Models::ExtensionConfig::AITasks::Task::YesNo::OnNo::SetMetadata::Value::MixedArray }

                  module Mixed
                    extend Imagekitio::Internal::Type::Union

                    variant String

                    variant Float

                    variant Imagekitio::Internal::Type::Boolean

                    # @!method self.variants
                    #   @return [Array(String, Float, Boolean)]
                  end

                  # @!method self.variants
                  #   @return [Array(String, Float, Boolean, Array<String, Float, Boolean>)]

                  # @type [Imagekitio::Internal::Type::Converter]
                  MixedArray =
                    Imagekitio::Internal::Type::ArrayOf[union: -> {
                      Imagekitio::ExtensionConfig::AITasks::Task::YesNo::OnNo::SetMetadata::Value::Mixed
                    }]
                end
              end

              class UnsetMetadata < Imagekitio::Internal::Type::BaseModel
                # @!attribute field
                #   Name of the custom metadata field to remove.
                #
                #   @return [String]
                required :field, String

                # @!method initialize(field:)
                #   @param field [String] Name of the custom metadata field to remove.
              end
            end

            # @see Imagekitio::Models::ExtensionConfig::AITasks::Task::YesNo#on_unknown
            class OnUnknown < Imagekitio::Internal::Type::BaseModel
              # @!attribute add_tags
              #   Array of tag strings to add to the asset.
              #
              #   @return [Array<String>, nil]
              optional :add_tags, Imagekitio::Internal::Type::ArrayOf[String]

              # @!attribute remove_tags
              #   Array of tag strings to remove from the asset.
              #
              #   @return [Array<String>, nil]
              optional :remove_tags, Imagekitio::Internal::Type::ArrayOf[String]

              # @!attribute set_metadata
              #   Array of custom metadata field updates.
              #
              #   @return [Array<Imagekitio::Models::ExtensionConfig::AITasks::Task::YesNo::OnUnknown::SetMetadata>, nil]
              optional :set_metadata,
                       -> { Imagekitio::Internal::Type::ArrayOf[Imagekitio::ExtensionConfig::AITasks::Task::YesNo::OnUnknown::SetMetadata] }

              # @!attribute unset_metadata
              #   Array of custom metadata fields to remove.
              #
              #   @return [Array<Imagekitio::Models::ExtensionConfig::AITasks::Task::YesNo::OnUnknown::UnsetMetadata>, nil]
              optional :unset_metadata,
                       -> { Imagekitio::Internal::Type::ArrayOf[Imagekitio::ExtensionConfig::AITasks::Task::YesNo::OnUnknown::UnsetMetadata] }

              # @!method initialize(add_tags: nil, remove_tags: nil, set_metadata: nil, unset_metadata: nil)
              #   Actions to execute if the AI cannot determine the answer.
              #
              #   @param add_tags [Array<String>] Array of tag strings to add to the asset.
              #
              #   @param remove_tags [Array<String>] Array of tag strings to remove from the asset.
              #
              #   @param set_metadata [Array<Imagekitio::Models::ExtensionConfig::AITasks::Task::YesNo::OnUnknown::SetMetadata>] Array of custom metadata field updates.
              #
              #   @param unset_metadata [Array<Imagekitio::Models::ExtensionConfig::AITasks::Task::YesNo::OnUnknown::UnsetMetadata>] Array of custom metadata fields to remove.

              class SetMetadata < Imagekitio::Internal::Type::BaseModel
                # @!attribute field
                #   Name of the custom metadata field to set.
                #
                #   @return [String]
                required :field, String

                # @!attribute value
                #   Value to set for the custom metadata field. The value type should match the
                #   custom metadata field type.
                #
                #   @return [String, Float, Boolean, Array<String, Float, Boolean>]
                required :value,
                         union: -> { Imagekitio::ExtensionConfig::AITasks::Task::YesNo::OnUnknown::SetMetadata::Value }

                # @!method initialize(field:, value:)
                #   Some parameter documentations has been truncated, see
                #   {Imagekitio::Models::ExtensionConfig::AITasks::Task::YesNo::OnUnknown::SetMetadata}
                #   for more details.
                #
                #   @param field [String] Name of the custom metadata field to set.
                #
                #   @param value [String, Float, Boolean, Array<String, Float, Boolean>] Value to set for the custom metadata field. The value type should match the cust

                # Value to set for the custom metadata field. The value type should match the
                # custom metadata field type.
                #
                # @see Imagekitio::Models::ExtensionConfig::AITasks::Task::YesNo::OnUnknown::SetMetadata#value
                module Value
                  extend Imagekitio::Internal::Type::Union

                  variant String

                  variant Float

                  variant Imagekitio::Internal::Type::Boolean

                  variant -> { Imagekitio::Models::ExtensionConfig::AITasks::Task::YesNo::OnUnknown::SetMetadata::Value::MixedArray }

                  module Mixed
                    extend Imagekitio::Internal::Type::Union

                    variant String

                    variant Float

                    variant Imagekitio::Internal::Type::Boolean

                    # @!method self.variants
                    #   @return [Array(String, Float, Boolean)]
                  end

                  # @!method self.variants
                  #   @return [Array(String, Float, Boolean, Array<String, Float, Boolean>)]

                  # @type [Imagekitio::Internal::Type::Converter]
                  MixedArray =
                    Imagekitio::Internal::Type::ArrayOf[union: -> {
                      Imagekitio::ExtensionConfig::AITasks::Task::YesNo::OnUnknown::SetMetadata::Value::Mixed
                    }]
                end
              end

              class UnsetMetadata < Imagekitio::Internal::Type::BaseModel
                # @!attribute field
                #   Name of the custom metadata field to remove.
                #
                #   @return [String]
                required :field, String

                # @!method initialize(field:)
                #   @param field [String] Name of the custom metadata field to remove.
              end
            end

            # @see Imagekitio::Models::ExtensionConfig::AITasks::Task::YesNo#on_yes
            class OnYes < Imagekitio::Internal::Type::BaseModel
              # @!attribute add_tags
              #   Array of tag strings to add to the asset.
              #
              #   @return [Array<String>, nil]
              optional :add_tags, Imagekitio::Internal::Type::ArrayOf[String]

              # @!attribute remove_tags
              #   Array of tag strings to remove from the asset.
              #
              #   @return [Array<String>, nil]
              optional :remove_tags, Imagekitio::Internal::Type::ArrayOf[String]

              # @!attribute set_metadata
              #   Array of custom metadata field updates.
              #
              #   @return [Array<Imagekitio::Models::ExtensionConfig::AITasks::Task::YesNo::OnYes::SetMetadata>, nil]
              optional :set_metadata,
                       -> { Imagekitio::Internal::Type::ArrayOf[Imagekitio::ExtensionConfig::AITasks::Task::YesNo::OnYes::SetMetadata] }

              # @!attribute unset_metadata
              #   Array of custom metadata fields to remove.
              #
              #   @return [Array<Imagekitio::Models::ExtensionConfig::AITasks::Task::YesNo::OnYes::UnsetMetadata>, nil]
              optional :unset_metadata,
                       -> { Imagekitio::Internal::Type::ArrayOf[Imagekitio::ExtensionConfig::AITasks::Task::YesNo::OnYes::UnsetMetadata] }

              # @!method initialize(add_tags: nil, remove_tags: nil, set_metadata: nil, unset_metadata: nil)
              #   Actions to execute if the AI answers yes.
              #
              #   @param add_tags [Array<String>] Array of tag strings to add to the asset.
              #
              #   @param remove_tags [Array<String>] Array of tag strings to remove from the asset.
              #
              #   @param set_metadata [Array<Imagekitio::Models::ExtensionConfig::AITasks::Task::YesNo::OnYes::SetMetadata>] Array of custom metadata field updates.
              #
              #   @param unset_metadata [Array<Imagekitio::Models::ExtensionConfig::AITasks::Task::YesNo::OnYes::UnsetMetadata>] Array of custom metadata fields to remove.

              class SetMetadata < Imagekitio::Internal::Type::BaseModel
                # @!attribute field
                #   Name of the custom metadata field to set.
                #
                #   @return [String]
                required :field, String

                # @!attribute value
                #   Value to set for the custom metadata field. The value type should match the
                #   custom metadata field type.
                #
                #   @return [String, Float, Boolean, Array<String, Float, Boolean>]
                required :value,
                         union: -> { Imagekitio::ExtensionConfig::AITasks::Task::YesNo::OnYes::SetMetadata::Value }

                # @!method initialize(field:, value:)
                #   Some parameter documentations has been truncated, see
                #   {Imagekitio::Models::ExtensionConfig::AITasks::Task::YesNo::OnYes::SetMetadata}
                #   for more details.
                #
                #   @param field [String] Name of the custom metadata field to set.
                #
                #   @param value [String, Float, Boolean, Array<String, Float, Boolean>] Value to set for the custom metadata field. The value type should match the cust

                # Value to set for the custom metadata field. The value type should match the
                # custom metadata field type.
                #
                # @see Imagekitio::Models::ExtensionConfig::AITasks::Task::YesNo::OnYes::SetMetadata#value
                module Value
                  extend Imagekitio::Internal::Type::Union

                  variant String

                  variant Float

                  variant Imagekitio::Internal::Type::Boolean

                  variant -> { Imagekitio::Models::ExtensionConfig::AITasks::Task::YesNo::OnYes::SetMetadata::Value::MixedArray }

                  module Mixed
                    extend Imagekitio::Internal::Type::Union

                    variant String

                    variant Float

                    variant Imagekitio::Internal::Type::Boolean

                    # @!method self.variants
                    #   @return [Array(String, Float, Boolean)]
                  end

                  # @!method self.variants
                  #   @return [Array(String, Float, Boolean, Array<String, Float, Boolean>)]

                  # @type [Imagekitio::Internal::Type::Converter]
                  MixedArray =
                    Imagekitio::Internal::Type::ArrayOf[union: -> {
                      Imagekitio::ExtensionConfig::AITasks::Task::YesNo::OnYes::SetMetadata::Value::Mixed
                    }]
                end
              end

              class UnsetMetadata < Imagekitio::Internal::Type::BaseModel
                # @!attribute field
                #   Name of the custom metadata field to remove.
                #
                #   @return [String]
                required :field, String

                # @!method initialize(field:)
                #   @param field [String] Name of the custom metadata field to remove.
              end
            end
          end

          # @!method self.variants
          #   @return [Array(Imagekitio::Models::ExtensionConfig::AITasks::Task::SelectTags, Imagekitio::Models::ExtensionConfig::AITasks::Task::SelectMetadata, Imagekitio::Models::ExtensionConfig::AITasks::Task::YesNo)]
        end
      end

      # @!method self.variants
      #   @return [Array(Imagekitio::Models::ExtensionConfig::RemoveBg, Imagekitio::Models::ExtensionConfig::AIAutoDescription, Imagekitio::Models::ExtensionConfig::AITasks, Imagekitio::Models::ExtensionConfig::AutoTaggingExtension)]
    end
  end
end
