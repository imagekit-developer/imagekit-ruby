# typed: strong

module Imagekit
  module Resources
    class Files
      class Details
        # This API returns an object with details or attributes about the current version
        # of the file.
        sig do
          params(
            file_id: String,
            request_options: Imagekit::RequestOptions::OrHash
          ).returns(Imagekit::Models::Files::DetailRetrieveResponse)
        end
        def retrieve(
          # The unique `fileId` of the uploaded file. `fileId` is returned in the list and
          # search assets API and upload API.
          file_id,
          request_options: {}
        )
        end

        # This API updates the details or attributes of the current version of the file.
        # You can update `tags`, `customCoordinates`, `customMetadata`, publication
        # status, remove existing `AITags` and apply extensions using this API.
        sig do
          params(
            file_id: String,
            custom_coordinates: T.nilable(String),
            custom_metadata: T.anything,
            extensions:
              T::Array[
                T.any(
                  Imagekit::Files::DetailUpdateParams::Extension::RemovedotBgExtension::OrHash,
                  Imagekit::Files::DetailUpdateParams::Extension::AutoTaggingExtension::OrHash
                )
              ],
            remove_ai_tags:
              T.any(
                T::Array[String],
                Imagekit::Files::DetailUpdateParams::RemoveAITags::OrSymbol
              ),
            tags: T.nilable(T::Array[String]),
            webhook_url: String,
            publish: Imagekit::Files::DetailUpdateParams::Publish::OrHash,
            request_options: Imagekit::RequestOptions::OrHash
          ).returns(Imagekit::Models::Files::DetailUpdateResponse)
        end
        def update(
          # The unique `fileId` of the uploaded file. `fileId` is returned in list and
          # search assets API and upload API.
          file_id,
          # Define an important area in the image in the format `x,y,width,height` e.g.
          # `10,10,100,100`. Send `null` to unset this value.
          custom_coordinates: nil,
          # A key-value data to be associated with the asset. To unset a key, send `null`
          # value for that key. Before setting any custom metadata on an asset you have to
          # create the field using custom metadata fields API.
          custom_metadata: nil,
          # Array of extensions to be applied to the asset. Each extension can be configured
          # with specific parameters based on the extension type.
          extensions: nil,
          # An array of AITags associated with the file that you want to remove, e.g.
          # `["car", "vehicle", "motorsports"]`.
          #
          # If you want to remove all AITags associated with the file, send a string -
          # "all".
          #
          # Note: The remove operation for `AITags` executes before any of the `extensions`
          # are processed.
          remove_ai_tags: nil,
          # An array of tags associated with the file, such as `["tag1", "tag2"]`. Send
          # `null` to unset all tags associated with the file.
          tags: nil,
          # The final status of extensions after they have completed execution will be
          # delivered to this endpoint as a POST request.
          # [Learn more](/docs/api-reference/digital-asset-management-dam/managing-assets/update-file-details#webhook-payload-structure)
          # about the webhook payload structure.
          webhook_url: nil,
          # Configure the publication status of a file and its versions.
          publish: nil,
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
end
