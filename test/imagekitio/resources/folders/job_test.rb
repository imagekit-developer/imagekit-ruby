# frozen_string_literal: true

require_relative "../../test_helper"

class Imagekitio::Test::Resources::Folders::JobTest < Imagekitio::Test::ResourceTest
  def test_get
    skip("Prism tests are disabled")

    response = @image_kit.folders.job.get("jobId")

    assert_pattern do
      response => Imagekitio::Models::Folders::JobGetResponse
    end

    assert_pattern do
      response => {
        job_id: String | nil,
        purge_request_id: String | nil,
        status: Imagekitio::Models::Folders::JobGetResponse::Status | nil,
        type: Imagekitio::Models::Folders::JobGetResponse::Type | nil
      }
    end
  end
end
