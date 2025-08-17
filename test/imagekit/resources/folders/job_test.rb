# frozen_string_literal: true

require_relative "../../test_helper"

class Imagekit::Test::Resources::Folders::JobTest < Imagekit::Test::ResourceTest
  def test_get
    skip("Prism tests are disabled")

    response = @image_kit.folders.job.get("jobId")

    assert_pattern do
      response => Imagekit::Models::Folders::JobGetResponse
    end

    assert_pattern do
      response => {
        job_id: String | nil,
        purge_request_id: String | nil,
        status: String | nil,
        type: String | nil
      }
    end
  end
end
