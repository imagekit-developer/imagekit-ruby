# frozen_string_literal: true

module Imagekitio
  module Resources
    class Tags
      # Some parameter documentations has been truncated, see
      # {Imagekitio::Models::TagListParams} for more details.
      #
      # This API lists the distinct tags in use across your media library, with the
      # number of assets each tag is applied to and when it was last used. Tags are
      # matched case-insensitively, so `Summer` and `summer` are one entry: `name` is
      # the lowercased form and `label` is the spelling that was used most recently.
      #
      # Use `tagSource` and `fileType` to list only the tags in use on matching assets.
      # `lastUsedAt` and the `ASC_LAST_USED` / `DESC_LAST_USED` sorts follow those
      # filters, while `assetCount` always counts every asset carrying the tag. Use
      # `search` or `prefix` to narrow the listing and `cursor` to page through it.
      #
      # Tag counts are updated asynchronously. Changes to a file's tags usually appear
      # in this list within about a minute, but can take longer during heavy tagging
      # activity, so a tag you just added or removed may not be reflected immediately.
      #
      # @overload list(cursor: nil, file_type: nil, limit: nil, prefix: nil, search: nil, sort: nil, tag_source: nil, request_options: {})
      #
      # @param cursor [String] The `nextCursor` value from the previous response, to fetch the next page. A cur
      #
      # @param file_type [Symbol, Imagekitio::Models::TagListParams::FileType] Filter tags by the type of asset they are applied to.
      #
      # @param limit [Integer] The maximum number of tags to return in response.
      #
      # @param prefix [String] Only return tags that begin with this value. Matching is case-insensitive.
      #
      # @param search [String] Only return tags that contain this text. Every word in the value must appear in
      #
      # @param sort [Symbol, Imagekitio::Models::TagListParams::Sort] Sort the results.
      #
      # @param tag_source [Symbol, Imagekitio::Models::TagListParams::TagSource] Filter tags by who added them.
      #
      # @param request_options [Imagekitio::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Imagekitio::Models::TagListResponse]
      #
      # @see Imagekitio::Models::TagListParams
      def list(params = {})
        parsed, options = Imagekitio::TagListParams.dump_request(params)
        query = Imagekitio::Internal::Util.encode_query_params(parsed)
        @client.request(
          method: :get,
          path: "v1/tags",
          query: query.transform_keys(file_type: "fileType", tag_source: "tagSource"),
          model: Imagekitio::Models::TagListResponse,
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
