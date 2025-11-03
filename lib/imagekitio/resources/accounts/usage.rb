# frozen_string_literal: true

module Imagekitio
  module Resources
    class Accounts
      class Usage
        # Some parameter documentations has been truncated, see
        # {Imagekitio::Models::Accounts::UsageGetParams} for more details.
        #
        # Get the account usage information between two dates. Note that the API response
        # includes data from the start date while excluding data from the end date. In
        # other words, the data covers the period starting from the specified start date
        # up to, but not including, the end date.
        #
        # @overload get(end_date:, start_date:, request_options: {})
        #
        # @param end_date [Date] Specify a `endDate` in `YYYY-MM-DD` format. It should be after the `startDate`.
        #
        # @param start_date [Date] Specify a `startDate` in `YYYY-MM-DD` format. It should be before the `endDate`.
        #
        # @param request_options [Imagekitio::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [Imagekitio::Models::Accounts::UsageGetResponse]
        #
        # @see Imagekitio::Models::Accounts::UsageGetParams
        def get(params)
          parsed, options = Imagekitio::Accounts::UsageGetParams.dump_request(params)
          @client.request(
            method: :get,
            path: "v1/accounts/usage",
            query: parsed.transform_keys(end_date: "endDate", start_date: "startDate"),
            model: Imagekitio::Models::Accounts::UsageGetResponse,
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
