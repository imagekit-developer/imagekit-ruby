# frozen_string_literal: true

require_relative "../test_helper"

class Imagekit::Test::Resources::AssetsTest < Imagekit::Test::ResourceTest
  def test_list
    skip("Prism tests are disabled")

    response = @image_kit.assets.list

    assert_pattern do
      response => ^(Imagekit::Internal::Type::ArrayOf[union: Imagekit::Models::AssetListResponseItem])
    end
  end
end
