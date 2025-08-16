# typed: strong

module Imagekit
  module Models
    class FileUploadV1Params < Imagekit::Internal::Type::BaseModel
      extend Imagekit::Internal::Type::RequestParameters::Converter
      include Imagekit::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(Imagekit::FileUploadV1Params, Imagekit::Internal::AnyHash)
        end

      # Pass the HTTP URL or base64 string. When passing a URL in the file parameter,
      # please ensure that our servers can access the URL. In case ImageKit is unable to
      # download the file from the specified URL, a `400` error response is returned.
      # This will also result in a `400` error if the file download request is aborted
      # if response headers are not received in 8 seconds.
      sig { returns(String) }
      attr_accessor :file

      # The name with which the file has to be uploaded. The file name can contain:
      #
      # - Alphanumeric Characters: `a-z`, `A-Z`, `0-9`.
      # - Special Characters: `.`, `-`
      #
      # Any other character including space will be replaced by `_`
      sig { returns(String) }
      attr_accessor :file_name

      # A unique value that the ImageKit.io server will use to recognize and prevent
      # subsequent retries for the same request. We suggest using V4 UUIDs, or another
      # random string with enough entropy to avoid collisions. This field is only
      # required for authentication when uploading a file from the client side.
      #
      # **Note**: Sending a value that has been used in the past will result in a
      # validation error. Even if your previous request resulted in an error, you should
      # always send a new value for this field.
      sig { returns(T.nilable(String)) }
      attr_reader :token

      sig { params(token: String).void }
      attr_writer :token

      # Server-side checks to run on the asset. Read more about
      # [Upload API checks](/docs/api-reference/upload-file/upload-file#upload-api-checks).
      sig { returns(T.nilable(String)) }
      attr_reader :checks

      sig { params(checks: String).void }
      attr_writer :checks

      # Define an important area in the image. This is only relevant for image type
      # files.
      #
      # - To be passed as a string with the x and y coordinates of the top-left corner,
      #   and width and height of the area of interest in the format `x,y,width,height`.
      #   For example - `10,10,100,100`
      # - Can be used with fo-customtransformation.
      # - If this field is not specified and the file is overwritten, then
      #   customCoordinates will be removed.
      sig { returns(T.nilable(String)) }
      attr_reader :custom_coordinates

      sig { params(custom_coordinates: String).void }
      attr_writer :custom_coordinates

      # Stringified JSON key-value data to be associated with the asset.
      sig { returns(T.nilable(String)) }
      attr_reader :custom_metadata

      sig { params(custom_metadata: String).void }
      attr_writer :custom_metadata

      # The time until your signature is valid. It must be a
      # [Unix time](https://en.wikipedia.org/wiki/Unix_time) in less than 1 hour into
      # the future. It should be in seconds. This field is only required for
      # authentication when uploading a file from the client side.
      sig { returns(T.nilable(String)) }
      attr_reader :expire

      sig { params(expire: String).void }
      attr_writer :expire

      # Stringified JSON object with an array of extensions to be applied to the image.
      # Refer to extensions schema in
      # [update file API request body](/docs/api-reference/digital-asset-management-dam/managing-assets/update-file-details#request-body).
      sig { returns(T.nilable(String)) }
      attr_reader :extensions

      sig { params(extensions: String).void }
      attr_writer :extensions

      # The folder path in which the image has to be uploaded. If the folder(s) didn't
      # exist before, a new folder(s) is created.
      #
      # The folder name can contain:
      #
      # - Alphanumeric Characters: `a-z` , `A-Z` , `0-9`
      # - Special Characters: `/` , `_` , `-`
      #
      # Using multiple `/` creates a nested folder.
      sig { returns(T.nilable(String)) }
      attr_reader :folder

      sig { params(folder: String).void }
      attr_writer :folder

      # Whether to mark the file as private or not.
      #
      # If `true`, the file is marked as private and is accessible only using named
      # transformation or signed URL.
      sig do
        returns(
          T.nilable(Imagekit::FileUploadV1Params::IsPrivateFile::OrSymbol)
        )
      end
      attr_reader :is_private_file

      sig do
        params(
          is_private_file: Imagekit::FileUploadV1Params::IsPrivateFile::OrSymbol
        ).void
      end
      attr_writer :is_private_file

      # Whether to upload file as published or not.
      #
      # If `false`, the file is marked as unpublished, which restricts access to the
      # file only via the media library. Files in draft or unpublished state can only be
      # publicly accessed after being published.
      #
      # The option to upload in draft state is only available in custom enterprise
      # pricing plans.
      sig do
        returns(T.nilable(Imagekit::FileUploadV1Params::IsPublished::OrSymbol))
      end
      attr_reader :is_published

      sig do
        params(
          is_published: Imagekit::FileUploadV1Params::IsPublished::OrSymbol
        ).void
      end
      attr_writer :is_published

      # If set to `true` and a file already exists at the exact location, its AITags
      # will be removed. Set `overwriteAITags` to `false` to preserve AITags.
      sig do
        returns(
          T.nilable(Imagekit::FileUploadV1Params::OverwriteAITags::OrSymbol)
        )
      end
      attr_reader :overwrite_ai_tags

      sig do
        params(
          overwrite_ai_tags:
            Imagekit::FileUploadV1Params::OverwriteAITags::OrSymbol
        ).void
      end
      attr_writer :overwrite_ai_tags

      # If the request does not have `customMetadata`, and a file already exists at the
      # exact location, existing customMetadata will be removed.
      sig do
        returns(
          T.nilable(
            Imagekit::FileUploadV1Params::OverwriteCustomMetadata::OrSymbol
          )
        )
      end
      attr_reader :overwrite_custom_metadata

      sig do
        params(
          overwrite_custom_metadata:
            Imagekit::FileUploadV1Params::OverwriteCustomMetadata::OrSymbol
        ).void
      end
      attr_writer :overwrite_custom_metadata

      # If `false` and `useUniqueFileName` is also `false`, and a file already exists at
      # the exact location, upload API will return an error immediately.
      sig { returns(T.nilable(String)) }
      attr_reader :overwrite_file

      sig { params(overwrite_file: String).void }
      attr_writer :overwrite_file

      # If the request does not have `tags`, and a file already exists at the exact
      # location, existing tags will be removed.
      sig do
        returns(
          T.nilable(Imagekit::FileUploadV1Params::OverwriteTags::OrSymbol)
        )
      end
      attr_reader :overwrite_tags

      sig do
        params(
          overwrite_tags: Imagekit::FileUploadV1Params::OverwriteTags::OrSymbol
        ).void
      end
      attr_writer :overwrite_tags

      # Your ImageKit.io public key. This field is only required for authentication when
      # uploading a file from the client side.
      sig { returns(T.nilable(String)) }
      attr_reader :public_key

      sig { params(public_key: String).void }
      attr_writer :public_key

      # Comma-separated values of the fields that you want the API to return in the
      # response.
      #
      # For example, set the value of this field to
      # `tags,customCoordinates,isPrivateFile` to get the value of `tags`,
      # `customCoordinates`, and `isPrivateFile` in the response.
      #
      # Accepts combination of `tags`, `customCoordinates`, `isPrivateFile`,
      # `embeddedMetadata`, `isPublished`, `customMetadata`, and `metadata`.
      sig { returns(T.nilable(String)) }
      attr_reader :response_fields

      sig { params(response_fields: String).void }
      attr_writer :response_fields

      # HMAC-SHA1 digest of the token+expire using your ImageKit.io private API key as a
      # key. Learn how to create a signature on the page below. This should be in
      # lowercase.
      #
      # Signature must be calculated on the server-side. This field is only required for
      # authentication when uploading a file from the client side.
      sig { returns(T.nilable(String)) }
      attr_reader :signature

      sig { params(signature: String).void }
      attr_writer :signature

      # Set the tags while uploading the file.
      #
      # Comma-separated value of tags in the format `tag1,tag2,tag3`. The maximum length
      # of all characters should not exceed 500. `%` is not allowed.
      #
      # If this field is not specified and the file is overwritten then the tags will be
      # removed.
      sig { returns(T.nilable(String)) }
      attr_reader :tags

      sig { params(tags: String).void }
      attr_writer :tags

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
      sig { returns(T.nilable(String)) }
      attr_reader :transformation

      sig { params(transformation: String).void }
      attr_writer :transformation

      # Whether to use a unique filename for this file or not.
      #
      # If `true`, ImageKit.io will add a unique suffix to the filename parameter to get
      # a unique filename.
      #
      # If `false`, then the image is uploaded with the provided filename parameter, and
      # any existing file with the same name is replaced.
      sig do
        returns(
          T.nilable(Imagekit::FileUploadV1Params::UseUniqueFileName::OrSymbol)
        )
      end
      attr_reader :use_unique_file_name

      sig do
        params(
          use_unique_file_name:
            Imagekit::FileUploadV1Params::UseUniqueFileName::OrSymbol
        ).void
      end
      attr_writer :use_unique_file_name

      # The final status of extensions after they have completed execution will be
      # delivered to this endpoint as a POST request.
      # [Learn more](/docs/api-reference/digital-asset-management-dam/managing-assets/update-file-details#webhook-payload-structure)
      # about the webhook payload structure.
      sig { returns(T.nilable(String)) }
      attr_reader :webhook_url

      sig { params(webhook_url: String).void }
      attr_writer :webhook_url

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
        ).returns(T.attached_class)
      end
      def self.new(
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

      sig do
        override.returns(
          {
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
            overwrite_tags:
              Imagekit::FileUploadV1Params::OverwriteTags::OrSymbol,
            public_key: String,
            response_fields: String,
            signature: String,
            tags: String,
            transformation: String,
            use_unique_file_name:
              Imagekit::FileUploadV1Params::UseUniqueFileName::OrSymbol,
            webhook_url: String,
            request_options: Imagekit::RequestOptions
          }
        )
      end
      def to_hash
      end

      # Whether to mark the file as private or not.
      #
      # If `true`, the file is marked as private and is accessible only using named
      # transformation or signed URL.
      module IsPrivateFile
        extend Imagekit::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias do
            T.all(Symbol, Imagekit::FileUploadV1Params::IsPrivateFile)
          end
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        TRUE =
          T.let(
            :true,
            Imagekit::FileUploadV1Params::IsPrivateFile::TaggedSymbol
          )
        FALSE =
          T.let(
            :false,
            Imagekit::FileUploadV1Params::IsPrivateFile::TaggedSymbol
          )

        sig do
          override.returns(
            T::Array[Imagekit::FileUploadV1Params::IsPrivateFile::TaggedSymbol]
          )
        end
        def self.values
        end
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

        TaggedSymbol =
          T.type_alias do
            T.all(Symbol, Imagekit::FileUploadV1Params::IsPublished)
          end
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        TRUE =
          T.let(:true, Imagekit::FileUploadV1Params::IsPublished::TaggedSymbol)
        FALSE =
          T.let(:false, Imagekit::FileUploadV1Params::IsPublished::TaggedSymbol)

        sig do
          override.returns(
            T::Array[Imagekit::FileUploadV1Params::IsPublished::TaggedSymbol]
          )
        end
        def self.values
        end
      end

      # If set to `true` and a file already exists at the exact location, its AITags
      # will be removed. Set `overwriteAITags` to `false` to preserve AITags.
      module OverwriteAITags
        extend Imagekit::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias do
            T.all(Symbol, Imagekit::FileUploadV1Params::OverwriteAITags)
          end
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        TRUE =
          T.let(
            :true,
            Imagekit::FileUploadV1Params::OverwriteAITags::TaggedSymbol
          )
        FALSE =
          T.let(
            :false,
            Imagekit::FileUploadV1Params::OverwriteAITags::TaggedSymbol
          )

        sig do
          override.returns(
            T::Array[
              Imagekit::FileUploadV1Params::OverwriteAITags::TaggedSymbol
            ]
          )
        end
        def self.values
        end
      end

      # If the request does not have `customMetadata`, and a file already exists at the
      # exact location, existing customMetadata will be removed.
      module OverwriteCustomMetadata
        extend Imagekit::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias do
            T.all(Symbol, Imagekit::FileUploadV1Params::OverwriteCustomMetadata)
          end
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        TRUE =
          T.let(
            :true,
            Imagekit::FileUploadV1Params::OverwriteCustomMetadata::TaggedSymbol
          )
        FALSE =
          T.let(
            :false,
            Imagekit::FileUploadV1Params::OverwriteCustomMetadata::TaggedSymbol
          )

        sig do
          override.returns(
            T::Array[
              Imagekit::FileUploadV1Params::OverwriteCustomMetadata::TaggedSymbol
            ]
          )
        end
        def self.values
        end
      end

      # If the request does not have `tags`, and a file already exists at the exact
      # location, existing tags will be removed.
      module OverwriteTags
        extend Imagekit::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias do
            T.all(Symbol, Imagekit::FileUploadV1Params::OverwriteTags)
          end
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        TRUE =
          T.let(
            :true,
            Imagekit::FileUploadV1Params::OverwriteTags::TaggedSymbol
          )
        FALSE =
          T.let(
            :false,
            Imagekit::FileUploadV1Params::OverwriteTags::TaggedSymbol
          )

        sig do
          override.returns(
            T::Array[Imagekit::FileUploadV1Params::OverwriteTags::TaggedSymbol]
          )
        end
        def self.values
        end
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

        TaggedSymbol =
          T.type_alias do
            T.all(Symbol, Imagekit::FileUploadV1Params::UseUniqueFileName)
          end
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        TRUE =
          T.let(
            :true,
            Imagekit::FileUploadV1Params::UseUniqueFileName::TaggedSymbol
          )
        FALSE =
          T.let(
            :false,
            Imagekit::FileUploadV1Params::UseUniqueFileName::TaggedSymbol
          )

        sig do
          override.returns(
            T::Array[
              Imagekit::FileUploadV1Params::UseUniqueFileName::TaggedSymbol
            ]
          )
        end
        def self.values
        end
      end
    end
  end
end
