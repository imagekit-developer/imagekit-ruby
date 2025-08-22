# frozen_string_literal: true

require_relative "../../test_helper"

class Imagekit::Test::Resources::Accounts::OriginsTest < Imagekit::Test::ResourceTest
  def test_create_required_params
    skip("Prism tests are disabled")

    response = @image_kit.accounts.origins.create(body: {name: "name", type: :S3})

    assert_pattern do
      response => Imagekit::Models::Accounts::OriginCreateResponse
    end

    assert_pattern do
      case response
      in Imagekit::Models::Accounts::OriginCreateResponse::S3
      in Imagekit::Models::Accounts::OriginCreateResponse::S3Compatible
      in Imagekit::Models::Accounts::OriginCreateResponse::CloudinaryBackup
      in Imagekit::Models::Accounts::OriginCreateResponse::WebFolder
      in Imagekit::Models::Accounts::OriginCreateResponse::WebProxy
      in Imagekit::Models::Accounts::OriginCreateResponse::GoogleCloudStorageGcs
      in Imagekit::Models::Accounts::OriginCreateResponse::AzureBlobStorage
      in Imagekit::Models::Accounts::OriginCreateResponse::AkeneoPim
      end
    end
  end

  def test_update_required_params
    skip("Prism tests are disabled")

    response = @image_kit.accounts.origins.update("id", body: {name: "name", type: :S3})

    assert_pattern do
      response => Imagekit::Models::Accounts::OriginUpdateResponse
    end

    assert_pattern do
      case response
      in Imagekit::Models::Accounts::OriginUpdateResponse::S3
      in Imagekit::Models::Accounts::OriginUpdateResponse::S3Compatible
      in Imagekit::Models::Accounts::OriginUpdateResponse::CloudinaryBackup
      in Imagekit::Models::Accounts::OriginUpdateResponse::WebFolder
      in Imagekit::Models::Accounts::OriginUpdateResponse::WebProxy
      in Imagekit::Models::Accounts::OriginUpdateResponse::GoogleCloudStorageGcs
      in Imagekit::Models::Accounts::OriginUpdateResponse::AzureBlobStorage
      in Imagekit::Models::Accounts::OriginUpdateResponse::AkeneoPim
      end
    end
  end

  def test_list
    skip("Prism tests are disabled")

    response = @image_kit.accounts.origins.list

    assert_pattern do
      response => ^(Imagekit::Internal::Type::ArrayOf[union: Imagekit::Models::Accounts::OriginListResponseItem])
    end
  end

  def test_delete
    skip("Prism tests are disabled")

    response = @image_kit.accounts.origins.delete("id")

    assert_pattern do
      response => nil
    end
  end

  def test_get
    skip("Prism tests are disabled")

    response = @image_kit.accounts.origins.get("id")

    assert_pattern do
      response => Imagekit::Models::Accounts::OriginGetResponse
    end

    assert_pattern do
      case response
      in Imagekit::Models::Accounts::OriginGetResponse::S3
      in Imagekit::Models::Accounts::OriginGetResponse::S3Compatible
      in Imagekit::Models::Accounts::OriginGetResponse::CloudinaryBackup
      in Imagekit::Models::Accounts::OriginGetResponse::WebFolder
      in Imagekit::Models::Accounts::OriginGetResponse::WebProxy
      in Imagekit::Models::Accounts::OriginGetResponse::GoogleCloudStorageGcs
      in Imagekit::Models::Accounts::OriginGetResponse::AzureBlobStorage
      in Imagekit::Models::Accounts::OriginGetResponse::AkeneoPim
      end
    end
  end
end
