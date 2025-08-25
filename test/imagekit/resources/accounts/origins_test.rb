# frozen_string_literal: true

require_relative "../../test_helper"

class Imagekit::Test::Resources::Accounts::OriginsTest < Imagekit::Test::ResourceTest
  def test_create_required_params
    skip("Prism tests are disabled")

    response =
      @image_kit.accounts.origins.create(
        origin: {
          accessKey: "AKIATEST123",
          bucket: "test-bucket",
          name: "My S3 Origin",
          secretKey: "secrettest123",
          type: :S3
        }
      )

    assert_pattern do
      response => Imagekit::Accounts::Origin
    end

    assert_pattern do
      case response
      in Imagekit::Accounts::Origin::S3
      in Imagekit::Accounts::Origin::S3Compatible
      in Imagekit::Accounts::Origin::CloudinaryBackup
      in Imagekit::Accounts::Origin::WebFolder
      in Imagekit::Accounts::Origin::WebProxy
      in Imagekit::Accounts::Origin::Gcs
      in Imagekit::Accounts::Origin::AzureBlob
      in Imagekit::Accounts::Origin::AkeneoPim
      end
    end

    assert_pattern do
      case response
      in {
        type: :S3,
        access_key: String,
        bucket: String,
        name: String,
        secret_key: String,
        id: String | nil,
        base_url_for_canonical_header: String | nil,
        include_canonical_header: Imagekit::Internal::Type::Boolean | nil,
        prefix: String | nil
      }
      in {
        type: :S3_COMPATIBLE,
        access_key: String,
        bucket: String,
        endpoint: String,
        name: String,
        secret_key: String,
        id: String | nil,
        base_url_for_canonical_header: String | nil,
        include_canonical_header: Imagekit::Internal::Type::Boolean | nil,
        prefix: String | nil,
        s3_force_path_style: Imagekit::Internal::Type::Boolean | nil
      }
      in {
        type: :CLOUDINARY_BACKUP,
        access_key: String,
        bucket: String,
        name: String,
        secret_key: String,
        id: String | nil,
        base_url_for_canonical_header: String | nil,
        include_canonical_header: Imagekit::Internal::Type::Boolean | nil,
        prefix: String | nil
      }
      in {
        type: :WEB_FOLDER,
        base_url: String,
        name: String,
        id: String | nil,
        base_url_for_canonical_header: String | nil,
        forward_host_header_to_origin: Imagekit::Internal::Type::Boolean | nil,
        include_canonical_header: Imagekit::Internal::Type::Boolean | nil
      }
      in {
        type: :WEB_PROXY,
        name: String,
        id: String | nil,
        base_url_for_canonical_header: String | nil,
        include_canonical_header: Imagekit::Internal::Type::Boolean | nil
      }
      in {
        type: :GCS,
        bucket: String,
        client_email: String,
        name: String,
        private_key: String,
        id: String | nil,
        base_url_for_canonical_header: String | nil,
        include_canonical_header: Imagekit::Internal::Type::Boolean | nil,
        prefix: String | nil
      }
      in {
        type: :AZURE_BLOB,
        account_name: String,
        container: String,
        name: String,
        sas_token: String,
        id: String | nil,
        base_url_for_canonical_header: String | nil,
        include_canonical_header: Imagekit::Internal::Type::Boolean | nil,
        prefix: String | nil
      }
      in {
        type: :AKENEO_PIM,
        base_url: String,
        client_id: String,
        client_secret: String,
        name: String,
        password: String,
        username: String,
        id: String | nil,
        base_url_for_canonical_header: String | nil,
        include_canonical_header: Imagekit::Internal::Type::Boolean | nil
      }
      end
    end
  end

  def test_update_required_params
    skip("Prism tests are disabled")

    response =
      @image_kit.accounts.origins.update(
        "id",
        origin: {
          accessKey: "AKIATEST123",
          bucket: "test-bucket",
          name: "My S3 Origin",
          secretKey: "secrettest123",
          type: :S3
        }
      )

    assert_pattern do
      response => Imagekit::Accounts::Origin
    end

    assert_pattern do
      case response
      in Imagekit::Accounts::Origin::S3
      in Imagekit::Accounts::Origin::S3Compatible
      in Imagekit::Accounts::Origin::CloudinaryBackup
      in Imagekit::Accounts::Origin::WebFolder
      in Imagekit::Accounts::Origin::WebProxy
      in Imagekit::Accounts::Origin::Gcs
      in Imagekit::Accounts::Origin::AzureBlob
      in Imagekit::Accounts::Origin::AkeneoPim
      end
    end

    assert_pattern do
      case response
      in {
        type: :S3,
        access_key: String,
        bucket: String,
        name: String,
        secret_key: String,
        id: String | nil,
        base_url_for_canonical_header: String | nil,
        include_canonical_header: Imagekit::Internal::Type::Boolean | nil,
        prefix: String | nil
      }
      in {
        type: :S3_COMPATIBLE,
        access_key: String,
        bucket: String,
        endpoint: String,
        name: String,
        secret_key: String,
        id: String | nil,
        base_url_for_canonical_header: String | nil,
        include_canonical_header: Imagekit::Internal::Type::Boolean | nil,
        prefix: String | nil,
        s3_force_path_style: Imagekit::Internal::Type::Boolean | nil
      }
      in {
        type: :CLOUDINARY_BACKUP,
        access_key: String,
        bucket: String,
        name: String,
        secret_key: String,
        id: String | nil,
        base_url_for_canonical_header: String | nil,
        include_canonical_header: Imagekit::Internal::Type::Boolean | nil,
        prefix: String | nil
      }
      in {
        type: :WEB_FOLDER,
        base_url: String,
        name: String,
        id: String | nil,
        base_url_for_canonical_header: String | nil,
        forward_host_header_to_origin: Imagekit::Internal::Type::Boolean | nil,
        include_canonical_header: Imagekit::Internal::Type::Boolean | nil
      }
      in {
        type: :WEB_PROXY,
        name: String,
        id: String | nil,
        base_url_for_canonical_header: String | nil,
        include_canonical_header: Imagekit::Internal::Type::Boolean | nil
      }
      in {
        type: :GCS,
        bucket: String,
        client_email: String,
        name: String,
        private_key: String,
        id: String | nil,
        base_url_for_canonical_header: String | nil,
        include_canonical_header: Imagekit::Internal::Type::Boolean | nil,
        prefix: String | nil
      }
      in {
        type: :AZURE_BLOB,
        account_name: String,
        container: String,
        name: String,
        sas_token: String,
        id: String | nil,
        base_url_for_canonical_header: String | nil,
        include_canonical_header: Imagekit::Internal::Type::Boolean | nil,
        prefix: String | nil
      }
      in {
        type: :AKENEO_PIM,
        base_url: String,
        client_id: String,
        client_secret: String,
        name: String,
        password: String,
        username: String,
        id: String | nil,
        base_url_for_canonical_header: String | nil,
        include_canonical_header: Imagekit::Internal::Type::Boolean | nil
      }
      end
    end
  end

  def test_list
    skip("Prism tests are disabled")

    response = @image_kit.accounts.origins.list

    assert_pattern do
      response => ^(Imagekit::Internal::Type::ArrayOf[union: Imagekit::Accounts::Origin])
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
      response => Imagekit::Accounts::Origin
    end

    assert_pattern do
      case response
      in Imagekit::Accounts::Origin::S3
      in Imagekit::Accounts::Origin::S3Compatible
      in Imagekit::Accounts::Origin::CloudinaryBackup
      in Imagekit::Accounts::Origin::WebFolder
      in Imagekit::Accounts::Origin::WebProxy
      in Imagekit::Accounts::Origin::Gcs
      in Imagekit::Accounts::Origin::AzureBlob
      in Imagekit::Accounts::Origin::AkeneoPim
      end
    end

    assert_pattern do
      case response
      in {
        type: :S3,
        access_key: String,
        bucket: String,
        name: String,
        secret_key: String,
        id: String | nil,
        base_url_for_canonical_header: String | nil,
        include_canonical_header: Imagekit::Internal::Type::Boolean | nil,
        prefix: String | nil
      }
      in {
        type: :S3_COMPATIBLE,
        access_key: String,
        bucket: String,
        endpoint: String,
        name: String,
        secret_key: String,
        id: String | nil,
        base_url_for_canonical_header: String | nil,
        include_canonical_header: Imagekit::Internal::Type::Boolean | nil,
        prefix: String | nil,
        s3_force_path_style: Imagekit::Internal::Type::Boolean | nil
      }
      in {
        type: :CLOUDINARY_BACKUP,
        access_key: String,
        bucket: String,
        name: String,
        secret_key: String,
        id: String | nil,
        base_url_for_canonical_header: String | nil,
        include_canonical_header: Imagekit::Internal::Type::Boolean | nil,
        prefix: String | nil
      }
      in {
        type: :WEB_FOLDER,
        base_url: String,
        name: String,
        id: String | nil,
        base_url_for_canonical_header: String | nil,
        forward_host_header_to_origin: Imagekit::Internal::Type::Boolean | nil,
        include_canonical_header: Imagekit::Internal::Type::Boolean | nil
      }
      in {
        type: :WEB_PROXY,
        name: String,
        id: String | nil,
        base_url_for_canonical_header: String | nil,
        include_canonical_header: Imagekit::Internal::Type::Boolean | nil
      }
      in {
        type: :GCS,
        bucket: String,
        client_email: String,
        name: String,
        private_key: String,
        id: String | nil,
        base_url_for_canonical_header: String | nil,
        include_canonical_header: Imagekit::Internal::Type::Boolean | nil,
        prefix: String | nil
      }
      in {
        type: :AZURE_BLOB,
        account_name: String,
        container: String,
        name: String,
        sas_token: String,
        id: String | nil,
        base_url_for_canonical_header: String | nil,
        include_canonical_header: Imagekit::Internal::Type::Boolean | nil,
        prefix: String | nil
      }
      in {
        type: :AKENEO_PIM,
        base_url: String,
        client_id: String,
        client_secret: String,
        name: String,
        password: String,
        username: String,
        id: String | nil,
        base_url_for_canonical_header: String | nil,
        include_canonical_header: Imagekit::Internal::Type::Boolean | nil
      }
      end
    end
  end
end
