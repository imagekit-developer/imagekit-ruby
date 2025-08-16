# frozen_string_literal: true

require_relative "../test_helper"

class Imagekit::Test::Resources::FolderTest < Imagekit::Test::ResourceTest
  def test_create_required_params
    skip("Prism tests are disabled")

    response = @image_kit.folder.create(folder_name: "summer", parent_folder_path: "/product/images/")

    assert_pattern do
      response => Imagekit::Internal::Type::Unknown
    end
  end

  def test_delete_required_params
    skip("Prism tests are disabled")

    response = @image_kit.folder.delete(folder_path: "/folder/to/delete/")

    assert_pattern do
      response => Imagekit::Internal::Type::Unknown
    end
  end
end
