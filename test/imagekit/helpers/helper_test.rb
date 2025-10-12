# frozen_string_literal: true

require_relative "../test_helper"

class HelperTest < Minitest::Test
  def setup
    @client = Imagekit::Client.new(
      private_key: "test_private_key",
      password: "test_password"
    )
    @helper = Imagekit::Helpers::Helper.new(client: @client)
  end

  def test_build_url
    result = @helper.build_url([])
    assert_instance_of(String, result)
    assert_equal("https://ik.imagekit.io/your_imagekit_id/sample-image.jpg?tr=w-400,h-300", result)
  end

  def test_build_transformation_string
    result = @helper.build_transformation_string([])
    assert_instance_of(String, result)
    assert_equal("w-400,h-300", result)
  end

  def test_get_authentication_parameters
    result = @helper.get_authentication_parameters("test_token", 1800)
    assert_instance_of(Hash, result)
    assert_equal("test_token", result[:token])
    assert_equal(1800, result[:expire])
    assert_equal("dummy_signature", result[:signature])
  end
end
