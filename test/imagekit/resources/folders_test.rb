# frozen_string_literal: true

require_relative "../test_helper"

class Imagekit::Test::Resources::FoldersTest < Imagekit::Test::ResourceTest
  def test_create_required_params
    skip("Prism tests are disabled")

    response = @image_kit.folders.create(folder_name: "summer", parent_folder_path: "/product/images/")

    assert_pattern do
      response => Imagekit::Models::FolderCreateResponse
    end

    assert_pattern do
      response => {
        **_
      }
    end
  end

  def test_delete_required_params
    skip("Prism tests are disabled")

    response = @image_kit.folders.delete(folder_path: "/folder/to/delete/")

    assert_pattern do
      response => Imagekit::Models::FolderDeleteResponse
    end

    assert_pattern do
      response => {
        **_
      }
    end
  end

  def test_copy_required_params
    skip("Prism tests are disabled")

    response =
      @image_kit.folders.copy(
        destination_path: "/path/of/destination/folder",
        source_folder_path: "/path/of/source/folder"
      )

    assert_pattern do
      response => Imagekit::Models::FolderCopyResponse
    end

    assert_pattern do
      response => {
        job_id: String | nil
      }
    end
  end

  def test_move_required_params
    skip("Prism tests are disabled")

    response =
      @image_kit.folders.move(
        destination_path: "/path/of/destination/folder",
        source_folder_path: "/path/of/source/folder"
      )

    assert_pattern do
      response => Imagekit::Models::FolderMoveResponse
    end

    assert_pattern do
      response => {
        job_id: String | nil
      }
    end
  end

  def test_rename_required_params
    skip("Prism tests are disabled")

    response = @image_kit.folders.rename(folder_path: "/path/of/folder", new_folder_name: "new-folder-name")

    assert_pattern do
      response => Imagekit::Models::FolderRenameResponse
    end

    assert_pattern do
      response => {
        job_id: String | nil
      }
    end
  end
end
