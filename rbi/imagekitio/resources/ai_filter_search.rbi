# typed: strong

module Imagekitio
  module Resources
    class AIFilterSearch
      # Convert a natural-language prompt into a structured ImageKit media-library
      # search query. The response returns a `searchQuery` string (the same Lucene-like
      # syntax accepted by the list and search assets API) plus suggested filter
      # parameters. This endpoint only generates the query; it does not execute the
      # search.
      sig do
        params(
          prompt: String,
          current_folder: String,
          timezone: String,
          request_options: Imagekitio::RequestOptions::OrHash
        ).returns(Imagekitio::Models::AIFilterSearchCreateResponse)
      end
      def create(
        # Natural-language description of what to search for, e.g. "red dresses tagged
        # summer uploaded last month".
        prompt:,
        # Absolute path of the folder the user is currently in. Used to resolve relative
        # references like "this folder" in the prompt.
        current_folder: nil,
        # IANA timezone (e.g. `Asia/Kolkata`) used to resolve relative date references in
        # the prompt. Defaults to UTC when omitted.
        timezone: nil,
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
