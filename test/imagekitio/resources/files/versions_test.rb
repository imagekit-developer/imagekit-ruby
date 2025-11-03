# frozen_string_literal: true

require_relative "../../test_helper"

class Imagekitio::Test::Resources::Files::VersionsTest < Imagekitio::Test::ResourceTest
  def test_list
    skip("Prism tests are disabled")

    response = @image_kit.files.versions.list("fileId")

    assert_pattern do
      response => ^(Imagekitio::Internal::Type::ArrayOf[Imagekitio::File])
    end
  end

  def test_delete_required_params
    skip("Prism tests are disabled")

    response = @image_kit.files.versions.delete("versionId", file_id: "fileId")

    assert_pattern do
      response => Imagekitio::Models::Files::VersionDeleteResponse
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
      response => Imagekitio::File
    end

    assert_pattern do
      response => {
        ai_tags: ^(Imagekitio::Internal::Type::ArrayOf[Imagekitio::File::AITag]) | nil,
        created_at: Time | nil,
        custom_coordinates: String | nil,
        custom_metadata: ^(Imagekitio::Internal::Type::HashOf[Imagekitio::Internal::Type::Unknown]) | nil,
        description: String | nil,
        file_id: String | nil,
        file_path: String | nil,
        file_type: String | nil,
        has_alpha: Imagekitio::Internal::Type::Boolean | nil,
        height: Float | nil,
        is_private_file: Imagekitio::Internal::Type::Boolean | nil,
        is_published: Imagekitio::Internal::Type::Boolean | nil,
        mime: String | nil,
        name: String | nil,
        selected_fields_schema: ^(Imagekitio::Internal::Type::HashOf[Imagekitio::File::SelectedFieldsSchema]) | nil,
        size: Float | nil,
        tags: ^(Imagekitio::Internal::Type::ArrayOf[String]) | nil,
        thumbnail: String | nil,
        type: Imagekitio::File::Type | nil,
        updated_at: Time | nil,
        url: String | nil,
        version_info: Imagekitio::File::VersionInfo | nil,
        width: Float | nil
      }
    end
  end

  def test_restore_required_params
    skip("Prism tests are disabled")

    response = @image_kit.files.versions.restore("versionId", file_id: "fileId")

    assert_pattern do
      response => Imagekitio::File
    end

    assert_pattern do
      response => {
        ai_tags: ^(Imagekitio::Internal::Type::ArrayOf[Imagekitio::File::AITag]) | nil,
        created_at: Time | nil,
        custom_coordinates: String | nil,
        custom_metadata: ^(Imagekitio::Internal::Type::HashOf[Imagekitio::Internal::Type::Unknown]) | nil,
        description: String | nil,
        file_id: String | nil,
        file_path: String | nil,
        file_type: String | nil,
        has_alpha: Imagekitio::Internal::Type::Boolean | nil,
        height: Float | nil,
        is_private_file: Imagekitio::Internal::Type::Boolean | nil,
        is_published: Imagekitio::Internal::Type::Boolean | nil,
        mime: String | nil,
        name: String | nil,
        selected_fields_schema: ^(Imagekitio::Internal::Type::HashOf[Imagekitio::File::SelectedFieldsSchema]) | nil,
        size: Float | nil,
        tags: ^(Imagekitio::Internal::Type::ArrayOf[String]) | nil,
        thumbnail: String | nil,
        type: Imagekitio::File::Type | nil,
        updated_at: Time | nil,
        url: String | nil,
        version_info: Imagekitio::File::VersionInfo | nil,
        width: Float | nil
      }
    end
  end
end
