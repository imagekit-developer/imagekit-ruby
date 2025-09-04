# frozen_string_literal: true

require_relative "../../test_helper"

class Imagekit::Test::Resources::Accounts::OriginsTest < Imagekit::Test::ResourceTest
  def test_create_required_params
    skip("Prism tests are disabled")

    response =
      @image_kit.accounts.origins.create(
        base_url: "https://akeneo.company.com",
        client_id: "akeneo-client-id",
        client_secret: "akeneo-client-secret",
        name: "US S3 Storage",
        password: "strongpassword123",
        type: :AKENEO_PIM,
        username: "integration-user"
      )

    assert_pattern do
      response => Imagekit::Accounts::OriginResponse
    end

    assert_pattern do
      case response
      in Imagekit::Accounts::OriginResponse::S3
      in Imagekit::Accounts::OriginResponse::S3Compatible
      in Imagekit::Accounts::OriginResponse::CloudinaryBackup
      in Imagekit::Accounts::OriginResponse::WebFolder
      in Imagekit::Accounts::OriginResponse::WebProxy
      in Imagekit::Accounts::OriginResponse::Gcs
      in Imagekit::Accounts::OriginResponse::AzureBlob
      in Imagekit::Accounts::OriginResponse::AkeneoPim
      end
    end

    assert_pattern do
      case response
      in {
        type: :S3,
        id: String,
        bucket: String,
        include_canonical_header: Imagekit::Internal::Type::Boolean,
        name: String,
        prefix: String,
        base_url_for_canonical_header: String | nil
      }
      in {
        type: :S3_COMPATIBLE,
        id: String,
        bucket: String,
        endpoint: String,
        include_canonical_header: Imagekit::Internal::Type::Boolean,
        name: String,
        prefix: String,
        s3_force_path_style: Imagekit::Internal::Type::Boolean,
        base_url_for_canonical_header: String | nil
      }
      in {
        type: :CLOUDINARY_BACKUP,
        id: String,
        bucket: String,
        include_canonical_header: Imagekit::Internal::Type::Boolean,
        name: String,
        prefix: String,
        base_url_for_canonical_header: String | nil
      }
      in {
        type: :WEB_FOLDER,
        id: String,
        base_url: String,
        forward_host_header_to_origin: Imagekit::Internal::Type::Boolean,
        include_canonical_header: Imagekit::Internal::Type::Boolean,
        name: String,
        base_url_for_canonical_header: String | nil
      }
      in {
        type: :WEB_PROXY,
        id: String,
        include_canonical_header: Imagekit::Internal::Type::Boolean,
        name: String,
        base_url_for_canonical_header: String | nil
      }
      in {
        type: :GCS,
        id: String,
        bucket: String,
        client_email: String,
        include_canonical_header: Imagekit::Internal::Type::Boolean,
        name: String,
        prefix: String,
        base_url_for_canonical_header: String | nil
      }
      in {
        type: :AZURE_BLOB,
        id: String,
        account_name: String,
        container: String,
        include_canonical_header: Imagekit::Internal::Type::Boolean,
        name: String,
        prefix: String,
        base_url_for_canonical_header: String | nil
      }
      in {
        type: :AKENEO_PIM,
        id: String,
        base_url: String,
        include_canonical_header: Imagekit::Internal::Type::Boolean,
        name: String,
        base_url_for_canonical_header: String | nil
      }
      end
    end
  end

  def test_update_required_params
    skip("Prism tests are disabled")

    response =
      @image_kit.accounts.origins.update(
        "id",
        base_url: "https://akeneo.company.com",
        client_id: "akeneo-client-id",
        client_secret: "akeneo-client-secret",
        name: "US S3 Storage",
        password: "strongpassword123",
        type: :AKENEO_PIM,
        username: "integration-user"
      )

    assert_pattern do
      response => Imagekit::Accounts::OriginResponse
    end

    assert_pattern do
      case response
      in Imagekit::Accounts::OriginResponse::S3
      in Imagekit::Accounts::OriginResponse::S3Compatible
      in Imagekit::Accounts::OriginResponse::CloudinaryBackup
      in Imagekit::Accounts::OriginResponse::WebFolder
      in Imagekit::Accounts::OriginResponse::WebProxy
      in Imagekit::Accounts::OriginResponse::Gcs
      in Imagekit::Accounts::OriginResponse::AzureBlob
      in Imagekit::Accounts::OriginResponse::AkeneoPim
      end
    end

    assert_pattern do
      case response
      in {
        type: :S3,
        id: String,
        bucket: String,
        include_canonical_header: Imagekit::Internal::Type::Boolean,
        name: String,
        prefix: String,
        base_url_for_canonical_header: String | nil
      }
      in {
        type: :S3_COMPATIBLE,
        id: String,
        bucket: String,
        endpoint: String,
        include_canonical_header: Imagekit::Internal::Type::Boolean,
        name: String,
        prefix: String,
        s3_force_path_style: Imagekit::Internal::Type::Boolean,
        base_url_for_canonical_header: String | nil
      }
      in {
        type: :CLOUDINARY_BACKUP,
        id: String,
        bucket: String,
        include_canonical_header: Imagekit::Internal::Type::Boolean,
        name: String,
        prefix: String,
        base_url_for_canonical_header: String | nil
      }
      in {
        type: :WEB_FOLDER,
        id: String,
        base_url: String,
        forward_host_header_to_origin: Imagekit::Internal::Type::Boolean,
        include_canonical_header: Imagekit::Internal::Type::Boolean,
        name: String,
        base_url_for_canonical_header: String | nil
      }
      in {
        type: :WEB_PROXY,
        id: String,
        include_canonical_header: Imagekit::Internal::Type::Boolean,
        name: String,
        base_url_for_canonical_header: String | nil
      }
      in {
        type: :GCS,
        id: String,
        bucket: String,
        client_email: String,
        include_canonical_header: Imagekit::Internal::Type::Boolean,
        name: String,
        prefix: String,
        base_url_for_canonical_header: String | nil
      }
      in {
        type: :AZURE_BLOB,
        id: String,
        account_name: String,
        container: String,
        include_canonical_header: Imagekit::Internal::Type::Boolean,
        name: String,
        prefix: String,
        base_url_for_canonical_header: String | nil
      }
      in {
        type: :AKENEO_PIM,
        id: String,
        base_url: String,
        include_canonical_header: Imagekit::Internal::Type::Boolean,
        name: String,
        base_url_for_canonical_header: String | nil
      }
      end
    end
  end

  def test_list
    skip("Prism tests are disabled")

    response = @image_kit.accounts.origins.list

    assert_pattern do
      response => ^(Imagekit::Internal::Type::ArrayOf[union: Imagekit::Accounts::OriginResponse])
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
      response => Imagekit::Accounts::OriginResponse
    end

    assert_pattern do
      case response
      in Imagekit::Accounts::OriginResponse::S3
      in Imagekit::Accounts::OriginResponse::S3Compatible
      in Imagekit::Accounts::OriginResponse::CloudinaryBackup
      in Imagekit::Accounts::OriginResponse::WebFolder
      in Imagekit::Accounts::OriginResponse::WebProxy
      in Imagekit::Accounts::OriginResponse::Gcs
      in Imagekit::Accounts::OriginResponse::AzureBlob
      in Imagekit::Accounts::OriginResponse::AkeneoPim
      end
    end

    assert_pattern do
      case response
      in {
        type: :S3,
        id: String,
        bucket: String,
        include_canonical_header: Imagekit::Internal::Type::Boolean,
        name: String,
        prefix: String,
        base_url_for_canonical_header: String | nil
      }
      in {
        type: :S3_COMPATIBLE,
        id: String,
        bucket: String,
        endpoint: String,
        include_canonical_header: Imagekit::Internal::Type::Boolean,
        name: String,
        prefix: String,
        s3_force_path_style: Imagekit::Internal::Type::Boolean,
        base_url_for_canonical_header: String | nil
      }
      in {
        type: :CLOUDINARY_BACKUP,
        id: String,
        bucket: String,
        include_canonical_header: Imagekit::Internal::Type::Boolean,
        name: String,
        prefix: String,
        base_url_for_canonical_header: String | nil
      }
      in {
        type: :WEB_FOLDER,
        id: String,
        base_url: String,
        forward_host_header_to_origin: Imagekit::Internal::Type::Boolean,
        include_canonical_header: Imagekit::Internal::Type::Boolean,
        name: String,
        base_url_for_canonical_header: String | nil
      }
      in {
        type: :WEB_PROXY,
        id: String,
        include_canonical_header: Imagekit::Internal::Type::Boolean,
        name: String,
        base_url_for_canonical_header: String | nil
      }
      in {
        type: :GCS,
        id: String,
        bucket: String,
        client_email: String,
        include_canonical_header: Imagekit::Internal::Type::Boolean,
        name: String,
        prefix: String,
        base_url_for_canonical_header: String | nil
      }
      in {
        type: :AZURE_BLOB,
        id: String,
        account_name: String,
        container: String,
        include_canonical_header: Imagekit::Internal::Type::Boolean,
        name: String,
        prefix: String,
        base_url_for_canonical_header: String | nil
      }
      in {
        type: :AKENEO_PIM,
        id: String,
        base_url: String,
        include_canonical_header: Imagekit::Internal::Type::Boolean,
        name: String,
        base_url_for_canonical_header: String | nil
      }
      end
    end
  end
end
