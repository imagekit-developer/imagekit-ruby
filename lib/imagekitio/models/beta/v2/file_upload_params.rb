# frozen_string_literal: true

module Imagekitio
  module Models
    module Beta
      module V2
        # @see Imagekitio::Resources::Beta::V2::Files#upload
        class FileUploadParams < Imagekitio::Internal::Type::BaseModel
          extend Imagekitio::Internal::Type::RequestParameters::Converter
          include Imagekitio::Internal::Type::RequestParameters

          # @!attribute file
          #   The API accepts any of the following:
          #
          #   - **Binary data** – send the raw bytes as `multipart/form-data`.
          #   - **HTTP / HTTPS URL** – a publicly reachable URL that ImageKit’s servers can
          #     fetch.
          #   - **Base64 string** – the file encoded as a Base64 data URI or plain Base64.
          #
          #   When supplying a URL, the server must receive the response headers within 8
          #   seconds; otherwise the request fails with 400 Bad Request.
          #
          #   @return [Pathname, StringIO, IO, String, Imagekitio::FilePart]
          required :file, Imagekitio::Internal::Type::FileInput

          # @!attribute file_name
          #   The name with which the file has to be uploaded.
          #
          #   @return [String]
          required :file_name, String, api_name: :fileName

          # @!attribute token
          #   This is the client-generated JSON Web Token (JWT). The ImageKit.io server uses
          #   it to authenticate and check that the upload request parameters have not been
          #   tampered with after the token has been generated. Learn how to create the token
          #   on the page below. This field is only required for authentication when uploading
          #   a file from the client side.
          #
          #   **Note**: Sending a JWT that has been used in the past will result in a
          #   validation error. Even if your previous request resulted in an error, you should
          #   always send a new token.
          #
          #   **⚠️Warning**: JWT must be generated on the server-side because it is generated
          #   using your account's private API key. This field is required for authentication
          #   when uploading a file from the client-side.
          #
          #   @return [String, nil]
          optional :token, String

          # @!attribute checks
          #   Server-side checks to run on the asset. Read more about
          #   [Upload API checks](/docs/api-reference/upload-file/upload-file-v2#upload-api-checks).
          #
          #   @return [String, nil]
          optional :checks, String

          # @!attribute custom_coordinates
          #   Define an important area in the image. This is only relevant for image type
          #   files.
          #
          #   - To be passed as a string with the x and y coordinates of the top-left corner,
          #     and width and height of the area of interest in the format `x,y,width,height`.
          #     For example - `10,10,100,100`
          #   - Can be used with fo-customtransformation.
          #   - If this field is not specified and the file is overwritten, then
          #     customCoordinates will be removed.
          #
          #   @return [String, nil]
          optional :custom_coordinates, String, api_name: :customCoordinates

          # @!attribute custom_metadata
          #   JSON key-value pairs to associate with the asset. Create the custom metadata
          #   fields before setting these values.
          #
          #   @return [Hash{Symbol=>Object}, nil]
          optional :custom_metadata,
                   Imagekitio::Internal::Type::HashOf[Imagekitio::Internal::Type::Unknown],
                   api_name: :customMetadata

          # @!attribute description
          #   Optional text to describe the contents of the file.
          #
          #   @return [String, nil]
          optional :description, String

          # @!attribute extensions
          #   Array of extensions to be applied to the asset. Each extension can be configured
          #   with specific parameters based on the extension type.
          #
          #   @return [Array<Imagekitio::Models::ExtensionItem::RemoveBg, Imagekitio::Models::ExtensionItem::AIAutoDescription, Imagekitio::Models::ExtensionItem::AITasks, Imagekitio::Models::ExtensionItem::SavedExtension, Imagekitio::Models::ExtensionItem::AutoTaggingExtension>, nil]
          optional :extensions, -> { Imagekitio::Internal::Type::ArrayOf[union: Imagekitio::ExtensionItem] }

          # @!attribute folder
          #   The folder path in which the image has to be uploaded. If the folder(s) didn't
          #   exist before, a new folder(s) is created. Using multiple `/` creates a nested
          #   folder.
          #
          #   @return [String, nil]
          optional :folder, String

          # @!attribute is_private_file
          #   Whether to mark the file as private or not.
          #
          #   If `true`, the file is marked as private and is accessible only using named
          #   transformation or signed URL.
          #
          #   @return [Boolean, nil]
          optional :is_private_file, Imagekitio::Internal::Type::Boolean, api_name: :isPrivateFile

          # @!attribute is_published
          #   Whether to upload file as published or not.
          #
          #   If `false`, the file is marked as unpublished, which restricts access to the
          #   file only via the media library. Files in draft or unpublished state can only be
          #   publicly accessed after being published.
          #
          #   The option to upload in draft state is only available in custom enterprise
          #   pricing plans.
          #
          #   @return [Boolean, nil]
          optional :is_published, Imagekitio::Internal::Type::Boolean, api_name: :isPublished

          # @!attribute overwrite_ai_tags
          #   If set to `true` and a file already exists at the exact location, its AITags
          #   will be removed. Set `overwriteAITags` to `false` to preserve AITags.
          #
          #   @return [Boolean, nil]
          optional :overwrite_ai_tags, Imagekitio::Internal::Type::Boolean, api_name: :overwriteAITags

          # @!attribute overwrite_custom_metadata
          #   If the request does not have `customMetadata`, and a file already exists at the
          #   exact location, existing customMetadata will be removed.
          #
          #   @return [Boolean, nil]
          optional :overwrite_custom_metadata,
                   Imagekitio::Internal::Type::Boolean,
                   api_name: :overwriteCustomMetadata

          # @!attribute overwrite_file
          #   If `false` and `useUniqueFileName` is also `false`, and a file already exists at
          #   the exact location, upload API will return an error immediately.
          #
          #   @return [Boolean, nil]
          optional :overwrite_file, Imagekitio::Internal::Type::Boolean, api_name: :overwriteFile

          # @!attribute overwrite_tags
          #   If the request does not have `tags`, and a file already exists at the exact
          #   location, existing tags will be removed.
          #
          #   @return [Boolean, nil]
          optional :overwrite_tags, Imagekitio::Internal::Type::Boolean, api_name: :overwriteTags

          # @!attribute response_fields
          #   Array of response field keys to include in the API response body.
          #
          #   @return [Array<Symbol, Imagekitio::Models::Beta::V2::FileUploadParams::ResponseField>, nil]
          optional :response_fields,
                   -> {
                     Imagekitio::Internal::Type::ArrayOf[enum: Imagekitio::Beta::V2::FileUploadParams::ResponseField]
                   },
                   api_name: :responseFields

          # @!attribute tags
          #   Set the tags while uploading the file. Provide an array of tag strings (e.g.
          #   `["tag1", "tag2", "tag3"]`). The combined length of all tag characters must not
          #   exceed 500, and the `%` character is not allowed. If this field is not specified
          #   and the file is overwritten, the existing tags will be removed.
          #
          #   @return [Array<String>, nil]
          optional :tags, Imagekitio::Internal::Type::ArrayOf[String]

          # @!attribute transformation
          #   Configure pre-processing (`pre`) and post-processing (`post`) transformations.
          #
          #   - `pre` — applied before the file is uploaded to the Media Library.
          #     Useful for reducing file size or applying basic optimizations upfront (e.g.,
          #     resize, compress).
          #
          #   - `post` — applied immediately after upload.
          #     Ideal for generating transformed versions (like video encodes or thumbnails)
          #     in advance, so they're ready for delivery without delay.
          #
          #   You can mix and match any combination of post-processing types.
          #
          #   @return [Imagekitio::Models::Beta::V2::FileUploadParams::Transformation, nil]
          optional :transformation, -> { Imagekitio::Beta::V2::FileUploadParams::Transformation }

          # @!attribute use_unique_file_name
          #   Whether to use a unique filename for this file or not.
          #
          #   If `true`, ImageKit.io will add a unique suffix to the filename parameter to get
          #   a unique filename.
          #
          #   If `false`, then the image is uploaded with the provided filename parameter, and
          #   any existing file with the same name is replaced.
          #
          #   @return [Boolean, nil]
          optional :use_unique_file_name, Imagekitio::Internal::Type::Boolean, api_name: :useUniqueFileName

          # @!attribute webhook_url
          #   The final status of extensions after they have completed execution will be
          #   delivered to this endpoint as a POST request.
          #   [Learn more](/docs/api-reference/digital-asset-management-dam/managing-assets/update-file-details#webhook-payload-structure)
          #   about the webhook payload structure.
          #
          #   @return [String, nil]
          optional :webhook_url, String, api_name: :webhookUrl

          # @!method initialize(file:, file_name:, token: nil, checks: nil, custom_coordinates: nil, custom_metadata: nil, description: nil, extensions: nil, folder: nil, is_private_file: nil, is_published: nil, overwrite_ai_tags: nil, overwrite_custom_metadata: nil, overwrite_file: nil, overwrite_tags: nil, response_fields: nil, tags: nil, transformation: nil, use_unique_file_name: nil, webhook_url: nil, request_options: {})
          #   Some parameter documentations has been truncated, see
          #   {Imagekitio::Models::Beta::V2::FileUploadParams} for more details.
          #
          #   @param file [Pathname, StringIO, IO, String, Imagekitio::FilePart] The API accepts any of the following:
          #
          #   @param file_name [String] The name with which the file has to be uploaded.
          #
          #   @param token [String] This is the client-generated JSON Web Token (JWT). The ImageKit.io server uses i
          #
          #   @param checks [String] Server-side checks to run on the asset.
          #
          #   @param custom_coordinates [String] Define an important area in the image. This is only relevant for image type file
          #
          #   @param custom_metadata [Hash{Symbol=>Object}] JSON key-value pairs to associate with the asset. Create the custom metadata fie
          #
          #   @param description [String] Optional text to describe the contents of the file.
          #
          #   @param extensions [Array<Imagekitio::Models::ExtensionItem::RemoveBg, Imagekitio::Models::ExtensionItem::AIAutoDescription, Imagekitio::Models::ExtensionItem::AITasks, Imagekitio::Models::ExtensionItem::SavedExtension, Imagekitio::Models::ExtensionItem::AutoTaggingExtension>] Array of extensions to be applied to the asset. Each extension can be configured
          #
          #   @param folder [String] The folder path in which the image has to be uploaded. If the folder(s) didn't e
          #
          #   @param is_private_file [Boolean] Whether to mark the file as private or not.
          #
          #   @param is_published [Boolean] Whether to upload file as published or not.
          #
          #   @param overwrite_ai_tags [Boolean] If set to `true` and a file already exists at the exact location, its AITags wil
          #
          #   @param overwrite_custom_metadata [Boolean] If the request does not have `customMetadata`, and a file already exists at the
          #
          #   @param overwrite_file [Boolean] If `false` and `useUniqueFileName` is also `false`, and a file already exists at
          #
          #   @param overwrite_tags [Boolean] If the request does not have `tags`, and a file already exists at the exact loca
          #
          #   @param response_fields [Array<Symbol, Imagekitio::Models::Beta::V2::FileUploadParams::ResponseField>] Array of response field keys to include in the API response body.
          #
          #   @param tags [Array<String>] Set the tags while uploading the file.
          #
          #   @param transformation [Imagekitio::Models::Beta::V2::FileUploadParams::Transformation] Configure pre-processing (`pre`) and post-processing (`post`) transformations.
          #
          #   @param use_unique_file_name [Boolean] Whether to use a unique filename for this file or not.
          #
          #   @param webhook_url [String] The final status of extensions after they have completed execution will be deliv
          #
          #   @param request_options [Imagekitio::RequestOptions, Hash{Symbol=>Object}]

          module ResponseField
            extend Imagekitio::Internal::Type::Enum

            TAGS = :tags
            CUSTOM_COORDINATES = :customCoordinates
            IS_PRIVATE_FILE = :isPrivateFile
            EMBEDDED_METADATA = :embeddedMetadata
            IS_PUBLISHED = :isPublished
            CUSTOM_METADATA = :customMetadata
            METADATA = :metadata
            SELECTED_FIELDS_SCHEMA = :selectedFieldsSchema

            # @!method self.values
            #   @return [Array<Symbol>]
          end

          class Transformation < Imagekitio::Internal::Type::BaseModel
            # @!attribute post
            #   List of transformations to apply _after_ the file is uploaded.
            #   Each item must match one of the following types: `transformation`,
            #   `gif-to-video`, `thumbnail`, `abs`.
            #
            #   @return [Array<Imagekitio::Models::Beta::V2::FileUploadParams::Transformation::Post::Transformation, Imagekitio::Models::Beta::V2::FileUploadParams::Transformation::Post::GifToVideo, Imagekitio::Models::Beta::V2::FileUploadParams::Transformation::Post::Thumbnail, Imagekitio::Models::Beta::V2::FileUploadParams::Transformation::Post::Abs>, nil]
            optional :post,
                     -> { Imagekitio::Internal::Type::ArrayOf[union: Imagekitio::Beta::V2::FileUploadParams::Transformation::Post] }

            # @!attribute pre
            #   Transformation string to apply before uploading the file to the Media Library.
            #   Useful for optimizing files at ingestion.
            #
            #   @return [String, nil]
            optional :pre, String

            # @!method initialize(post: nil, pre: nil)
            #   Some parameter documentations has been truncated, see
            #   {Imagekitio::Models::Beta::V2::FileUploadParams::Transformation} for more
            #   details.
            #
            #   Configure pre-processing (`pre`) and post-processing (`post`) transformations.
            #
            #   - `pre` — applied before the file is uploaded to the Media Library.
            #     Useful for reducing file size or applying basic optimizations upfront (e.g.,
            #     resize, compress).
            #
            #   - `post` — applied immediately after upload.
            #     Ideal for generating transformed versions (like video encodes or thumbnails)
            #     in advance, so they're ready for delivery without delay.
            #
            #   You can mix and match any combination of post-processing types.
            #
            #   @param post [Array<Imagekitio::Models::Beta::V2::FileUploadParams::Transformation::Post::Transformation, Imagekitio::Models::Beta::V2::FileUploadParams::Transformation::Post::GifToVideo, Imagekitio::Models::Beta::V2::FileUploadParams::Transformation::Post::Thumbnail, Imagekitio::Models::Beta::V2::FileUploadParams::Transformation::Post::Abs>] List of transformations to apply _after_ the file is uploaded.
            #
            #   @param pre [String] Transformation string to apply before uploading the file to the Media Library. U

            module Post
              extend Imagekitio::Internal::Type::Union

              discriminator :type

              variant :transformation,
                      -> { Imagekitio::Beta::V2::FileUploadParams::Transformation::Post::Transformation }

              variant :"gif-to-video", -> { Imagekitio::Beta::V2::FileUploadParams::Transformation::Post::GifToVideo }

              variant :thumbnail, -> { Imagekitio::Beta::V2::FileUploadParams::Transformation::Post::Thumbnail }

              variant :abs, -> { Imagekitio::Beta::V2::FileUploadParams::Transformation::Post::Abs }

              class Transformation < Imagekitio::Internal::Type::BaseModel
                # @!attribute type
                #   Transformation type.
                #
                #   @return [Symbol, :transformation]
                required :type, const: :transformation

                # @!attribute value
                #   Transformation string (e.g. `w-200,h-200`).
                #   Same syntax as ImageKit URL-based transformations.
                #
                #   @return [String]
                required :value, String

                # @!method initialize(value:, type: :transformation)
                #   Some parameter documentations has been truncated, see
                #   {Imagekitio::Models::Beta::V2::FileUploadParams::Transformation::Post::Transformation}
                #   for more details.
                #
                #   @param value [String] Transformation string (e.g. `w-200,h-200`).
                #
                #   @param type [Symbol, :transformation] Transformation type.
              end

              class GifToVideo < Imagekitio::Internal::Type::BaseModel
                # @!attribute type
                #   Converts an animated GIF into an MP4.
                #
                #   @return [Symbol, :"gif-to-video"]
                required :type, const: :"gif-to-video"

                # @!attribute value
                #   Optional transformation string to apply to the output video.
                #   **Example**: `q-80`
                #
                #   @return [String, nil]
                optional :value, String

                # @!method initialize(value: nil, type: :"gif-to-video")
                #   Some parameter documentations has been truncated, see
                #   {Imagekitio::Models::Beta::V2::FileUploadParams::Transformation::Post::GifToVideo}
                #   for more details.
                #
                #   @param value [String] Optional transformation string to apply to the output video.
                #
                #   @param type [Symbol, :"gif-to-video"] Converts an animated GIF into an MP4.
              end

              class Thumbnail < Imagekitio::Internal::Type::BaseModel
                # @!attribute type
                #   Generates a thumbnail image.
                #
                #   @return [Symbol, :thumbnail]
                required :type, const: :thumbnail

                # @!attribute value
                #   Optional transformation string.
                #   **Example**: `w-150,h-150`
                #
                #   @return [String, nil]
                optional :value, String

                # @!method initialize(value: nil, type: :thumbnail)
                #   Some parameter documentations has been truncated, see
                #   {Imagekitio::Models::Beta::V2::FileUploadParams::Transformation::Post::Thumbnail}
                #   for more details.
                #
                #   @param value [String] Optional transformation string.
                #
                #   @param type [Symbol, :thumbnail] Generates a thumbnail image.
              end

              class Abs < Imagekitio::Internal::Type::BaseModel
                # @!attribute protocol
                #   Streaming protocol to use (`hls` or `dash`).
                #
                #   @return [Symbol, Imagekitio::Models::Beta::V2::FileUploadParams::Transformation::Post::Abs::Protocol]
                required :protocol,
                         enum: -> { Imagekitio::Beta::V2::FileUploadParams::Transformation::Post::Abs::Protocol }

                # @!attribute type
                #   Adaptive Bitrate Streaming (ABS) setup.
                #
                #   @return [Symbol, :abs]
                required :type, const: :abs

                # @!attribute value
                #   List of different representations you want to create separated by an underscore.
                #
                #   @return [String]
                required :value, String

                # @!method initialize(protocol:, value:, type: :abs)
                #   Some parameter documentations has been truncated, see
                #   {Imagekitio::Models::Beta::V2::FileUploadParams::Transformation::Post::Abs} for
                #   more details.
                #
                #   @param protocol [Symbol, Imagekitio::Models::Beta::V2::FileUploadParams::Transformation::Post::Abs::Protocol] Streaming protocol to use (`hls` or `dash`).
                #
                #   @param value [String] List of different representations you want to create separated by an underscore.
                #
                #   @param type [Symbol, :abs] Adaptive Bitrate Streaming (ABS) setup.

                # Streaming protocol to use (`hls` or `dash`).
                #
                # @see Imagekitio::Models::Beta::V2::FileUploadParams::Transformation::Post::Abs#protocol
                module Protocol
                  extend Imagekitio::Internal::Type::Enum

                  HLS = :hls
                  DASH = :dash

                  # @!method self.values
                  #   @return [Array<Symbol>]
                end
              end

              # @!method self.variants
              #   @return [Array(Imagekitio::Models::Beta::V2::FileUploadParams::Transformation::Post::Transformation, Imagekitio::Models::Beta::V2::FileUploadParams::Transformation::Post::GifToVideo, Imagekitio::Models::Beta::V2::FileUploadParams::Transformation::Post::Thumbnail, Imagekitio::Models::Beta::V2::FileUploadParams::Transformation::Post::Abs)]
            end
          end
        end
      end
    end
  end
end
