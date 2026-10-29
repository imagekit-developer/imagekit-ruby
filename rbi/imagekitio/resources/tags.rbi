# typed: strong

module Imagekitio
  module Resources
    class Tags
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
      sig do
        params(
          cursor: String,
          file_type: Imagekitio::TagListParams::FileType::OrSymbol,
          limit: Integer,
          prefix: String,
          search: String,
          sort: Imagekitio::TagListParams::Sort::OrSymbol,
          tag_source: Imagekitio::TagListParams::TagSource::OrSymbol,
          request_options: Imagekitio::RequestOptions::OrHash
        ).returns(Imagekitio::Models::TagListResponse)
      end
      def list(
        # The `nextCursor` value from the previous response, to fetch the next page. A
        # cursor is bound to the `tagSource`, `fileType`, `sort`, `search` and `prefix` it
        # was issued with; sending it with different values returns a 400.
        cursor: nil,
        # Filter tags by the type of asset they are applied to.
        #
        # - `image` — tags in use on images
        # - `video` — tags in use on videos
        # - `static` — tags in use on any other file, such as documents, scripts and
        #   stylesheets
        # - `all` — tags in use on any asset
        file_type: nil,
        # The maximum number of tags to return in response.
        limit: nil,
        # Only return tags that begin with this value. Matching is case-insensitive.
        prefix: nil,
        # Only return tags that contain this text. Every word in the value must appear in
        # the tag and the last word may be incomplete, which suits search-as-you-type.
        # Matching is case-insensitive.
        search: nil,
        # Sort the results.
        #
        # - `ASC_NAME` / `DESC_NAME` — by `name`
        # - `ASC_LAST_USED` / `DESC_LAST_USED` — by `lastUsedAt` within the requested
        #   `tagSource` and `fileType`, ties broken by `name`
        sort: nil,
        # Filter tags by who added them.
        #
        # - `user` — tags added by users through the dashboard or the API
        # - `ai` — tags added by AI auto-tagging extensions
        # - `all` — both
        tag_source: nil,
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
