# typed: strong

module Imagekitio
  module Models
    class FileUploadParams < Imagekitio::Internal::Type::BaseModel
      extend Imagekitio::Internal::Type::RequestParameters::Converter
      include Imagekitio::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(Imagekitio::FileUploadParams, Imagekitio::Internal::AnyHash)
        end

      # The API accepts any of the following:
      #
      # - **Binary data** – send the raw bytes as `multipart/form-data`.
      # - **HTTP / HTTPS URL** – a publicly reachable URL that ImageKit’s servers can
      #   fetch.
      # - **Base64 string** – the file encoded as a Base64 data URI or plain Base64.
      #
      # When supplying a URL, the server must receive the response headers within 8
      # seconds; otherwise the request fails with 400 Bad Request.
      sig { returns(Imagekitio::Internal::FileInput) }
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

      # JSON key-value pairs to associate with the asset. Create the custom metadata
      # fields before setting these values.
      sig { returns(T.nilable(T::Hash[Symbol, T.anything])) }
      attr_reader :custom_metadata

      sig { params(custom_metadata: T::Hash[Symbol, T.anything]).void }
      attr_writer :custom_metadata

      # Optional text to describe the contents of the file.
      sig { returns(T.nilable(String)) }
      attr_reader :description

      sig { params(description: String).void }
      attr_writer :description

      # The time until your signature is valid. It must be a
      # [Unix time](https://en.wikipedia.org/wiki/Unix_time) in less than 1 hour into
      # the future. It should be in seconds. This field is only required for
      # authentication when uploading a file from the client side.
      sig { returns(T.nilable(Integer)) }
      attr_reader :expire

      sig { params(expire: Integer).void }
      attr_writer :expire

      # Array of extensions to be applied to the asset. Each extension can be configured
      # with specific parameters based on the extension type.
      sig do
        returns(
          T.nilable(
            T::Array[
              T.any(
                Imagekitio::ExtensionItem::RemoveBg,
                Imagekitio::ExtensionItem::AIAutoDescription,
                Imagekitio::ExtensionItem::AutoTaggingExtension
              )
            ]
          )
        )
      end
      attr_reader :extensions

      sig do
        params(
          extensions:
            T::Array[
              T.any(
                Imagekitio::ExtensionItem::RemoveBg::OrHash,
                Imagekitio::ExtensionItem::AIAutoDescription::OrHash,
                Imagekitio::ExtensionItem::AutoTaggingExtension::OrHash
              )
            ]
        ).void
      end
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
      sig { returns(T.nilable(T::Boolean)) }
      attr_reader :is_private_file

      sig { params(is_private_file: T::Boolean).void }
      attr_writer :is_private_file

      # Whether to upload file as published or not.
      #
      # If `false`, the file is marked as unpublished, which restricts access to the
      # file only via the media library. Files in draft or unpublished state can only be
      # publicly accessed after being published.
      #
      # The option to upload in draft state is only available in custom enterprise
      # pricing plans.
      sig { returns(T.nilable(T::Boolean)) }
      attr_reader :is_published

      sig { params(is_published: T::Boolean).void }
      attr_writer :is_published

      # If set to `true` and a file already exists at the exact location, its AITags
      # will be removed. Set `overwriteAITags` to `false` to preserve AITags.
      sig { returns(T.nilable(T::Boolean)) }
      attr_reader :overwrite_ai_tags

      sig { params(overwrite_ai_tags: T::Boolean).void }
      attr_writer :overwrite_ai_tags

      # If the request does not have `customMetadata`, and a file already exists at the
      # exact location, existing customMetadata will be removed.
      sig { returns(T.nilable(T::Boolean)) }
      attr_reader :overwrite_custom_metadata

      sig { params(overwrite_custom_metadata: T::Boolean).void }
      attr_writer :overwrite_custom_metadata

      # If `false` and `useUniqueFileName` is also `false`, and a file already exists at
      # the exact location, upload API will return an error immediately.
      sig { returns(T.nilable(T::Boolean)) }
      attr_reader :overwrite_file

      sig { params(overwrite_file: T::Boolean).void }
      attr_writer :overwrite_file

      # If the request does not have `tags`, and a file already exists at the exact
      # location, existing tags will be removed.
      sig { returns(T.nilable(T::Boolean)) }
      attr_reader :overwrite_tags

      sig { params(overwrite_tags: T::Boolean).void }
      attr_writer :overwrite_tags

      # Your ImageKit.io public key. This field is only required for authentication when
      # uploading a file from the client side.
      sig { returns(T.nilable(String)) }
      attr_reader :public_key

      sig { params(public_key: String).void }
      attr_writer :public_key

      # Array of response field keys to include in the API response body.
      sig do
        returns(
          T.nilable(
            T::Array[Imagekitio::FileUploadParams::ResponseField::OrSymbol]
          )
        )
      end
      attr_reader :response_fields

      sig do
        params(
          response_fields:
            T::Array[Imagekitio::FileUploadParams::ResponseField::OrSymbol]
        ).void
      end
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

      # Set the tags while uploading the file. Provide an array of tag strings (e.g.
      # `["tag1", "tag2", "tag3"]`). The combined length of all tag characters must not
      # exceed 500, and the `%` character is not allowed. If this field is not specified
      # and the file is overwritten, the existing tags will be removed.
      sig { returns(T.nilable(T::Array[String])) }
      attr_reader :tags

      sig { params(tags: T::Array[String]).void }
      attr_writer :tags

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
      sig { returns(T.nilable(Imagekitio::FileUploadParams::Transformation)) }
      attr_reader :transformation

      sig do
        params(
          transformation: Imagekitio::FileUploadParams::Transformation::OrHash
        ).void
      end
      attr_writer :transformation

      # Whether to use a unique filename for this file or not.
      #
      # If `true`, ImageKit.io will add a unique suffix to the filename parameter to get
      # a unique filename.
      #
      # If `false`, then the image is uploaded with the provided filename parameter, and
      # any existing file with the same name is replaced.
      sig { returns(T.nilable(T::Boolean)) }
      attr_reader :use_unique_file_name

      sig { params(use_unique_file_name: T::Boolean).void }
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
          file: Imagekitio::Internal::FileInput,
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
          public_key: String,
          response_fields:
            T::Array[Imagekitio::FileUploadParams::ResponseField::OrSymbol],
          signature: String,
          tags: T::Array[String],
          transformation: Imagekitio::FileUploadParams::Transformation::OrHash,
          use_unique_file_name: T::Boolean,
          webhook_url: String,
          request_options: Imagekitio::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
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
        # Array of extensions to be applied to the asset. Each extension can be configured
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

      sig do
        override.returns(
          {
            file: Imagekitio::Internal::FileInput,
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
                  Imagekitio::ExtensionItem::RemoveBg,
                  Imagekitio::ExtensionItem::AIAutoDescription,
                  Imagekitio::ExtensionItem::AutoTaggingExtension
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
              T::Array[Imagekitio::FileUploadParams::ResponseField::OrSymbol],
            signature: String,
            tags: T::Array[String],
            transformation: Imagekitio::FileUploadParams::Transformation,
            use_unique_file_name: T::Boolean,
            webhook_url: String,
            request_options: Imagekitio::RequestOptions
          }
        )
      end
      def to_hash
      end

      module ResponseField
        extend Imagekitio::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias do
            T.all(Symbol, Imagekitio::FileUploadParams::ResponseField)
          end
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        TAGS =
          T.let(
            :tags,
            Imagekitio::FileUploadParams::ResponseField::TaggedSymbol
          )
        CUSTOM_COORDINATES =
          T.let(
            :customCoordinates,
            Imagekitio::FileUploadParams::ResponseField::TaggedSymbol
          )
        IS_PRIVATE_FILE =
          T.let(
            :isPrivateFile,
            Imagekitio::FileUploadParams::ResponseField::TaggedSymbol
          )
        EMBEDDED_METADATA =
          T.let(
            :embeddedMetadata,
            Imagekitio::FileUploadParams::ResponseField::TaggedSymbol
          )
        IS_PUBLISHED =
          T.let(
            :isPublished,
            Imagekitio::FileUploadParams::ResponseField::TaggedSymbol
          )
        CUSTOM_METADATA =
          T.let(
            :customMetadata,
            Imagekitio::FileUploadParams::ResponseField::TaggedSymbol
          )
        METADATA =
          T.let(
            :metadata,
            Imagekitio::FileUploadParams::ResponseField::TaggedSymbol
          )
        SELECTED_FIELDS_SCHEMA =
          T.let(
            :selectedFieldsSchema,
            Imagekitio::FileUploadParams::ResponseField::TaggedSymbol
          )

        sig do
          override.returns(
            T::Array[Imagekitio::FileUploadParams::ResponseField::TaggedSymbol]
          )
        end
        def self.values
        end
      end

      class Transformation < Imagekitio::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Imagekitio::FileUploadParams::Transformation,
              Imagekitio::Internal::AnyHash
            )
          end

        # List of transformations to apply _after_ the file is uploaded.
        # Each item must match one of the following types: `transformation`,
        # `gif-to-video`, `thumbnail`, `abs`.
        sig do
          returns(
            T.nilable(
              T::Array[
                T.any(
                  Imagekitio::FileUploadParams::Transformation::Post::Transformation,
                  Imagekitio::FileUploadParams::Transformation::Post::GifToVideo,
                  Imagekitio::FileUploadParams::Transformation::Post::Thumbnail,
                  Imagekitio::FileUploadParams::Transformation::Post::Abs
                )
              ]
            )
          )
        end
        attr_reader :post

        sig do
          params(
            post:
              T::Array[
                T.any(
                  Imagekitio::FileUploadParams::Transformation::Post::Transformation::OrHash,
                  Imagekitio::FileUploadParams::Transformation::Post::GifToVideo::OrHash,
                  Imagekitio::FileUploadParams::Transformation::Post::Thumbnail::OrHash,
                  Imagekitio::FileUploadParams::Transformation::Post::Abs::OrHash
                )
              ]
          ).void
        end
        attr_writer :post

        # Transformation string to apply before uploading the file to the Media Library.
        # Useful for optimizing files at ingestion.
        sig { returns(T.nilable(String)) }
        attr_reader :pre

        sig { params(pre: String).void }
        attr_writer :pre

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
        sig do
          params(
            post:
              T::Array[
                T.any(
                  Imagekitio::FileUploadParams::Transformation::Post::Transformation::OrHash,
                  Imagekitio::FileUploadParams::Transformation::Post::GifToVideo::OrHash,
                  Imagekitio::FileUploadParams::Transformation::Post::Thumbnail::OrHash,
                  Imagekitio::FileUploadParams::Transformation::Post::Abs::OrHash
                )
              ],
            pre: String
          ).returns(T.attached_class)
        end
        def self.new(
          # List of transformations to apply _after_ the file is uploaded.
          # Each item must match one of the following types: `transformation`,
          # `gif-to-video`, `thumbnail`, `abs`.
          post: nil,
          # Transformation string to apply before uploading the file to the Media Library.
          # Useful for optimizing files at ingestion.
          pre: nil
        )
        end

        sig do
          override.returns(
            {
              post:
                T::Array[
                  T.any(
                    Imagekitio::FileUploadParams::Transformation::Post::Transformation,
                    Imagekitio::FileUploadParams::Transformation::Post::GifToVideo,
                    Imagekitio::FileUploadParams::Transformation::Post::Thumbnail,
                    Imagekitio::FileUploadParams::Transformation::Post::Abs
                  )
                ],
              pre: String
            }
          )
        end
        def to_hash
        end

        module Post
          extend Imagekitio::Internal::Type::Union

          Variants =
            T.type_alias do
              T.any(
                Imagekitio::FileUploadParams::Transformation::Post::Transformation,
                Imagekitio::FileUploadParams::Transformation::Post::GifToVideo,
                Imagekitio::FileUploadParams::Transformation::Post::Thumbnail,
                Imagekitio::FileUploadParams::Transformation::Post::Abs
              )
            end

          class Transformation < Imagekitio::Internal::Type::BaseModel
            OrHash =
              T.type_alias do
                T.any(
                  Imagekitio::FileUploadParams::Transformation::Post::Transformation,
                  Imagekitio::Internal::AnyHash
                )
              end

            # Transformation type.
            sig { returns(Symbol) }
            attr_accessor :type

            # Transformation string (e.g. `w-200,h-200`).
            # Same syntax as ImageKit URL-based transformations.
            sig { returns(String) }
            attr_accessor :value

            sig do
              params(value: String, type: Symbol).returns(T.attached_class)
            end
            def self.new(
              # Transformation string (e.g. `w-200,h-200`).
              # Same syntax as ImageKit URL-based transformations.
              value:,
              # Transformation type.
              type: :transformation
            )
            end

            sig { override.returns({ type: Symbol, value: String }) }
            def to_hash
            end
          end

          class GifToVideo < Imagekitio::Internal::Type::BaseModel
            OrHash =
              T.type_alias do
                T.any(
                  Imagekitio::FileUploadParams::Transformation::Post::GifToVideo,
                  Imagekitio::Internal::AnyHash
                )
              end

            # Converts an animated GIF into an MP4.
            sig { returns(Symbol) }
            attr_accessor :type

            # Optional transformation string to apply to the output video.
            # **Example**: `q-80`
            sig { returns(T.nilable(String)) }
            attr_reader :value

            sig { params(value: String).void }
            attr_writer :value

            sig do
              params(value: String, type: Symbol).returns(T.attached_class)
            end
            def self.new(
              # Optional transformation string to apply to the output video.
              # **Example**: `q-80`
              value: nil,
              # Converts an animated GIF into an MP4.
              type: :"gif-to-video"
            )
            end

            sig { override.returns({ type: Symbol, value: String }) }
            def to_hash
            end
          end

          class Thumbnail < Imagekitio::Internal::Type::BaseModel
            OrHash =
              T.type_alias do
                T.any(
                  Imagekitio::FileUploadParams::Transformation::Post::Thumbnail,
                  Imagekitio::Internal::AnyHash
                )
              end

            # Generates a thumbnail image.
            sig { returns(Symbol) }
            attr_accessor :type

            # Optional transformation string.
            # **Example**: `w-150,h-150`
            sig { returns(T.nilable(String)) }
            attr_reader :value

            sig { params(value: String).void }
            attr_writer :value

            sig do
              params(value: String, type: Symbol).returns(T.attached_class)
            end
            def self.new(
              # Optional transformation string.
              # **Example**: `w-150,h-150`
              value: nil,
              # Generates a thumbnail image.
              type: :thumbnail
            )
            end

            sig { override.returns({ type: Symbol, value: String }) }
            def to_hash
            end
          end

          class Abs < Imagekitio::Internal::Type::BaseModel
            OrHash =
              T.type_alias do
                T.any(
                  Imagekitio::FileUploadParams::Transformation::Post::Abs,
                  Imagekitio::Internal::AnyHash
                )
              end

            # Streaming protocol to use (`hls` or `dash`).
            sig do
              returns(
                Imagekitio::FileUploadParams::Transformation::Post::Abs::Protocol::OrSymbol
              )
            end
            attr_accessor :protocol

            # Adaptive Bitrate Streaming (ABS) setup.
            sig { returns(Symbol) }
            attr_accessor :type

            # List of different representations you want to create separated by an underscore.
            sig { returns(String) }
            attr_accessor :value

            sig do
              params(
                protocol:
                  Imagekitio::FileUploadParams::Transformation::Post::Abs::Protocol::OrSymbol,
                value: String,
                type: Symbol
              ).returns(T.attached_class)
            end
            def self.new(
              # Streaming protocol to use (`hls` or `dash`).
              protocol:,
              # List of different representations you want to create separated by an underscore.
              value:,
              # Adaptive Bitrate Streaming (ABS) setup.
              type: :abs
            )
            end

            sig do
              override.returns(
                {
                  protocol:
                    Imagekitio::FileUploadParams::Transformation::Post::Abs::Protocol::OrSymbol,
                  type: Symbol,
                  value: String
                }
              )
            end
            def to_hash
            end

            # Streaming protocol to use (`hls` or `dash`).
            module Protocol
              extend Imagekitio::Internal::Type::Enum

              TaggedSymbol =
                T.type_alias do
                  T.all(
                    Symbol,
                    Imagekitio::FileUploadParams::Transformation::Post::Abs::Protocol
                  )
                end
              OrSymbol = T.type_alias { T.any(Symbol, String) }

              HLS =
                T.let(
                  :hls,
                  Imagekitio::FileUploadParams::Transformation::Post::Abs::Protocol::TaggedSymbol
                )
              DASH =
                T.let(
                  :dash,
                  Imagekitio::FileUploadParams::Transformation::Post::Abs::Protocol::TaggedSymbol
                )

              sig do
                override.returns(
                  T::Array[
                    Imagekitio::FileUploadParams::Transformation::Post::Abs::Protocol::TaggedSymbol
                  ]
                )
              end
              def self.values
              end
            end
          end

          sig do
            override.returns(
              T::Array[
                Imagekitio::FileUploadParams::Transformation::Post::Variants
              ]
            )
          end
          def self.variants
          end
        end
      end
    end
  end
end
