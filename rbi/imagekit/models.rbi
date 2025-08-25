# typed: strong

module Imagekit
  Accounts = Imagekit::Models::Accounts

  AssetListParams = Imagekit::Models::AssetListParams

  AsyncBulkJobResponse =
    T.let(
      Imagekit::Models::AsyncBulkJobResponse,
      Imagekit::Internal::Type::Converter
    )

  Beta = Imagekit::Models::Beta

  Cache = Imagekit::Models::Cache

  CustomMetadataField = Imagekit::Models::CustomMetadataField

  CustomMetadataFieldCreateParams =
    Imagekit::Models::CustomMetadataFieldCreateParams

  CustomMetadataFieldDeleteParams =
    Imagekit::Models::CustomMetadataFieldDeleteParams

  CustomMetadataFieldListParams =
    Imagekit::Models::CustomMetadataFieldListParams

  CustomMetadataFieldUpdateParams =
    Imagekit::Models::CustomMetadataFieldUpdateParams

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

  VideoTransformationAcceptedWebhookEvent =
    Imagekit::Models::VideoTransformationAcceptedWebhookEvent

  VideoTransformationErrorWebhookEvent =
    Imagekit::Models::VideoTransformationErrorWebhookEvent

  VideoTransformationReadyWebhookEvent =
    Imagekit::Models::VideoTransformationReadyWebhookEvent

  WebhookUnsafeUnwrapParams = Imagekit::Models::WebhookUnsafeUnwrapParams

  WebhookUnwrapParams = Imagekit::Models::WebhookUnwrapParams
end
