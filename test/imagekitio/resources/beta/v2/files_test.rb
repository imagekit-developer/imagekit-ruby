# frozen_string_literal: true

require_relative "../../../test_helper"

class Imagekitio::Test::Resources::Beta::V2::FilesTest < Imagekitio::Test::ResourceTest
  def test_upload_required_params
    skip("Prism tests are disabled")

    response = @image_kit.beta.v2.files.upload(file: Pathname(__FILE__), file_name: "fileName")

    assert_pattern do
      response => Imagekitio::Models::Beta::V2::FileUploadResponse
    end

    assert_pattern do
      response => {
        ai_tags: ^(Imagekitio::Internal::Type::ArrayOf[Imagekitio::Models::Beta::V2::FileUploadResponse::AITag]) | nil,
        audio_codec: String | nil,
        bit_rate: Integer | nil,
        custom_coordinates: String | nil,
        custom_metadata: ^(Imagekitio::Internal::Type::HashOf[Imagekitio::Internal::Type::Unknown]) | nil,
        description: String | nil,
        duration: Integer | nil,
        embedded_metadata: ^(Imagekitio::Internal::Type::HashOf[Imagekitio::Internal::Type::Unknown]) | nil,
        extension_status: Imagekitio::Models::Beta::V2::FileUploadResponse::ExtensionStatus | nil,
        file_id: String | nil,
        file_path: String | nil,
        file_type: String | nil,
        height: Float | nil,
        is_private_file: Imagekitio::Internal::Type::Boolean | nil,
        is_published: Imagekitio::Internal::Type::Boolean | nil,
        metadata: Imagekitio::Metadata | nil,
        name: String | nil,
        selected_fields_schema: ^(Imagekitio::Internal::Type::HashOf[Imagekitio::Models::Beta::V2::FileUploadResponse::SelectedFieldsSchema]) | nil,
        size: Float | nil,
        tags: ^(Imagekitio::Internal::Type::ArrayOf[String]) | nil,
        thumbnail_url: String | nil,
        url: String | nil,
        version_info: Imagekitio::Models::Beta::V2::FileUploadResponse::VersionInfo | nil,
        video_codec: String | nil,
        width: Float | nil
      }
    end
  end
end
