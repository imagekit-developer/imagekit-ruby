# frozen_string_literal: true

module Imagekit
  module Resources
    class Files
      class Versions
        # Some parameter documentations has been truncated, see
        # {Imagekit::Models::Files::VersionListParams} for more details.
        #
        # This API returns details of all versions of a file.
        #
        # @overload list(file_id, request_options: {})
        #
        # @param file_id [String] The unique `fileId` of the uploaded file. `fileId` is returned in list and searc
        #
        # @param request_options [Imagekit::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [Array<Imagekit::Models::Files::VersionListResponseItem>]
        #
        # @see Imagekit::Models::Files::VersionListParams
        def list(file_id, params = {})
          @client.request(
            method: :get,
            path: ["v1/files/%1$s/versions", file_id],
            model: Imagekit::Internal::Type::ArrayOf[Imagekit::Models::Files::VersionListResponseItem],
            options: params[:request_options]
          )
        end

        # Some parameter documentations has been truncated, see
        # {Imagekit::Models::Files::VersionDeleteParams} for more details.
        #
        # This API deletes a non-current file version permanently. The API returns an
        # empty response.
        #
        # Note: If you want to delete all versions of a file, use the delete file API.
        #
        # @overload delete(version_id, file_id:, request_options: {})
        #
        # @param version_id [String] The unique `versionId` of the uploaded file. `versionId` is returned in list and
        #
        # @param file_id [String] The unique `fileId` of the uploaded file. `fileId` is returned in list and searc
        #
        # @param request_options [Imagekit::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [Object]
        #
        # @see Imagekit::Models::Files::VersionDeleteParams
        def delete(version_id, params)
          parsed, options = Imagekit::Files::VersionDeleteParams.dump_request(params)
          file_id =
            parsed.delete(:file_id) do
              raise ArgumentError.new("missing required path argument #{_1}")
            end
          @client.request(
            method: :delete,
            path: ["v1/files/%1$s/versions/%2$s", file_id, version_id],
            model: Imagekit::Internal::Type::Unknown,
            options: options
          )
        end

        # Some parameter documentations has been truncated, see
        # {Imagekit::Models::Files::VersionGetParams} for more details.
        #
        # This API returns an object with details or attributes of a file version.
        #
        # @overload get(version_id, file_id:, request_options: {})
        #
        # @param version_id [String] The unique `versionId` of the uploaded file. `versionId` is returned in list and
        #
        # @param file_id [String] The unique `fileId` of the uploaded file. `fileId` is returned in list and searc
        #
        # @param request_options [Imagekit::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [Imagekit::Models::Files::VersionGetResponse]
        #
        # @see Imagekit::Models::Files::VersionGetParams
        def get(version_id, params)
          parsed, options = Imagekit::Files::VersionGetParams.dump_request(params)
          file_id =
            parsed.delete(:file_id) do
              raise ArgumentError.new("missing required path argument #{_1}")
            end
          @client.request(
            method: :get,
            path: ["v1/files/%1$s/versions/%2$s", file_id, version_id],
            model: Imagekit::Models::Files::VersionGetResponse,
            options: options
          )
        end

        # Some parameter documentations has been truncated, see
        # {Imagekit::Models::Files::VersionRestoreParams} for more details.
        #
        # This API restores a file version as the current file version.
        #
        # @overload restore(version_id, file_id:, request_options: {})
        #
        # @param version_id [String] The unique `versionId` of the uploaded file. `versionId` is returned in list and
        #
        # @param file_id [String] The unique `fileId` of the uploaded file. `fileId` is returned in list and searc
        #
        # @param request_options [Imagekit::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [Imagekit::Models::Files::VersionRestoreResponse]
        #
        # @see Imagekit::Models::Files::VersionRestoreParams
        def restore(version_id, params)
          parsed, options = Imagekit::Files::VersionRestoreParams.dump_request(params)
          file_id =
            parsed.delete(:file_id) do
              raise ArgumentError.new("missing required path argument #{_1}")
            end
          @client.request(
            method: :put,
            path: ["v1/files/%1$s/versions/%2$s/restore", file_id, version_id],
            model: Imagekit::Models::Files::VersionRestoreResponse,
            options: options
          )
        end

        # @api private
        #
        # @param client [Imagekit::Client]
        def initialize(client:)
          @client = client
        end
      end
    end
  end
end
