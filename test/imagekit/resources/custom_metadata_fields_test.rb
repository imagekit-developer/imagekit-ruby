# frozen_string_literal: true

require_relative "../test_helper"

class Imagekit::Test::Resources::CustomMetadataFieldsTest < Imagekit::Test::ResourceTest
  def test_create_required_params
    skip("Prism tests are disabled")

    response =
      @image_kit.custom_metadata_fields.create(label: "price", name: "price", schema: {type: :Number})

    assert_pattern do
      response => Imagekit::Models::CustomMetadataFieldCreateResponse
    end

    assert_pattern do
      response => {
        id: String,
        label: String,
        name: String,
        schema: Imagekit::Models::CustomMetadataFieldCreateResponse::Schema
      }
    end
  end

  def test_update
    skip("Prism tests are disabled")

    response = @image_kit.custom_metadata_fields.update("id")

    assert_pattern do
      response => Imagekit::Models::CustomMetadataFieldUpdateResponse
    end

    assert_pattern do
      response => {
        id: String,
        label: String,
        name: String,
        schema: Imagekit::Models::CustomMetadataFieldUpdateResponse::Schema
      }
    end
  end

  def test_list
    skip("Prism tests are disabled")

    response = @image_kit.custom_metadata_fields.list

    assert_pattern do
      response => ^(Imagekit::Internal::Type::ArrayOf[Imagekit::Models::CustomMetadataFieldListResponseItem])
    end
  end

  def test_delete
    skip("Prism tests are disabled")

    response = @image_kit.custom_metadata_fields.delete("id")

    assert_pattern do
      response => Imagekit::Models::CustomMetadataFieldDeleteResponse
    end

    assert_pattern do
      response => {
        **_
      }
    end
  end
end
