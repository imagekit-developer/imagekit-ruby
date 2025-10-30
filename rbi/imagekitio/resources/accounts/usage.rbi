# typed: strong

module Imagekitio
  module Resources
    class Accounts
      class Usage
        # Get the account usage information between two dates. Note that the API response
        # includes data from the start date while excluding data from the end date. In
        # other words, the data covers the period starting from the specified start date
        # up to, but not including, the end date.
        sig do
          params(
            end_date: Date,
            start_date: Date,
            request_options: Imagekitio::RequestOptions::OrHash
          ).returns(Imagekitio::Models::Accounts::UsageGetResponse)
        end
        def get(
          # Specify a `endDate` in `YYYY-MM-DD` format. It should be after the `startDate`.
          # The difference between `startDate` and `endDate` should be less than 90 days.
          end_date:,
          # Specify a `startDate` in `YYYY-MM-DD` format. It should be before the `endDate`.
          # The difference between `startDate` and `endDate` should be less than 90 days.
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
