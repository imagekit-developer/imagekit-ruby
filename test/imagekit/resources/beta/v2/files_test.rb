# frozen_string_literal: true

require_relative "../../../test_helper"

class Imagekit::Test::Resources::Beta::V2::FilesTest < Imagekit::Test::ResourceTest
  def test_upload_required_params
    skip("Prism tests are disabled")

    response = @image_kit.beta.v2.files.upload(file: Pathname(__FILE__), file_name: "fileName")

    assert_pattern do
      response => Imagekit::Models::Beta::V2::FileUploadResponse
    end

    assert_pattern do
      response => {
        ai_tags: ^(Imagekit::Internal::Type::ArrayOf[Imagekit::Models::Beta::V2::FileUploadResponse::AITag]) | nil,
        audio_codec: String | nil,
        bit_rate: Integer | nil,
        custom_coordinates: String | nil,
        custom_metadata: ^(Imagekit::Internal::Type::HashOf[Imagekit::Internal::Type::Unknown]) | nil,
        duration: Integer | nil,
        embedded_metadata: ^(Imagekit::Internal::Type::HashOf[Imagekit::Internal::Type::Unknown]) | nil,
        extension_status: Imagekit::Models::Beta::V2::FileUploadResponse::ExtensionStatus | nil,
        file_id: String | nil,
        file_path: String | nil,
        file_type: String | nil,
        height: Float | nil,
        is_private_file: Imagekit::Internal::Type::Boolean | nil,
        is_published: Imagekit::Internal::Type::Boolean | nil,
        metadata: Imagekit::Models::Beta::V2::FileUploadResponse::Metadata | nil,
        name: String | nil,
        size: Float | nil,
        tags: ^(Imagekit::Internal::Type::ArrayOf[String]) | nil,
        thumbnail_url: String | nil,
        url: String | nil,
        version_info: Imagekit::Models::Beta::V2::FileUploadResponse::VersionInfo | nil,
        video_codec: String | nil,
        width: Float | nil
      }
    end
  end
end
