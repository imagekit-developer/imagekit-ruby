# frozen_string_literal: true

module Imagekit
  module Models
    # @see Imagekit::Resources::Files#upload_v2
    class FileUploadV2Params < Imagekit::Internal::Type::BaseModel
      extend Imagekit::Internal::Type::RequestParameters::Converter
      include Imagekit::Internal::Type::RequestParameters

      # @!attribute file
      #   Pass the HTTP URL or base64 string. When passing a URL in the file parameter,
      #   please ensure that our servers can access the URL. In case ImageKit is unable to
      #   download the file from the specified URL, a `400` error response is returned.
      #   This will also result in a `400` error if the file download request is aborted
      #   if response headers are not received in 8 seconds.
      #
      #   @return [String]
      required :file, String

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
      #   Stringified JSON key-value data to be associated with the asset.
      #
      #   @return [String, nil]
      optional :custom_metadata, String, api_name: :customMetadata

      # @!attribute extensions
      #   Stringified JSON object with an array of extensions to be applied to the image.
      #   Refer to extensions schema in
      #   [update file API request body](/docs/api-reference/digital-asset-management-dam/managing-assets/update-file-details#request-body).
      #
      #   @return [String, nil]
      optional :extensions, String

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
      #   @return [Symbol, Imagekit::Models::FileUploadV2Params::IsPrivateFile, nil]
      optional :is_private_file,
               enum: -> { Imagekit::FileUploadV2Params::IsPrivateFile },
               api_name: :isPrivateFile

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
      #   @return [Symbol, Imagekit::Models::FileUploadV2Params::IsPublished, nil]
      optional :is_published, enum: -> { Imagekit::FileUploadV2Params::IsPublished }, api_name: :isPublished

      # @!attribute overwrite_ai_tags
      #   If set to `true` and a file already exists at the exact location, its AITags
      #   will be removed. Set `overwriteAITags` to `false` to preserve AITags.
      #
      #   @return [Symbol, Imagekit::Models::FileUploadV2Params::OverwriteAITags, nil]
      optional :overwrite_ai_tags,
               enum: -> { Imagekit::FileUploadV2Params::OverwriteAITags },
               api_name: :overwriteAITags

      # @!attribute overwrite_custom_metadata
      #   If the request does not have `customMetadata`, and a file already exists at the
      #   exact location, existing customMetadata will be removed.
      #
      #   @return [Symbol, Imagekit::Models::FileUploadV2Params::OverwriteCustomMetadata, nil]
      optional :overwrite_custom_metadata,
               enum: -> { Imagekit::FileUploadV2Params::OverwriteCustomMetadata },
               api_name: :overwriteCustomMetadata

      # @!attribute overwrite_file
      #   If `false` and `useUniqueFileName` is also `false`, and a file already exists at
      #   the exact location, upload API will return an error immediately.
      #
      #   @return [String, nil]
      optional :overwrite_file, String, api_name: :overwriteFile

      # @!attribute overwrite_tags
      #   If the request does not have `tags`, and a file already exists at the exact
      #   location, existing tags will be removed.
      #
      #   @return [Symbol, Imagekit::Models::FileUploadV2Params::OverwriteTags, nil]
      optional :overwrite_tags,
               enum: -> { Imagekit::FileUploadV2Params::OverwriteTags },
               api_name: :overwriteTags

      # @!attribute response_fields
      #   Comma-separated values of the fields that you want the API to return in the
      #   response.
      #
      #   For example, set the value of this field to
      #   `tags,customCoordinates,isPrivateFile` to get the value of `tags`,
      #   `customCoordinates`, and `isPrivateFile` in the response.
      #
      #   Accepts combination of `tags`, `customCoordinates`, `isPrivateFile`,
      #   `embeddedMetadata`, `isPublished`, `customMetadata`, and `metadata`.
      #
      #   @return [String, nil]
      optional :response_fields, String, api_name: :responseFields

      # @!attribute tags
      #   Set the tags while uploading the file.
      #
      #   Comma-separated value of tags in the format `tag1,tag2,tag3`. The maximum length
      #   of all characters should not exceed 500. `%` is not allowed.
      #
      #   If this field is not specified and the file is overwritten then the tags will be
      #   removed.
      #
      #   @return [String, nil]
      optional :tags, String

      # @!attribute transformation
      #   Stringified JSON object with properties for pre and post transformations:
      #
      #   `pre` - Accepts a "string" containing a valid transformation used for requesting
      #   a pre-transformation for an image or a video file.
      #
      #   `post` - Accepts an array of objects with properties:
      #
      #   - `type`: One of `transformation`, `gif-to-video`, `thumbnail`, or `abs`
      #     (Adaptive bitrate streaming).
      #   - `value`: A "string" corresponding to the required transformation. Required if
      #     `type` is `transformation` or `abs`. Optional if `type` is `gif-to-video` or
      #     `thumbnail`.
      #   - `protocol`: Either `hls` or `dash`, applicable only if `type` is `abs`.
      #
      #   Read more about
      #   [Adaptive bitrate streaming (ABS)](/docs/adaptive-bitrate-streaming).
      #
      #   @return [String, nil]
      optional :transformation, String

      # @!attribute use_unique_file_name
      #   Whether to use a unique filename for this file or not.
      #
      #   If `true`, ImageKit.io will add a unique suffix to the filename parameter to get
      #   a unique filename.
      #
      #   If `false`, then the image is uploaded with the provided filename parameter, and
      #   any existing file with the same name is replaced.
      #
      #   @return [Symbol, Imagekit::Models::FileUploadV2Params::UseUniqueFileName, nil]
      optional :use_unique_file_name,
               enum: -> { Imagekit::FileUploadV2Params::UseUniqueFileName },
               api_name: :useUniqueFileName

      # @!attribute webhook_url
      #   The final status of extensions after they have completed execution will be
      #   delivered to this endpoint as a POST request.
      #   [Learn more](/docs/api-reference/digital-asset-management-dam/managing-assets/update-file-details#webhook-payload-structure)
      #   about the webhook payload structure.
      #
      #   @return [String, nil]
      optional :webhook_url, String, api_name: :webhookUrl

      # @!method initialize(file:, file_name:, token: nil, checks: nil, custom_coordinates: nil, custom_metadata: nil, extensions: nil, folder: nil, is_private_file: nil, is_published: nil, overwrite_ai_tags: nil, overwrite_custom_metadata: nil, overwrite_file: nil, overwrite_tags: nil, response_fields: nil, tags: nil, transformation: nil, use_unique_file_name: nil, webhook_url: nil, request_options: {})
      #   Some parameter documentations has been truncated, see
      #   {Imagekit::Models::FileUploadV2Params} for more details.
      #
      #   @param file [String] Pass the HTTP URL or base64 string. When passing a URL in the file parameter, pl
      #
      #   @param file_name [String] The name with which the file has to be uploaded.
      #
      #   @param token [String] This is the client-generated JSON Web Token (JWT). The ImageKit.io server uses i
      #
      #   @param checks [String] Server-side checks to run on the asset.
      #
      #   @param custom_coordinates [String] Define an important area in the image. This is only relevant for image type file
      #
      #   @param custom_metadata [String] Stringified JSON key-value data to be associated with the asset.
      #
      #   @param extensions [String] Stringified JSON object with an array of extensions to be applied to the image.
      #
      #   @param folder [String] The folder path in which the image has to be uploaded. If the folder(s) didn't e
      #
      #   @param is_private_file [Symbol, Imagekit::Models::FileUploadV2Params::IsPrivateFile] Whether to mark the file as private or not.
      #
      #   @param is_published [Symbol, Imagekit::Models::FileUploadV2Params::IsPublished] Whether to upload file as published or not.
      #
      #   @param overwrite_ai_tags [Symbol, Imagekit::Models::FileUploadV2Params::OverwriteAITags] If set to `true` and a file already exists at the exact location, its AITags wil
      #
      #   @param overwrite_custom_metadata [Symbol, Imagekit::Models::FileUploadV2Params::OverwriteCustomMetadata] If the request does not have `customMetadata`, and a file already exists at the
      #
      #   @param overwrite_file [String] If `false` and `useUniqueFileName` is also `false`, and a file already exists at
      #
      #   @param overwrite_tags [Symbol, Imagekit::Models::FileUploadV2Params::OverwriteTags] If the request does not have `tags`, and a file already exists at the exact loca
      #
      #   @param response_fields [String] Comma-separated values of the fields that you want the API to return in the resp
      #
      #   @param tags [String] Set the tags while uploading the file.
      #
      #   @param transformation [String] Stringified JSON object with properties for pre and post transformations:
      #
      #   @param use_unique_file_name [Symbol, Imagekit::Models::FileUploadV2Params::UseUniqueFileName] Whether to use a unique filename for this file or not.
      #
      #   @param webhook_url [String] The final status of extensions after they have completed execution will be deliv
      #
      #   @param request_options [Imagekit::RequestOptions, Hash{Symbol=>Object}]

      # Whether to mark the file as private or not.
      #
      # If `true`, the file is marked as private and is accessible only using named
      # transformation or signed URL.
      module IsPrivateFile
        extend Imagekit::Internal::Type::Enum

        TRUE = :true
        FALSE = :false

        # @!method self.values
        #   @return [Array<Symbol>]
      end

      # Whether to upload file as published or not.
      #
      # If `false`, the file is marked as unpublished, which restricts access to the
      # file only via the media library. Files in draft or unpublished state can only be
      # publicly accessed after being published.
      #
      # The option to upload in draft state is only available in custom enterprise
      # pricing plans.
      module IsPublished
        extend Imagekit::Internal::Type::Enum

        TRUE = :true
        FALSE = :false

        # @!method self.values
        #   @return [Array<Symbol>]
      end

      # If set to `true` and a file already exists at the exact location, its AITags
      # will be removed. Set `overwriteAITags` to `false` to preserve AITags.
      module OverwriteAITags
        extend Imagekit::Internal::Type::Enum

        TRUE = :true
        FALSE = :false

        # @!method self.values
        #   @return [Array<Symbol>]
      end

      # If the request does not have `customMetadata`, and a file already exists at the
      # exact location, existing customMetadata will be removed.
      module OverwriteCustomMetadata
        extend Imagekit::Internal::Type::Enum

        TRUE = :true
        FALSE = :false

        # @!method self.values
        #   @return [Array<Symbol>]
      end

      # If the request does not have `tags`, and a file already exists at the exact
      # location, existing tags will be removed.
      module OverwriteTags
        extend Imagekit::Internal::Type::Enum

        TRUE = :true
        FALSE = :false

        # @!method self.values
        #   @return [Array<Symbol>]
      end

      # Whether to use a unique filename for this file or not.
      #
      # If `true`, ImageKit.io will add a unique suffix to the filename parameter to get
      # a unique filename.
      #
      # If `false`, then the image is uploaded with the provided filename parameter, and
      # any existing file with the same name is replaced.
      module UseUniqueFileName
        extend Imagekit::Internal::Type::Enum

        TRUE = :true
        FALSE = :false

        # @!method self.values
        #   @return [Array<Symbol>]
      end
    end
  end
end
