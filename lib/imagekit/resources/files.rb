# frozen_string_literal: true

module Imagekit
  module Resources
    class Files
      # @return [Imagekit::Resources::Files::Details]
      attr_reader :details

      # @return [Imagekit::Resources::Files::Batch]
      attr_reader :batch

      # @return [Imagekit::Resources::Files::Versions]
      attr_reader :versions

      # @return [Imagekit::Resources::Files::Purge]
      attr_reader :purge

      # @return [Imagekit::Resources::Files::Metadata]
      attr_reader :metadata

      # Some parameter documentations has been truncated, see
      # {Imagekit::Models::FileListParams} for more details.
      #
      # This API can list all the uploaded files and folders in your ImageKit.io media
      # library. In addition, you can fine-tune your query by specifying various filters
      # by generating a query string in a Lucene-like syntax and provide this generated
      # string as the value of the `searchQuery`.
      #
      # @overload list(file_type: nil, limit: nil, path: nil, search_query: nil, skip: nil, sort: nil, type: nil, request_options: {})
      #
      # @param file_type [String] Type of files to include in the result set. Accepts three values:
      #
      # @param limit [String] The maximum number of results to return in response:
      #
      # @param path [String] Folder path if you want to limit the search within a specific folder. For exampl
      #
      # @param search_query [String] Query string in a Lucene-like query language e.g. `createdAt > "7d"`.
      #
      # @param skip [String] The number of results to skip before returning results:
      #
      # @param sort [String] You can sort based on the following fields:
      #
      # @param type [Symbol, Imagekit::Models::FileListParams::Type] Limit search to one of `file`, `file-version`, or `folder`. Pass `all` to includ
      #
      # @param request_options [Imagekit::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Array<Imagekit::Models::FileListResponseItem>]
      #
      # @see Imagekit::Models::FileListParams
      def list(params = {})
        parsed, options = Imagekit::FileListParams.dump_request(params)
        @client.request(
          method: :get,
          path: "v1/files",
          query: parsed.transform_keys(file_type: "fileType", search_query: "searchQuery"),
          model: Imagekit::Internal::Type::ArrayOf[Imagekit::Models::FileListResponseItem],
          options: options
        )
      end

      # Some parameter documentations has been truncated, see
      # {Imagekit::Models::FileDeleteParams} for more details.
      #
      # This API deletes the file and all its file versions permanently.
      #
      # Note: If a file or specific transformation has been requested in the past, then
      # the response is cached. Deleting a file does not purge the cache. You can purge
      # the cache using purge cache API.
      #
      # @overload delete(file_id, request_options: {})
      #
      # @param file_id [String] The unique `fileId` of the uploaded file. `fileId` is returned in list and searc
      #
      # @param request_options [Imagekit::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [nil]
      #
      # @see Imagekit::Models::FileDeleteParams
      def delete(file_id, params = {})
        @client.request(
          method: :delete,
          path: ["v1/files/%1$s", file_id],
          model: NilClass,
          options: params[:request_options]
        )
      end

      # Some parameter documentations has been truncated, see
      # {Imagekit::Models::FileAddTagsParams} for more details.
      #
      # This API adds tags to multiple files in bulk. A maximum of 50 files can be
      # specified at a time.
      #
      # @overload add_tags(file_ids:, tags:, request_options: {})
      #
      # @param file_ids [Array<String>] An array of fileIds to which you want to add tags.
      #
      # @param tags [Array<String>] An array of tags that you want to add to the files.
      #
      # @param request_options [Imagekit::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Imagekit::Models::FileAddTagsResponse]
      #
      # @see Imagekit::Models::FileAddTagsParams
      def add_tags(params)
        parsed, options = Imagekit::FileAddTagsParams.dump_request(params)
        @client.request(
          method: :post,
          path: "v1/files/addTags",
          body: parsed,
          model: Imagekit::Models::FileAddTagsResponse,
          options: options
        )
      end

      # Some parameter documentations has been truncated, see
      # {Imagekit::Models::FileCopyParams} for more details.
      #
      # This will copy a file from one folder to another.
      #
      # Note: If any file at the destination has the same name as the source file, then
      # the source file and its versions (if `includeFileVersions` is set to true) will
      # be appended to the destination file version history.
      #
      # @overload copy(destination_path:, source_file_path:, include_file_versions: nil, request_options: {})
      #
      # @param destination_path [String] Full path to the folder you want to copy the above file into.
      #
      # @param source_file_path [String] The full path of the file you want to copy.
      #
      # @param include_file_versions [Boolean] Option to copy all versions of a file. By default, only the current version of t
      #
      # @param request_options [Imagekit::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Object]
      #
      # @see Imagekit::Models::FileCopyParams
      def copy(params)
        parsed, options = Imagekit::FileCopyParams.dump_request(params)
        @client.request(
          method: :post,
          path: "v1/files/copy",
          body: parsed,
          model: Imagekit::Internal::Type::Unknown,
          options: options
        )
      end

      # Some parameter documentations has been truncated, see
      # {Imagekit::Models::FileMoveParams} for more details.
      #
      # This will move a file and all its versions from one folder to another.
      #
      # Note: If any file at the destination has the same name as the source file, then
      # the source file and its versions will be appended to the destination file.
      #
      # @overload move(destination_path:, source_file_path:, request_options: {})
      #
      # @param destination_path [String] Full path to the folder you want to move the above file into.
      #
      # @param source_file_path [String] The full path of the file you want to move.
      #
      # @param request_options [Imagekit::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Object]
      #
      # @see Imagekit::Models::FileMoveParams
      def move(params)
        parsed, options = Imagekit::FileMoveParams.dump_request(params)
        @client.request(
          method: :post,
          path: "v1/files/move",
          body: parsed,
          model: Imagekit::Internal::Type::Unknown,
          options: options
        )
      end

      # Some parameter documentations has been truncated, see
      # {Imagekit::Models::FileRemoveAITagsParams} for more details.
      #
      # This API removes AITags from multiple files in bulk. A maximum of 50 files can
      # be specified at a time.
      #
      # @overload remove_ai_tags(ai_tags:, file_ids:, request_options: {})
      #
      # @param ai_tags [Array<String>] An array of AITags that you want to remove from the files.
      #
      # @param file_ids [Array<String>] An array of fileIds from which you want to remove AITags.
      #
      # @param request_options [Imagekit::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Imagekit::Models::FileRemoveAITagsResponse]
      #
      # @see Imagekit::Models::FileRemoveAITagsParams
      def remove_ai_tags(params)
        parsed, options = Imagekit::FileRemoveAITagsParams.dump_request(params)
        @client.request(
          method: :post,
          path: "v1/files/removeAITags",
          body: parsed,
          model: Imagekit::Models::FileRemoveAITagsResponse,
          options: options
        )
      end

      # Some parameter documentations has been truncated, see
      # {Imagekit::Models::FileRemoveTagsParams} for more details.
      #
      # This API removes tags from multiple files in bulk. A maximum of 50 files can be
      # specified at a time.
      #
      # @overload remove_tags(file_ids:, tags:, request_options: {})
      #
      # @param file_ids [Array<String>] An array of fileIds from which you want to remove tags.
      #
      # @param tags [Array<String>] An array of tags that you want to remove from the files.
      #
      # @param request_options [Imagekit::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Imagekit::Models::FileRemoveTagsResponse]
      #
      # @see Imagekit::Models::FileRemoveTagsParams
      def remove_tags(params)
        parsed, options = Imagekit::FileRemoveTagsParams.dump_request(params)
        @client.request(
          method: :post,
          path: "v1/files/removeTags",
          body: parsed,
          model: Imagekit::Models::FileRemoveTagsResponse,
          options: options
        )
      end

      # Some parameter documentations has been truncated, see
      # {Imagekit::Models::FileRenameParams} for more details.
      #
      # You can rename an already existing file in the media library using rename file
      # API. This operation would rename all file versions of the file.
      #
      # Note: The old URLs will stop working. The file/file version URLs cached on CDN
      # will continue to work unless a purge is requested.
      #
      # @overload rename(file_path:, new_file_name:, purge_cache: nil, request_options: {})
      #
      # @param file_path [String] The full path of the file you want to rename.
      #
      # @param new_file_name [String] The new name of the file. A filename can contain:
      #
      # @param purge_cache [Boolean] Option to purge cache for the old file and its versions' URLs.
      #
      # @param request_options [Imagekit::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Imagekit::Models::FileRenameResponse]
      #
      # @see Imagekit::Models::FileRenameParams
      def rename(params)
        parsed, options = Imagekit::FileRenameParams.dump_request(params)
        @client.request(
          method: :put,
          path: "v1/files/rename",
          body: parsed,
          model: Imagekit::Models::FileRenameResponse,
          options: options
        )
      end

      # Some parameter documentations has been truncated, see
      # {Imagekit::Models::FileUploadV1Params} for more details.
      #
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
      #
      # @overload upload_v1(file:, file_name:, token: nil, checks: nil, custom_coordinates: nil, custom_metadata: nil, expire: nil, extensions: nil, folder: nil, is_private_file: nil, is_published: nil, overwrite_ai_tags: nil, overwrite_custom_metadata: nil, overwrite_file: nil, overwrite_tags: nil, public_key: nil, response_fields: nil, signature: nil, tags: nil, transformation: nil, use_unique_file_name: nil, webhook_url: nil, request_options: {})
      #
      # @param file [String] Pass the HTTP URL or base64 string. When passing a URL in the file parameter, pl
      #
      # @param file_name [String] The name with which the file has to be uploaded.
      #
      # @param token [String] A unique value that the ImageKit.io server will use to recognize and prevent sub
      #
      # @param checks [String] Server-side checks to run on the asset.
      #
      # @param custom_coordinates [String] Define an important area in the image. This is only relevant for image type file
      #
      # @param custom_metadata [String] Stringified JSON key-value data to be associated with the asset.
      #
      # @param expire [String] The time until your signature is valid. It must be a [Unix time](https://en.wiki
      #
      # @param extensions [String] Stringified JSON object with an array of extensions to be applied to the image.
      #
      # @param folder [String] The folder path in which the image has to be uploaded. If the folder(s) didn't e
      #
      # @param is_private_file [Symbol, Imagekit::Models::FileUploadV1Params::IsPrivateFile] Whether to mark the file as private or not.
      #
      # @param is_published [Symbol, Imagekit::Models::FileUploadV1Params::IsPublished] Whether to upload file as published or not.
      #
      # @param overwrite_ai_tags [Symbol, Imagekit::Models::FileUploadV1Params::OverwriteAITags] If set to `true` and a file already exists at the exact location, its AITags wil
      #
      # @param overwrite_custom_metadata [Symbol, Imagekit::Models::FileUploadV1Params::OverwriteCustomMetadata] If the request does not have `customMetadata`, and a file already exists at the
      #
      # @param overwrite_file [String] If `false` and `useUniqueFileName` is also `false`, and a file already exists at
      #
      # @param overwrite_tags [Symbol, Imagekit::Models::FileUploadV1Params::OverwriteTags] If the request does not have `tags`, and a file already exists at the exact loca
      #
      # @param public_key [String] Your ImageKit.io public key. This field is only required for authentication when
      #
      # @param response_fields [String] Comma-separated values of the fields that you want the API to return in the resp
      #
      # @param signature [String] HMAC-SHA1 digest of the token+expire using your ImageKit.io private API key as a
      #
      # @param tags [String] Set the tags while uploading the file.
      #
      # @param transformation [String] Stringified JSON object with properties for pre and post transformations:
      #
      # @param use_unique_file_name [Symbol, Imagekit::Models::FileUploadV1Params::UseUniqueFileName] Whether to use a unique filename for this file or not.
      #
      # @param webhook_url [String] The final status of extensions after they have completed execution will be deliv
      #
      # @param request_options [Imagekit::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Imagekit::Models::FileUploadV1Response]
      #
      # @see Imagekit::Models::FileUploadV1Params
      def upload_v1(params)
        parsed, options = Imagekit::FileUploadV1Params.dump_request(params)
        path =
          @client.base_url_overridden? ? "api/v1/files/upload" : "https://upload.imagekit.io/api/v1/files/upload"
        @client.request(
          method: :post,
          path: path,
          headers: {"content-type" => "multipart/form-data"},
          body: parsed,
          model: Imagekit::Models::FileUploadV1Response,
          options: options
        )
      end

      # Some parameter documentations has been truncated, see
      # {Imagekit::Models::FileUploadV2Params} for more details.
      #
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
      #
      # @overload upload_v2(file:, file_name:, token: nil, checks: nil, custom_coordinates: nil, custom_metadata: nil, extensions: nil, folder: nil, is_private_file: nil, is_published: nil, overwrite_ai_tags: nil, overwrite_custom_metadata: nil, overwrite_file: nil, overwrite_tags: nil, response_fields: nil, tags: nil, transformation: nil, use_unique_file_name: nil, webhook_url: nil, request_options: {})
      #
      # @param file [String] Pass the HTTP URL or base64 string. When passing a URL in the file parameter, pl
      #
      # @param file_name [String] The name with which the file has to be uploaded.
      #
      # @param token [String] This is the client-generated JSON Web Token (JWT). The ImageKit.io server uses i
      #
      # @param checks [String] Server-side checks to run on the asset.
      #
      # @param custom_coordinates [String] Define an important area in the image. This is only relevant for image type file
      #
      # @param custom_metadata [String] Stringified JSON key-value data to be associated with the asset.
      #
      # @param extensions [String] Stringified JSON object with an array of extensions to be applied to the image.
      #
      # @param folder [String] The folder path in which the image has to be uploaded. If the folder(s) didn't e
      #
      # @param is_private_file [Symbol, Imagekit::Models::FileUploadV2Params::IsPrivateFile] Whether to mark the file as private or not.
      #
      # @param is_published [Symbol, Imagekit::Models::FileUploadV2Params::IsPublished] Whether to upload file as published or not.
      #
      # @param overwrite_ai_tags [Symbol, Imagekit::Models::FileUploadV2Params::OverwriteAITags] If set to `true` and a file already exists at the exact location, its AITags wil
      #
      # @param overwrite_custom_metadata [Symbol, Imagekit::Models::FileUploadV2Params::OverwriteCustomMetadata] If the request does not have `customMetadata`, and a file already exists at the
      #
      # @param overwrite_file [String] If `false` and `useUniqueFileName` is also `false`, and a file already exists at
      #
      # @param overwrite_tags [Symbol, Imagekit::Models::FileUploadV2Params::OverwriteTags] If the request does not have `tags`, and a file already exists at the exact loca
      #
      # @param response_fields [String] Comma-separated values of the fields that you want the API to return in the resp
      #
      # @param tags [String] Set the tags while uploading the file.
      #
      # @param transformation [String] Stringified JSON object with properties for pre and post transformations:
      #
      # @param use_unique_file_name [Symbol, Imagekit::Models::FileUploadV2Params::UseUniqueFileName] Whether to use a unique filename for this file or not.
      #
      # @param webhook_url [String] The final status of extensions after they have completed execution will be deliv
      #
      # @param request_options [Imagekit::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Imagekit::Models::FileUploadV2Response]
      #
      # @see Imagekit::Models::FileUploadV2Params
      def upload_v2(params)
        parsed, options = Imagekit::FileUploadV2Params.dump_request(params)
        path =
          @client.base_url_overridden? ? "api/v2/files/upload" : "https://upload.imagekit.io/api/v2/files/upload"
        @client.request(
          method: :post,
          path: path,
          headers: {"content-type" => "multipart/form-data"},
          body: parsed,
          model: Imagekit::Models::FileUploadV2Response,
          options: options
        )
      end

      # @api private
      #
      # @param client [Imagekit::Client]
      def initialize(client:)
        @client = client
        @details = Imagekit::Resources::Files::Details.new(client: client)
        @batch = Imagekit::Resources::Files::Batch.new(client: client)
        @versions = Imagekit::Resources::Files::Versions.new(client: client)
        @purge = Imagekit::Resources::Files::Purge.new(client: client)
        @metadata = Imagekit::Resources::Files::Metadata.new(client: client)
      end
    end
  end
end
