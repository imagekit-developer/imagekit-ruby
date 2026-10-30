# typed: strong

module Imagekitio
  module Models
    module Accounts
      class ContractGetResponse < Imagekitio::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Imagekitio::Models::Accounts::ContractGetResponse,
              Imagekitio::Internal::AnyHash
            )
          end

        # Whether the account has an active contract. The other fields are present only
        # when it does.
        sig { returns(T::Boolean) }
        attr_accessor :has_contract

        # When `consumed` was last computed. `null` if it has not been computed for the
        # contract yet; `consumed` is then all zeros.
        sig { returns(T.nilable(Time)) }
        attr_accessor :as_of

        # Usage consumed in the current contract term. For an agency account, this
        # includes the child accounts billed to it.
        sig { returns(T.nilable(Imagekitio::Accounts::ContractUnits)) }
        attr_reader :consumed

        sig do
          params(consumed: Imagekitio::Accounts::ContractUnits::OrHash).void
        end
        attr_writer :consumed

        # Length of each contract term in months.
        sig { returns(T.nilable(Integer)) }
        attr_reader :contract_months

        sig { params(contract_months: Integer).void }
        attr_writer :contract_months

        # End date of the current contract term.
        sig { returns(T.nilable(Date)) }
        attr_reader :effective_contract_end_date

        sig { params(effective_contract_end_date: Date).void }
        attr_writer :effective_contract_end_date

        # Start date of the current contract term. It moves forward when the contract
        # renews.
        sig { returns(T.nilable(Date)) }
        attr_reader :effective_contract_start_date

        sig { params(effective_contract_start_date: Date).void }
        attr_writer :effective_contract_start_date

        # Start date of the first contract term.
        sig { returns(T.nilable(Date)) }
        attr_reader :original_contract_start_date

        sig { params(original_contract_start_date: Date).void }
        attr_writer :original_contract_start_date

        # Usage included in the current contract term.
        sig { returns(T.nilable(Imagekitio::Accounts::ContractUnits)) }
        attr_reader :quota

        sig { params(quota: Imagekitio::Accounts::ContractUnits::OrHash).void }
        attr_writer :quota

        sig do
          params(
            has_contract: T::Boolean,
            as_of: T.nilable(Time),
            consumed: Imagekitio::Accounts::ContractUnits::OrHash,
            contract_months: Integer,
            effective_contract_end_date: Date,
            effective_contract_start_date: Date,
            original_contract_start_date: Date,
            quota: Imagekitio::Accounts::ContractUnits::OrHash
          ).returns(T.attached_class)
        end
        def self.new(
          # Whether the account has an active contract. The other fields are present only
          # when it does.
          has_contract:,
          # When `consumed` was last computed. `null` if it has not been computed for the
          # contract yet; `consumed` is then all zeros.
          as_of: nil,
          # Usage consumed in the current contract term. For an agency account, this
          # includes the child accounts billed to it.
          consumed: nil,
          # Length of each contract term in months.
          contract_months: nil,
          # End date of the current contract term.
          effective_contract_end_date: nil,
          # Start date of the current contract term. It moves forward when the contract
          # renews.
          effective_contract_start_date: nil,
          # Start date of the first contract term.
          original_contract_start_date: nil,
          # Usage included in the current contract term.
          quota: nil
        )
        end

        sig do
          override.returns(
            {
              has_contract: T::Boolean,
              as_of: T.nilable(Time),
              consumed: Imagekitio::Accounts::ContractUnits,
              contract_months: Integer,
              effective_contract_end_date: Date,
              effective_contract_start_date: Date,
              original_contract_start_date: Date,
              quota: Imagekitio::Accounts::ContractUnits
            }
          )
        end
        def to_hash
        end
      end
    end
  end
end
