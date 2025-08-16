# frozen_string_literal: true

require_relative "../../test_helper"

class Imagekit::Test::Resources::Files::BatchTest < Imagekit::Test::ResourceTest
  def test_delete_required_params
    skip("Prism tests are disabled")

    response =
      @image_kit.files.batch.delete(file_ids: %w[598821f949c0a938d57563bd 598821f949c0a938d57563be])

    assert_pattern do
      response => Imagekit::Models::Files::BatchDeleteResponse
    end

    assert_pattern do
      response => {
        successfully_deleted_file_ids: ^(Imagekit::Internal::Type::ArrayOf[String]) | nil
      }
    end
  end
end
