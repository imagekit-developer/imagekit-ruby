# frozen_string_literal: true

module Imagekitio
  module Resources
    class AIFilterSearch
      # Some parameter documentations has been truncated, see
      # {Imagekitio::Models::AIFilterSearchCreateParams} for more details.
      #
      # Convert a natural-language prompt into a structured ImageKit media-library
      # search query. The response returns a `searchQuery` string (the same Lucene-like
      # syntax accepted by the list and search assets API) plus suggested filter
      # parameters. This endpoint only generates the query; it does not execute the
      # search.
      #
      # @overload create(prompt:, current_folder: nil, timezone: nil, request_options: {})
      #
      # @param prompt [String] Natural-language description of what to search for, e.g. "red dresses tagged sum
      #
      # @param current_folder [String] Absolute path of the folder the user is currently in. Used to resolve relative r
      #
      # @param timezone [String] IANA timezone (e.g. `Asia/Kolkata`) used to resolve relative date references in
      #
      # @param request_options [Imagekitio::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Imagekitio::Models::AIFilterSearchCreateResponse]
      #
      # @see Imagekitio::Models::AIFilterSearchCreateParams
      def create(params)
        parsed, options = Imagekitio::AIFilterSearchCreateParams.dump_request(params)
        @client.request(
          method: :post,
          path: "v1/ai-filter-search",
          body: parsed,
          model: Imagekitio::Models::AIFilterSearchCreateResponse,
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
