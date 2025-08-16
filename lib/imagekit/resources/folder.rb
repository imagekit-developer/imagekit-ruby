# frozen_string_literal: true

module Imagekit
  module Resources
    class Folder
      # Some parameter documentations has been truncated, see
      # {Imagekit::Models::FolderCreateParams} for more details.
      #
      # This will create a new folder. You can specify the folder name and location of
      # the parent folder where this new folder should be created.
      #
      # @overload create(folder_name:, parent_folder_path:, request_options: {})
      #
      # @param folder_name [String] The folder will be created with this name.
      #
      # @param parent_folder_path [String] The folder where the new folder should be created, for root use `/` else the pat
      #
      # @param request_options [Imagekit::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Object]
      #
      # @see Imagekit::Models::FolderCreateParams
      def create(params)
        parsed, options = Imagekit::FolderCreateParams.dump_request(params)
        @client.request(
          method: :post,
          path: "v1/folder",
          body: parsed,
          model: Imagekit::Internal::Type::Unknown,
          options: options
        )
      end

      # Some parameter documentations has been truncated, see
      # {Imagekit::Models::FolderDeleteParams} for more details.
      #
      # This will delete a folder and all its contents permanently. The API returns an
      # empty response.
      #
      # @overload delete(folder_path:, request_options: {})
      #
      # @param folder_path [String] Full path to the folder you want to delete. For example `/folder/to/delete/`.
      #
      # @param request_options [Imagekit::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Object]
      #
      # @see Imagekit::Models::FolderDeleteParams
      def delete(params)
        parsed, options = Imagekit::FolderDeleteParams.dump_request(params)
        @client.request(
          method: :delete,
          path: "v1/folder",
          body: parsed,
          model: Imagekit::Internal::Type::Unknown,
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
