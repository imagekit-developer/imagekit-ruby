# frozen_string_literal: true

require_relative "../test_helper"

class Imagekitio::Test::Resources::NamedTransformationsTest < Imagekitio::Test::ResourceTest
  def test_create_required_params
    skip("Mock server tests are disabled")

    response =
      @image_kit.named_transformations.create(
        name: "small_thumbnail",
        transformation: "w-150,h-150,fo-center,cm-pad_resize"
      )

    assert_pattern do
      response => Imagekitio::NamedTransformation
    end

    assert_pattern do
      response => {
        id: String,
        created_at: Time,
        enabled: Imagekitio::Internal::Type::Boolean,
        name: String,
        transformation: String
      }
    end
  end

  def test_update
    skip("Mock server tests are disabled")

    response = @image_kit.named_transformations.update("6bZ9x2ZUx")

    assert_pattern do
      response => Imagekitio::NamedTransformation
    end

    assert_pattern do
      response => {
        id: String,
        created_at: Time,
        enabled: Imagekitio::Internal::Type::Boolean,
        name: String,
        transformation: String
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

    response = @image_kit.named_transformations.delete("6bZ9x2ZUx")

    assert_pattern do
      response => nil
    end
  end

  def test_get
    skip("Mock server tests are disabled")

    response = @image_kit.named_transformations.get("6bZ9x2ZUx")

    assert_pattern do
      response => Imagekitio::NamedTransformation
    end

    assert_pattern do
      response => {
        id: String,
        created_at: Time,
        enabled: Imagekitio::Internal::Type::Boolean,
        name: String,
        transformation: String
      }
    end
  end
end
