# frozen_string_literal: true

module Imagekit
  module Resources
    class Files
      # @return [Imagekit::Resources::Files::Bulk]
      attr_reader :bulk

      # @return [Imagekit::Resources::Files::Versions]
      attr_reader :versions

      # @return [Imagekit::Resources::Files::Metadata]
      attr_reader :metadata

      # Some parameter documentations has been truncated, see
      # {Imagekit::Models::FileUpdateParams} for more details.
      #
      # This API updates the details or attributes of the current version of the file.
      # You can update `tags`, `customCoordinates`, `customMetadata`, publication
      # status, remove existing `AITags` and apply extensions using this API.
      #
      # @overload update(file_id, update: nil, request_options: {})
      #
      # @param file_id [String] The unique `fileId` of the uploaded file. `fileId` is returned in list and searc
      #
      # @param update [Imagekit::Models::FileUpdateParams::Update::UpdateFileDetails, Imagekit::Models::FileUpdateParams::Update::ChangePublicationStatus]
      #
      # @param request_options [Imagekit::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Imagekit::Models::FileUpdateResponse]
      #
      # @see Imagekit::Models::FileUpdateParams
      def update(file_id, params = {})
        parsed, options = Imagekit::FileUpdateParams.dump_request(params)
        @client.request(
          method: :patch,
          path: ["v1/files/%1$s/details", file_id],
          body: parsed[:update],
          model: Imagekit::Models::FileUpdateResponse,
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
      # @return [Imagekit::Models::FileCopyResponse]
      #
      # @see Imagekit::Models::FileCopyParams
      def copy(params)
        parsed, options = Imagekit::FileCopyParams.dump_request(params)
        @client.request(
          method: :post,
          path: "v1/files/copy",
          body: parsed,
          model: Imagekit::Models::FileCopyResponse,
          options: options
        )
      end

      # Some parameter documentations has been truncated, see
      # {Imagekit::Models::FileGetParams} for more details.
      #
      # This API returns an object with details or attributes about the current version
      # of the file.
      #
      # @overload get(file_id, request_options: {})
      #
      # @param file_id [String] The unique `fileId` of the uploaded file. `fileId` is returned in the list and s
      #
      # @param request_options [Imagekit::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Imagekit::Models::File]
      #
      # @see Imagekit::Models::FileGetParams
      def get(file_id, params = {})
        @client.request(
          method: :get,
          path: ["v1/files/%1$s/details", file_id],
          model: Imagekit::File,
          options: params[:request_options]
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
      # @return [Imagekit::Models::FileMoveResponse]
      #
      # @see Imagekit::Models::FileMoveParams
      def move(params)
        parsed, options = Imagekit::FileMoveParams.dump_request(params)
        @client.request(
          method: :post,
          path: "v1/files/move",
          body: parsed,
          model: Imagekit::Models::FileMoveResponse,
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
      # {Imagekit::Models::FileUploadParams} for more details.
      #
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
      #
      # @overload upload(file:, file_name:, token: nil, checks: nil, custom_coordinates: nil, custom_metadata: nil, description: nil, expire: nil, extensions: nil, folder: nil, is_private_file: nil, is_published: nil, overwrite_ai_tags: nil, overwrite_custom_metadata: nil, overwrite_file: nil, overwrite_tags: nil, public_key: nil, response_fields: nil, signature: nil, tags: nil, transformation: nil, use_unique_file_name: nil, webhook_url: nil, request_options: {})
      #
      # @param file [String] The API accepts any of the following:
      #
      # @param file_name [String] The name with which the file has to be uploaded.
      #
      # @param token [String] A unique value that the ImageKit.io server will use to recognize and prevent sub
      #
      # @param checks [String] Server-side checks to run on the asset.
      #
      # @param custom_coordinates [String] Define an important area in the image. This is only relevant for image type file
      #
      # @param custom_metadata [Hash{Symbol=>Object}] JSON key-value pairs to associate with the asset. Create the custom metadata fie
      #
      # @param description [String] Optional text to describe the contents of the file.
      #
      # @param expire [Integer] The time until your signature is valid. It must be a [Unix time](https://en.wiki
      #
      # @param extensions [Array<Imagekit::Models::FileUploadParams::Extension::RemoveBg, Imagekit::Models::FileUploadParams::Extension::AIAutoDescription, Imagekit::Models::FileUploadParams::Extension::AutoTaggingExtension>] Array of extensions to be applied to the image. Each extension can be configured
      #
      # @param folder [String] The folder path in which the image has to be uploaded. If the folder(s) didn't e
      #
      # @param is_private_file [Boolean] Whether to mark the file as private or not.
      #
      # @param is_published [Boolean] Whether to upload file as published or not.
      #
      # @param overwrite_ai_tags [Boolean] If set to `true` and a file already exists at the exact location, its AITags wil
      #
      # @param overwrite_custom_metadata [Boolean] If the request does not have `customMetadata`, and a file already exists at the
      #
      # @param overwrite_file [Boolean] If `false` and `useUniqueFileName` is also `false`, and a file already exists at
      #
      # @param overwrite_tags [Boolean] If the request does not have `tags`, and a file already exists at the exact loca
      #
      # @param public_key [String] Your ImageKit.io public key. This field is only required for authentication when
      #
      # @param response_fields [Array<Symbol, Imagekit::Models::FileUploadParams::ResponseField>] Array of response field keys to include in the API response body.
      #
      # @param signature [String] HMAC-SHA1 digest of the token+expire using your ImageKit.io private API key as a
      #
      # @param tags [Array<String>] Set the tags while uploading the file.
      #
      # @param transformation [Imagekit::Models::FileUploadParams::Transformation] Configure pre-processing (`pre`) and post-processing (`post`) transformations.
      #
      # @param use_unique_file_name [Boolean] Whether to use a unique filename for this file or not.
      #
      # @param webhook_url [String] The final status of extensions after they have completed execution will be deliv
      #
      # @param request_options [Imagekit::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Imagekit::Models::FileUploadResponse]
      #
      # @see Imagekit::Models::FileUploadParams
      def upload(params)
        parsed, options = Imagekit::FileUploadParams.dump_request(params)
        path =
          @client.base_url_overridden? ? "api/v1/files/upload" : "https://upload.imagekit.io/api/v1/files/upload"
        @client.request(
          method: :post,
          path: path,
          headers: {"content-type" => "multipart/form-data"},
          body: parsed,
          model: Imagekit::Models::FileUploadResponse,
          options: options
        )
      end

      # @api private
      #
      # @param client [Imagekit::Client]
      def initialize(client:)
        @client = client
        @bulk = Imagekit::Resources::Files::Bulk.new(client: client)
        @versions = Imagekit::Resources::Files::Versions.new(client: client)
        @metadata = Imagekit::Resources::Files::Metadata.new(client: client)
      end
    end
  end
end
