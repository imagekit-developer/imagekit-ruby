# frozen_string_literal: true

module Imagekitio
  module Resources
    class Accounts
      class UsageAnalytics
        # Some parameter documentations has been truncated, see
        # {Imagekitio::Models::Accounts::UsageAnalyticsGetParams} for more details.
        #
        # **Note:** This API is currently in beta.
        #
        # Get the account analytics data between two dates. The response covers the period
        # from the start date to the end date, both dates inclusive. Both dates are
        # interpreted as UTC calendar days.
        #
        # The returned data is scoped to the requesting account only. Unlike
        # `/v1/accounts/usage`, an agency account's analytics are not aggregated across
        # its child accounts.
        #
        # The response is cached for 5 minutes per account and date range. Use
        # `generatedAt` to check how fresh the returned data is.
        #
        # @overload get(end_date:, start_date:, request_options: {})
        #
        # @param end_date [Date] Specify an `endDate` in `YYYY-MM-DD` format, interpreted as a UTC calendar day.
        #
        # @param start_date [Date] Specify a `startDate` in `YYYY-MM-DD` format, interpreted as a UTC calendar day.
        #
        # @param request_options [Imagekitio::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [Imagekitio::Models::Accounts::UsageAnalyticsResponse]
        #
        # @see Imagekitio::Models::Accounts::UsageAnalyticsGetParams
        def get(params)
          parsed, options = Imagekitio::Accounts::UsageAnalyticsGetParams.dump_request(params)
          query = Imagekitio::Internal::Util.encode_query_params(parsed)
          @client.request(
            method: :get,
            path: "v1/accounts/usage-analytics",
            query: query.transform_keys(end_date: "endDate", start_date: "startDate"),
            model: Imagekitio::Accounts::UsageAnalyticsResponse,
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
