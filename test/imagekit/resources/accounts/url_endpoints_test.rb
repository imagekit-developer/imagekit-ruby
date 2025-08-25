# frozen_string_literal: true

require_relative "../../test_helper"

class Imagekit::Test::Resources::Accounts::URLEndpointsTest < Imagekit::Test::ResourceTest
  def test_create_required_params
    skip("Prism tests are disabled")

    response = @image_kit.accounts.url_endpoints.create(description: "My custom URL endpoint")

    assert_pattern do
      response => Imagekit::Accounts::URLEndpointResponse
    end

    assert_pattern do
      response => {
        id: String,
        description: String,
        origins: ^(Imagekit::Internal::Type::ArrayOf[String]),
        url_prefix: String,
        url_rewriter: Imagekit::Accounts::URLEndpointResponse::URLRewriter | nil
      }
    end
  end

  def test_update_required_params
    skip("Prism tests are disabled")

    response = @image_kit.accounts.url_endpoints.update("id", description: "My custom URL endpoint")

    assert_pattern do
      response => Imagekit::Accounts::URLEndpointResponse
    end

    assert_pattern do
      response => {
        id: String,
        description: String,
        origins: ^(Imagekit::Internal::Type::ArrayOf[String]),
        url_prefix: String,
        url_rewriter: Imagekit::Accounts::URLEndpointResponse::URLRewriter | nil
      }
    end
  end

  def test_list
    skip("Prism tests are disabled")

    response = @image_kit.accounts.url_endpoints.list

    assert_pattern do
      response => ^(Imagekit::Internal::Type::ArrayOf[Imagekit::Accounts::URLEndpointResponse])
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
      response => Imagekit::Accounts::URLEndpointResponse
    end

    assert_pattern do
      response => {
        id: String,
        description: String,
        origins: ^(Imagekit::Internal::Type::ArrayOf[String]),
        url_prefix: String,
        url_rewriter: Imagekit::Accounts::URLEndpointResponse::URLRewriter | nil
      }
    end
  end
end
