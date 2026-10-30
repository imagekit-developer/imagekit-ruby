# frozen_string_literal: true

require_relative "../../test_helper"

class Imagekitio::Test::Resources::Accounts::ContractTest < Imagekitio::Test::ResourceTest
  def test_get
    skip("Mock server tests are disabled")

    response = @image_kit.accounts.contract.get

    assert_pattern do
      response => Imagekitio::Models::Accounts::ContractGetResponse
    end

    assert_pattern do
      response => {
        has_contract: Imagekitio::Internal::Type::Boolean,
        as_of: Time | nil,
        consumed: Imagekitio::Accounts::ContractUnits | nil,
        contract_months: Integer | nil,
        effective_contract_end_date: Date | nil,
        effective_contract_start_date: Date | nil,
        original_contract_start_date: Date | nil,
        quota: Imagekitio::Accounts::ContractUnits | nil
      }
    end
  end
end
