# typed: strong

module Imagekitio
  module Models
    module ExtensionItem
      extend Imagekitio::Internal::Type::Union

      Variants =
        T.type_alias do
          T.any(
            Imagekitio::ExtensionItem::RemoveBg,
            Imagekitio::ExtensionItem::AIAutoDescription,
            Imagekitio::ExtensionItem::AITasks,
            Imagekitio::ExtensionItem::SavedExtension,
            Imagekitio::ExtensionItem::AutoTaggingExtension
          )
        end

      class RemoveBg < Imagekitio::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Imagekitio::ExtensionItem::RemoveBg,
              Imagekitio::Internal::AnyHash
            )
          end

        # Specifies the background removal extension.
        sig { returns(Symbol) }
        attr_accessor :name

        sig { returns(T.nilable(Imagekitio::ExtensionItem::RemoveBg::Options)) }
        attr_reader :options

        sig do
          params(
            options: Imagekitio::ExtensionItem::RemoveBg::Options::OrHash
          ).void
        end
        attr_writer :options

        sig do
          params(
            options: Imagekitio::ExtensionItem::RemoveBg::Options::OrHash,
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
              options: Imagekitio::ExtensionItem::RemoveBg::Options
            }
          )
        end
        def to_hash
        end

        class Options < Imagekitio::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Imagekitio::ExtensionItem::RemoveBg::Options,
                Imagekitio::Internal::AnyHash
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

      class AutoTaggingExtension < Imagekitio::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Imagekitio::ExtensionItem::AutoTaggingExtension,
              Imagekitio::Internal::AnyHash
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
          returns(
            Imagekitio::ExtensionItem::AutoTaggingExtension::Name::OrSymbol
          )
        end
        attr_accessor :name

        sig do
          params(
            max_tags: Integer,
            min_confidence: Integer,
            name:
              Imagekitio::ExtensionItem::AutoTaggingExtension::Name::OrSymbol
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
                Imagekitio::ExtensionItem::AutoTaggingExtension::Name::OrSymbol
            }
          )
        end
        def to_hash
        end

        # Specifies the auto-tagging extension used.
        module Name
          extend Imagekitio::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(
                Symbol,
                Imagekitio::ExtensionItem::AutoTaggingExtension::Name
              )
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          GOOGLE_AUTO_TAGGING =
            T.let(
              :"google-auto-tagging",
              Imagekitio::ExtensionItem::AutoTaggingExtension::Name::TaggedSymbol
            )
          AWS_AUTO_TAGGING =
            T.let(
              :"aws-auto-tagging",
              Imagekitio::ExtensionItem::AutoTaggingExtension::Name::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                Imagekitio::ExtensionItem::AutoTaggingExtension::Name::TaggedSymbol
              ]
            )
          end
          def self.values
          end
        end
      end

      class AIAutoDescription < Imagekitio::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Imagekitio::ExtensionItem::AIAutoDescription,
              Imagekitio::Internal::AnyHash
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

      class AITasks < Imagekitio::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Imagekitio::ExtensionItem::AITasks,
              Imagekitio::Internal::AnyHash
            )
          end

        # Specifies the AI tasks extension for automated image analysis using AI models.
        sig { returns(Symbol) }
        attr_accessor :name

        # Array of task objects defining AI operations to perform on the asset.
        sig do
          returns(
            T::Array[
              T.any(
                Imagekitio::ExtensionItem::AITasks::Task::SelectTags,
                Imagekitio::ExtensionItem::AITasks::Task::SelectMetadata,
                Imagekitio::ExtensionItem::AITasks::Task::YesNo
              )
            ]
          )
        end
        attr_accessor :tasks

        sig do
          params(
            tasks:
              T::Array[
                T.any(
                  Imagekitio::ExtensionItem::AITasks::Task::SelectTags::OrHash,
                  Imagekitio::ExtensionItem::AITasks::Task::SelectMetadata::OrHash,
                  Imagekitio::ExtensionItem::AITasks::Task::YesNo::OrHash
                )
              ],
            name: Symbol
          ).returns(T.attached_class)
        end
        def self.new(
          # Array of task objects defining AI operations to perform on the asset.
          tasks:,
          # Specifies the AI tasks extension for automated image analysis using AI models.
          name: :"ai-tasks"
        )
        end

        sig do
          override.returns(
            {
              name: Symbol,
              tasks:
                T::Array[
                  T.any(
                    Imagekitio::ExtensionItem::AITasks::Task::SelectTags,
                    Imagekitio::ExtensionItem::AITasks::Task::SelectMetadata,
                    Imagekitio::ExtensionItem::AITasks::Task::YesNo
                  )
                ]
            }
          )
        end
        def to_hash
        end

        module Task
          extend Imagekitio::Internal::Type::Union

          Variants =
            T.type_alias do
              T.any(
                Imagekitio::ExtensionItem::AITasks::Task::SelectTags,
                Imagekitio::ExtensionItem::AITasks::Task::SelectMetadata,
                Imagekitio::ExtensionItem::AITasks::Task::YesNo
              )
            end

          class SelectTags < Imagekitio::Internal::Type::BaseModel
            OrHash =
              T.type_alias do
                T.any(
                  Imagekitio::ExtensionItem::AITasks::Task::SelectTags,
                  Imagekitio::Internal::AnyHash
                )
              end

            # The question or instruction for the AI to analyze the image.
            sig { returns(String) }
            attr_accessor :instruction

            # Task type that analyzes the image and adds matching tags from a vocabulary.
            sig { returns(Symbol) }
            attr_accessor :type

            # Maximum number of tags to select from the vocabulary.
            sig { returns(T.nilable(Integer)) }
            attr_reader :max_selections

            sig { params(max_selections: Integer).void }
            attr_writer :max_selections

            # Minimum number of tags to select from the vocabulary.
            sig { returns(T.nilable(Integer)) }
            attr_reader :min_selections

            sig { params(min_selections: Integer).void }
            attr_writer :min_selections

            # Array of possible tag values. Combined length of all strings must not exceed 500
            # characters. Cannot contain the `%` character.
            sig { returns(T.nilable(T::Array[String])) }
            attr_reader :vocabulary

            sig { params(vocabulary: T::Array[String]).void }
            attr_writer :vocabulary

            sig do
              params(
                instruction: String,
                max_selections: Integer,
                min_selections: Integer,
                vocabulary: T::Array[String],
                type: Symbol
              ).returns(T.attached_class)
            end
            def self.new(
              # The question or instruction for the AI to analyze the image.
              instruction:,
              # Maximum number of tags to select from the vocabulary.
              max_selections: nil,
              # Minimum number of tags to select from the vocabulary.
              min_selections: nil,
              # Array of possible tag values. Combined length of all strings must not exceed 500
              # characters. Cannot contain the `%` character.
              vocabulary: nil,
              # Task type that analyzes the image and adds matching tags from a vocabulary.
              type: :select_tags
            )
            end

            sig do
              override.returns(
                {
                  instruction: String,
                  type: Symbol,
                  max_selections: Integer,
                  min_selections: Integer,
                  vocabulary: T::Array[String]
                }
              )
            end
            def to_hash
            end
          end

          class SelectMetadata < Imagekitio::Internal::Type::BaseModel
            OrHash =
              T.type_alias do
                T.any(
                  Imagekitio::ExtensionItem::AITasks::Task::SelectMetadata,
                  Imagekitio::Internal::AnyHash
                )
              end

            # Name of the custom metadata field to set. The field must exist in your account.
            sig { returns(String) }
            attr_accessor :field

            # The question or instruction for the AI to analyze the image.
            sig { returns(String) }
            attr_accessor :instruction

            # Task type that analyzes the image and sets a custom metadata field value from a
            # vocabulary.
            sig { returns(Symbol) }
            attr_accessor :type

            # Maximum number of values to select from the vocabulary.
            sig { returns(T.nilable(Integer)) }
            attr_reader :max_selections

            sig { params(max_selections: Integer).void }
            attr_writer :max_selections

            # Minimum number of values to select from the vocabulary.
            sig { returns(T.nilable(Integer)) }
            attr_reader :min_selections

            sig { params(min_selections: Integer).void }
            attr_writer :min_selections

            # Array of possible values matching the custom metadata field type.
            sig do
              returns(
                T.nilable(
                  T::Array[
                    Imagekitio::ExtensionItem::AITasks::Task::SelectMetadata::Vocabulary::Variants
                  ]
                )
              )
            end
            attr_reader :vocabulary

            sig do
              params(
                vocabulary:
                  T::Array[
                    Imagekitio::ExtensionItem::AITasks::Task::SelectMetadata::Vocabulary::Variants
                  ]
              ).void
            end
            attr_writer :vocabulary

            sig do
              params(
                field: String,
                instruction: String,
                max_selections: Integer,
                min_selections: Integer,
                vocabulary:
                  T::Array[
                    Imagekitio::ExtensionItem::AITasks::Task::SelectMetadata::Vocabulary::Variants
                  ],
                type: Symbol
              ).returns(T.attached_class)
            end
            def self.new(
              # Name of the custom metadata field to set. The field must exist in your account.
              field:,
              # The question or instruction for the AI to analyze the image.
              instruction:,
              # Maximum number of values to select from the vocabulary.
              max_selections: nil,
              # Minimum number of values to select from the vocabulary.
              min_selections: nil,
              # Array of possible values matching the custom metadata field type.
              vocabulary: nil,
              # Task type that analyzes the image and sets a custom metadata field value from a
              # vocabulary.
              type: :select_metadata
            )
            end

            sig do
              override.returns(
                {
                  field: String,
                  instruction: String,
                  type: Symbol,
                  max_selections: Integer,
                  min_selections: Integer,
                  vocabulary:
                    T::Array[
                      Imagekitio::ExtensionItem::AITasks::Task::SelectMetadata::Vocabulary::Variants
                    ]
                }
              )
            end
            def to_hash
            end

            module Vocabulary
              extend Imagekitio::Internal::Type::Union

              Variants = T.type_alias { T.any(String, Float, T::Boolean) }

              sig do
                override.returns(
                  T::Array[
                    Imagekitio::ExtensionItem::AITasks::Task::SelectMetadata::Vocabulary::Variants
                  ]
                )
              end
              def self.variants
              end
            end
          end

          class YesNo < Imagekitio::Internal::Type::BaseModel
            OrHash =
              T.type_alias do
                T.any(
                  Imagekitio::ExtensionItem::AITasks::Task::YesNo,
                  Imagekitio::Internal::AnyHash
                )
              end

            # The yes/no question for the AI to answer about the image.
            sig { returns(String) }
            attr_accessor :instruction

            # Task type that asks a yes/no question and executes actions based on the answer.
            sig { returns(Symbol) }
            attr_accessor :type

            # Actions to execute if the AI answers no.
            sig do
              returns(
                T.nilable(Imagekitio::ExtensionItem::AITasks::Task::YesNo::OnNo)
              )
            end
            attr_reader :on_no

            sig do
              params(
                on_no:
                  Imagekitio::ExtensionItem::AITasks::Task::YesNo::OnNo::OrHash
              ).void
            end
            attr_writer :on_no

            # Actions to execute if the AI cannot determine the answer.
            sig do
              returns(
                T.nilable(
                  Imagekitio::ExtensionItem::AITasks::Task::YesNo::OnUnknown
                )
              )
            end
            attr_reader :on_unknown

            sig do
              params(
                on_unknown:
                  Imagekitio::ExtensionItem::AITasks::Task::YesNo::OnUnknown::OrHash
              ).void
            end
            attr_writer :on_unknown

            # Actions to execute if the AI answers yes.
            sig do
              returns(
                T.nilable(
                  Imagekitio::ExtensionItem::AITasks::Task::YesNo::OnYes
                )
              )
            end
            attr_reader :on_yes

            sig do
              params(
                on_yes:
                  Imagekitio::ExtensionItem::AITasks::Task::YesNo::OnYes::OrHash
              ).void
            end
            attr_writer :on_yes

            sig do
              params(
                instruction: String,
                on_no:
                  Imagekitio::ExtensionItem::AITasks::Task::YesNo::OnNo::OrHash,
                on_unknown:
                  Imagekitio::ExtensionItem::AITasks::Task::YesNo::OnUnknown::OrHash,
                on_yes:
                  Imagekitio::ExtensionItem::AITasks::Task::YesNo::OnYes::OrHash,
                type: Symbol
              ).returns(T.attached_class)
            end
            def self.new(
              # The yes/no question for the AI to answer about the image.
              instruction:,
              # Actions to execute if the AI answers no.
              on_no: nil,
              # Actions to execute if the AI cannot determine the answer.
              on_unknown: nil,
              # Actions to execute if the AI answers yes.
              on_yes: nil,
              # Task type that asks a yes/no question and executes actions based on the answer.
              type: :yes_no
            )
            end

            sig do
              override.returns(
                {
                  instruction: String,
                  type: Symbol,
                  on_no: Imagekitio::ExtensionItem::AITasks::Task::YesNo::OnNo,
                  on_unknown:
                    Imagekitio::ExtensionItem::AITasks::Task::YesNo::OnUnknown,
                  on_yes: Imagekitio::ExtensionItem::AITasks::Task::YesNo::OnYes
                }
              )
            end
            def to_hash
            end

            class OnNo < Imagekitio::Internal::Type::BaseModel
              OrHash =
                T.type_alias do
                  T.any(
                    Imagekitio::ExtensionItem::AITasks::Task::YesNo::OnNo,
                    Imagekitio::Internal::AnyHash
                  )
                end

              # Array of tag strings to add to the asset.
              sig { returns(T.nilable(T::Array[String])) }
              attr_reader :add_tags

              sig { params(add_tags: T::Array[String]).void }
              attr_writer :add_tags

              # Array of tag strings to remove from the asset.
              sig { returns(T.nilable(T::Array[String])) }
              attr_reader :remove_tags

              sig { params(remove_tags: T::Array[String]).void }
              attr_writer :remove_tags

              # Array of custom metadata field updates.
              sig do
                returns(
                  T.nilable(
                    T::Array[
                      Imagekitio::ExtensionItem::AITasks::Task::YesNo::OnNo::SetMetadata
                    ]
                  )
                )
              end
              attr_reader :set_metadata

              sig do
                params(
                  set_metadata:
                    T::Array[
                      Imagekitio::ExtensionItem::AITasks::Task::YesNo::OnNo::SetMetadata::OrHash
                    ]
                ).void
              end
              attr_writer :set_metadata

              # Array of custom metadata fields to remove.
              sig do
                returns(
                  T.nilable(
                    T::Array[
                      Imagekitio::ExtensionItem::AITasks::Task::YesNo::OnNo::UnsetMetadata
                    ]
                  )
                )
              end
              attr_reader :unset_metadata

              sig do
                params(
                  unset_metadata:
                    T::Array[
                      Imagekitio::ExtensionItem::AITasks::Task::YesNo::OnNo::UnsetMetadata::OrHash
                    ]
                ).void
              end
              attr_writer :unset_metadata

              # Actions to execute if the AI answers no.
              sig do
                params(
                  add_tags: T::Array[String],
                  remove_tags: T::Array[String],
                  set_metadata:
                    T::Array[
                      Imagekitio::ExtensionItem::AITasks::Task::YesNo::OnNo::SetMetadata::OrHash
                    ],
                  unset_metadata:
                    T::Array[
                      Imagekitio::ExtensionItem::AITasks::Task::YesNo::OnNo::UnsetMetadata::OrHash
                    ]
                ).returns(T.attached_class)
              end
              def self.new(
                # Array of tag strings to add to the asset.
                add_tags: nil,
                # Array of tag strings to remove from the asset.
                remove_tags: nil,
                # Array of custom metadata field updates.
                set_metadata: nil,
                # Array of custom metadata fields to remove.
                unset_metadata: nil
              )
              end

              sig do
                override.returns(
                  {
                    add_tags: T::Array[String],
                    remove_tags: T::Array[String],
                    set_metadata:
                      T::Array[
                        Imagekitio::ExtensionItem::AITasks::Task::YesNo::OnNo::SetMetadata
                      ],
                    unset_metadata:
                      T::Array[
                        Imagekitio::ExtensionItem::AITasks::Task::YesNo::OnNo::UnsetMetadata
                      ]
                  }
                )
              end
              def to_hash
              end

              class SetMetadata < Imagekitio::Internal::Type::BaseModel
                OrHash =
                  T.type_alias do
                    T.any(
                      Imagekitio::ExtensionItem::AITasks::Task::YesNo::OnNo::SetMetadata,
                      Imagekitio::Internal::AnyHash
                    )
                  end

                # Name of the custom metadata field to set.
                sig { returns(String) }
                attr_accessor :field

                # Value to set for the custom metadata field. The value type should match the
                # custom metadata field type.
                sig do
                  returns(
                    Imagekitio::ExtensionItem::AITasks::Task::YesNo::OnNo::SetMetadata::Value::Variants
                  )
                end
                attr_accessor :value

                sig do
                  params(
                    field: String,
                    value:
                      Imagekitio::ExtensionItem::AITasks::Task::YesNo::OnNo::SetMetadata::Value::Variants
                  ).returns(T.attached_class)
                end
                def self.new(
                  # Name of the custom metadata field to set.
                  field:,
                  # Value to set for the custom metadata field. The value type should match the
                  # custom metadata field type.
                  value:
                )
                end

                sig do
                  override.returns(
                    {
                      field: String,
                      value:
                        Imagekitio::ExtensionItem::AITasks::Task::YesNo::OnNo::SetMetadata::Value::Variants
                    }
                  )
                end
                def to_hash
                end

                # Value to set for the custom metadata field. The value type should match the
                # custom metadata field type.
                module Value
                  extend Imagekitio::Internal::Type::Union

                  Variants =
                    T.type_alias do
                      T.any(
                        String,
                        Float,
                        T::Boolean,
                        T::Array[
                          Imagekitio::ExtensionItem::AITasks::Task::YesNo::OnNo::SetMetadata::Value::Mixed::Variants
                        ]
                      )
                    end

                  module Mixed
                    extend Imagekitio::Internal::Type::Union

                    Variants = T.type_alias { T.any(String, Float, T::Boolean) }

                    sig do
                      override.returns(
                        T::Array[
                          Imagekitio::ExtensionItem::AITasks::Task::YesNo::OnNo::SetMetadata::Value::Mixed::Variants
                        ]
                      )
                    end
                    def self.variants
                    end
                  end

                  sig do
                    override.returns(
                      T::Array[
                        Imagekitio::ExtensionItem::AITasks::Task::YesNo::OnNo::SetMetadata::Value::Variants
                      ]
                    )
                  end
                  def self.variants
                  end

                  MixedArray =
                    T.let(
                      Imagekitio::Internal::Type::ArrayOf[
                        union:
                          Imagekitio::ExtensionItem::AITasks::Task::YesNo::OnNo::SetMetadata::Value::Mixed
                      ],
                      Imagekitio::Internal::Type::Converter
                    )
                end
              end

              class UnsetMetadata < Imagekitio::Internal::Type::BaseModel
                OrHash =
                  T.type_alias do
                    T.any(
                      Imagekitio::ExtensionItem::AITasks::Task::YesNo::OnNo::UnsetMetadata,
                      Imagekitio::Internal::AnyHash
                    )
                  end

                # Name of the custom metadata field to remove.
                sig { returns(String) }
                attr_accessor :field

                sig { params(field: String).returns(T.attached_class) }
                def self.new(
                  # Name of the custom metadata field to remove.
                  field:
                )
                end

                sig { override.returns({ field: String }) }
                def to_hash
                end
              end
            end

            class OnUnknown < Imagekitio::Internal::Type::BaseModel
              OrHash =
                T.type_alias do
                  T.any(
                    Imagekitio::ExtensionItem::AITasks::Task::YesNo::OnUnknown,
                    Imagekitio::Internal::AnyHash
                  )
                end

              # Array of tag strings to add to the asset.
              sig { returns(T.nilable(T::Array[String])) }
              attr_reader :add_tags

              sig { params(add_tags: T::Array[String]).void }
              attr_writer :add_tags

              # Array of tag strings to remove from the asset.
              sig { returns(T.nilable(T::Array[String])) }
              attr_reader :remove_tags

              sig { params(remove_tags: T::Array[String]).void }
              attr_writer :remove_tags

              # Array of custom metadata field updates.
              sig do
                returns(
                  T.nilable(
                    T::Array[
                      Imagekitio::ExtensionItem::AITasks::Task::YesNo::OnUnknown::SetMetadata
                    ]
                  )
                )
              end
              attr_reader :set_metadata

              sig do
                params(
                  set_metadata:
                    T::Array[
                      Imagekitio::ExtensionItem::AITasks::Task::YesNo::OnUnknown::SetMetadata::OrHash
                    ]
                ).void
              end
              attr_writer :set_metadata

              # Array of custom metadata fields to remove.
              sig do
                returns(
                  T.nilable(
                    T::Array[
                      Imagekitio::ExtensionItem::AITasks::Task::YesNo::OnUnknown::UnsetMetadata
                    ]
                  )
                )
              end
              attr_reader :unset_metadata

              sig do
                params(
                  unset_metadata:
                    T::Array[
                      Imagekitio::ExtensionItem::AITasks::Task::YesNo::OnUnknown::UnsetMetadata::OrHash
                    ]
                ).void
              end
              attr_writer :unset_metadata

              # Actions to execute if the AI cannot determine the answer.
              sig do
                params(
                  add_tags: T::Array[String],
                  remove_tags: T::Array[String],
                  set_metadata:
                    T::Array[
                      Imagekitio::ExtensionItem::AITasks::Task::YesNo::OnUnknown::SetMetadata::OrHash
                    ],
                  unset_metadata:
                    T::Array[
                      Imagekitio::ExtensionItem::AITasks::Task::YesNo::OnUnknown::UnsetMetadata::OrHash
                    ]
                ).returns(T.attached_class)
              end
              def self.new(
                # Array of tag strings to add to the asset.
                add_tags: nil,
                # Array of tag strings to remove from the asset.
                remove_tags: nil,
                # Array of custom metadata field updates.
                set_metadata: nil,
                # Array of custom metadata fields to remove.
                unset_metadata: nil
              )
              end

              sig do
                override.returns(
                  {
                    add_tags: T::Array[String],
                    remove_tags: T::Array[String],
                    set_metadata:
                      T::Array[
                        Imagekitio::ExtensionItem::AITasks::Task::YesNo::OnUnknown::SetMetadata
                      ],
                    unset_metadata:
                      T::Array[
                        Imagekitio::ExtensionItem::AITasks::Task::YesNo::OnUnknown::UnsetMetadata
                      ]
                  }
                )
              end
              def to_hash
              end

              class SetMetadata < Imagekitio::Internal::Type::BaseModel
                OrHash =
                  T.type_alias do
                    T.any(
                      Imagekitio::ExtensionItem::AITasks::Task::YesNo::OnUnknown::SetMetadata,
                      Imagekitio::Internal::AnyHash
                    )
                  end

                # Name of the custom metadata field to set.
                sig { returns(String) }
                attr_accessor :field

                # Value to set for the custom metadata field. The value type should match the
                # custom metadata field type.
                sig do
                  returns(
                    Imagekitio::ExtensionItem::AITasks::Task::YesNo::OnUnknown::SetMetadata::Value::Variants
                  )
                end
                attr_accessor :value

                sig do
                  params(
                    field: String,
                    value:
                      Imagekitio::ExtensionItem::AITasks::Task::YesNo::OnUnknown::SetMetadata::Value::Variants
                  ).returns(T.attached_class)
                end
                def self.new(
                  # Name of the custom metadata field to set.
                  field:,
                  # Value to set for the custom metadata field. The value type should match the
                  # custom metadata field type.
                  value:
                )
                end

                sig do
                  override.returns(
                    {
                      field: String,
                      value:
                        Imagekitio::ExtensionItem::AITasks::Task::YesNo::OnUnknown::SetMetadata::Value::Variants
                    }
                  )
                end
                def to_hash
                end

                # Value to set for the custom metadata field. The value type should match the
                # custom metadata field type.
                module Value
                  extend Imagekitio::Internal::Type::Union

                  Variants =
                    T.type_alias do
                      T.any(
                        String,
                        Float,
                        T::Boolean,
                        T::Array[
                          Imagekitio::ExtensionItem::AITasks::Task::YesNo::OnUnknown::SetMetadata::Value::Mixed::Variants
                        ]
                      )
                    end

                  module Mixed
                    extend Imagekitio::Internal::Type::Union

                    Variants = T.type_alias { T.any(String, Float, T::Boolean) }

                    sig do
                      override.returns(
                        T::Array[
                          Imagekitio::ExtensionItem::AITasks::Task::YesNo::OnUnknown::SetMetadata::Value::Mixed::Variants
                        ]
                      )
                    end
                    def self.variants
                    end
                  end

                  sig do
                    override.returns(
                      T::Array[
                        Imagekitio::ExtensionItem::AITasks::Task::YesNo::OnUnknown::SetMetadata::Value::Variants
                      ]
                    )
                  end
                  def self.variants
                  end

                  MixedArray =
                    T.let(
                      Imagekitio::Internal::Type::ArrayOf[
                        union:
                          Imagekitio::ExtensionItem::AITasks::Task::YesNo::OnUnknown::SetMetadata::Value::Mixed
                      ],
                      Imagekitio::Internal::Type::Converter
                    )
                end
              end

              class UnsetMetadata < Imagekitio::Internal::Type::BaseModel
                OrHash =
                  T.type_alias do
                    T.any(
                      Imagekitio::ExtensionItem::AITasks::Task::YesNo::OnUnknown::UnsetMetadata,
                      Imagekitio::Internal::AnyHash
                    )
                  end

                # Name of the custom metadata field to remove.
                sig { returns(String) }
                attr_accessor :field

                sig { params(field: String).returns(T.attached_class) }
                def self.new(
                  # Name of the custom metadata field to remove.
                  field:
                )
                end

                sig { override.returns({ field: String }) }
                def to_hash
                end
              end
            end

            class OnYes < Imagekitio::Internal::Type::BaseModel
              OrHash =
                T.type_alias do
                  T.any(
                    Imagekitio::ExtensionItem::AITasks::Task::YesNo::OnYes,
                    Imagekitio::Internal::AnyHash
                  )
                end

              # Array of tag strings to add to the asset.
              sig { returns(T.nilable(T::Array[String])) }
              attr_reader :add_tags

              sig { params(add_tags: T::Array[String]).void }
              attr_writer :add_tags

              # Array of tag strings to remove from the asset.
              sig { returns(T.nilable(T::Array[String])) }
              attr_reader :remove_tags

              sig { params(remove_tags: T::Array[String]).void }
              attr_writer :remove_tags

              # Array of custom metadata field updates.
              sig do
                returns(
                  T.nilable(
                    T::Array[
                      Imagekitio::ExtensionItem::AITasks::Task::YesNo::OnYes::SetMetadata
                    ]
                  )
                )
              end
              attr_reader :set_metadata

              sig do
                params(
                  set_metadata:
                    T::Array[
                      Imagekitio::ExtensionItem::AITasks::Task::YesNo::OnYes::SetMetadata::OrHash
                    ]
                ).void
              end
              attr_writer :set_metadata

              # Array of custom metadata fields to remove.
              sig do
                returns(
                  T.nilable(
                    T::Array[
                      Imagekitio::ExtensionItem::AITasks::Task::YesNo::OnYes::UnsetMetadata
                    ]
                  )
                )
              end
              attr_reader :unset_metadata

              sig do
                params(
                  unset_metadata:
                    T::Array[
                      Imagekitio::ExtensionItem::AITasks::Task::YesNo::OnYes::UnsetMetadata::OrHash
                    ]
                ).void
              end
              attr_writer :unset_metadata

              # Actions to execute if the AI answers yes.
              sig do
                params(
                  add_tags: T::Array[String],
                  remove_tags: T::Array[String],
                  set_metadata:
                    T::Array[
                      Imagekitio::ExtensionItem::AITasks::Task::YesNo::OnYes::SetMetadata::OrHash
                    ],
                  unset_metadata:
                    T::Array[
                      Imagekitio::ExtensionItem::AITasks::Task::YesNo::OnYes::UnsetMetadata::OrHash
                    ]
                ).returns(T.attached_class)
              end
              def self.new(
                # Array of tag strings to add to the asset.
                add_tags: nil,
                # Array of tag strings to remove from the asset.
                remove_tags: nil,
                # Array of custom metadata field updates.
                set_metadata: nil,
                # Array of custom metadata fields to remove.
                unset_metadata: nil
              )
              end

              sig do
                override.returns(
                  {
                    add_tags: T::Array[String],
                    remove_tags: T::Array[String],
                    set_metadata:
                      T::Array[
                        Imagekitio::ExtensionItem::AITasks::Task::YesNo::OnYes::SetMetadata
                      ],
                    unset_metadata:
                      T::Array[
                        Imagekitio::ExtensionItem::AITasks::Task::YesNo::OnYes::UnsetMetadata
                      ]
                  }
                )
              end
              def to_hash
              end

              class SetMetadata < Imagekitio::Internal::Type::BaseModel
                OrHash =
                  T.type_alias do
                    T.any(
                      Imagekitio::ExtensionItem::AITasks::Task::YesNo::OnYes::SetMetadata,
                      Imagekitio::Internal::AnyHash
                    )
                  end

                # Name of the custom metadata field to set.
                sig { returns(String) }
                attr_accessor :field

                # Value to set for the custom metadata field. The value type should match the
                # custom metadata field type.
                sig do
                  returns(
                    Imagekitio::ExtensionItem::AITasks::Task::YesNo::OnYes::SetMetadata::Value::Variants
                  )
                end
                attr_accessor :value

                sig do
                  params(
                    field: String,
                    value:
                      Imagekitio::ExtensionItem::AITasks::Task::YesNo::OnYes::SetMetadata::Value::Variants
                  ).returns(T.attached_class)
                end
                def self.new(
                  # Name of the custom metadata field to set.
                  field:,
                  # Value to set for the custom metadata field. The value type should match the
                  # custom metadata field type.
                  value:
                )
                end

                sig do
                  override.returns(
                    {
                      field: String,
                      value:
                        Imagekitio::ExtensionItem::AITasks::Task::YesNo::OnYes::SetMetadata::Value::Variants
                    }
                  )
                end
                def to_hash
                end

                # Value to set for the custom metadata field. The value type should match the
                # custom metadata field type.
                module Value
                  extend Imagekitio::Internal::Type::Union

                  Variants =
                    T.type_alias do
                      T.any(
                        String,
                        Float,
                        T::Boolean,
                        T::Array[
                          Imagekitio::ExtensionItem::AITasks::Task::YesNo::OnYes::SetMetadata::Value::Mixed::Variants
                        ]
                      )
                    end

                  module Mixed
                    extend Imagekitio::Internal::Type::Union

                    Variants = T.type_alias { T.any(String, Float, T::Boolean) }

                    sig do
                      override.returns(
                        T::Array[
                          Imagekitio::ExtensionItem::AITasks::Task::YesNo::OnYes::SetMetadata::Value::Mixed::Variants
                        ]
                      )
                    end
                    def self.variants
                    end
                  end

                  sig do
                    override.returns(
                      T::Array[
                        Imagekitio::ExtensionItem::AITasks::Task::YesNo::OnYes::SetMetadata::Value::Variants
                      ]
                    )
                  end
                  def self.variants
                  end

                  MixedArray =
                    T.let(
                      Imagekitio::Internal::Type::ArrayOf[
                        union:
                          Imagekitio::ExtensionItem::AITasks::Task::YesNo::OnYes::SetMetadata::Value::Mixed
                      ],
                      Imagekitio::Internal::Type::Converter
                    )
                end
              end

              class UnsetMetadata < Imagekitio::Internal::Type::BaseModel
                OrHash =
                  T.type_alias do
                    T.any(
                      Imagekitio::ExtensionItem::AITasks::Task::YesNo::OnYes::UnsetMetadata,
                      Imagekitio::Internal::AnyHash
                    )
                  end

                # Name of the custom metadata field to remove.
                sig { returns(String) }
                attr_accessor :field

                sig { params(field: String).returns(T.attached_class) }
                def self.new(
                  # Name of the custom metadata field to remove.
                  field:
                )
                end

                sig { override.returns({ field: String }) }
                def to_hash
                end
              end
            end
          end

          sig do
            override.returns(
              T::Array[Imagekitio::ExtensionItem::AITasks::Task::Variants]
            )
          end
          def self.variants
          end
        end
      end

      class SavedExtension < Imagekitio::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Imagekitio::ExtensionItem::SavedExtension,
              Imagekitio::Internal::AnyHash
            )
          end

        # The unique ID of the saved extension to apply.
        sig { returns(String) }
        attr_accessor :id

        # Indicates this is a reference to a saved extension.
        sig { returns(Symbol) }
        attr_accessor :name

        sig { params(id: String, name: Symbol).returns(T.attached_class) }
        def self.new(
          # The unique ID of the saved extension to apply.
          id:,
          # Indicates this is a reference to a saved extension.
          name: :"saved-extension"
        )
        end

        sig { override.returns({ id: String, name: Symbol }) }
        def to_hash
        end
      end

      sig { override.returns(T::Array[Imagekitio::ExtensionItem::Variants]) }
      def self.variants
      end
    end

    Extensions =
      T.let(
        Imagekitio::Internal::Type::ArrayOf[union: Imagekitio::ExtensionItem],
        Imagekitio::Internal::Type::Converter
      )
  end
end
