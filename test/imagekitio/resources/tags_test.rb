# frozen_string_literal: true

require_relative "../test_helper"

class Imagekitio::Test::Resources::TagsTest < Imagekitio::Test::ResourceTest
  def test_list
    skip("Mock server tests are disabled")

    response = @image_kit.tags.list

    assert_pattern do
      response => Imagekitio::Models::TagListResponse
    end

    assert_pattern do
      response => {
        next_cursor: String | nil,
        tags: ^(Imagekitio::Internal::Type::ArrayOf[Imagekitio::Tag])
      }
    end
  end
end
