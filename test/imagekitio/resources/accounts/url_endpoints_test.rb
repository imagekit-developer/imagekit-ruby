# frozen_string_literal: true

require_relative "../../test_helper"

class Imagekitio::Test::Resources::Accounts::URLEndpointsTest < Imagekitio::Test::ResourceTest
  def test_create_required_params
    skip("Prism tests are disabled")

    response = @image_kit.accounts.url_endpoints.create(description: "My custom URL endpoint")

    assert_pattern do
      response => Imagekitio::Accounts::URLEndpointResponse
    end

    assert_pattern do
      response => {
        id: String,
        description: String,
        origins: ^(Imagekitio::Internal::Type::ArrayOf[String]),
        url_prefix: String,
        url_rewriter: Imagekitio::Accounts::URLEndpointResponse::URLRewriter | nil
      }
    end
  end

  def test_update_required_params
    skip("Prism tests are disabled")

    response = @image_kit.accounts.url_endpoints.update("id", description: "My custom URL endpoint")

    assert_pattern do
      response => Imagekitio::Accounts::URLEndpointResponse
    end

    assert_pattern do
      response => {
        id: String,
        description: String,
        origins: ^(Imagekitio::Internal::Type::ArrayOf[String]),
        url_prefix: String,
        url_rewriter: Imagekitio::Accounts::URLEndpointResponse::URLRewriter | nil
      }
    end
  end

  def test_list
    skip("Prism tests are disabled")

    response = @image_kit.accounts.url_endpoints.list

    assert_pattern do
      response => ^(Imagekitio::Internal::Type::ArrayOf[Imagekitio::Accounts::URLEndpointResponse])
    end
  end

  def test_delete
    skip("Prism tests are disabled")

    response = @image_kit.accounts.url_endpoints.delete("id")

    assert_pattern do
      response => nil
    end
  end

  def test_get
    skip("Prism tests are disabled")

    response = @image_kit.accounts.url_endpoints.get("id")

    assert_pattern do
      response => Imagekitio::Accounts::URLEndpointResponse
    end

    assert_pattern do
      response => {
        id: String,
        description: String,
        origins: ^(Imagekitio::Internal::Type::ArrayOf[String]),
        url_prefix: String,
        url_rewriter: Imagekitio::Accounts::URLEndpointResponse::URLRewriter | nil
      }
    end
  end
end
