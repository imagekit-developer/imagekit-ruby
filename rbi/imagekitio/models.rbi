# typed: strong

module Imagekitio
  Accounts = Imagekitio::Models::Accounts

  AITag = Imagekitio::Models::AITag

  AssetListParams = Imagekitio::Models::AssetListParams

  BaseOverlay = Imagekitio::Models::BaseOverlay

  BaseWebhookEvent = Imagekitio::Models::BaseWebhookEvent

  Beta = Imagekitio::Models::Beta

  Cache = Imagekitio::Models::Cache

  CustomMetadata =
    T.let(
      Imagekitio::Models::CustomMetadata,
      Imagekitio::Internal::Type::Converter
    )

  CustomMetadataField = Imagekitio::Models::CustomMetadataField

  CustomMetadataFieldCreateParams =
    Imagekitio::Models::CustomMetadataFieldCreateParams

  CustomMetadataFieldDeleteParams =
    Imagekitio::Models::CustomMetadataFieldDeleteParams

  CustomMetadataFieldListParams =
    Imagekitio::Models::CustomMetadataFieldListParams

  CustomMetadataFieldUpdateParams =
    Imagekitio::Models::CustomMetadataFieldUpdateParams

  EmbeddedMetadata =
    T.let(
      Imagekitio::Models::EmbeddedMetadata,
      Imagekitio::Internal::Type::Converter
    )

  ExtensionConfig = Imagekitio::Models::ExtensionConfig

  ExtensionItem = Imagekitio::Models::ExtensionItem

  Extensions =
    T.let(Imagekitio::Models::Extensions, Imagekitio::Internal::Type::Converter)

  File = Imagekitio::Models::File

  FileCopyParams = Imagekitio::Models::FileCopyParams

  FileCreateEvent = Imagekitio::Models::FileCreateEvent

  FileDeleteEvent = Imagekitio::Models::FileDeleteEvent

  FileDeleteParams = Imagekitio::Models::FileDeleteParams

  FileGetParams = Imagekitio::Models::FileGetParams

  FileMoveParams = Imagekitio::Models::FileMoveParams

  FileRenameParams = Imagekitio::Models::FileRenameParams

  Files = Imagekitio::Models::Files

  FileUpdateEvent = Imagekitio::Models::FileUpdateEvent

  FileUpdateParams = Imagekitio::Models::FileUpdateParams

  FileUploadParams = Imagekitio::Models::FileUploadParams

  FileVersionCreateEvent = Imagekitio::Models::FileVersionCreateEvent

  FileVersionDeleteEvent = Imagekitio::Models::FileVersionDeleteEvent

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

  SelectedFieldsSchema =
    T.let(
      Imagekitio::Models::SelectedFieldsSchema,
      Imagekitio::Internal::Type::Converter
    )

  SelectedFieldsSchemaItem = Imagekitio::Models::SelectedFieldsSchemaItem

  SolidColorOverlay = Imagekitio::Models::SolidColorOverlay

  SolidColorOverlayTransformation =
    Imagekitio::Models::SolidColorOverlayTransformation

  SrcOptions = Imagekitio::Models::SrcOptions

  StreamingResolution = Imagekitio::Models::StreamingResolution

  SubtitleOverlay = Imagekitio::Models::SubtitleOverlay

  SubtitleOverlayTransformation =
    Imagekitio::Models::SubtitleOverlayTransformation

  TextOverlay = Imagekitio::Models::TextOverlay

  TextOverlayTransformation = Imagekitio::Models::TextOverlayTransformation

  Transformation = Imagekitio::Models::Transformation

  TransformationPosition = Imagekitio::Models::TransformationPosition

  UnsafeUnwrapWebhookEvent = Imagekitio::Models::UnsafeUnwrapWebhookEvent

  UnwrapWebhookEvent = Imagekitio::Models::UnwrapWebhookEvent

  UpdateFileRequest = Imagekitio::Models::UpdateFileRequest

  UploadPostTransformErrorEvent =
    Imagekitio::Models::UploadPostTransformErrorEvent

  UploadPostTransformSuccessEvent =
    Imagekitio::Models::UploadPostTransformSuccessEvent

  UploadPreTransformErrorEvent =
    Imagekitio::Models::UploadPreTransformErrorEvent

  UploadPreTransformSuccessEvent =
    Imagekitio::Models::UploadPreTransformSuccessEvent

  VersionInfo = Imagekitio::Models::VersionInfo

  VideoOverlay = Imagekitio::Models::VideoOverlay

  VideoTransformationAcceptedEvent =
    Imagekitio::Models::VideoTransformationAcceptedEvent

  VideoTransformationErrorEvent =
    Imagekitio::Models::VideoTransformationErrorEvent

  VideoTransformationReadyEvent =
    Imagekitio::Models::VideoTransformationReadyEvent

  WebhookUnsafeUnwrapParams = Imagekitio::Models::WebhookUnsafeUnwrapParams

  WebhookUnwrapParams = Imagekitio::Models::WebhookUnwrapParams
end
