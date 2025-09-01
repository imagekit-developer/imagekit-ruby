# frozen_string_literal: true

require_relative "../../test_helper"

class Imagekit::Test::Resources::Files::VersionsTest < Imagekit::Test::ResourceTest
  def test_list
    skip("Prism tests are disabled")

    response = @image_kit.files.versions.list("fileId")

    assert_pattern do
      response => ^(Imagekit::Internal::Type::ArrayOf[Imagekit::File])
    end
  end

  def test_delete_required_params
    skip("Prism tests are disabled")

    response = @image_kit.files.versions.delete("versionId", file_id: "fileId")

    assert_pattern do
      response => Imagekit::Models::Files::VersionDeleteResponse
    end

    assert_pattern do
      response => {
        **_
      }
    end
  end

  def test_get_required_params
    skip("Prism tests are disabled")

    response = @image_kit.files.versions.get("versionId", file_id: "fileId")

    assert_pattern do
      response => Imagekit::File
    end

    assert_pattern do
      response => {
        ai_tags: ^(Imagekit::Internal::Type::ArrayOf[Imagekit::File::AITag]) | nil,
        created_at: Time | nil,
        custom_coordinates: String | nil,
        custom_metadata: ^(Imagekit::Internal::Type::HashOf[Imagekit::Internal::Type::Unknown]) | nil,
        description: String | nil,
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
        type: Imagekit::File::Type | nil,
        updated_at: Time | nil,
        url: String | nil,
        version_info: Imagekit::File::VersionInfo | nil,
        width: Float | nil
      }
    end
  end

  def test_restore_required_params
    skip("Prism tests are disabled")

    response = @image_kit.files.versions.restore("versionId", file_id: "fileId")

    assert_pattern do
      response => Imagekit::File
    end

    assert_pattern do
      response => {
        ai_tags: ^(Imagekit::Internal::Type::ArrayOf[Imagekit::File::AITag]) | nil,
        created_at: Time | nil,
        custom_coordinates: String | nil,
        custom_metadata: ^(Imagekit::Internal::Type::HashOf[Imagekit::Internal::Type::Unknown]) | nil,
        description: String | nil,
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
        type: Imagekit::File::Type | nil,
        updated_at: Time | nil,
        url: String | nil,
        version_info: Imagekit::File::VersionInfo | nil,
        width: Float | nil
      }
    end
  end
end
