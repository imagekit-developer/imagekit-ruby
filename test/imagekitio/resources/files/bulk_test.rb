# frozen_string_literal: true

require_relative "../../test_helper"

class Imagekitio::Test::Resources::Files::BulkTest < Imagekitio::Test::ResourceTest
  def test_delete_required_params
    skip("Prism tests are disabled")

    response =
      @image_kit.files.bulk.delete(file_ids: %w[598821f949c0a938d57563bd 598821f949c0a938d57563be])

    assert_pattern do
      response => Imagekitio::Models::Files::BulkDeleteResponse
    end

    assert_pattern do
      response => {
        successfully_deleted_file_ids: ^(Imagekitio::Internal::Type::ArrayOf[String]) | nil
      }
    end
  end

  def test_add_tags_required_params
    skip("Prism tests are disabled")

    response =
      @image_kit.files.bulk.add_tags(
        file_ids: %w[598821f949c0a938d57563bd 598821f949c0a938d57563be],
        tags: %w[t-shirt round-neck sale2019]
      )

    assert_pattern do
      response => Imagekitio::Models::Files::BulkAddTagsResponse
    end

    assert_pattern do
      response => {
        successfully_updated_file_ids: ^(Imagekitio::Internal::Type::ArrayOf[String]) | nil
      }
    end
  end

  def test_remove_ai_tags_required_params
    skip("Prism tests are disabled")

    response =
      @image_kit.files.bulk.remove_ai_tags(
        ai_tags: %w[t-shirt round-neck sale2019],
        file_ids: %w[598821f949c0a938d57563bd 598821f949c0a938d57563be]
      )

    assert_pattern do
      response => Imagekitio::Models::Files::BulkRemoveAITagsResponse
    end

    assert_pattern do
      response => {
        successfully_updated_file_ids: ^(Imagekitio::Internal::Type::ArrayOf[String]) | nil
      }
    end
  end

  def test_remove_tags_required_params
    skip("Prism tests are disabled")

    response =
      @image_kit.files.bulk.remove_tags(
        file_ids: %w[598821f949c0a938d57563bd 598821f949c0a938d57563be],
        tags: %w[t-shirt round-neck sale2019]
      )

    assert_pattern do
      response => Imagekitio::Models::Files::BulkRemoveTagsResponse
    end

    assert_pattern do
      response => {
        successfully_updated_file_ids: ^(Imagekitio::Internal::Type::ArrayOf[String]) | nil
      }
    end
  end
end
