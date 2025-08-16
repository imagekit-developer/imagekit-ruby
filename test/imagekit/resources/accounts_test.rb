# frozen_string_literal: true

require_relative "../test_helper"

class Imagekit::Test::Resources::AccountsTest < Imagekit::Test::ResourceTest
  def test_get_usage_required_params
    skip("Prism tests are disabled")

    response = @image_kit.accounts.get_usage(end_date: "2019-12-27", start_date: "2019-12-27")

    assert_pattern do
      response => Imagekit::Models::AccountGetUsageResponse
    end

    assert_pattern do
      response => {
        bandwidth_bytes: Integer | nil,
        extension_units_count: Integer | nil,
        media_library_storage_bytes: Integer | nil,
        original_cache_storage_bytes: Integer | nil,
        video_processing_units_count: Integer | nil
      }
    end
  end
end
