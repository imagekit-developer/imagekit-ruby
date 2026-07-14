# typed: strong

module Imagekitio
  module Resources
    class Accounts
      class UsageAnalytics
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
        sig do
          params(
            end_date: Date,
            start_date: Date,
            request_options: Imagekitio::RequestOptions::OrHash
          ).returns(Imagekitio::Accounts::UsageAnalyticsResponse)
        end
        def get(
          # Specify an `endDate` in `YYYY-MM-DD` format, interpreted as a UTC calendar day.
          # It should be after the `startDate`. The difference between `startDate` and
          # `endDate` should be less than 90 days.
          end_date:,
          # Specify a `startDate` in `YYYY-MM-DD` format, interpreted as a UTC calendar day.
          # It should be before the `endDate`. The difference between `startDate` and
          # `endDate` should be less than 90 days.
          start_date:,
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
end
