require_relative './helper'
require "rspec/autorun"

RSpec.describe "CalculationTest" do

    it "is_valid_hex_with_valid_hex" do
        result=is_valid_hex('f06830ca9f1e3e90')
        expect(true).to eq(result)
    end

    it "is_valid_hex_with_invalid_hex" do
        result=is_valid_hex('f06830ca9f1e3e90$')
        expect(false).to eq(result)
    end

    it "hamming_distance_test_expect_0" do
        result=hamming_distance('f06830ca9f1e3e90','f06830ca9f1e3e90')
        expect(0).to  eq(result)
    end

    it "hamming_distance_test_expect_17" do
        result=hamming_distance('2d5ad3936d2e015b','2d6ed293db36a4fb')
        expect(17).to  eq(result)
    end

    it "hamming_distance_test_expect_37" do
        result=hamming_distance('a4a65595ac94518b','7838873e791f8400')
        expect(37).to  eq(result)
    end

    it "get_authenticated_params_test_with_nil_expire_nill_token" do
        allow(OpenSSL::HMAC).to receive(:hexdigest).and_return('my_signature')
        result=get_authenticated_params(nil,nil,'private_key')
        expect(nil).not_to eq(result[:token])
        expect(nil).not_to eq(result[:expire])
        expect('my_signature').to eq(result[:signature])
    end

    it "get_authenticated_params_test_with_nil_expire" do
        allow(OpenSSL::HMAC).to receive(:hexdigest).and_return('my_signature')
        result=get_authenticated_params('my_token',nil,'private_key')
        expect('my_token').to eq(result[:token])
        expect(nil).not_to eq(result[:expire])
        expect('my_signature').to eq(result[:signature])
    end

    it "get_authenticated_params_test_with_hard_coded_params" do
        result=get_authenticated_params('your_token',1582269249,'private_key_test')
        expect('your_token').to eq(result[:token])
        expect(nil).not_to eq(result[:expire])
        expect('e71bcd6031016b060d349d212e23e85c791decdd').to eq(result[:signature])
    end

    it "get_authenticated_params_test_with_nil_token" do
        allow(OpenSSL::HMAC).to receive(:hexdigest).and_return('my_signature')
        result=get_authenticated_params(nil,nil,'private_key')
        expect(nil).not_to eq(result[:token])
        expect(nil).not_to eq(result[:expire])
        expect('my_signature').to eq(result[:signature])
    end

    it "get_authenticated_params_test_with_nil_private_key" do
        allow(OpenSSL::HMAC).to receive(:hexdigest).and_return('my_signature')
        result=get_authenticated_params('your_token', 1582269249, nil)
        expect(result).to eq(nil)
    end
end
