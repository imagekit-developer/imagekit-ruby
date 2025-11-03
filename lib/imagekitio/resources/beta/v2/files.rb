# frozen_string_literal: true

module Imagekitio
  module Resources
    class Beta
      class V2
        class Files
          # Some parameter documentations has been truncated, see
          # {Imagekitio::Models::Beta::V2::FileUploadParams} for more details.
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
          # @overload upload(file:, file_name:, token: nil, checks: nil, custom_coordinates: nil, custom_metadata: nil, description: nil, extensions: nil, folder: nil, is_private_file: nil, is_published: nil, overwrite_ai_tags: nil, overwrite_custom_metadata: nil, overwrite_file: nil, overwrite_tags: nil, response_fields: nil, tags: nil, transformation: nil, use_unique_file_name: nil, webhook_url: nil, request_options: {})
          #
          # @param file [Pathname, StringIO, IO, String, Imagekitio::FilePart] The API accepts any of the following:
          #
          # @param file_name [String] The name with which the file has to be uploaded.
          #
          # @param token [String] This is the client-generated JSON Web Token (JWT). The ImageKit.io server uses i
          #
          # @param checks [String] Server-side checks to run on the asset.
          #
          # @param custom_coordinates [String] Define an important area in the image. This is only relevant for image type file
          #
          # @param custom_metadata [Hash{Symbol=>Object}] JSON key-value pairs to associate with the asset. Create the custom metadata fie
          #
          # @param description [String] Optional text to describe the contents of the file.
          #
          # @param extensions [Array<Imagekitio::Models::ExtensionItem::RemoveBg, Imagekitio::Models::ExtensionItem::AIAutoDescription, Imagekitio::Models::ExtensionItem::AutoTaggingExtension>] Array of extensions to be applied to the asset. Each extension can be configured
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
          # @param response_fields [Array<Symbol, Imagekitio::Models::Beta::V2::FileUploadParams::ResponseField>] Array of response field keys to include in the API response body.
          #
          # @param tags [Array<String>] Set the tags while uploading the file.
          #
          # @param transformation [Imagekitio::Models::Beta::V2::FileUploadParams::Transformation] Configure pre-processing (`pre`) and post-processing (`post`) transformations.
          #
          # @param use_unique_file_name [Boolean] Whether to use a unique filename for this file or not.
          #
          # @param webhook_url [String] The final status of extensions after they have completed execution will be deliv
          #
          # @param request_options [Imagekitio::RequestOptions, Hash{Symbol=>Object}, nil]
          #
          # @return [Imagekitio::Models::Beta::V2::FileUploadResponse]
          #
          # @see Imagekitio::Models::Beta::V2::FileUploadParams
          def upload(params)
            parsed, options = Imagekitio::Beta::V2::FileUploadParams.dump_request(params)
            path =
              @client.base_url_overridden? ? "api/v2/files/upload" : "https://upload.imagekit.io/api/v2/files/upload"
            @client.request(
              method: :post,
              path: path,
              headers: {"content-type" => "multipart/form-data"},
              body: parsed,
              model: Imagekitio::Models::Beta::V2::FileUploadResponse,
              options: options
            )
          end

          # @api private
          #
          # @param client [Imagekitio::Client]
          def initialize(client:)
            @client = client
          end
        end
      end
    end
  end
end
