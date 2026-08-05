# frozen_string_literal: true

require_relative "../test_helper"

class Imagekitio::Test::Resources::NamedTransformationsTest < Imagekitio::Test::ResourceTest
  def test_create_required_params
    skip("Mock server tests are disabled")

    response =
      @image_kit.named_transformations.create(
        name: "small_thumbnail",
        transformation: "tr:w-150,h-150,fo-center,cm-resize"
      )

    assert_pattern do
      response => Imagekitio::NamedTransformation
    end

    assert_pattern do
      response => {
        id: String | nil,
        created_at: Time | nil,
        disabled: Imagekitio::Internal::Type::Boolean | nil,
        name: String | nil,
        transformation: String | nil
      }
    end
  end

  def test_update
    skip("Mock server tests are disabled")

    response = @image_kit.named_transformations.update("id")

    assert_pattern do
      response => Imagekitio::NamedTransformation
    end

    assert_pattern do
      response => {
        id: String | nil,
        created_at: Time | nil,
        disabled: Imagekitio::Internal::Type::Boolean | nil,
        name: String | nil,
        transformation: String | nil
      }
    end
  end

  def test_list
    skip("Mock server tests are disabled")

    response = @image_kit.named_transformations.list

    assert_pattern do
      response => ^(Imagekitio::Internal::Type::ArrayOf[Imagekitio::NamedTransformation])
    end
  end

  def test_delete
    skip("Mock server tests are disabled")

    response = @image_kit.named_transformations.delete("id")

    assert_pattern do
      response => Imagekitio::NamedTransformation
    end

    assert_pattern do
      response => {
        id: String | nil,
        created_at: Time | nil,
        disabled: Imagekitio::Internal::Type::Boolean | nil,
        name: String | nil,
        transformation: String | nil
      }
    end
  end

  def test_get
    skip("Mock server tests are disabled")

    response = @image_kit.named_transformations.get("id")

    assert_pattern do
      response => Imagekitio::NamedTransformation
    end

    assert_pattern do
      response => {
        id: String | nil,
        created_at: Time | nil,
        disabled: Imagekitio::Internal::Type::Boolean | nil,
        name: String | nil,
        transformation: String | nil
      }
    end
  end
end
