# frozen_string_literal: true

require_relative "../test_helper"

class Imagekitio::Test::Resources::SavedExtensionsTest < Imagekitio::Test::ResourceTest
  def test_create_required_params
    skip("Prism tests are disabled")

    response =
      @image_kit.saved_extensions.create(
        config: {name: :"remove-bg"},
        description: "Analyzes vehicle images for type, condition, and quality assessment",
        name: "Car Quality Analysis"
      )

    assert_pattern do
      response => Imagekitio::SavedExtension
    end

    assert_pattern do
      response => {
        id: String | nil,
        config: Imagekitio::ExtensionConfig | nil,
        created_at: Time | nil,
        description: String | nil,
        name: String | nil,
        updated_at: Time | nil
      }
    end
  end

  def test_update
    skip("Prism tests are disabled")

    response = @image_kit.saved_extensions.update("id")

    assert_pattern do
      response => Imagekitio::SavedExtension
    end

    assert_pattern do
      response => {
        id: String | nil,
        config: Imagekitio::ExtensionConfig | nil,
        created_at: Time | nil,
        description: String | nil,
        name: String | nil,
        updated_at: Time | nil
      }
    end
  end

  def test_list
    skip("Prism tests are disabled")

    response = @image_kit.saved_extensions.list

    assert_pattern do
      response => ^(Imagekitio::Internal::Type::ArrayOf[Imagekitio::SavedExtension])
    end
  end

  def test_delete
    skip("Prism tests are disabled")

    response = @image_kit.saved_extensions.delete("id")

    assert_pattern do
      response => nil
    end
  end

  def test_get
    skip("Prism tests are disabled")

    response = @image_kit.saved_extensions.get("id")

    assert_pattern do
      response => Imagekitio::SavedExtension
    end

    assert_pattern do
      response => {
        id: String | nil,
        config: Imagekitio::ExtensionConfig | nil,
        created_at: Time | nil,
        description: String | nil,
        name: String | nil,
        updated_at: Time | nil
      }
    end
  end
end
