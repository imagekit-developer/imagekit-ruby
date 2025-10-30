# frozen_string_literal: true

require_relative "../../test_helper"

class Imagekitio::Test::Resources::Accounts::UsageTest < Imagekitio::Test::ResourceTest
  def test_get_required_params
    skip("Prism tests are disabled")

    response = @image_kit.accounts.usage.get(end_date: "2019-12-27", start_date: "2019-12-27")

    assert_pattern do
      response => Imagekitio::Models::Accounts::UsageGetResponse
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
