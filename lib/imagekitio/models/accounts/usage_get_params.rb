# frozen_string_literal: true

module Imagekitio
  module Models
    module Accounts
      # @see Imagekitio::Resources::Accounts::Usage#get
      class UsageGetParams < Imagekitio::Internal::Type::BaseModel
        extend Imagekitio::Internal::Type::RequestParameters::Converter
        include Imagekitio::Internal::Type::RequestParameters

        # @!attribute end_date
        #   Specify a `endDate` in `YYYY-MM-DD` format. It should be after the `startDate`.
        #   The difference between `startDate` and `endDate` should be less than 90 days.
        #
        #   @return [Date]
        required :end_date, Date

        # @!attribute start_date
        #   Specify a `startDate` in `YYYY-MM-DD` format. It should be before the `endDate`.
        #   The difference between `startDate` and `endDate` should be less than 90 days.
        #
        #   @return [Date]
        required :start_date, Date

        # @!method initialize(end_date:, start_date:, request_options: {})
        #   Some parameter documentations has been truncated, see
        #   {Imagekitio::Models::Accounts::UsageGetParams} for more details.
        #
        #   @param end_date [Date] Specify a `endDate` in `YYYY-MM-DD` format. It should be after the `startDate`.
        #
        #   @param start_date [Date] Specify a `startDate` in `YYYY-MM-DD` format. It should be before the `endDate`.
        #
        #   @param request_options [Imagekitio::RequestOptions, Hash{Symbol=>Object}]
      end
    end
  end
end
