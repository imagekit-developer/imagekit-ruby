# frozen_string_literal: true

require_relative "../test_helper"

class Imagekitio::Test::Resources::AssetsTest < Imagekitio::Test::ResourceTest
  def test_list
    skip("Prism tests are disabled")

    response = @image_kit.assets.list

    assert_pattern do
      response => ^(Imagekitio::Internal::Type::ArrayOf[union: Imagekitio::Models::AssetListResponseItem])
    end
  end
end
