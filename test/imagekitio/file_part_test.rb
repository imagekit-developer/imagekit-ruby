# frozen_string_literal: true

require_relative "test_helper"

class Imagekitio::Test::FilePartTest < Minitest::Test
  def test_to_json
    text = "gray"
    filepart = Imagekitio::FilePart.new(StringIO.new(text))

    assert_equal(text.to_json, filepart.to_json)
    assert_equal(text.to_yaml, filepart.to_yaml)
  end
end
