# typed: strong

module Imagekitio
  module Resources
    class Files
      class Versions
        # This API returns details of all versions of a file.
        sig do
          params(
            file_id: String,
            request_options: Imagekitio::RequestOptions::OrHash
          ).returns(T::Array[Imagekitio::File])
        end
        def list(
          # The unique `fileId` of the uploaded file. `fileId` is returned in list and
          # search assets API and upload API.
          file_id,
          request_options: {}
        )
        end

        # This API deletes a non-current file version permanently. The API returns an
        # empty response.
        #
        # Note: If you want to delete all versions of a file, use the delete file API.
        sig do
          params(
            version_id: String,
            file_id: String,
            request_options: Imagekitio::RequestOptions::OrHash
          ).returns(Imagekitio::Models::Files::VersionDeleteResponse)
        end
        def delete(
          # The unique `versionId` of the uploaded file. `versionId` is returned in list and
          # search assets API and upload API.
          version_id,
          # The unique `fileId` of the uploaded file. `fileId` is returned in list and
          # search assets API and upload API.
          file_id:,
          request_options: {}
        )
        end

        # This API returns an object with details or attributes of a file version.
        sig do
          params(
            version_id: String,
            file_id: String,
            request_options: Imagekitio::RequestOptions::OrHash
          ).returns(Imagekitio::File)
        end
        def get(
          # The unique `versionId` of the uploaded file. `versionId` is returned in list and
          # search assets API and upload API.
          version_id,
          # The unique `fileId` of the uploaded file. `fileId` is returned in list and
          # search assets API and upload API.
          file_id:,
          request_options: {}
        )
        end

        # This API restores a file version as the current file version.
        sig do
          params(
            version_id: String,
            file_id: String,
            request_options: Imagekitio::RequestOptions::OrHash
          ).returns(Imagekitio::File)
        end
        def restore(
          # The unique `versionId` of the uploaded file. `versionId` is returned in list and
          # search assets API and upload API.
          version_id,
          # The unique `fileId` of the uploaded file. `fileId` is returned in list and
          # search assets API and upload API.
          file_id:,
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
