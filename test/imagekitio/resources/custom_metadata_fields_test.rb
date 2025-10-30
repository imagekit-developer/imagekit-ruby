# frozen_string_literal: true

require_relative "../test_helper"

class Imagekitio::Test::Resources::CustomMetadataFieldsTest < Imagekitio::Test::ResourceTest
  def test_create_required_params
    skip("Prism tests are disabled")

    response =
      @image_kit.custom_metadata_fields.create(label: "price", name: "price", schema: {type: :Number})

    assert_pattern do
      response => Imagekitio::CustomMetadataField
    end

    assert_pattern do
      response => {
        id: String,
        label: String,
        name: String,
        schema: Imagekitio::CustomMetadataField::Schema
      }
    end
  end

  def test_update
    skip("Prism tests are disabled")

    response = @image_kit.custom_metadata_fields.update("id")

    assert_pattern do
      response => Imagekitio::CustomMetadataField
    end

    assert_pattern do
      response => {
        id: String,
        label: String,
        name: String,
        schema: Imagekitio::CustomMetadataField::Schema
      }
    end
  end

  def test_list
    skip("Prism tests are disabled")

    response = @image_kit.custom_metadata_fields.list

    assert_pattern do
      response => ^(Imagekitio::Internal::Type::ArrayOf[Imagekitio::CustomMetadataField])
    end
  end

  def test_delete
    skip("Prism tests are disabled")

    response = @image_kit.custom_metadata_fields.delete("id")

    assert_pattern do
      response => Imagekitio::Models::CustomMetadataFieldDeleteResponse
    end

    assert_pattern do
      response => {
        **_
      }
    end
  end
end
