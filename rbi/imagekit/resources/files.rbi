# typed: strong

module Imagekit
  module Resources
    class Files
      sig { returns(Imagekit::Resources::Files::Bulk) }
      attr_reader :bulk

      sig { returns(Imagekit::Resources::Files::Versions) }
      attr_reader :versions

      sig { returns(Imagekit::Resources::Files::Metadata) }
      attr_reader :metadata

      # This API updates the details or attributes of the current version of the file.
      # You can update `tags`, `customCoordinates`, `customMetadata`, publication
      # status, remove existing `AITags` and apply extensions using this API.
      sig do
        params(
          file_id: String,
          update:
            T.any(
              Imagekit::FileUpdateParams::Update::UpdateFileDetails::OrHash,
              Imagekit::FileUpdateParams::Update::ChangePublicationStatus::OrHash
            ),
          request_options: Imagekit::RequestOptions::OrHash
        ).returns(Imagekit::Models::FileUpdateResponse)
      end
      def update(
        # The unique `fileId` of the uploaded file. `fileId` is returned in list and
        # search assets API and upload API.
        file_id,
        update: nil,
        request_options: {}
      )
      end

      # This API deletes the file and all its file versions permanently.
      #
      # Note: If a file or specific transformation has been requested in the past, then
      # the response is cached. Deleting a file does not purge the cache. You can purge
      # the cache using purge cache API.
      sig do
        params(
          file_id: String,
          request_options: Imagekit::RequestOptions::OrHash
        ).void
      end
      def delete(
        # The unique `fileId` of the uploaded file. `fileId` is returned in list and
        # search assets API and upload API.
        file_id,
        request_options: {}
      )
      end

      # This will copy a file from one folder to another.
      #
      # Note: If any file at the destination has the same name as the source file, then
      # the source file and its versions (if `includeFileVersions` is set to true) will
      # be appended to the destination file version history.
      sig do
        params(
          destination_path: String,
          source_file_path: String,
          include_file_versions: T::Boolean,
          request_options: Imagekit::RequestOptions::OrHash
        ).returns(Imagekit::Models::FileCopyResponse)
      end
      def copy(
        # Full path to the folder you want to copy the above file into.
        destination_path:,
        # The full path of the file you want to copy.
        source_file_path:,
        # Option to copy all versions of a file. By default, only the current version of
        # the file is copied. When set to true, all versions of the file will be copied.
        # Default value - `false`.
        include_file_versions: nil,
        request_options: {}
      )
      end

      # This API returns an object with details or attributes about the current version
      # of the file.
      sig do
        params(
          file_id: String,
          request_options: Imagekit::RequestOptions::OrHash
        ).returns(Imagekit::File)
      end
      def get(
        # The unique `fileId` of the uploaded file. `fileId` is returned in the list and
        # search assets API and upload API.
        file_id,
        request_options: {}
      )
      end

      # This will move a file and all its versions from one folder to another.
      #
      # Note: If any file at the destination has the same name as the source file, then
      # the source file and its versions will be appended to the destination file.
      sig do
        params(
          destination_path: String,
          source_file_path: String,
          request_options: Imagekit::RequestOptions::OrHash
        ).returns(Imagekit::Models::FileMoveResponse)
      end
      def move(
        # Full path to the folder you want to move the above file into.
        destination_path:,
        # The full path of the file you want to move.
        source_file_path:,
        request_options: {}
      )
      end

      # You can rename an already existing file in the media library using rename file
      # API. This operation would rename all file versions of the file.
      #
      # Note: The old URLs will stop working. The file/file version URLs cached on CDN
      # will continue to work unless a purge is requested.
      sig do
        params(
          file_path: String,
          new_file_name: String,
          purge_cache: T::Boolean,
          request_options: Imagekit::RequestOptions::OrHash
        ).returns(Imagekit::Models::FileRenameResponse)
      end
      def rename(
        # The full path of the file you want to rename.
        file_path:,
        # The new name of the file. A filename can contain:
        #
        # Alphanumeric Characters: `a-z`, `A-Z`, `0-9` (including Unicode letters, marks,
        # and numerals in other languages). Special Characters: `.`, `_`, and `-`.
        #
        # Any other character, including space, will be replaced by `_`.
        new_file_name:,
        # Option to purge cache for the old file and its versions' URLs.
        #
        # When set to true, it will internally issue a purge cache request on CDN to
        # remove cached content of old file and its versions. This purge request is
        # counted against your monthly purge quota.
        #
        # Note: If the old file were accessible at
        # `https://ik.imagekit.io/demo/old-filename.jpg`, a purge cache request would be
        # issued against `https://ik.imagekit.io/demo/old-filename.jpg*` (with a wildcard
        # at the end). It will remove the file and its versions' URLs and any
        # transformations made using query parameters on this file or its versions.
        # However, the cache for file transformations made using path parameters will
        # persist. You can purge them using the purge API. For more details, refer to the
        # purge API documentation.
        #
        # Default value - `false`
        purge_cache: nil,
        request_options: {}
      )
      end

      # ImageKit.io allows you to upload files directly from both the server and client
      # sides. For server-side uploads, private API key authentication is used. For
      # client-side uploads, generate a one-time `token`, `signature`, and `expire` from
      # your secure backend using private API.
      # [Learn more](/docs/api-reference/upload-file/upload-file#how-to-implement-client-side-file-upload)
      # about how to implement client-side file upload.
      #
      # The [V2 API](/docs/api-reference/upload-file/upload-file-v2) enhances security
      # by verifying the entire payload using JWT.
      #
      # **File size limit** \
      # On the free plan, the maximum upload file sizes are 20MB for images, audio, and raw
      # files and 100MB for videos. On the paid plan, these limits increase to 40MB for images,
      # audio, and raw files and 2GB for videos. These limits can be further increased with
      # higher-tier plans.
      #
      # **Version limit** \
      # A file can have a maximum of 100 versions.
      #
      # **Demo applications**
      #
      # - A full-fledged
      #   [upload widget using Uppy](https://github.com/imagekit-samples/uppy-uploader),
      #   supporting file selections from local storage, URL, Dropbox, Google Drive,
      #   Instagram, and more.
      # - [Quick start guides](/docs/quick-start-guides) for various frameworks and
      #   technologies.
      sig do
        params(
          file: String,
          file_name: String,
          token: String,
          checks: String,
          custom_coordinates: String,
          custom_metadata: T::Hash[Symbol, T.anything],
          description: String,
          expire: Integer,
          extensions:
            T::Array[
              T.any(
                Imagekit::FileUploadParams::Extension::RemoveBg::OrHash,
                Imagekit::FileUploadParams::Extension::AIAutoDescription::OrHash,
                Imagekit::FileUploadParams::Extension::AutoTaggingExtension::OrHash
              )
            ],
          folder: String,
          is_private_file: T::Boolean,
          is_published: T::Boolean,
          overwrite_ai_tags: T::Boolean,
          overwrite_custom_metadata: T::Boolean,
          overwrite_file: T::Boolean,
          overwrite_tags: T::Boolean,
          public_key: String,
          response_fields:
            T::Array[Imagekit::FileUploadParams::ResponseField::OrSymbol],
          signature: String,
          tags: T::Array[String],
          transformation: Imagekit::FileUploadParams::Transformation::OrHash,
          use_unique_file_name: T::Boolean,
          webhook_url: String,
          request_options: Imagekit::RequestOptions::OrHash
        ).returns(Imagekit::Models::FileUploadResponse)
      end
      def upload(
        # The API accepts any of the following:
        #
        # - **Binary data** – send the raw bytes as `multipart/form-data`.
        # - **HTTP / HTTPS URL** – a publicly reachable URL that ImageKit’s servers can
        #   fetch.
        # - **Base64 string** – the file encoded as a Base64 data URI or plain Base64.
        #
        # When supplying a URL, the server must receive the response headers within 8
        # seconds; otherwise the request fails with 400 Bad Request.
        file:,
        # The name with which the file has to be uploaded. The file name can contain:
        #
        # - Alphanumeric Characters: `a-z`, `A-Z`, `0-9`.
        # - Special Characters: `.`, `-`
        #
        # Any other character including space will be replaced by `_`
        file_name:,
        # A unique value that the ImageKit.io server will use to recognize and prevent
        # subsequent retries for the same request. We suggest using V4 UUIDs, or another
        # random string with enough entropy to avoid collisions. This field is only
        # required for authentication when uploading a file from the client side.
        #
        # **Note**: Sending a value that has been used in the past will result in a
        # validation error. Even if your previous request resulted in an error, you should
        # always send a new value for this field.
        token: nil,
        # Server-side checks to run on the asset. Read more about
        # [Upload API checks](/docs/api-reference/upload-file/upload-file#upload-api-checks).
        checks: nil,
        # Define an important area in the image. This is only relevant for image type
        # files.
        #
        # - To be passed as a string with the x and y coordinates of the top-left corner,
        #   and width and height of the area of interest in the format `x,y,width,height`.
        #   For example - `10,10,100,100`
        # - Can be used with fo-customtransformation.
        # - If this field is not specified and the file is overwritten, then
        #   customCoordinates will be removed.
        custom_coordinates: nil,
        # JSON key-value pairs to associate with the asset. Create the custom metadata
        # fields before setting these values.
        custom_metadata: nil,
        # Optional text to describe the contents of the file.
        description: nil,
        # The time until your signature is valid. It must be a
        # [Unix time](https://en.wikipedia.org/wiki/Unix_time) in less than 1 hour into
        # the future. It should be in seconds. This field is only required for
        # authentication when uploading a file from the client side.
        expire: nil,
        # Array of extensions to be applied to the image. Each extension can be configured
        # with specific parameters based on the extension type.
        extensions: nil,
        # The folder path in which the image has to be uploaded. If the folder(s) didn't
        # exist before, a new folder(s) is created.
        #
        # The folder name can contain:
        #
        # - Alphanumeric Characters: `a-z` , `A-Z` , `0-9`
        # - Special Characters: `/` , `_` , `-`
        #
        # Using multiple `/` creates a nested folder.
        folder: nil,
        # Whether to mark the file as private or not.
        #
        # If `true`, the file is marked as private and is accessible only using named
        # transformation or signed URL.
        is_private_file: nil,
        # Whether to upload file as published or not.
        #
        # If `false`, the file is marked as unpublished, which restricts access to the
        # file only via the media library. Files in draft or unpublished state can only be
        # publicly accessed after being published.
        #
        # The option to upload in draft state is only available in custom enterprise
        # pricing plans.
        is_published: nil,
        # If set to `true` and a file already exists at the exact location, its AITags
        # will be removed. Set `overwriteAITags` to `false` to preserve AITags.
        overwrite_ai_tags: nil,
        # If the request does not have `customMetadata`, and a file already exists at the
        # exact location, existing customMetadata will be removed.
        overwrite_custom_metadata: nil,
        # If `false` and `useUniqueFileName` is also `false`, and a file already exists at
        # the exact location, upload API will return an error immediately.
        overwrite_file: nil,
        # If the request does not have `tags`, and a file already exists at the exact
        # location, existing tags will be removed.
        overwrite_tags: nil,
        # Your ImageKit.io public key. This field is only required for authentication when
        # uploading a file from the client side.
        public_key: nil,
        # Array of response field keys to include in the API response body.
        response_fields: nil,
        # HMAC-SHA1 digest of the token+expire using your ImageKit.io private API key as a
        # key. Learn how to create a signature on the page below. This should be in
        # lowercase.
        #
        # Signature must be calculated on the server-side. This field is only required for
        # authentication when uploading a file from the client side.
        signature: nil,
        # Set the tags while uploading the file. Provide an array of tag strings (e.g.
        # `["tag1", "tag2", "tag3"]`). The combined length of all tag characters must not
        # exceed 500, and the `%` character is not allowed. If this field is not specified
        # and the file is overwritten, the existing tags will be removed.
        tags: nil,
        # Configure pre-processing (`pre`) and post-processing (`post`) transformations.
        #
        # - `pre` — applied before the file is uploaded to the Media Library.
        #   Useful for reducing file size or applying basic optimizations upfront (e.g.,
        #   resize, compress).
        #
        # - `post` — applied immediately after upload.
        #   Ideal for generating transformed versions (like video encodes or thumbnails)
        #   in advance, so they're ready for delivery without delay.
        #
        # You can mix and match any combination of post-processing types.
        transformation: nil,
        # Whether to use a unique filename for this file or not.
        #
        # If `true`, ImageKit.io will add a unique suffix to the filename parameter to get
        # a unique filename.
        #
        # If `false`, then the image is uploaded with the provided filename parameter, and
        # any existing file with the same name is replaced.
        use_unique_file_name: nil,
        # The final status of extensions after they have completed execution will be
        # delivered to this endpoint as a POST request.
        # [Learn more](/docs/api-reference/digital-asset-management-dam/managing-assets/update-file-details#webhook-payload-structure)
        # about the webhook payload structure.
        webhook_url: nil,
        request_options: {}
      )
      end

      # @api private
      sig { params(client: Imagekit::Client).returns(T.attached_class) }
      def self.new(client:)
      end
    end
  end
end
