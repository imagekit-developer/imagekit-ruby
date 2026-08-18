# frozen_string_literal: true

require_relative "../test_helper"

class Imagekitio::Test::Resources::AIFilterSearchTest < Imagekitio::Test::ResourceTest
  def test_create_required_params
    skip("Mock server tests are disabled")

    response = @image_kit.ai_filter_search.create(prompt: "red dresses tagged summer uploaded last month")

    assert_pattern do
      response => Imagekitio::Models::AIFilterSearchCreateResponse
    end

    assert_pattern do
      response => {
        file_type: Imagekitio::Models::AIFilterSearchCreateResponse::FileType | nil,
        is_version_included_in_search: Imagekitio::Internal::Type::Boolean | nil,
        search_query: String | nil
      }
    end
  end
end
