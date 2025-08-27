# frozen_string_literal: true

module Imagekit
  [Imagekit::Internal::Type::BaseModel, *Imagekit::Internal::Type::BaseModel.subclasses].each do |cls|
    cls.define_sorbet_constant!(:OrHash) { T.type_alias { T.any(cls, Imagekit::Internal::AnyHash) } }
  end

  Imagekit::Internal::Util.walk_namespaces(Imagekit::Models).each do |mod|
    case mod
    in Imagekit::Internal::Type::Enum | Imagekit::Internal::Type::Union
      mod.constants.each do |name|
        case mod.const_get(name)
        in true | false
          mod.define_sorbet_constant!(:TaggedBoolean) { T.type_alias { T::Boolean } }
          mod.define_sorbet_constant!(:OrBoolean) { T.type_alias { T::Boolean } }
        in Integer
          mod.define_sorbet_constant!(:TaggedInteger) { T.type_alias { Integer } }
          mod.define_sorbet_constant!(:OrInteger) { T.type_alias { Integer } }
        in Float
          mod.define_sorbet_constant!(:TaggedFloat) { T.type_alias { Float } }
          mod.define_sorbet_constant!(:OrFloat) { T.type_alias { Float } }
        in Symbol
          mod.define_sorbet_constant!(:TaggedSymbol) { T.type_alias { Symbol } }
          mod.define_sorbet_constant!(:OrSymbol) { T.type_alias { T.any(Symbol, String) } }
        else
        end
      end
    else
    end
  end

  Imagekit::Internal::Util.walk_namespaces(Imagekit::Models)
                          .lazy
                          .grep(Imagekit::Internal::Type::Union)
                          .each do |mod|
    const = :Variants
    next if mod.sorbet_constant_defined?(const)

    mod.define_sorbet_constant!(const) { T.type_alias { mod.to_sorbet_type } }
  end

  Accounts = Imagekit::Models::Accounts

  AssetListParams = Imagekit::Models::AssetListParams

  Beta = Imagekit::Models::Beta

  Cache = Imagekit::Models::Cache

  CustomMetadataField = Imagekit::Models::CustomMetadataField

  CustomMetadataFieldCreateParams = Imagekit::Models::CustomMetadataFieldCreateParams

  CustomMetadataFieldDeleteParams = Imagekit::Models::CustomMetadataFieldDeleteParams

  CustomMetadataFieldListParams = Imagekit::Models::CustomMetadataFieldListParams

  CustomMetadataFieldUpdateParams = Imagekit::Models::CustomMetadataFieldUpdateParams

  File = Imagekit::Models::File

  FileCopyParams = Imagekit::Models::FileCopyParams

  FileDeleteParams = Imagekit::Models::FileDeleteParams

  FileGetParams = Imagekit::Models::FileGetParams

  FileMoveParams = Imagekit::Models::FileMoveParams

  FileRenameParams = Imagekit::Models::FileRenameParams

  Files = Imagekit::Models::Files

  FileUpdateParams = Imagekit::Models::FileUpdateParams

  FileUploadParams = Imagekit::Models::FileUploadParams

  Folder = Imagekit::Models::Folder

  FolderCopyParams = Imagekit::Models::FolderCopyParams

  FolderCreateParams = Imagekit::Models::FolderCreateParams

  FolderDeleteParams = Imagekit::Models::FolderDeleteParams

  FolderMoveParams = Imagekit::Models::FolderMoveParams

  FolderRenameParams = Imagekit::Models::FolderRenameParams

  Folders = Imagekit::Models::Folders

  Metadata = Imagekit::Models::Metadata

  UnsafeUnwrapWebhookEvent = Imagekit::Models::UnsafeUnwrapWebhookEvent

  UnwrapWebhookEvent = Imagekit::Models::UnwrapWebhookEvent

  VideoTransformationAcceptedEvent = Imagekit::Models::VideoTransformationAcceptedEvent

  VideoTransformationErrorEvent = Imagekit::Models::VideoTransformationErrorEvent

  VideoTransformationReadyEvent = Imagekit::Models::VideoTransformationReadyEvent

  WebhookUnsafeUnwrapParams = Imagekit::Models::WebhookUnsafeUnwrapParams

  WebhookUnwrapParams = Imagekit::Models::WebhookUnwrapParams
end
