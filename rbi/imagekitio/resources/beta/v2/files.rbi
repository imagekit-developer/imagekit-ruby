# typed: strong

module Imagekitio
  module Resources
    class Beta
      class V2
        class Files
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
              file: Imagekitio::Internal::FileInput,
              file_name: String,
              token: String,
              checks: String,
              custom_coordinates: String,
              custom_metadata: T::Hash[Symbol, T.anything],
              description: String,
              extensions:
                T::Array[
                  T.any(
                    Imagekitio::ExtensionItem::RemoveBg::OrHash,
                    Imagekitio::ExtensionItem::AIAutoDescription::OrHash,
                    Imagekitio::ExtensionItem::AutoTaggingExtension::OrHash
                  )
                ],
              folder: String,
              is_private_file: T::Boolean,
              is_published: T::Boolean,
              overwrite_ai_tags: T::Boolean,
              overwrite_custom_metadata: T::Boolean,
              overwrite_file: T::Boolean,
              overwrite_tags: T::Boolean,
              response_fields:
                T::Array[
                  Imagekitio::Beta::V2::FileUploadParams::ResponseField::OrSymbol
                ],
              tags: T::Array[String],
              transformation:
                Imagekitio::Beta::V2::FileUploadParams::Transformation::OrHash,
              use_unique_file_name: T::Boolean,
              webhook_url: String,
              request_options: Imagekitio::RequestOptions::OrHash
            ).returns(Imagekitio::Models::Beta::V2::FileUploadResponse)
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
            # JSON key-value pairs to associate with the asset. Create the custom metadata
            # fields before setting these values.
            custom_metadata: nil,
            # Optional text to describe the contents of the file.
            description: nil,
            # Array of extensions to be applied to the asset. Each extension can be configured
            # with specific parameters based on the extension type.
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
            # Array of response field keys to include in the API response body.
            response_fields: nil,
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
          sig { params(client: Imagekitio::Client).returns(T.attached_class) }
          def self.new(client:)
          end
        end
      end
    end
  end
end
