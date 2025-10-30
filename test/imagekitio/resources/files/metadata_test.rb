# frozen_string_literal: true

require_relative "../../test_helper"

class Imagekitio::Test::Resources::Files::MetadataTest < Imagekitio::Test::ResourceTest
  def test_get
    skip("Prism tests are disabled")

    response = @image_kit.files.metadata.get("fileId")

    assert_pattern do
      response => Imagekitio::Metadata
    end

    assert_pattern do
      response => {
        audio_codec: String | nil,
        bit_rate: Integer | nil,
        density: Integer | nil,
        duration: Integer | nil,
        exif: Imagekitio::Metadata::Exif | nil,
        format_: String | nil,
        has_color_profile: Imagekitio::Internal::Type::Boolean | nil,
        has_transparency: Imagekitio::Internal::Type::Boolean | nil,
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
      response => Imagekitio::Metadata
    end

    assert_pattern do
      response => {
        audio_codec: String | nil,
        bit_rate: Integer | nil,
        density: Integer | nil,
        duration: Integer | nil,
        exif: Imagekitio::Metadata::Exif | nil,
        format_: String | nil,
        has_color_profile: Imagekitio::Internal::Type::Boolean | nil,
        has_transparency: Imagekitio::Internal::Type::Boolean | nil,
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
