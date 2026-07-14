# frozen_string_literal: true

require_relative "../../test_helper"

class Imagekitio::Test::Resources::Accounts::UsageAnalyticsTest < Imagekitio::Test::ResourceTest
  def test_get_required_params
    skip("Mock server tests are disabled")

    response = @image_kit.accounts.usage_analytics.get(end_date: "2019-12-27", start_date: "2019-12-27")

    assert_pattern do
      response => Imagekitio::Accounts::UsageAnalyticsResponse
    end

    assert_pattern do
      response => {
        bandwidth_bytes: Float,
        browser: Imagekitio::Accounts::UsageAnalyticsResponse::Browser,
        cache: Imagekitio::Accounts::UsageAnalyticsResponse::Cache,
        country: Imagekitio::Accounts::UsageAnalyticsResponse::Country,
        device: Imagekitio::Accounts::UsageAnalyticsResponse::Device,
        end_date: Date,
        error_reasons: ^(Imagekitio::Internal::Type::ArrayOf[Imagekitio::Accounts::UsageAnalyticsResponse::ErrorReason]),
        extensions: ^(Imagekitio::Internal::Type::ArrayOf[Imagekitio::Accounts::UsageAnalyticsResponse::Extension]),
        format_: Imagekitio::Accounts::UsageAnalyticsResponse::Format,
        generated_at: Time,
        request_count: Float,
        start_date: Date,
        status_codes: ^(Imagekitio::Internal::Type::ArrayOf[Imagekitio::Accounts::UsageAnalyticsResponse::StatusCode]),
        top404_assets: ^(Imagekitio::Internal::Type::ArrayOf[Imagekitio::Accounts::UsageAnalyticsResponse::Top404Asset]),
        top_images: Imagekitio::Accounts::UsageAnalyticsResponse::TopImages,
        top_image_transforms: Imagekitio::Accounts::UsageAnalyticsResponse::TopImageTransforms,
        top_other_assets: Imagekitio::Accounts::UsageAnalyticsResponse::TopOtherAssets,
        top_referrers: Imagekitio::Accounts::UsageAnalyticsResponse::TopReferrers,
        top_user_agents: Imagekitio::Accounts::UsageAnalyticsResponse::TopUserAgents,
        top_videos: Imagekitio::Accounts::UsageAnalyticsResponse::TopVideos,
        top_video_transforms: Imagekitio::Accounts::UsageAnalyticsResponse::TopVideoTransforms,
        url_endpoints: Imagekitio::Accounts::UsageAnalyticsResponse::URLEndpoints,
        video_processing: ^(Imagekitio::Internal::Type::ArrayOf[Imagekitio::Accounts::UsageAnalyticsResponse::VideoProcessing])
      }
    end
  end
end
