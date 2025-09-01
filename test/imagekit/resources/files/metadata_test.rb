# frozen_string_literal: true

require_relative "../../test_helper"

class Imagekit::Test::Resources::Files::MetadataTest < Imagekit::Test::ResourceTest
  def test_get
    skip("Prism tests are disabled")

    response = @image_kit.files.metadata.get("fileId")

    assert_pattern do
      response => Imagekit::Metadata
    end

    assert_pattern do
      response => {
        audio_codec: String | nil,
        bit_rate: Integer | nil,
        density: Integer | nil,
        duration: Integer | nil,
        exif: Imagekit::Metadata::Exif | nil,
        format_: String | nil,
        has_color_profile: Imagekit::Internal::Type::Boolean | nil,
        has_transparency: Imagekit::Internal::Type::Boolean | nil,
        height: Integer | nil,
        p_hash: String | nil,
        quality: Integer | nil,
        size: Integer | nil,
        video_codec: String | nil,
        width: Integer | nil
      }
    end
  end

  def test_get_from_url_required_params
    skip("Prism tests are disabled")

    response = @image_kit.files.metadata.get_from_url(url: "https://example.com")

    assert_pattern do
      response => Imagekit::Metadata
    end

    assert_pattern do
      response => {
        audio_codec: String | nil,
        bit_rate: Integer | nil,
        density: Integer | nil,
        duration: Integer | nil,
        exif: Imagekit::Metadata::Exif | nil,
        format_: String | nil,
        has_color_profile: Imagekit::Internal::Type::Boolean | nil,
        has_transparency: Imagekit::Internal::Type::Boolean | nil,
        height: Integer | nil,
        p_hash: String | nil,
        quality: Integer | nil,
        size: Integer | nil,
        video_codec: String | nil,
        width: Integer | nil
      }
    end
  end
end
