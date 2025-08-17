# typed: strong

module Imagekit
  module Resources
    class Files
      class Metadata
        # You can programmatically get image EXIF, pHash, and other metadata for uploaded
        # files in the ImageKit.io media library using this API.
        #
        # You can also get the metadata in upload API response by passing `metadata` in
        # `responseFields` parameter.
        sig do
          params(
            file_id: String,
            request_options: Imagekit::RequestOptions::OrHash
          ).returns(Imagekit::Models::Files::MetadataGetResponse)
        end
        def get(
          # The unique `fileId` of the uploaded file. `fileId` is returned in the list and
          # search assets API and upload API.
          file_id,
          request_options: {}
        )
        end

        # Get image EXIF, pHash, and other metadata from ImageKit.io powered remote URL
        # using this API.
        sig do
          params(
            url: String,
            request_options: Imagekit::RequestOptions::OrHash
          ).returns(Imagekit::Models::Files::MetadataGetFromURLResponse)
        end
        def get_from_url(
          # Should be a valid file URL. It should be accessible using your ImageKit.io
          # account.
          url:,
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
