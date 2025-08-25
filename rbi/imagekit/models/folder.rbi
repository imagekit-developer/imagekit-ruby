# typed: strong

module Imagekit
  module Models
    class Folder < Imagekit::Internal::Type::BaseModel
      OrHash =
        T.type_alias { T.any(Imagekit::Folder, Imagekit::Internal::AnyHash) }

      # Date and time when the folder was created. The date and time is in ISO8601
      # format.
      sig { returns(T.nilable(Time)) }
      attr_reader :created_at

      sig { params(created_at: Time).void }
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
      sig { returns(T.nilable(Imagekit::Folder::Type::TaggedSymbol)) }
      attr_reader :type

      sig { params(type: Imagekit::Folder::Type::OrSymbol).void }
      attr_writer :type

      # Date and time when the folder was last updated. The date and time is in ISO8601
      # format.
      sig { returns(T.nilable(Time)) }
      attr_reader :updated_at

      sig { params(updated_at: Time).void }
      attr_writer :updated_at

      sig do
        params(
          created_at: Time,
          folder_id: String,
          folder_path: String,
          name: String,
          type: Imagekit::Folder::Type::OrSymbol,
          updated_at: Time
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
            created_at: Time,
            folder_id: String,
            folder_path: String,
            name: String,
            type: Imagekit::Folder::Type::TaggedSymbol,
            updated_at: Time
          }
        )
      end
      def to_hash
      end

      # Type of the asset.
      module Type
        extend Imagekit::Internal::Type::Enum

        TaggedSymbol = T.type_alias { T.all(Symbol, Imagekit::Folder::Type) }
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        FOLDER = T.let(:folder, Imagekit::Folder::Type::TaggedSymbol)

        sig { override.returns(T::Array[Imagekit::Folder::Type::TaggedSymbol]) }
        def self.values
        end
      end
    end
  end
end
