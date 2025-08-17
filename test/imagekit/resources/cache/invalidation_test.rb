# frozen_string_literal: true

require_relative "../../test_helper"

class Imagekit::Test::Resources::Cache::InvalidationTest < Imagekit::Test::ResourceTest
  def test_create_required_params
    skip("Prism tests are disabled")

    response =
      @image_kit.cache.invalidation.create(url: "https://ik.imagekit.io/your_imagekit_id/default-image.jpg")

    assert_pattern do
      response => Imagekit::Models::Cache::InvalidationCreateResponse
    end

    assert_pattern do
      response => {
        request_id: String | nil
      }
    end
  end

  def test_get
    skip("Prism tests are disabled")

    response = @image_kit.cache.invalidation.get("requestId")

    assert_pattern do
      response => Imagekit::Models::Cache::InvalidationGetResponse
    end

    assert_pattern do
      response => {
        status: Imagekit::Models::Cache::InvalidationGetResponse::Status | nil
      }
    end
  end
end
