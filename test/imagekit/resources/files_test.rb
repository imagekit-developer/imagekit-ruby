# frozen_string_literal: true

require_relative "../test_helper"

class Imagekit::Test::Resources::FilesTest < Imagekit::Test::ResourceTest
  def test_update
    skip("Prism tests are disabled")

    response = @image_kit.files.update("fileId")

    assert_pattern do
      response => Imagekit::Models::FileUpdateResponse
    end

    assert_pattern do
      response => {
        ai_tags: ^(Imagekit::Internal::Type::ArrayOf[Imagekit::Models::FileUpdateResponse::AITag]) | nil,
        created_at: String | nil,
        custom_coordinates: String | nil,
        custom_metadata: ^(Imagekit::Internal::Type::HashOf[Imagekit::Internal::Type::Unknown]) | nil,
        extension_status: Imagekit::Models::FileUpdateResponse::ExtensionStatus | nil,
        file_id: String | nil,
        file_path: String | nil,
        file_type: String | nil,
        has_alpha: Imagekit::Internal::Type::Boolean | nil,
        height: Float | nil,
        is_private_file: Imagekit::Internal::Type::Boolean | nil,
        is_published: Imagekit::Internal::Type::Boolean | nil,
        mime: String | nil,
        name: String | nil,
        size: Float | nil,
        tags: ^(Imagekit::Internal::Type::ArrayOf[String]) | nil,
        thumbnail: String | nil,
        type: String | nil,
        updated_at: String | nil,
        url: String | nil,
        version_info: Imagekit::Models::FileUpdateResponse::VersionInfo | nil,
        width: Float | nil
      }
    end
  end

  def test_delete
    skip("Prism tests are disabled")

    response = @image_kit.files.delete("fileId")

    assert_pattern do
      response => nil
    end
  end

  def test_copy_required_params
    skip("Prism tests are disabled")

    response =
      @image_kit.files.copy(destination_path: "/folder/to/copy/into/", source_file_path: "/path/to/file.jpg")

    assert_pattern do
      response => Imagekit::Models::FileCopyResponse
    end

    assert_pattern do
      response => {
        **_
      }
    end
  end

  def test_get
    skip("Prism tests are disabled")

    response = @image_kit.files.get("fileId")

    assert_pattern do
      response => Imagekit::Models::FileGetResponse
    end

    assert_pattern do
      response => {
        ai_tags: ^(Imagekit::Internal::Type::ArrayOf[Imagekit::Models::FileGetResponse::AITag]) | nil,
        created_at: String | nil,
        custom_coordinates: String | nil,
        custom_metadata: ^(Imagekit::Internal::Type::HashOf[Imagekit::Internal::Type::Unknown]) | nil,
        file_id: String | nil,
        file_path: String | nil,
        file_type: String | nil,
        has_alpha: Imagekit::Internal::Type::Boolean | nil,
        height: Float | nil,
        is_private_file: Imagekit::Internal::Type::Boolean | nil,
        is_published: Imagekit::Internal::Type::Boolean | nil,
        mime: String | nil,
        name: String | nil,
        size: Float | nil,
        tags: ^(Imagekit::Internal::Type::ArrayOf[String]) | nil,
        thumbnail: String | nil,
        type: String | nil,
        updated_at: String | nil,
        url: String | nil,
        version_info: Imagekit::Models::FileGetResponse::VersionInfo | nil,
        width: Float | nil
      }
    end
  end

  def test_move_required_params
    skip("Prism tests are disabled")

    response =
      @image_kit.files.move(destination_path: "/folder/to/move/into/", source_file_path: "/path/to/file.jpg")

    assert_pattern do
      response => Imagekit::Models::FileMoveResponse
    end

    assert_pattern do
      response => {
        **_
      }
    end
  end

  def test_rename_required_params
    skip("Prism tests are disabled")

    response = @image_kit.files.rename(file_path: "/path/to/file.jpg", new_file_name: "newFileName.jpg")

    assert_pattern do
      response => Imagekit::Models::FileRenameResponse
    end

    assert_pattern do
      response => {
        purge_request_id: String | nil
      }
    end
  end

  def test_upload_required_params
    skip("Prism tests are disabled")

    response = @image_kit.files.upload(file: Pathname(__FILE__), file_name: "fileName")

    assert_pattern do
      response => Imagekit::Models::FileUploadResponse
    end

    assert_pattern do
      response => {
        ai_tags: ^(Imagekit::Internal::Type::ArrayOf[Imagekit::Models::FileUploadResponse::AITag]) | nil,
        audio_codec: String | nil,
        bit_rate: Integer | nil,
        custom_coordinates: String | nil,
        custom_metadata: ^(Imagekit::Internal::Type::HashOf[Imagekit::Internal::Type::Unknown]) | nil,
        duration: Integer | nil,
        embedded_metadata: ^(Imagekit::Internal::Type::HashOf[Imagekit::Internal::Type::Unknown]) | nil,
        extension_status: Imagekit::Models::FileUploadResponse::ExtensionStatus | nil,
        file_id: String | nil,
        file_path: String | nil,
        file_type: String | nil,
        height: Float | nil,
        is_private_file: Imagekit::Internal::Type::Boolean | nil,
        is_published: Imagekit::Internal::Type::Boolean | nil,
        metadata: Imagekit::Models::FileUploadResponse::Metadata | nil,
        name: String | nil,
        size: Float | nil,
        tags: ^(Imagekit::Internal::Type::ArrayOf[String]) | nil,
        thumbnail_url: String | nil,
        url: String | nil,
        version_info: Imagekit::Models::FileUploadResponse::VersionInfo | nil,
        video_codec: String | nil,
        width: Float | nil
      }
    end
  end
end
