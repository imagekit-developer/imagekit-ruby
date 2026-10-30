# frozen_string_literal: true

require_relative "../test_helper"

class Imagekitio::Test::Resources::TagsTest < Imagekitio::Test::ResourceTest
  def test_list
    skip("Mock server tests are disabled")

    response = @image_kit.tags.list

    assert_pattern do
      response => Imagekitio::Internal::Cursor
    end

    row = response.to_enum.first
    return if row.nil?

    assert_pattern do
      row => Imagekitio::Tag
    end

    assert_pattern do
      row => {
        asset_count: Integer,
        label: String,
        last_used_at: Time,
        name: String
      }
    end
  end
end
