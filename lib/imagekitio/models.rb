# frozen_string_literal: true

module Imagekitio
  [Imagekitio::Internal::Type::BaseModel, *Imagekitio::Internal::Type::BaseModel.subclasses].each do |cls|
    cls.define_sorbet_constant!(:OrHash) { T.type_alias { T.any(cls, Imagekitio::Internal::AnyHash) } }
  end

  Imagekitio::Internal::Util.walk_namespaces(Imagekitio::Models).each do |mod|
    case mod
    in Imagekitio::Internal::Type::Enum | Imagekitio::Internal::Type::Union
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

  Imagekitio::Internal::Util.walk_namespaces(Imagekitio::Models)
                            .lazy
                            .grep(Imagekitio::Internal::Type::Union)
                            .each do |mod|
    const = :Variants
    next if mod.sorbet_constant_defined?(const)

    mod.define_sorbet_constant!(const) { T.type_alias { mod.to_sorbet_type } }
  end

  Accounts = Imagekitio::Models::Accounts

  AssetListParams = Imagekitio::Models::AssetListParams

  BaseOverlay = Imagekitio::Models::BaseOverlay

  BaseWebhookEvent = Imagekitio::Models::BaseWebhookEvent

  Beta = Imagekitio::Models::Beta

  Cache = Imagekitio::Models::Cache

  CustomMetadataField = Imagekitio::Models::CustomMetadataField

  CustomMetadataFieldCreateParams = Imagekitio::Models::CustomMetadataFieldCreateParams

  CustomMetadataFieldDeleteParams = Imagekitio::Models::CustomMetadataFieldDeleteParams

  CustomMetadataFieldListParams = Imagekitio::Models::CustomMetadataFieldListParams

  CustomMetadataFieldUpdateParams = Imagekitio::Models::CustomMetadataFieldUpdateParams

  ExtensionConfig = Imagekitio::Models::ExtensionConfig

  ExtensionItem = Imagekitio::Models::ExtensionItem

  # @type [Imagekitio::Internal::Type::Converter]
  Extensions = Imagekitio::Models::Extensions

  File = Imagekitio::Models::File

  FileCopyParams = Imagekitio::Models::FileCopyParams

  FileDeleteParams = Imagekitio::Models::FileDeleteParams

  FileGetParams = Imagekitio::Models::FileGetParams

  FileMoveParams = Imagekitio::Models::FileMoveParams

  FileRenameParams = Imagekitio::Models::FileRenameParams

  Files = Imagekitio::Models::Files

  FileUpdateParams = Imagekitio::Models::FileUpdateParams

  FileUploadParams = Imagekitio::Models::FileUploadParams

  Folder = Imagekitio::Models::Folder

  FolderCopyParams = Imagekitio::Models::FolderCopyParams

  FolderCreateParams = Imagekitio::Models::FolderCreateParams

  FolderDeleteParams = Imagekitio::Models::FolderDeleteParams

  FolderMoveParams = Imagekitio::Models::FolderMoveParams

  FolderRenameParams = Imagekitio::Models::FolderRenameParams

  Folders = Imagekitio::Models::Folders

  GetImageAttributesOptions = Imagekitio::Models::GetImageAttributesOptions

  ImageOverlay = Imagekitio::Models::ImageOverlay

  Metadata = Imagekitio::Models::Metadata

  Overlay = Imagekitio::Models::Overlay

  OverlayPosition = Imagekitio::Models::OverlayPosition

  OverlayTiming = Imagekitio::Models::OverlayTiming

  ResponsiveImageAttributes = Imagekitio::Models::ResponsiveImageAttributes

  SavedExtension = Imagekitio::Models::SavedExtension

  SavedExtensionCreateParams = Imagekitio::Models::SavedExtensionCreateParams

  SavedExtensionDeleteParams = Imagekitio::Models::SavedExtensionDeleteParams

  SavedExtensionGetParams = Imagekitio::Models::SavedExtensionGetParams

  SavedExtensionListParams = Imagekitio::Models::SavedExtensionListParams

  SavedExtensionUpdateParams = Imagekitio::Models::SavedExtensionUpdateParams

  SolidColorOverlay = Imagekitio::Models::SolidColorOverlay

  SolidColorOverlayTransformation = Imagekitio::Models::SolidColorOverlayTransformation

  SrcOptions = Imagekitio::Models::SrcOptions

  StreamingResolution = Imagekitio::Models::StreamingResolution

  SubtitleOverlay = Imagekitio::Models::SubtitleOverlay

  SubtitleOverlayTransformation = Imagekitio::Models::SubtitleOverlayTransformation

  TextOverlay = Imagekitio::Models::TextOverlay

  TextOverlayTransformation = Imagekitio::Models::TextOverlayTransformation

  Transformation = Imagekitio::Models::Transformation

  TransformationPosition = Imagekitio::Models::TransformationPosition

  UnsafeUnwrapWebhookEvent = Imagekitio::Models::UnsafeUnwrapWebhookEvent

  UnwrapWebhookEvent = Imagekitio::Models::UnwrapWebhookEvent

  UpdateFileRequest = Imagekitio::Models::UpdateFileRequest

  UploadPostTransformErrorEvent = Imagekitio::Models::UploadPostTransformErrorEvent

  UploadPostTransformSuccessEvent = Imagekitio::Models::UploadPostTransformSuccessEvent

  UploadPreTransformErrorEvent = Imagekitio::Models::UploadPreTransformErrorEvent

  UploadPreTransformSuccessEvent = Imagekitio::Models::UploadPreTransformSuccessEvent

  VideoOverlay = Imagekitio::Models::VideoOverlay

  VideoTransformationAcceptedEvent = Imagekitio::Models::VideoTransformationAcceptedEvent

  VideoTransformationErrorEvent = Imagekitio::Models::VideoTransformationErrorEvent

  VideoTransformationReadyEvent = Imagekitio::Models::VideoTransformationReadyEvent

  WebhookUnsafeUnwrapParams = Imagekitio::Models::WebhookUnsafeUnwrapParams

  WebhookUnwrapParams = Imagekitio::Models::WebhookUnwrapParams
end
