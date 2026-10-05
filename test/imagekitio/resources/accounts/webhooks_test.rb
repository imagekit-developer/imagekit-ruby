# frozen_string_literal: true

require_relative "../../test_helper"

class Imagekitio::Test::Resources::Accounts::WebhooksTest < Imagekitio::Test::ResourceTest
  def test_create_required_params
    skip("Mock server tests are disabled")

    response =
      @image_kit.accounts.webhooks.create(
        endpoint: "https://example.com/imagekit/webhooks",
        events: [:"video.transformation.ready", :"file.created"]
      )

    assert_pattern do
      response => Imagekitio::Accounts::Webhook
    end

    assert_pattern do
      response => {
        id: String,
        created_at: Time,
        enabled: Imagekitio::Internal::Type::Boolean,
        endpoint: String,
        events: ^(Imagekitio::Internal::Type::ArrayOf[enum: Imagekitio::Accounts::WebhookEventType]),
        secret: String,
        updated_at: Time
      }
    end
  end

  def test_update
    skip("Mock server tests are disabled")

    response = @image_kit.accounts.webhooks.update("65f1c2a9e4b0a1b2c3d4e5f6")

    assert_pattern do
      response => Imagekitio::Accounts::Webhook
    end

    assert_pattern do
      response => {
        id: String,
        created_at: Time,
        enabled: Imagekitio::Internal::Type::Boolean,
        endpoint: String,
        events: ^(Imagekitio::Internal::Type::ArrayOf[enum: Imagekitio::Accounts::WebhookEventType]),
        secret: String,
        updated_at: Time
      }
    end
  end

  def test_list
    skip("Mock server tests are disabled")

    response = @image_kit.accounts.webhooks.list

    assert_pattern do
      response => ^(Imagekitio::Internal::Type::ArrayOf[Imagekitio::Accounts::Webhook])
    end
  end

  def test_delete
    skip("Mock server tests are disabled")

    response = @image_kit.accounts.webhooks.delete("65f1c2a9e4b0a1b2c3d4e5f6")

    assert_pattern do
      response => nil
    end
  end

  def test_get
    skip("Mock server tests are disabled")

    response = @image_kit.accounts.webhooks.get("65f1c2a9e4b0a1b2c3d4e5f6")

    assert_pattern do
      response => Imagekitio::Accounts::Webhook
    end

    assert_pattern do
      response => {
        id: String,
        created_at: Time,
        enabled: Imagekitio::Internal::Type::Boolean,
        endpoint: String,
        events: ^(Imagekitio::Internal::Type::ArrayOf[enum: Imagekitio::Accounts::WebhookEventType]),
        secret: String,
        updated_at: Time
      }
    end
  end
end
