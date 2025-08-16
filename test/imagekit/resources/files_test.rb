# frozen_string_literal: true

require_relative "../test_helper"

class Imagekit::Test::Resources::FilesTest < Imagekit::Test::ResourceTest
  def test_list
    skip("Prism tests are disabled")

    response = @image_kit.files.list

    assert_pattern do
      response => ^(Imagekit::Internal::Type::ArrayOf[Imagekit::Models::FileListResponseItem])
    end
  end

  def test_delete
    skip("Prism tests are disabled")

    response = @image_kit.files.delete("fileId")

    assert_pattern do
      response => nil
    end
  end

  def test_add_tags_required_params
    skip("Prism tests are disabled")

    response =
      @image_kit.files.add_tags(
        file_ids: %w[598821f949c0a938d57563bd 598821f949c0a938d57563be],
        tags: %w[t-shirt round-neck sale2019]
      )

    assert_pattern do
      response => Imagekit::Models::FileAddTagsResponse
    end

    assert_pattern do
      response => {
        successfully_updated_file_ids: ^(Imagekit::Internal::Type::ArrayOf[String]) | nil
      }
    end
  end

  def test_copy_required_params
    skip("Prism tests are disabled")

    response =
      @image_kit.files.copy(destination_path: "/folder/to/copy/into/", source_file_path: "/path/to/file.jpg")

    assert_pattern do
      response => Imagekit::Internal::Type::Unknown
    end
  end

  def test_move_required_params
    skip("Prism tests are disabled")

    response =
      @image_kit.files.move(destination_path: "/folder/to/move/into/", source_file_path: "/path/to/file.jpg")

    assert_pattern do
      response => Imagekit::Internal::Type::Unknown
    end
  end

  def test_remove_ai_tags_required_params
    skip("Prism tests are disabled")

    response =
      @image_kit.files.remove_ai_tags(
        ai_tags: %w[t-shirt round-neck sale2019],
        file_ids: %w[598821f949c0a938d57563bd 598821f949c0a938d57563be]
      )

    assert_pattern do
      response => Imagekit::Models::FileRemoveAITagsResponse
    end

    assert_pattern do
      response => {
        successfully_updated_file_ids: ^(Imagekit::Internal::Type::ArrayOf[String]) | nil
      }
    end
  end

  def test_remove_tags_required_params
    skip("Prism tests are disabled")

    response =
      @image_kit.files.remove_tags(
        file_ids: %w[598821f949c0a938d57563bd 598821f949c0a938d57563be],
        tags: %w[t-shirt round-neck sale2019]
      )

    assert_pattern do
      response => Imagekit::Models::FileRemoveTagsResponse
    end

    assert_pattern do
      response => {
        successfully_updated_file_ids: ^(Imagekit::Internal::Type::ArrayOf[String]) | nil
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

  def test_upload_v1_required_params
    skip("Prism tests are disabled")

    response =
      @image_kit.files.upload_v1(
        file: "https://www.example.com/rest-of-the-image-path.jpg",
        file_name: "fileName"
      )

    assert_pattern do
      response => Imagekit::Models::FileUploadV1Response
    end

    assert_pattern do
      response => {
        ai_tags: ^(Imagekit::Internal::Type::ArrayOf[Imagekit::Models::FileUploadV1Response::AITag]) | nil,
        audio_codec: String | nil,
        bit_rate: Integer | nil,
        custom_coordinates: String | nil,
        custom_metadata: Imagekit::Internal::Type::Unknown | nil,
        duration: Integer | nil,
        embedded_metadata: Imagekit::Models::FileUploadV1Response::EmbeddedMetadata | nil,
        extension_status: Imagekit::Models::FileUploadV1Response::ExtensionStatus | nil,
        file_id: String | nil,
        file_path: String | nil,
        file_type: String | nil,
        height: Float | nil,
        is_private_file: Imagekit::Internal::Type::Boolean | nil,
        is_published: Imagekit::Internal::Type::Boolean | nil,
        metadata: Imagekit::Models::FileUploadV1Response::Metadata | nil,
        name: String | nil,
        size: Float | nil,
        tags: ^(Imagekit::Internal::Type::ArrayOf[String]) | nil,
        thumbnail_url: String | nil,
        url: String | nil,
        version_info: Imagekit::Models::FileUploadV1Response::VersionInfo | nil,
        video_codec: String | nil,
        width: Float | nil
      }
    end
  end

  def test_upload_v2_required_params
    skip("Prism tests are disabled")

    response =
      @image_kit.files.upload_v2(
        file: "https://www.example.com/rest-of-the-image-path.jpg",
        file_name: "fileName"
      )

    assert_pattern do
      response => Imagekit::Models::FileUploadV2Response
    end

    assert_pattern do
      response => {
        ai_tags: ^(Imagekit::Internal::Type::ArrayOf[Imagekit::Models::FileUploadV2Response::AITag]) | nil,
        audio_codec: String | nil,
        bit_rate: Integer | nil,
        custom_coordinates: String | nil,
        custom_metadata: Imagekit::Internal::Type::Unknown | nil,
        duration: Integer | nil,
        embedded_metadata: Imagekit::Models::FileUploadV2Response::EmbeddedMetadata | nil,
        extension_status: Imagekit::Models::FileUploadV2Response::ExtensionStatus | nil,
        file_id: String | nil,
        file_path: String | nil,
        file_type: String | nil,
        height: Float | nil,
        is_private_file: Imagekit::Internal::Type::Boolean | nil,
        is_published: Imagekit::Internal::Type::Boolean | nil,
        metadata: Imagekit::Models::FileUploadV2Response::Metadata | nil,
        name: String | nil,
        size: Float | nil,
        tags: ^(Imagekit::Internal::Type::ArrayOf[String]) | nil,
        thumbnail_url: String | nil,
        url: String | nil,
        version_info: Imagekit::Models::FileUploadV2Response::VersionInfo | nil,
        video_codec: String | nil,
        width: Float | nil
      }
    end
  end
end
