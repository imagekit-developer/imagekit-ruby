# typed: strong

module Imagekit
  module Resources
    class Files
      sig { returns(Imagekit::Resources::Files::Details) }
      attr_reader :details

      sig { returns(Imagekit::Resources::Files::Batch) }
      attr_reader :batch

      sig { returns(Imagekit::Resources::Files::Versions) }
      attr_reader :versions

      sig { returns(Imagekit::Resources::Files::Purge) }
      attr_reader :purge

      sig { returns(Imagekit::Resources::Files::Metadata) }
      attr_reader :metadata

      # This API can list all the uploaded files and folders in your ImageKit.io media
      # library. In addition, you can fine-tune your query by specifying various filters
      # by generating a query string in a Lucene-like syntax and provide this generated
      # string as the value of the `searchQuery`.
      sig do
        params(
          file_type: String,
          limit: String,
          path: String,
          search_query: String,
          skip: String,
          sort: String,
          type: Imagekit::FileListParams::Type::OrSymbol,
          request_options: Imagekit::RequestOptions::OrHash
        ).returns(T::Array[Imagekit::Models::FileListResponseItem])
      end
      def list(
        # Type of files to include in the result set. Accepts three values:
        #
        # `all` - include all types of files in the result set. `image` - only search in
        # image type files. `non-image` - only search in files that are not images, e.g.,
        # JS or CSS or video files.
        #
        # Default value - `all`
        file_type: nil,
        # The maximum number of results to return in response:
        #
        # Minimum value - 1
        #
        # Maximum value - 1000
        #
        # Default value - 1000
        limit: nil,
        # Folder path if you want to limit the search within a specific folder. For
        # example, `/sales-banner/` will only search in folder sales-banner.
        path: nil,
        # Query string in a Lucene-like query language e.g. `createdAt > "7d"`.
        #
        # Note : When the searchQuery parameter is present, the following query parameters
        # will have no effect on the result:
        #
        # 1. `tags`
        # 2. `type`
        # 3. `name`
        #
        # [Learn more](/docs/api-reference/digital-asset-management-dam/list-and-search-assets#advanced-search-queries)
        # from examples.
        search_query: nil,
        # The number of results to skip before returning results:
        #
        # Minimum value - 0
        #
        # Default value - 0
        skip: nil,
        # You can sort based on the following fields:
        #
        # 1. name - `ASC_NAME` or `DESC_NAME`
        # 2. createdAt - `ASC_CREATED` or `DESC_CREATED`
        # 3. updatedAt - `ASC_UPDATED` or `DESC_UPDATED`
        # 4. height - `ASC_HEIGHT` or `DESC_HEIGHT`
        # 5. width - `ASC_WIDTH` or `DESC_WIDTH`
        # 6. size - `ASC_SIZE` or `DESC_SIZE`
        #
        # Default value - `ASC_CREATED`
        sort: nil,
        # Limit search to one of `file`, `file-version`, or `folder`. Pass `all` to
        # include `files` and `folders` in search results (`file-version` will not be
        # included in this case).
        #
        # Default value - `file`
        type: nil,
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

      # This API adds tags to multiple files in bulk. A maximum of 50 files can be
      # specified at a time.
      sig do
        params(
          file_ids: T::Array[String],
          tags: T::Array[String],
          request_options: Imagekit::RequestOptions::OrHash
        ).returns(Imagekit::Models::FileAddTagsResponse)
      end
      def add_tags(
        # An array of fileIds to which you want to add tags.
        file_ids:,
        # An array of tags that you want to add to the files.
        tags:,
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
        ).returns(T.anything)
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

      # This will move a file and all its versions from one folder to another.
      #
      # Note: If any file at the destination has the same name as the source file, then
      # the source file and its versions will be appended to the destination file.
      sig do
        params(
          destination_path: String,
          source_file_path: String,
          request_options: Imagekit::RequestOptions::OrHash
        ).returns(T.anything)
      end
      def move(
        # Full path to the folder you want to move the above file into.
        destination_path:,
        # The full path of the file you want to move.
        source_file_path:,
        request_options: {}
      )
      end

      # This API removes AITags from multiple files in bulk. A maximum of 50 files can
      # be specified at a time.
      sig do
        params(
          ai_tags: T::Array[String],
          file_ids: T::Array[String],
          request_options: Imagekit::RequestOptions::OrHash
        ).returns(Imagekit::Models::FileRemoveAITagsResponse)
      end
      def remove_ai_tags(
        # An array of AITags that you want to remove from the files.
        ai_tags:,
        # An array of fileIds from which you want to remove AITags.
        file_ids:,
        request_options: {}
      )
      end

      # This API removes tags from multiple files in bulk. A maximum of 50 files can be
      # specified at a time.
      sig do
        params(
          file_ids: T::Array[String],
          tags: T::Array[String],
          request_options: Imagekit::RequestOptions::OrHash
        ).returns(Imagekit::Models::FileRemoveTagsResponse)
      end
      def remove_tags(
        # An array of fileIds from which you want to remove tags.
        file_ids:,
        # An array of tags that you want to remove from the files.
        tags:,
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
      # client-side uploads, generate a one-time `token`, `signature`, and `expiration`
      # from your secure backend using private API.
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
          custom_metadata: String,
          expire: String,
          extensions: String,
          folder: String,
          is_private_file:
            Imagekit::FileUploadV1Params::IsPrivateFile::OrSymbol,
          is_published: Imagekit::FileUploadV1Params::IsPublished::OrSymbol,
          overwrite_ai_tags:
            Imagekit::FileUploadV1Params::OverwriteAITags::OrSymbol,
          overwrite_custom_metadata:
            Imagekit::FileUploadV1Params::OverwriteCustomMetadata::OrSymbol,
          overwrite_file: String,
          overwrite_tags: Imagekit::FileUploadV1Params::OverwriteTags::OrSymbol,
          public_key: String,
          response_fields: String,
          signature: String,
          tags: String,
          transformation: String,
          use_unique_file_name:
            Imagekit::FileUploadV1Params::UseUniqueFileName::OrSymbol,
          webhook_url: String,
          request_options: Imagekit::RequestOptions::OrHash
        ).returns(Imagekit::Models::FileUploadV1Response)
      end
      def upload_v1(
        # Pass the HTTP URL or base64 string. When passing a URL in the file parameter,
        # please ensure that our servers can access the URL. In case ImageKit is unable to
        # download the file from the specified URL, a `400` error response is returned.
        # This will also result in a `400` error if the file download request is aborted
        # if response headers are not received in 8 seconds.
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
        # Stringified JSON key-value data to be associated with the asset.
        custom_metadata: nil,
        # The time until your signature is valid. It must be a
        # [Unix time](https://en.wikipedia.org/wiki/Unix_time) in less than 1 hour into
        # the future. It should be in seconds. This field is only required for
        # authentication when uploading a file from the client side.
        expire: nil,
        # Stringified JSON object with an array of extensions to be applied to the image.
        # Refer to extensions schema in
        # [update file API request body](/docs/api-reference/digital-asset-management-dam/managing-assets/update-file-details#request-body).
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
        # Comma-separated values of the fields that you want the API to return in the
        # response.
        #
        # For example, set the value of this field to
        # `tags,customCoordinates,isPrivateFile` to get the value of `tags`,
        # `customCoordinates`, and `isPrivateFile` in the response.
        #
        # Accepts combination of `tags`, `customCoordinates`, `isPrivateFile`,
        # `embeddedMetadata`, `isPublished`, `customMetadata`, and `metadata`.
        response_fields: nil,
        # HMAC-SHA1 digest of the token+expire using your ImageKit.io private API key as a
        # key. Learn how to create a signature on the page below. This should be in
        # lowercase.
        #
        # Signature must be calculated on the server-side. This field is only required for
        # authentication when uploading a file from the client side.
        signature: nil,
        # Set the tags while uploading the file.
        #
        # Comma-separated value of tags in the format `tag1,tag2,tag3`. The maximum length
        # of all characters should not exceed 500. `%` is not allowed.
        #
        # If this field is not specified and the file is overwritten then the tags will be
        # removed.
        tags: nil,
        # Stringified JSON object with properties for pre and post transformations:
        #
        # `pre` - Accepts a "string" containing a valid transformation used for requesting
        # a pre-transformation for an image or a video file.
        #
        # `post` - Accepts an array of objects with properties:
        #
        # - `type`: One of `transformation`, `gif-to-video`, `thumbnail`, or `abs`
        #   (Adaptive bitrate streaming).
        # - `value`: A "string" corresponding to the required transformation. Required if
        #   `type` is `transformation` or `abs`. Optional if `type` is `gif-to-video` or
        #   `thumbnail`.
        # - `protocol`: Either `hls` or `dash`, applicable only if `type` is `abs`.
        #
        # Read more about
        # [Adaptive bitrate streaming (ABS)](/docs/adaptive-bitrate-streaming).
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

      # The V2 API enhances security by verifying the entire payload using JWT. This API
      # is in beta.
      #
      # ImageKit.io allows you to upload files directly from both the server and client
      # sides. For server-side uploads, private API key authentication is used. For
      # client-side uploads, generate a one-time `token` from your secure backend using
      # private API.
      # [Learn more](/docs/api-reference/upload-file/upload-file-v2#how-to-implement-secure-client-side-file-upload)
      # about how to implement secure client-side file upload.
      #
      # **File size limit** \
      # On the free plan, the maximum upload file sizes are 20MB for images, audio, and raw
      # files, and 100MB for videos. On the paid plan, these limits increase to 40MB for
      # images, audio, and raw files, and 2GB for videos. These limits can be further increased
      # with higher-tier plans.
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
          custom_metadata: String,
          extensions: String,
          folder: String,
          is_private_file:
            Imagekit::FileUploadV2Params::IsPrivateFile::OrSymbol,
          is_published: Imagekit::FileUploadV2Params::IsPublished::OrSymbol,
          overwrite_ai_tags:
            Imagekit::FileUploadV2Params::OverwriteAITags::OrSymbol,
          overwrite_custom_metadata:
            Imagekit::FileUploadV2Params::OverwriteCustomMetadata::OrSymbol,
          overwrite_file: String,
          overwrite_tags: Imagekit::FileUploadV2Params::OverwriteTags::OrSymbol,
          response_fields: String,
          tags: String,
          transformation: String,
          use_unique_file_name:
            Imagekit::FileUploadV2Params::UseUniqueFileName::OrSymbol,
          webhook_url: String,
          request_options: Imagekit::RequestOptions::OrHash
        ).returns(Imagekit::Models::FileUploadV2Response)
      end
      def upload_v2(
        # Pass the HTTP URL or base64 string. When passing a URL in the file parameter,
        # please ensure that our servers can access the URL. In case ImageKit is unable to
        # download the file from the specified URL, a `400` error response is returned.
        # This will also result in a `400` error if the file download request is aborted
        # if response headers are not received in 8 seconds.
        file:,
        # The name with which the file has to be uploaded.
        file_name:,
        # This is the client-generated JSON Web Token (JWT). The ImageKit.io server uses
        # it to authenticate and check that the upload request parameters have not been
        # tampered with after the token has been generated. Learn how to create the token
        # on the page below. This field is only required for authentication when uploading
        # a file from the client side.
        #
        # **Note**: Sending a JWT that has been used in the past will result in a
        # validation error. Even if your previous request resulted in an error, you should
        # always send a new token.
        #
        # **⚠️Warning**: JWT must be generated on the server-side because it is generated
        # using your account's private API key. This field is required for authentication
        # when uploading a file from the client-side.
        token: nil,
        # Server-side checks to run on the asset. Read more about
        # [Upload API checks](/docs/api-reference/upload-file/upload-file-v2#upload-api-checks).
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
        # Stringified JSON key-value data to be associated with the asset.
        custom_metadata: nil,
        # Stringified JSON object with an array of extensions to be applied to the image.
        # Refer to extensions schema in
        # [update file API request body](/docs/api-reference/digital-asset-management-dam/managing-assets/update-file-details#request-body).
        extensions: nil,
        # The folder path in which the image has to be uploaded. If the folder(s) didn't
        # exist before, a new folder(s) is created. Using multiple `/` creates a nested
        # folder.
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
        # Comma-separated values of the fields that you want the API to return in the
        # response.
        #
        # For example, set the value of this field to
        # `tags,customCoordinates,isPrivateFile` to get the value of `tags`,
        # `customCoordinates`, and `isPrivateFile` in the response.
        #
        # Accepts combination of `tags`, `customCoordinates`, `isPrivateFile`,
        # `embeddedMetadata`, `isPublished`, `customMetadata`, and `metadata`.
        response_fields: nil,
        # Set the tags while uploading the file.
        #
        # Comma-separated value of tags in the format `tag1,tag2,tag3`. The maximum length
        # of all characters should not exceed 500. `%` is not allowed.
        #
        # If this field is not specified and the file is overwritten then the tags will be
        # removed.
        tags: nil,
        # Stringified JSON object with properties for pre and post transformations:
        #
        # `pre` - Accepts a "string" containing a valid transformation used for requesting
        # a pre-transformation for an image or a video file.
        #
        # `post` - Accepts an array of objects with properties:
        #
        # - `type`: One of `transformation`, `gif-to-video`, `thumbnail`, or `abs`
        #   (Adaptive bitrate streaming).
        # - `value`: A "string" corresponding to the required transformation. Required if
        #   `type` is `transformation` or `abs`. Optional if `type` is `gif-to-video` or
        #   `thumbnail`.
        # - `protocol`: Either `hls` or `dash`, applicable only if `type` is `abs`.
        #
        # Read more about
        # [Adaptive bitrate streaming (ABS)](/docs/adaptive-bitrate-streaming).
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
