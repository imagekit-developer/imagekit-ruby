# frozen_string_literal: true

module Imagekitio
  module Models
    module Accounts
      # @see Imagekitio::Resources::Accounts::Contract#get
      class ContractGetResponse < Imagekitio::Internal::Type::BaseModel
        # @!attribute has_contract
        #   Whether the account has an active contract. The other fields are present only
        #   when it does.
        #
        #   @return [Boolean]
        required :has_contract, Imagekitio::Internal::Type::Boolean, api_name: :hasContract

        # @!attribute as_of
        #   When `consumed` was last computed. `null` if it has not been computed for the
        #   contract yet; `consumed` is then all zeros.
        #
        #   @return [Time, nil]
        optional :as_of, Time, api_name: :asOf, nil?: true

        # @!attribute consumed
        #   Usage consumed in the current contract term. For an agency account, this
        #   includes the child accounts billed to it.
        #
        #   @return [Imagekitio::Models::Accounts::ContractUnits, nil]
        optional :consumed, -> { Imagekitio::Accounts::ContractUnits }

        # @!attribute contract_months
        #   Length of each contract term in months.
        #
        #   @return [Integer, nil]
        optional :contract_months, Integer, api_name: :contractMonths

        # @!attribute effective_contract_end_date
        #   End date of the current contract term.
        #
        #   @return [Date, nil]
        optional :effective_contract_end_date, Date, api_name: :effectiveContractEndDate

        # @!attribute effective_contract_start_date
        #   Start date of the current contract term. It moves forward when the contract
        #   renews.
        #
        #   @return [Date, nil]
        optional :effective_contract_start_date, Date, api_name: :effectiveContractStartDate

        # @!attribute original_contract_start_date
        #   Start date of the first contract term.
        #
        #   @return [Date, nil]
        optional :original_contract_start_date, Date, api_name: :originalContractStartDate

        # @!attribute quota
        #   Usage included in the current contract term.
        #
        #   @return [Imagekitio::Models::Accounts::ContractUnits, nil]
        optional :quota, -> { Imagekitio::Accounts::ContractUnits }

        # @!method initialize(has_contract:, as_of: nil, consumed: nil, contract_months: nil, effective_contract_end_date: nil, effective_contract_start_date: nil, original_contract_start_date: nil, quota: nil)
        #   Some parameter documentations has been truncated, see
        #   {Imagekitio::Models::Accounts::ContractGetResponse} for more details.
        #
        #   @param has_contract [Boolean] Whether the account has an active contract. The other fields are present only wh
        #
        #   @param as_of [Time, nil] When `consumed` was last computed. `null` if it has not been computed for the co
        #
        #   @param consumed [Imagekitio::Models::Accounts::ContractUnits] Usage consumed in the current contract term. For an agency account, this include
        #
        #   @param contract_months [Integer] Length of each contract term in months.
        #
        #   @param effective_contract_end_date [Date] End date of the current contract term.
        #
        #   @param effective_contract_start_date [Date] Start date of the current contract term. It moves forward when the contract rene
        #
        #   @param original_contract_start_date [Date] Start date of the first contract term.
        #
        #   @param quota [Imagekitio::Models::Accounts::ContractUnits] Usage included in the current contract term.
      end
    end
  end
end
