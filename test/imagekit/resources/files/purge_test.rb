# frozen_string_literal: true

require_relative "../../test_helper"

class Imagekit::Test::Resources::Files::PurgeTest < Imagekit::Test::ResourceTest
  def test_execute_required_params
    skip("Prism tests are disabled")

    response =
      @image_kit.files.purge.execute(url: "https://ik.imagekit.io/your_imagekit_id/default-image.jpg")

    assert_pattern do
      response => Imagekit::Models::Files::PurgeExecuteResponse
    end

    assert_pattern do
      response => {
        request_id: String | nil
      }
    end
  end

  def test_status
    skip("Prism tests are disabled")

    response = @image_kit.files.purge.status("requestId")

    assert_pattern do
      response => Imagekit::Models::Files::PurgeStatusResponse
    end

    assert_pattern do
      response => {
        status: Imagekit::Models::Files::PurgeStatusResponse::Status | nil
      }
    end
  end
end
