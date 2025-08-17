# frozen_string_literal: true

module Imagekit
  module Resources
    class Assets
      # Some parameter documentations has been truncated, see
      # {Imagekit::Models::AssetListParams} for more details.
      #
      # This API can list all the uploaded files and folders in your ImageKit.io media
      # library. In addition, you can fine-tune your query by specifying various filters
      # by generating a query string in a Lucene-like syntax and provide this generated
      # string as the value of the `searchQuery`.
      #
      # @overload list(file_type: nil, limit: nil, path: nil, search_query: nil, skip: nil, sort: nil, type: nil, request_options: {})
      #
      # @param file_type [Symbol, Imagekit::Models::AssetListParams::FileType] Filter results by file type.
      #
      # @param limit [Integer] The maximum number of results to return in response.
      #
      # @param path [String] Folder path if you want to limit the search within a specific folder. For exampl
      #
      # @param search_query [String] Query string in a Lucene-like query language e.g. `createdAt > "7d"`.
      #
      # @param skip [Integer] The number of results to skip before returning results.
      #
      # @param sort [Symbol, Imagekit::Models::AssetListParams::Sort] Sort the results by one of the supported fields in ascending or descending order
      #
      # @param type [Symbol, Imagekit::Models::AssetListParams::Type] Filter results by asset type.
      #
      # @param request_options [Imagekit::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Array<Imagekit::Models::AssetListResponseItem::FileDetails, Imagekit::Models::AssetListResponseItem::FolderDetails>]
      #
      # @see Imagekit::Models::AssetListParams
      def list(params = {})
        parsed, options = Imagekit::AssetListParams.dump_request(params)
        @client.request(
          method: :get,
          path: "v1/files",
          query: parsed.transform_keys(file_type: "fileType", search_query: "searchQuery"),
          model: Imagekit::Internal::Type::ArrayOf[union: Imagekit::Models::AssetListResponseItem],
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
