# typed: strong

module Imagekit
  module Models
    # Object containing details of a file or file version.
    module AssetListResponseItem
      extend Imagekit::Internal::Type::Union

      Variants =
        T.type_alias do
          T.any(
            Imagekit::Models::AssetListResponseItem::FileDetails,
            Imagekit::Models::AssetListResponseItem::FolderDetails
          )
        end

      class FileDetails < Imagekit::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Imagekit::Models::AssetListResponseItem::FileDetails,
              Imagekit::Internal::AnyHash
            )
          end

        # An array of tags assigned to the file by auto tagging.
        sig do
          returns(
            T.nilable(
              T::Array[
                Imagekit::Models::AssetListResponseItem::FileDetails::AITag
              ]
            )
          )
        end
        attr_accessor :ai_tags

        # Date and time when the file was uploaded. The date and time is in ISO8601
        # format.
        sig { returns(T.nilable(String)) }
        attr_reader :created_at

        sig { params(created_at: String).void }
        attr_writer :created_at

        # An string with custom coordinates of the file.
        sig { returns(T.nilable(String)) }
        attr_accessor :custom_coordinates

        # An object with custom metadata for the file.
        sig { returns(T.nilable(T::Hash[Symbol, T.anything])) }
        attr_reader :custom_metadata

        sig { params(custom_metadata: T::Hash[Symbol, T.anything]).void }
        attr_writer :custom_metadata

        # Unique identifier of the asset.
        sig { returns(T.nilable(String)) }
        attr_reader :file_id

        sig { params(file_id: String).void }
        attr_writer :file_id

        # Path of the file. This is the path you would use in the URL to access the file.
        # For example, if the file is at the root of the media library, the path will be
        # `/file.jpg`. If the file is inside a folder named `images`, the path will be
        # `/images/file.jpg`.
        sig { returns(T.nilable(String)) }
        attr_reader :file_path

        sig { params(file_path: String).void }
        attr_writer :file_path

        # Type of the file. Possible values are `image`, `non-image`.
        sig { returns(T.nilable(String)) }
        attr_reader :file_type

        sig { params(file_type: String).void }
        attr_writer :file_type

        # Specifies if the image has an alpha channel.
        sig { returns(T.nilable(T::Boolean)) }
        attr_reader :has_alpha

        sig { params(has_alpha: T::Boolean).void }
        attr_writer :has_alpha

        # Height of the file.
        sig { returns(T.nilable(Float)) }
        attr_reader :height

        sig { params(height: Float).void }
        attr_writer :height

        # Specifies if the file is private or not.
        sig { returns(T.nilable(T::Boolean)) }
        attr_reader :is_private_file

        sig { params(is_private_file: T::Boolean).void }
        attr_writer :is_private_file

        # Specifies if the file is published or not.
        sig { returns(T.nilable(T::Boolean)) }
        attr_reader :is_published

        sig { params(is_published: T::Boolean).void }
        attr_writer :is_published

        # MIME type of the file.
        sig { returns(T.nilable(String)) }
        attr_reader :mime

        sig { params(mime: String).void }
        attr_writer :mime

        # Name of the asset.
        sig { returns(T.nilable(String)) }
        attr_reader :name

        sig { params(name: String).void }
        attr_writer :name

        # Size of the file in bytes.
        sig { returns(T.nilable(Float)) }
        attr_reader :size

        sig { params(size: Float).void }
        attr_writer :size

        # An array of tags assigned to the file. Tags are used to search files in the
        # media library.
        sig { returns(T.nilable(T::Array[String])) }
        attr_accessor :tags

        # URL of the thumbnail image. This URL is used to access the thumbnail image of
        # the file in the media library.
        sig { returns(T.nilable(String)) }
        attr_reader :thumbnail

        sig { params(thumbnail: String).void }
        attr_writer :thumbnail

        # Type of the asset.
        sig { returns(T.nilable(String)) }
        attr_reader :type

        sig { params(type: String).void }
        attr_writer :type

        # Date and time when the file was last updated. The date and time is in ISO8601
        # format.
        sig { returns(T.nilable(String)) }
        attr_reader :updated_at

        sig { params(updated_at: String).void }
        attr_writer :updated_at

        # URL of the file.
        sig { returns(T.nilable(String)) }
        attr_reader :url

        sig { params(url: String).void }
        attr_writer :url

        # An object with details of the file version.
        sig do
          returns(
            T.nilable(
              Imagekit::Models::AssetListResponseItem::FileDetails::VersionInfo
            )
          )
        end
        attr_reader :version_info

        sig do
          params(
            version_info:
              Imagekit::Models::AssetListResponseItem::FileDetails::VersionInfo::OrHash
          ).void
        end
        attr_writer :version_info

        # Width of the file.
        sig { returns(T.nilable(Float)) }
        attr_reader :width

        sig { params(width: Float).void }
        attr_writer :width

        # Object containing details of a file or file version.
        sig do
          params(
            ai_tags:
              T.nilable(
                T::Array[
                  Imagekit::Models::AssetListResponseItem::FileDetails::AITag::OrHash
                ]
              ),
            created_at: String,
            custom_coordinates: T.nilable(String),
            custom_metadata: T::Hash[Symbol, T.anything],
            file_id: String,
            file_path: String,
            file_type: String,
            has_alpha: T::Boolean,
            height: Float,
            is_private_file: T::Boolean,
            is_published: T::Boolean,
            mime: String,
            name: String,
            size: Float,
            tags: T.nilable(T::Array[String]),
            thumbnail: String,
            type: String,
            updated_at: String,
            url: String,
            version_info:
              Imagekit::Models::AssetListResponseItem::FileDetails::VersionInfo::OrHash,
            width: Float
          ).returns(T.attached_class)
        end
        def self.new(
          # An array of tags assigned to the file by auto tagging.
          ai_tags: nil,
          # Date and time when the file was uploaded. The date and time is in ISO8601
          # format.
          created_at: nil,
          # An string with custom coordinates of the file.
          custom_coordinates: nil,
          # An object with custom metadata for the file.
          custom_metadata: nil,
          # Unique identifier of the asset.
          file_id: nil,
          # Path of the file. This is the path you would use in the URL to access the file.
          # For example, if the file is at the root of the media library, the path will be
          # `/file.jpg`. If the file is inside a folder named `images`, the path will be
          # `/images/file.jpg`.
          file_path: nil,
          # Type of the file. Possible values are `image`, `non-image`.
          file_type: nil,
          # Specifies if the image has an alpha channel.
          has_alpha: nil,
          # Height of the file.
          height: nil,
          # Specifies if the file is private or not.
          is_private_file: nil,
          # Specifies if the file is published or not.
          is_published: nil,
          # MIME type of the file.
          mime: nil,
          # Name of the asset.
          name: nil,
          # Size of the file in bytes.
          size: nil,
          # An array of tags assigned to the file. Tags are used to search files in the
          # media library.
          tags: nil,
          # URL of the thumbnail image. This URL is used to access the thumbnail image of
          # the file in the media library.
          thumbnail: nil,
          # Type of the asset.
          type: nil,
          # Date and time when the file was last updated. The date and time is in ISO8601
          # format.
          updated_at: nil,
          # URL of the file.
          url: nil,
          # An object with details of the file version.
          version_info: nil,
          # Width of the file.
          width: nil
        )
        end

        sig do
          override.returns(
            {
              ai_tags:
                T.nilable(
                  T::Array[
                    Imagekit::Models::AssetListResponseItem::FileDetails::AITag
                  ]
                ),
              created_at: String,
              custom_coordinates: T.nilable(String),
              custom_metadata: T::Hash[Symbol, T.anything],
              file_id: String,
              file_path: String,
              file_type: String,
              has_alpha: T::Boolean,
              height: Float,
              is_private_file: T::Boolean,
              is_published: T::Boolean,
              mime: String,
              name: String,
              size: Float,
              tags: T.nilable(T::Array[String]),
              thumbnail: String,
              type: String,
              updated_at: String,
              url: String,
              version_info:
                Imagekit::Models::AssetListResponseItem::FileDetails::VersionInfo,
              width: Float
            }
          )
        end
        def to_hash
        end

        class AITag < Imagekit::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Imagekit::Models::AssetListResponseItem::FileDetails::AITag,
                Imagekit::Internal::AnyHash
              )
            end

          # Confidence score of the tag.
          sig { returns(T.nilable(Float)) }
          attr_reader :confidence

          sig { params(confidence: Float).void }
          attr_writer :confidence

          # Name of the tag.
          sig { returns(T.nilable(String)) }
          attr_reader :name

          sig { params(name: String).void }
          attr_writer :name

          # Source of the tag. Possible values are `google-auto-tagging` and
          # `aws-auto-tagging`.
          sig { returns(T.nilable(String)) }
          attr_reader :source

          sig { params(source: String).void }
          attr_writer :source

          sig do
            params(confidence: Float, name: String, source: String).returns(
              T.attached_class
            )
          end
          def self.new(
            # Confidence score of the tag.
            confidence: nil,
            # Name of the tag.
            name: nil,
            # Source of the tag. Possible values are `google-auto-tagging` and
            # `aws-auto-tagging`.
            source: nil
          )
          end

          sig do
            override.returns(
              { confidence: Float, name: String, source: String }
            )
          end
          def to_hash
          end
        end

        class VersionInfo < Imagekit::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Imagekit::Models::AssetListResponseItem::FileDetails::VersionInfo,
                Imagekit::Internal::AnyHash
              )
            end

          # Unique identifier of the file version.
          sig { returns(T.nilable(String)) }
          attr_reader :id

          sig { params(id: String).void }
          attr_writer :id

          # Name of the file version.
          sig { returns(T.nilable(String)) }
          attr_reader :name

          sig { params(name: String).void }
          attr_writer :name

          # An object with details of the file version.
          sig { params(id: String, name: String).returns(T.attached_class) }
          def self.new(
            # Unique identifier of the file version.
            id: nil,
            # Name of the file version.
            name: nil
          )
          end

          sig { override.returns({ id: String, name: String }) }
          def to_hash
          end
        end
      end

      class FolderDetails < Imagekit::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Imagekit::Models::AssetListResponseItem::FolderDetails,
              Imagekit::Internal::AnyHash
            )
          end

        # Date and time when the folder was created. The date and time is in ISO8601
        # format.
        sig { returns(T.nilable(String)) }
        attr_reader :created_at

        sig { params(created_at: String).void }
        attr_writer :created_at

        # Unique identifier of the asset.
        sig { returns(T.nilable(String)) }
        attr_reader :folder_id

        sig { params(folder_id: String).void }
        attr_writer :folder_id

        # Path of the folder. This is the path you would use in the URL to access the
        # folder. For example, if the folder is at the root of the media library, the path
        # will be /folder. If the folder is inside another folder named images, the path
        # will be /images/folder.
        sig { returns(T.nilable(String)) }
        attr_reader :folder_path

        sig { params(folder_path: String).void }
        attr_writer :folder_path

        # Name of the asset.
        sig { returns(T.nilable(String)) }
        attr_reader :name

        sig { params(name: String).void }
        attr_writer :name

        # Type of the asset.
        sig do
          returns(
            T.nilable(
              Imagekit::Models::AssetListResponseItem::FolderDetails::Type::TaggedSymbol
            )
          )
        end
        attr_reader :type

        sig do
          params(
            type:
              Imagekit::Models::AssetListResponseItem::FolderDetails::Type::OrSymbol
          ).void
        end
        attr_writer :type

        # Date and time when the folder was last updated. The date and time is in ISO8601
        # format.
        sig { returns(T.nilable(String)) }
        attr_reader :updated_at

        sig { params(updated_at: String).void }
        attr_writer :updated_at

        sig do
          params(
            created_at: String,
            folder_id: String,
            folder_path: String,
            name: String,
            type:
              Imagekit::Models::AssetListResponseItem::FolderDetails::Type::OrSymbol,
            updated_at: String
          ).returns(T.attached_class)
        end
        def self.new(
          # Date and time when the folder was created. The date and time is in ISO8601
          # format.
          created_at: nil,
          # Unique identifier of the asset.
          folder_id: nil,
          # Path of the folder. This is the path you would use in the URL to access the
          # folder. For example, if the folder is at the root of the media library, the path
          # will be /folder. If the folder is inside another folder named images, the path
          # will be /images/folder.
          folder_path: nil,
          # Name of the asset.
          name: nil,
          # Type of the asset.
          type: nil,
          # Date and time when the folder was last updated. The date and time is in ISO8601
          # format.
          updated_at: nil
        )
        end

        sig do
          override.returns(
            {
              created_at: String,
              folder_id: String,
              folder_path: String,
              name: String,
              type:
                Imagekit::Models::AssetListResponseItem::FolderDetails::Type::TaggedSymbol,
              updated_at: String
            }
          )
        end
        def to_hash
        end

        # Type of the asset.
        module Type
          extend Imagekit::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(
                Symbol,
                Imagekit::Models::AssetListResponseItem::FolderDetails::Type
              )
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          FOLDER =
            T.let(
              :folder,
              Imagekit::Models::AssetListResponseItem::FolderDetails::Type::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                Imagekit::Models::AssetListResponseItem::FolderDetails::Type::TaggedSymbol
              ]
            )
          end
          def self.values
          end
        end
      end

      sig do
        override.returns(
          T::Array[Imagekit::Models::AssetListResponseItem::Variants]
        )
      end
      def self.variants
      end
    end

    AssetListResponse =
      T.let(
        Imagekit::Internal::Type::ArrayOf[
          union: Imagekit::Models::AssetListResponseItem
        ],
        Imagekit::Internal::Type::Converter
      )
  end
end
