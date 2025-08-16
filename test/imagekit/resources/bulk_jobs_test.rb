# frozen_string_literal: true

require_relative "../test_helper"

class Imagekit::Test::Resources::BulkJobsTest < Imagekit::Test::ResourceTest
  def test_copy_folder_required_params
    skip("Prism tests are disabled")

    response =
      @image_kit.bulk_jobs.copy_folder(
        destination_path: "/path/of/destination/folder",
        source_folder_path: "/path/of/source/folder"
      )

    assert_pattern do
      response => Imagekit::Models::BulkJobCopyFolderResponse
    end

    assert_pattern do
      response => {
        job_id: String | nil
      }
    end
  end

  def test_move_folder_required_params
    skip("Prism tests are disabled")

    response =
      @image_kit.bulk_jobs.move_folder(
        destination_path: "/path/of/destination/folder",
        source_folder_path: "/path/of/source/folder"
      )

    assert_pattern do
      response => Imagekit::Models::BulkJobMoveFolderResponse
    end

    assert_pattern do
      response => {
        job_id: String | nil
      }
    end
  end

  def test_retrieve_status
    skip("Prism tests are disabled")

    response = @image_kit.bulk_jobs.retrieve_status("jobId")

    assert_pattern do
      response => Imagekit::Models::BulkJobRetrieveStatusResponse
    end

    assert_pattern do
      response => {
        job_id: String | nil,
        status: String | nil,
        type: String | nil
      }
    end
  end
end
