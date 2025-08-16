# frozen_string_literal: true

require_relative "../../test_helper"

class Imagekit::Test::Resources::Files::DetailsTest < Imagekit::Test::ResourceTest
  def test_retrieve
    skip("Prism tests are disabled")

    response = @image_kit.files.details.retrieve("fileId")

    assert_pattern do
      response => Imagekit::Models::Files::DetailRetrieveResponse
    end

    assert_pattern do
      response => {
        ai_tags: ^(Imagekit::Internal::Type::ArrayOf[Imagekit::Models::Files::DetailRetrieveResponse::AITag]) | nil,
        created_at: String | nil,
        custom_coordinates: String | nil,
        custom_metadata: Imagekit::Internal::Type::Unknown | nil,
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
        version_info: Imagekit::Models::Files::DetailRetrieveResponse::VersionInfo | nil,
        width: Float | nil
      }
    end
  end

  def test_update
    skip("Prism tests are disabled")

    response = @image_kit.files.details.update("fileId")

    assert_pattern do
      response => Imagekit::Models::Files::DetailUpdateResponse
    end

    assert_pattern do
      response => {
        ai_tags: ^(Imagekit::Internal::Type::ArrayOf[Imagekit::Models::Files::DetailUpdateResponse::AITag]) | nil,
        created_at: String | nil,
        custom_coordinates: String | nil,
        custom_metadata: Imagekit::Internal::Type::Unknown | nil,
        extension_status: Imagekit::Models::Files::DetailUpdateResponse::ExtensionStatus | nil,
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
        version_info: Imagekit::Models::Files::DetailUpdateResponse::VersionInfo | nil,
        width: Float | nil
      }
    end
  end
end
