# frozen_string_literal: true

require_relative "../test_helper"

class Imagekitio::Test::Resources::WebhooksTest < Imagekitio::Test::ResourceTest
  def test_unwrap
    key = "whsec_c2VjcmV0Cg=="

    webhook = StandardWebhooks::Webhook.new(key)

    data =
      "{\"id\":\"id\",\"type\":\"video.transformation.accepted\",\"created_at\":\"2019-12-27T18:11:19.117Z\",\"data\":{\"asset\":{\"url\":\"https://example.com\"},\"transformation\":{\"type\":\"video-transformation\",\"options\":{\"audio_codec\":\"aac\",\"auto_rotate\":true,\"format\":\"mp4\",\"quality\":0,\"stream_protocol\":\"HLS\",\"variants\":[\"string\"],\"video_codec\":\"h264\"}}},\"request\":{\"url\":\"https://example.com\",\"x_request_id\":\"x_request_id\",\"user_agent\":\"user_agent\"}}"
    message_id = "1"
    timestamp = Time.now.to_i.to_s
    signature = webhook.sign(message_id, timestamp, data)
    headers =
      {"webhook-id" => message_id, "webhook-timestamp" => timestamp, "webhook-signature" => signature}

    @image_kit.webhooks.unwrap(data, headers: headers, key: key)

    bad_headers = [
      headers.merge("webhook-id" => "bad"),
      headers.merge("webhook-timestamp" => "0"),
      headers.merge("webhook-signature" => webhook.sign(message_id, timestamp, "xxx"))
    ]
    bad_headers.each do |bad_header|
      assert_raises(StandardWebhooks::WebhookVerificationError) do
        @image_kit.webhooks.unwrap(data, headers: bad_header, key: key)
      end
    end
  end
end
