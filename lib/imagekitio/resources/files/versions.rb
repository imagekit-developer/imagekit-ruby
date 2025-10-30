# frozen_string_literal: true

module Imagekitio
  module Resources
    class Files
      class Versions
        # Some parameter documentations has been truncated, see
        # {Imagekitio::Models::Files::VersionListParams} for more details.
        #
        # This API returns details of all versions of a file.
        #
        # @overload list(file_id, request_options: {})
        #
        # @param file_id [String] The unique `fileId` of the uploaded file. `fileId` is returned in list and searc
        #
        # @param request_options [Imagekitio::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [Array<Imagekitio::Models::File>]
        #
        # @see Imagekitio::Models::Files::VersionListParams
        def list(file_id, params = {})
          @client.request(
            method: :get,
            path: ["v1/files/%1$s/versions", file_id],
            model: Imagekitio::Internal::Type::ArrayOf[Imagekitio::File],
            options: params[:request_options]
          )
        end

        # Some parameter documentations has been truncated, see
        # {Imagekitio::Models::Files::VersionDeleteParams} for more details.
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
        # @param request_options [Imagekitio::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [Imagekitio::Models::Files::VersionDeleteResponse]
        #
        # @see Imagekitio::Models::Files::VersionDeleteParams
        def delete(version_id, params)
          parsed, options = Imagekitio::Files::VersionDeleteParams.dump_request(params)
          file_id =
            parsed.delete(:file_id) do
              raise ArgumentError.new("missing required path argument #{_1}")
            end
          @client.request(
            method: :delete,
            path: ["v1/files/%1$s/versions/%2$s", file_id, version_id],
            model: Imagekitio::Models::Files::VersionDeleteResponse,
            options: options
          )
        end

        # Some parameter documentations has been truncated, see
        # {Imagekitio::Models::Files::VersionGetParams} for more details.
        #
        # This API returns an object with details or attributes of a file version.
        #
        # @overload get(version_id, file_id:, request_options: {})
        #
        # @param version_id [String] The unique `versionId` of the uploaded file. `versionId` is returned in list and
        #
        # @param file_id [String] The unique `fileId` of the uploaded file. `fileId` is returned in list and searc
        #
        # @param request_options [Imagekitio::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [Imagekitio::Models::File]
        #
        # @see Imagekitio::Models::Files::VersionGetParams
        def get(version_id, params)
          parsed, options = Imagekitio::Files::VersionGetParams.dump_request(params)
          file_id =
            parsed.delete(:file_id) do
              raise ArgumentError.new("missing required path argument #{_1}")
            end
          @client.request(
            method: :get,
            path: ["v1/files/%1$s/versions/%2$s", file_id, version_id],
            model: Imagekitio::File,
            options: options
          )
        end

        # Some parameter documentations has been truncated, see
        # {Imagekitio::Models::Files::VersionRestoreParams} for more details.
        #
        # This API restores a file version as the current file version.
        #
        # @overload restore(version_id, file_id:, request_options: {})
        #
        # @param version_id [String] The unique `versionId` of the uploaded file. `versionId` is returned in list and
        #
        # @param file_id [String] The unique `fileId` of the uploaded file. `fileId` is returned in list and searc
        #
        # @param request_options [Imagekitio::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [Imagekitio::Models::File]
        #
        # @see Imagekitio::Models::Files::VersionRestoreParams
        def restore(version_id, params)
          parsed, options = Imagekitio::Files::VersionRestoreParams.dump_request(params)
          file_id =
            parsed.delete(:file_id) do
              raise ArgumentError.new("missing required path argument #{_1}")
            end
          @client.request(
            method: :put,
            path: ["v1/files/%1$s/versions/%2$s/restore", file_id, version_id],
            model: Imagekitio::File,
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
