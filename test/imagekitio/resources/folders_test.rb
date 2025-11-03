# frozen_string_literal: true

require_relative "../test_helper"

class Imagekitio::Test::Resources::FoldersTest < Imagekitio::Test::ResourceTest
  def test_create_required_params
    skip("Prism tests are disabled")

    response = @image_kit.folders.create(folder_name: "summer", parent_folder_path: "/product/images/")

    assert_pattern do
      response => Imagekitio::Models::FolderCreateResponse
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
      response => Imagekitio::Models::FolderDeleteResponse
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
      response => Imagekitio::Models::FolderCopyResponse
    end

    assert_pattern do
      response => {
        job_id: String
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
      response => Imagekitio::Models::FolderMoveResponse
    end

    assert_pattern do
      response => {
        job_id: String
      }
    end
  end

  def test_rename_required_params
    skip("Prism tests are disabled")

    response = @image_kit.folders.rename(folder_path: "/path/of/folder", new_folder_name: "new-folder-name")

    assert_pattern do
      response => Imagekitio::Models::FolderRenameResponse
    end

    assert_pattern do
      response => {
        job_id: String
      }
    end
  end
end
