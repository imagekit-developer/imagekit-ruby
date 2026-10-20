# frozen_string_literal: true

module Imagekitio
  module Models
    # Triggered when a new video transformation request is accepted for processing.
    # This event confirms that ImageKit has received and queued your transformation
    # request. Use this for debugging and tracking transformation lifecycle.
    module UnsafeUnwrapWebhookEvent
      extend Imagekitio::Internal::Type::Union

      discriminator :type

      # Triggered when a new video transformation request is accepted for processing. This event confirms that ImageKit has received and queued your transformation request. Use this for debugging and tracking transformation lifecycle.
      variant :"video.transformation.accepted", -> { Imagekitio::VideoTransformationAcceptedEvent }

      # Triggered when video encoding is finished and the transformed resource is ready to be served. This is the key event to listen for - update your database or CMS flags when you receive this so your application can start showing the transformed video to users.
      variant :"video.transformation.ready", -> { Imagekitio::VideoTransformationReadyEvent }

      # Triggered when an error occurs during video encoding. Listen to this webhook to log error reasons and debug issues. Check your origin and URL endpoint settings if the reason is related to download failure. For other errors, contact ImageKit support.
      variant :"video.transformation.error", -> { Imagekitio::VideoTransformationErrorEvent }

      # Triggered when a pre-transformation completes successfully. The file has been processed with the requested transformation and is now available in the Media Library.
      variant :"upload.pre-transform.success", -> { Imagekitio::UploadPreTransformSuccessEvent }

      # Triggered when a pre-transformation fails. The file upload may have been accepted, but the requested transformation could not be applied.
      variant :"upload.pre-transform.error", -> { Imagekitio::UploadPreTransformErrorEvent }

      # Triggered when a post-transformation completes successfully. The transformed version of the file is now ready and can be accessed via the provided URL. Note that each post-transformation generates a separate webhook event.
      variant :"upload.post-transform.success", -> { Imagekitio::UploadPostTransformSuccessEvent }

      # Triggered when a post-transformation fails. The original file remains available, but the requested transformation could not be generated.
      variant :"upload.post-transform.error", -> { Imagekitio::UploadPostTransformErrorEvent }

      # Triggered when a file is created.
      variant :"file.created", -> { Imagekitio::FileCreateEvent }

      # Triggered when a file is updated.
      variant :"file.updated", -> { Imagekitio::FileUpdateEvent }

      # Triggered when a file is deleted.
      variant :"file.deleted", -> { Imagekitio::FileDeleteEvent }

      # Triggered when a file version is created.
      variant :"file-version.created", -> { Imagekitio::FileVersionCreateEvent }

      # Triggered when a file version is deleted.
      variant :"file-version.deleted", -> { Imagekitio::FileVersionDeleteEvent }

      # Triggered when a folder is created, whether explicitly, by copying or moving a folder, or implicitly when an upload creates missing parent folders. Copying or moving a folder tree sends one event per folder in the tree.
      variant :"folder.created", -> { Imagekitio::FolderCreateEvent }

      # Triggered when a folder is updated, for example when its custom metadata changes or it is renamed. Renaming a folder sends one event per folder in the tree, each with its new `folderPath`.
      variant :"folder.updated", -> { Imagekitio::FolderUpdateEvent }

      # Triggered when a folder is deleted. Deleting a folder tree sends one event per folder in the tree; the files inside it send `file.deleted` events and their versions send `file-version.deleted` events. Moving a folder sends this event for the old `folderId` and `folder.created` for the new one.
      variant :"folder.deleted", -> { Imagekitio::FolderDeleteEvent }

      # @!method self.variants
      #   @return [Array(Imagekitio::Models::VideoTransformationAcceptedEvent, Imagekitio::Models::VideoTransformationReadyEvent, Imagekitio::Models::VideoTransformationErrorEvent, Imagekitio::Models::UploadPreTransformSuccessEvent, Imagekitio::Models::UploadPreTransformErrorEvent, Imagekitio::Models::UploadPostTransformSuccessEvent, Imagekitio::Models::UploadPostTransformErrorEvent, Imagekitio::Models::FileCreateEvent, Imagekitio::Models::FileUpdateEvent, Imagekitio::Models::FileDeleteEvent, Imagekitio::Models::FileVersionCreateEvent, Imagekitio::Models::FileVersionDeleteEvent, Imagekitio::Models::FolderCreateEvent, Imagekitio::Models::FolderUpdateEvent, Imagekitio::Models::FolderDeleteEvent)]
    end
  end
end
