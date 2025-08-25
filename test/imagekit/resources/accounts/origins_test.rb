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
      response => Imagekit::Models::Accounts::OriginCreateResponse
    end

    assert_pattern do
      case response
      in Imagekit::Models::Accounts::OriginCreateResponse::S3
      in Imagekit::Models::Accounts::OriginCreateResponse::S3Compatible
      in Imagekit::Models::Accounts::OriginCreateResponse::CloudinaryBackup
      in Imagekit::Models::Accounts::OriginCreateResponse::WebFolder
      in Imagekit::Models::Accounts::OriginCreateResponse::WebProxy
      in Imagekit::Models::Accounts::OriginCreateResponse::Gcs
      in Imagekit::Models::Accounts::OriginCreateResponse::AzureBlob
      in Imagekit::Models::Accounts::OriginCreateResponse::AkeneoPim
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
        origin: {
          accessKey: "AKIATEST123",
          bucket: "test-bucket",
          name: "My S3 Origin",
          secretKey: "secrettest123",
          type: :S3
        }
      )

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
      in Imagekit::Models::Accounts::OriginUpdateResponse::Gcs
      in Imagekit::Models::Accounts::OriginUpdateResponse::AzureBlob
      in Imagekit::Models::Accounts::OriginUpdateResponse::AkeneoPim
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
      in Imagekit::Models::Accounts::OriginGetResponse::Gcs
      in Imagekit::Models::Accounts::OriginGetResponse::AzureBlob
      in Imagekit::Models::Accounts::OriginGetResponse::AkeneoPim
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
