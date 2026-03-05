# frozen_string_literal: true

require_relative "../../test_helper"

class Imagekitio::Test::Resources::Accounts::OriginsTest < Imagekitio::Test::ResourceTest
  def test_create_required_params
    skip("Mock server tests are disabled")

    response =
      @image_kit.accounts.origins.create(
        origin_request: {
          accessKey: "AKIATEST123",
          bucket: "test-bucket",
          name: "My S3 Origin",
          secretKey: "secrettest123",
          type: :S3
        }
      )

    assert_pattern do
      response => Imagekitio::Accounts::OriginResponse
    end

    assert_pattern do
      case response
      in Imagekitio::Accounts::OriginResponse::S3
      in Imagekitio::Accounts::OriginResponse::S3Compatible
      in Imagekitio::Accounts::OriginResponse::CloudinaryBackup
      in Imagekitio::Accounts::OriginResponse::WebFolder
      in Imagekitio::Accounts::OriginResponse::WebProxy
      in Imagekitio::Accounts::OriginResponse::Gcs
      in Imagekitio::Accounts::OriginResponse::AzureBlob
      in Imagekitio::Accounts::OriginResponse::AkeneoPim
      end
    end

    assert_pattern do
      case response
      in {
        type: :S3,
        id: String,
        bucket: String,
        include_canonical_header: Imagekitio::Internal::Type::Boolean,
        name: String,
        prefix: String,
        base_url_for_canonical_header: String | nil
      }
      in {
        type: :S3_COMPATIBLE,
        id: String,
        bucket: String,
        endpoint: String,
        include_canonical_header: Imagekitio::Internal::Type::Boolean,
        name: String,
        prefix: String,
        s3_force_path_style: Imagekitio::Internal::Type::Boolean,
        base_url_for_canonical_header: String | nil
      }
      in {
        type: :CLOUDINARY_BACKUP,
        id: String,
        bucket: String,
        include_canonical_header: Imagekitio::Internal::Type::Boolean,
        name: String,
        prefix: String,
        base_url_for_canonical_header: String | nil
      }
      in {
        type: :WEB_FOLDER,
        id: String,
        base_url: String,
        forward_host_header_to_origin: Imagekitio::Internal::Type::Boolean,
        include_canonical_header: Imagekitio::Internal::Type::Boolean,
        name: String,
        base_url_for_canonical_header: String | nil
      }
      in {
        type: :WEB_PROXY,
        id: String,
        include_canonical_header: Imagekitio::Internal::Type::Boolean,
        name: String,
        base_url_for_canonical_header: String | nil
      }
      in {
        type: :GCS,
        id: String,
        bucket: String,
        client_email: String,
        include_canonical_header: Imagekitio::Internal::Type::Boolean,
        name: String,
        prefix: String,
        base_url_for_canonical_header: String | nil
      }
      in {
        type: :AZURE_BLOB,
        id: String,
        account_name: String,
        container: String,
        include_canonical_header: Imagekitio::Internal::Type::Boolean,
        name: String,
        prefix: String,
        base_url_for_canonical_header: String | nil
      }
      in {
        type: :AKENEO_PIM,
        id: String,
        base_url: String,
        include_canonical_header: Imagekitio::Internal::Type::Boolean,
        name: String,
        base_url_for_canonical_header: String | nil
      }
      end
    end
  end

  def test_update_required_params
    skip("Mock server tests are disabled")

    response =
      @image_kit.accounts.origins.update(
        "id",
        origin_request: {
          accessKey: "AKIATEST123",
          bucket: "test-bucket",
          name: "My S3 Origin",
          secretKey: "secrettest123",
          type: :S3
        }
      )

    assert_pattern do
      response => Imagekitio::Accounts::OriginResponse
    end

    assert_pattern do
      case response
      in Imagekitio::Accounts::OriginResponse::S3
      in Imagekitio::Accounts::OriginResponse::S3Compatible
      in Imagekitio::Accounts::OriginResponse::CloudinaryBackup
      in Imagekitio::Accounts::OriginResponse::WebFolder
      in Imagekitio::Accounts::OriginResponse::WebProxy
      in Imagekitio::Accounts::OriginResponse::Gcs
      in Imagekitio::Accounts::OriginResponse::AzureBlob
      in Imagekitio::Accounts::OriginResponse::AkeneoPim
      end
    end

    assert_pattern do
      case response
      in {
        type: :S3,
        id: String,
        bucket: String,
        include_canonical_header: Imagekitio::Internal::Type::Boolean,
        name: String,
        prefix: String,
        base_url_for_canonical_header: String | nil
      }
      in {
        type: :S3_COMPATIBLE,
        id: String,
        bucket: String,
        endpoint: String,
        include_canonical_header: Imagekitio::Internal::Type::Boolean,
        name: String,
        prefix: String,
        s3_force_path_style: Imagekitio::Internal::Type::Boolean,
        base_url_for_canonical_header: String | nil
      }
      in {
        type: :CLOUDINARY_BACKUP,
        id: String,
        bucket: String,
        include_canonical_header: Imagekitio::Internal::Type::Boolean,
        name: String,
        prefix: String,
        base_url_for_canonical_header: String | nil
      }
      in {
        type: :WEB_FOLDER,
        id: String,
        base_url: String,
        forward_host_header_to_origin: Imagekitio::Internal::Type::Boolean,
        include_canonical_header: Imagekitio::Internal::Type::Boolean,
        name: String,
        base_url_for_canonical_header: String | nil
      }
      in {
        type: :WEB_PROXY,
        id: String,
        include_canonical_header: Imagekitio::Internal::Type::Boolean,
        name: String,
        base_url_for_canonical_header: String | nil
      }
      in {
        type: :GCS,
        id: String,
        bucket: String,
        client_email: String,
        include_canonical_header: Imagekitio::Internal::Type::Boolean,
        name: String,
        prefix: String,
        base_url_for_canonical_header: String | nil
      }
      in {
        type: :AZURE_BLOB,
        id: String,
        account_name: String,
        container: String,
        include_canonical_header: Imagekitio::Internal::Type::Boolean,
        name: String,
        prefix: String,
        base_url_for_canonical_header: String | nil
      }
      in {
        type: :AKENEO_PIM,
        id: String,
        base_url: String,
        include_canonical_header: Imagekitio::Internal::Type::Boolean,
        name: String,
        base_url_for_canonical_header: String | nil
      }
      end
    end
  end

  def test_list
    skip("Mock server tests are disabled")

    response = @image_kit.accounts.origins.list

    assert_pattern do
      response => ^(Imagekitio::Internal::Type::ArrayOf[union: Imagekitio::Accounts::OriginResponse])
    end
  end

  def test_delete
    skip("Mock server tests are disabled")

    response = @image_kit.accounts.origins.delete("id")

    assert_pattern do
      response => nil
    end
  end

  def test_get
    skip("Mock server tests are disabled")

    response = @image_kit.accounts.origins.get("id")

    assert_pattern do
      response => Imagekitio::Accounts::OriginResponse
    end

    assert_pattern do
      case response
      in Imagekitio::Accounts::OriginResponse::S3
      in Imagekitio::Accounts::OriginResponse::S3Compatible
      in Imagekitio::Accounts::OriginResponse::CloudinaryBackup
      in Imagekitio::Accounts::OriginResponse::WebFolder
      in Imagekitio::Accounts::OriginResponse::WebProxy
      in Imagekitio::Accounts::OriginResponse::Gcs
      in Imagekitio::Accounts::OriginResponse::AzureBlob
      in Imagekitio::Accounts::OriginResponse::AkeneoPim
      end
    end

    assert_pattern do
      case response
      in {
        type: :S3,
        id: String,
        bucket: String,
        include_canonical_header: Imagekitio::Internal::Type::Boolean,
        name: String,
        prefix: String,
        base_url_for_canonical_header: String | nil
      }
      in {
        type: :S3_COMPATIBLE,
        id: String,
        bucket: String,
        endpoint: String,
        include_canonical_header: Imagekitio::Internal::Type::Boolean,
        name: String,
        prefix: String,
        s3_force_path_style: Imagekitio::Internal::Type::Boolean,
        base_url_for_canonical_header: String | nil
      }
      in {
        type: :CLOUDINARY_BACKUP,
        id: String,
        bucket: String,
        include_canonical_header: Imagekitio::Internal::Type::Boolean,
        name: String,
        prefix: String,
        base_url_for_canonical_header: String | nil
      }
      in {
        type: :WEB_FOLDER,
        id: String,
        base_url: String,
        forward_host_header_to_origin: Imagekitio::Internal::Type::Boolean,
        include_canonical_header: Imagekitio::Internal::Type::Boolean,
        name: String,
        base_url_for_canonical_header: String | nil
      }
      in {
        type: :WEB_PROXY,
        id: String,
        include_canonical_header: Imagekitio::Internal::Type::Boolean,
        name: String,
        base_url_for_canonical_header: String | nil
      }
      in {
        type: :GCS,
        id: String,
        bucket: String,
        client_email: String,
        include_canonical_header: Imagekitio::Internal::Type::Boolean,
        name: String,
        prefix: String,
        base_url_for_canonical_header: String | nil
      }
      in {
        type: :AZURE_BLOB,
        id: String,
        account_name: String,
        container: String,
        include_canonical_header: Imagekitio::Internal::Type::Boolean,
        name: String,
        prefix: String,
        base_url_for_canonical_header: String | nil
      }
      in {
        type: :AKENEO_PIM,
        id: String,
        base_url: String,
        include_canonical_header: Imagekitio::Internal::Type::Boolean,
        name: String,
        base_url_for_canonical_header: String | nil
      }
      end
    end
  end
end
