# frozen_string_literal: true

require_relative "../test_helper"

class HelperAuthenticationTest < Minitest::Test
  def test_should_return_correct_authentication_parameters_with_provided_token_and_expire
    private_key = "private_key_test"
    client = Imagekit::Client.new(private_key: private_key)

    token = "your_token"
    expire = 1_582_269_249

    params = client.helper.get_authentication_parameters(token: token, expire: expire)

    # Expected exact match with Node.js output
    expected_signature = "e71bcd6031016b060d349d212e23e85c791decdd"

    assert_equal(token, params[:token])
    assert_equal(expire, params[:expire])
    assert_equal(expected_signature, params[:signature])
  end

  def test_should_return_authentication_parameters_with_required_properties_when_no_params_provided
    private_key = "private_key_test"
    client = Imagekit::Client.new(private_key: private_key)

    params = client.helper.get_authentication_parameters

    # Check that all required properties exist
    assert(params.key?(:token), "Expected token parameter")
    assert(params.key?(:expire), "Expected expire parameter")
    assert(params.key?(:signature), "Expected signature parameter")

    # Token should be a 32-character hex string
    token = params[:token]
    assert_instance_of(String, token)
    assert_match(/^[0-9a-f]{32}$/, token, "Expected token to be 32-character hex format")

    # Expire should be a number greater than current time
    expire = params[:expire]
    assert_instance_of(Integer, expire)
    current_time = Time.now.to_i
    assert(expire > current_time, "Expected expire #{expire} to be greater than current time #{current_time}")

    # Signature should be a hex string (40 characters for HMAC-SHA1)
    signature = params[:signature]
    assert_instance_of(String, signature)
    assert_match(/^[a-f0-9]{40}$/, signature, "Expected signature to be 40 character hex string")
  end

  def test_should_handle_edge_case_with_expire_time_0
    private_key = "private_key_test"
    client = Imagekit::Client.new(private_key: private_key)

    token = "test-token"
    expire = 0

    params = client.helper.get_authentication_parameters(token: token, expire: expire)

    assert_equal(token, params[:token])

    # When expire is 0 (falsy), it should use default expire time (30 minutes from now)
    expire_result = params[:expire]
    assert_instance_of(Integer, expire_result)
    expected_expire = Time.now.to_i + (60 * 30)
    # Allow a 10 second tolerance for test execution time
    assert(
      expire_result >= expected_expire - 10 && expire_result <= expected_expire + 10,
      "Expected expire to be close to #{expected_expire} (30 minutes from now), got #{expire_result}"
    )

    # Signature should be a hex string (40 characters for HMAC-SHA1)
    signature = params[:signature]
    assert_instance_of(String, signature)
    assert_match(/^[a-f0-9]{40}$/, signature, "Expected signature to be 40 character hex string")
  end

  def test_should_handle_empty_string_token
    private_key = "private_key_test"
    client = Imagekit::Client.new(private_key: private_key)

    token = "" # Empty string is falsy
    expire = 1_582_269_249

    params = client.helper.get_authentication_parameters(token: token, expire: expire)

    # Since empty string is falsy, it should generate a token
    token_result = params[:token]
    assert_instance_of(String, token_result)
    refute_empty(token_result, "Expected token to be generated when empty string is provided")
    assert_match(/^[0-9a-f]{32}$/, token_result, "Expected generated token to be 32-character hex format")

    assert_equal(expire, params[:expire])

    # Signature should be a hex string (40 characters for HMAC-SHA1)
    signature = params[:signature]
    assert_instance_of(String, signature)
    assert_match(/^[a-f0-9]{40}$/, signature, "Expected signature to be 40 character hex string")
  end

  def test_should_raise_error_when_private_key_is_not_provided
    # Test with empty private key
    assert_raises(ArgumentError, "Expected error when private key is empty") do
      client = Imagekit::Client.new(private_key: "")
      client.helper.get_authentication_parameters(token: "test", expire: 123)
    end
  end

  def test_should_raise_error_when_private_key_is_nil
    # Test with nil private key
    assert_raises(ArgumentError, "Expected error when private key is nil") do
      client = Imagekit::Client.new(private_key: nil)
      client.helper.get_authentication_parameters(token: "test", expire: 123)
    end
  end
end
