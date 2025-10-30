# typed: strong

module Imagekitio
  module Models
    module Accounts
      class UsageGetParams < Imagekitio::Internal::Type::BaseModel
        extend Imagekitio::Internal::Type::RequestParameters::Converter
        include Imagekitio::Internal::Type::RequestParameters

        OrHash =
          T.type_alias do
            T.any(
              Imagekitio::Accounts::UsageGetParams,
              Imagekitio::Internal::AnyHash
            )
          end

        # Specify a `endDate` in `YYYY-MM-DD` format. It should be after the `startDate`.
        # The difference between `startDate` and `endDate` should be less than 90 days.
        sig { returns(Date) }
        attr_accessor :end_date

        # Specify a `startDate` in `YYYY-MM-DD` format. It should be before the `endDate`.
        # The difference between `startDate` and `endDate` should be less than 90 days.
        sig { returns(Date) }
        attr_accessor :start_date

        sig do
          params(
            end_date: Date,
            start_date: Date,
            request_options: Imagekitio::RequestOptions::OrHash
          ).returns(T.attached_class)
        end
        def self.new(
          # Specify a `endDate` in `YYYY-MM-DD` format. It should be after the `startDate`.
          # The difference between `startDate` and `endDate` should be less than 90 days.
          end_date:,
          # Specify a `startDate` in `YYYY-MM-DD` format. It should be before the `endDate`.
          # The difference between `startDate` and `endDate` should be less than 90 days.
          start_date:,
          request_options: {}
        )
        end

        sig do
          override.returns(
            {
              end_date: Date,
              start_date: Date,
              request_options: Imagekitio::RequestOptions
            }
          )
        end
        def to_hash
        end
      end
    end
  end
end
