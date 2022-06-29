require_relative '../spec_helper'

RSpec.describe ImageKitIo::ApiService::File do
  let(:file_api_service) { described_class }
  let(:config) { ImageKitIo.config }
  let(:constants) { ImageKitIo.constants }
  let!(:private_key) { config.private_key }
  let!(:public_key) { config.public_key }
  let!(:url_endpoint) { config.url_endpoint }

  describe 'FileUploadTest' do
    it "test_upload_with_valid_expected_success_without_tags_and_remote_url" do
      request_obj = double
      allow(ImageKitIo::Request)
        .to receive(:new)
              .with(private_key, public_key, url_endpoint)
              .and_return(request_obj)

      allow(request_obj)
        .to receive(:create_headers)
              .and_return({})
      @ac={}
      allow(request_obj)
        .to receive(:request){|method,url,headers,payload| @ac={method: method, url: url, headers: headers, payload:payload}}
              .and_return({code: 200})

      SUT = file_api_service.new(request_obj)

      upload = SUT.upload(file: "http://remotefiles.com/fake_file.jpg", file_name: "my_file_name")
      expect(@ac[:payload].to_json).to eq("{\"multipart\":true,\"file\":\"http://remotefiles.com/fake_file.jpg\",\"fileName\":\"my_file_name\"}")

      expect(upload[:code]).to eq(200)

    end

    it "test_upload_with_valid_expected_success_without_tags_and_base64" do
      request_obj = double
      allow(ImageKitIo::Request)
        .to receive(:new)
              .with(private_key, public_key, url_endpoint)
              .and_return(request_obj)

      allow(request_obj)
        .to receive(:create_headers)
              .and_return({})
      @ac={}
      allow(request_obj)
        .to receive(:request){|method,url,headers,payload| @ac={method: method, url: url, headers: headers, payload:payload}}
              .and_return({code: 200})

      SUT = file_api_service.new(request_obj)
      base64="f06830ca9f1e3e90"
      upload = SUT.upload(file: base64, file_name: "my_file_name")
      expect(@ac[:payload].to_json).to eq("{\"multipart\":true,\"file\":\"#{base64}\",\"fileName\":\"my_file_name\"}")
      expect(ImageKitIo::Utils::Calculation.is_valid_hex(base64)).to eq(true)
      expect(upload[:code]).to eq(200)

    end

    it "test_upload_with_valid_expected_success_without_tags_and_file" do
      request_obj = double
      allow(ImageKitIo::Request)
        .to receive(:new)
              .with(private_key, public_key, url_endpoint)
              .and_return(request_obj)

      allow(request_obj)
        .to receive(:create_headers)
              .and_return({})
      @ac={}
      allow(request_obj)
        .to receive(:request){|method,url,headers,payload| @ac={method: method, url: url, headers: headers, payload:payload}}
              .and_return({code: 200})

      SUT = file_api_service.new(request_obj)
      file = open("test/imagekit/dummy_data/sample.jpg", "rb")
      upload = SUT.upload(file: file, file_name: "my_file_name")
      expect(@ac[:payload].keys).to eq([:multipart, :file, :fileName])
      expect(@ac[:payload][:file].io).to eq(file)
      expect(@ac[:payload][:fileName]).to eq('my_file_name')
      expect(upload[:code]).to eq(200)

    end

    it "test_upload_with_valid_expected_success_with_custom_coordinates" do
      request_obj = double
      allow(ImageKitIo::Request)
        .to receive(:new)
              .with(private_key, public_key, url_endpoint)
              .and_return(request_obj)

      allow(request_obj)
        .to receive(:create_headers)
              .and_return({})
      @ac={}
      allow(request_obj)
        .to receive(:request){|method,url,headers,payload| @ac={method: method, url: url, headers: headers, payload:payload}}
              .and_return({code: 200})

      SUT = file_api_service.new(request_obj)

      upload = SUT.upload(file: "./fake_file.jpg", file_name: "my_file_name", custom_coordinates: "10, 10, 100, 100")

      expect(@ac[:payload].to_json).to eq("{\"multipart\":true,\"file\":\"./fake_file.jpg\",\"fileName\":\"my_file_name\",\"customCoordinates\":\"10, 10, 100, 100\"}")

      expect(upload[:code]).to eq(200)

    end

    it "test_upload_with_valid_expected_success_with_extensions" do
      request_obj = double
      allow(ImageKitIo::Request)
        .to receive(:new)
              .with(private_key, public_key, url_endpoint)
              .and_return(request_obj)

      allow(request_obj)
        .to receive(:create_headers)
              .and_return({})
      @ac={}
      allow(request_obj)
        .to receive(:request){|method,url,headers,payload| @ac={method: method, url: url, headers: headers, payload:payload}}
              .and_return({code: 200})
      SUT = file_api_service.new(request_obj)
      upload = SUT.upload(file: "./fake_file.jpg", file_name: "my_file_name", extensions: [
        {
          name: 'remove-bg',
          options: {
            add_shadow: true
          }
        }
      ])
      expect(@ac[:payload]['extensions']).to eq("[{\"name\":\"remove-bg\",\"options\":{\"add_shadow\":true}}]")
      expect(upload[:code]).to eq(200)
    end

    it "test_upload_with_valid_expected_success_with_customMetadata" do
      request_obj = double
      allow(ImageKitIo::Request)
        .to receive(:new)
              .with(private_key, public_key, url_endpoint)
              .and_return(request_obj)

      allow(request_obj)
        .to receive(:create_headers)
              .and_return({})
      @ac={}
      allow(request_obj)
        .to receive(:request){|method,url,headers,payload| @ac={method: method, url: url, headers: headers, payload:payload}}
              .and_return({code: 200})
      SUT = file_api_service.new(request_obj)
      upload = SUT.upload(
        file: "./fake_file.jpg",
        file_name: "my_file_name",
        custom_metadata: {
          brand: 'Nike',
          color: 'red'
        }
      )
      expect(@ac[:payload]['customMetadata']).to eq("{\"brand\":\"Nike\",\"color\":\"red\"}")
      expect(upload[:code]).to eq(200)
    end

    it "test_upload_with_valid_expected_success" do
      request_obj = double
      allow(ImageKitIo::Request)
        .to receive(:new)
              .with(private_key, public_key, url_endpoint)
              .and_return(request_obj)

      allow(request_obj)
        .to receive(:create_headers)
              .and_return({})

      allow(request_obj)
        .to receive(:request){|method,url,headers,payload| @ac={method: method, url: url, headers: headers, payload:payload}}
              .and_return({code: 200})

      SUT = file_api_service.new(request_obj)

      upload = SUT.upload(file: "./fake_file.jpg", file_name: "my_file_name", response_fields: %w[is_private_file tags], tags: %w[abc def], use_unique_file_name: false)

      expect(@ac[:payload].to_json).to eq("{\"multipart\":true,\"file\":\"./fake_file.jpg\",\"fileName\":\"my_file_name\",\"responseFields\":\"is_private_file,tags\",\"tags\":\"abc,def\",\"useUniqueFileName\":\"false\"}")

      expect(upload[:code]).to eq(200)

    end

    it "test_upload_fails_on_invalid_options" do
      request_obj = double
      allow(ImageKitIo::Request)
        .to receive(:new)
              .with(private_key, public_key, url_endpoint)
              .and_return(request_obj)

      allow(request_obj)
        .to receive(:create_headers)
              .and_return({})

      allow(request_obj)
        .to receive(:request){|method,url,headers,payload| @ac={method: method, url: url, headers: headers, payload:payload}}
              .and_return({code: 401, message: nil})

      SUT = file_api_service.new(request_obj)
      expect{
        SUT.upload(file: "fake_file.jpg", file_name: "fake_name", invalid_option: "invalid_option" )
      }.to raise_error(ArgumentError)
    end

    it "test_upload_fails_on_unauthenticated_request" do
      request_obj = double
      allow(ImageKitIo::Request)
        .to receive(:new)
              .with(private_key, public_key, url_endpoint)
              .and_return(request_obj)

      allow(request_obj)
        .to receive(:create_headers)
              .and_return({})

      allow(request_obj)
        .to receive(:request){|method,url,headers,payload| @ac={method: method, url: url, headers: headers, payload:payload}}
              .and_return({code: 401, message: nil})

      SUT = file_api_service.new(request_obj)
      upload = SUT.upload(file: "fake_file.jpg", file_name: "fake_name")
      expect(@ac[:payload][:file]).to eq("fake_file.jpg")
      expect(@ac[:payload][:fileName]).to eq("fake_name")
      expect(upload[:code]).to eq(401)
    end
  end

  describe 'FileListTest' do
    it "test_list_files_fails_on_unauthenticated_request" do
      request_obj = double
      allow(ImageKitIo::Request)
        .to receive(:new)
              .with(private_key, public_key, url_endpoint)
              .and_return(request_obj)

      allow(request_obj)
        .to receive(:create_headers)
              .and_return({})

      allow(request_obj)
        .to receive(:request){|method,url,headers,payload| @ac={method: method, url: url, headers: headers, payload:payload}}
              .and_return({code: 401})

      SUT = file_api_service.new(request_obj)
      resp = SUT.list("skip": 0, "limit": 10)

      expect(@ac[:payload].to_json).to eq("{\"skip\":0,\"limit\":10}")
      expect(resp[:code]).to eq(401)
    end

    it "test_list_files_succeeds_with_basic_request" do
      request_obj = double
      allow(ImageKitIo::Request)
        .to receive(:new)
              .with(private_key, public_key, url_endpoint)
              .and_return(request_obj)

      allow(request_obj)
        .to receive(:create_headers)
              .and_return({})

      allow(request_obj)
        .to receive(:request){|method,url,headers,payload| @ac={method: method, url: url, headers: headers, payload:payload}}
              .and_return({code: 200, body:[]})

      SUT = file_api_service.new(request_obj)
      resp = SUT.list("skip": 0, "limit": 10)
      expect(@ac[:payload].to_json).to eq("{\"skip\":0,\"limit\":10}")
      expect(resp[:code]).to eq(200)
    end
  end

  describe 'FileVersionDetailTest' do
    let(:success_response) {
      "{\"fileId\":\"my_file_id\",\"name\":\"cat1.jpg\",\"size\":102117,\"versionInfo\":{\"id\":\"my_file_id\",\"name\":\"Version 2\"},\"filePath\":\"/cat1.jpg\",\"url\":\"https://ik.imagekit.io/app_id/cat1.jpg\",\"fileType\":\"image\",\"height\":700,\"width\":1050,\"thumbnailUrl\":\"https://ik.imagekit.io/app_id/tr:n-ik_ml_thumbnail/cat1.jpg\",\"tags\":[\"abc\",\"def\"],\"AITags\":null,\"isPrivateFile\":true,\"customCoordinates\":null,\"metadata\":{\"height\":700,\"width\":1050,\"size\":70842,\"format\":\"jpg\",\"hasColorProfile\":false,\"quality\":0,\"density\":72,\"hasTransparency\":false,\"exif\":{},\"pHash\":\"90249d9b1fc74367\"}}"
    }
    it 'test_get_file_version_detail_succeeds_with_id' do
      request_client = double
      allow_any_instance_of(ImageKitIo::Request)
        .to receive(:create_headers)
              .and_return({})
      allow(RestClient::Request)
        .to receive(:new)
              .and_return(request_client)
      allow(request_client)
        .to receive(:execute)
              .and_return(OpenStruct.new(code: 200,
                                         body:  success_response,
                                         content_type: "application/json"
      ))

      imagekit_request = ImageKitIo::Request.new(private_key, public_key, url_endpoint)
      SUT = file_api_service.new(imagekit_request)
      resp = SUT.get_file_version_detail(file_id: "my_file_id", version_id: 'my_file_id')
      expect(resp).to_not have_key(:error)
      expect(resp[:response]).to have_key('versionInfo')
      expect(resp[:response]['versionInfo']['id']).to eq('my_file_id')
    end

    it 'test_get_file_version_detail_failed_without_file_id' do
      imagekit_request = ImageKitIo::Request.new(private_key, public_key, url_endpoint)
      SUT = file_api_service.new(imagekit_request)
      expect{SUT.get_file_version_detail(version_id: 'file_version_id')}.to raise_error(ArgumentError, 'file_id is required')
    end

    it 'test_get_file_version_detail_failed_without_version_id' do
      imagekit_request = ImageKitIo::Request.new(private_key, public_key, url_endpoint)
      SUT = file_api_service.new(imagekit_request)
      expect{SUT.get_file_version_detail(file_id: 'my_file_id')}.to raise_error(ArgumentError, 'version_id is required')
    end
  end

  describe 'FileVersionsTest' do
    let(:success_response) {
      "[{\"type\":\"file\",\"name\":\"cat1.jpg\",\"createdAt\":\"2022-06-02T11:50:44.402Z\",\"updatedAt\":\"2022-06-14T15:44:12.300Z\",\"fileId\":\"my_file_id\",\"tags\":[\"abc\",\"def\"],\"AITags\":null,\"versionInfo\":{\"id\":\"my_file_id\",\"name\":\"Version 2\"},\"embeddedMetadata\":{\"DateCreated\":\"2022-06-14T15:44:12.299Z\",\"DateTimeCreated\":\"2022-06-14T15:44:12.299Z\"},\"customCoordinates\":null,\"customMetadata\":{},\"isPrivateFile\":true,\"url\":\"https://ik.imagekit.io/app_id/cat1.jpg\",\"thumbnail\":\"https://ik.imagekit.io/app_id/tr:n-ik_ml_thumbnail/cat1.jpg\",\"fileType\":\"image\",\"filePath\":\"/cat1.jpg\",\"height\":700,\"width\":1050,\"size\":102117,\"hasAlpha\":false,\"mime\":\"image/jpeg\"},{\"type\":\"file-version\",\"name\":\"cat1.jpg\",\"createdAt\":\"2022-06-14T15:44:10.910Z\",\"updatedAt\":\"2022-06-14T15:44:11.372Z\",\"fileId\":\"my_file_id\",\"tags\":[\"abc\",\"def\"],\"AITags\":null,\"versionInfo\":{\"id\":\"my_file_second_version_id\",\"name\":\"Version 1\"},\"embeddedMetadata\":{\"DateCreated\":\"2022-06-02T11:50:45.537Z\",\"DateTimeCreated\":\"2022-06-02T11:50:45.540Z\"},\"customCoordinates\":null,\"customMetadata\":{},\"isPrivateFile\":true,\"url\":\"https://ik.imagekit.io/app_id/cat1.jpg?ik-obj-version=ik_version_id\",\"thumbnail\":\"https://ik.imagekit.io/app_id/tr:n-ik_ml_thumbnail/cat1.jpg?ik-obj-version=ik_version_id\",\"fileType\":\"image\",\"filePath\":\"/cat1.jpg\",\"height\":700,\"width\":1050,\"size\":102117,\"hasAlpha\":false,\"mime\":\"image/jpeg\"}]"
    }
    it 'test_get_file_versions_succeeds_with_id' do
      request_client = double
      allow_any_instance_of(ImageKitIo::Request)
        .to receive(:create_headers)
              .and_return({})
      allow(RestClient::Request)
        .to receive(:new)
              .and_return(request_client)
      allow(request_client)
        .to receive(:execute)
              .and_return(OpenStruct.new(code: 200,
                                         body:  success_response,
                                         content_type: "application/json"
              ))

      imagekit_request = ImageKitIo::Request.new(private_key, public_key, url_endpoint)
      SUT = file_api_service.new(imagekit_request)
      resp = SUT.get_file_versions(file_id: "my_file_id")
      expect(resp).to_not have_key(:error)
      expect(resp[:response]).to be_an_instance_of(Array)
      expect(resp[:response].length).to eq(2)
      expect(resp[:response][0]['versionInfo']['id']).to eq('my_file_id')
      expect(resp[:response][0]['versionInfo']['name']).to eq('Version 2')
      expect(resp[:response][1]['versionInfo']['id']).to eq('my_file_second_version_id')
      expect(resp[:response][1]['versionInfo']['name']).to eq('Version 1')
    end

    it 'test_get_file_version_failed_without_file_id' do
      imagekit_request = ImageKitIo::Request.new(private_key, public_key, url_endpoint)
      SUT = file_api_service.new(imagekit_request)
      expect{SUT.get_file_versions}.to raise_error(ArgumentError)
    end
  end

  describe 'RestoreFileVersionTest' do
    let(:success_response) {
      "{\"type\":\"file\",\"name\":\"cat1.jpg\",\"createdAt\":\"2022-06-02T11:50:44.402Z\",\"updatedAt\":\"2022-06-14T16:20:06.258Z\",\"fileId\":\"my_file_id\",\"tags\":[\"abc\",\"def\"],\"AITags\":null,\"versionInfo\":{\"id\":\"my_second_version\",\"name\":\"Version 2\"},\"embeddedMetadata\":{\"DateCreated\":\"2022-06-02T11:50:45.537Z\",\"DateTimeCreated\":\"2022-06-02T11:50:45.540Z\"},\"customCoordinates\":null,\"customMetadata\":{},\"isPrivateFile\":true,\"url\":\"https://ik.imagekit.io/app_id/cat1.jpg\",\"thumbnail\":\"https://ik.imagekit.io/app_id/tr:n-ik_ml_thumbnail/cat1.jpg\",\"fileType\":\"image\",\"filePath\":\"/cat1.jpg\",\"height\":700,\"width\":1050,\"size\":102117,\"hasAlpha\":false,\"mime\":\"image/jpeg\"}"
    }
    it 'test_restore_file_version_succeeds_with_id' do
      request_client = double
      allow_any_instance_of(ImageKitIo::Request)
        .to receive(:create_headers)
              .and_return({})
      allow(RestClient::Request)
        .to receive(:new)
              .and_return(request_client)
      allow(request_client)
        .to receive(:execute)
              .and_return(OpenStruct.new(code: 200,
                                         body:  success_response,
                                         content_type: "application/json"
              ))

      imagekit_request = ImageKitIo::Request.new(private_key, public_key, url_endpoint)
      SUT = file_api_service.new(imagekit_request)
      resp = SUT.restore_file_version(file_id: "my_file_id", version_id: 'my_second_version')
      expect(resp).to_not have_key(:error)
      expect(resp[:response]['versionInfo']['id']).to eq('my_second_version')
      expect(resp[:response]['versionInfo']['name']).to eq('Version 2')
    end

    it 'test_restore_file_version_failed_without_file_id' do
      imagekit_request = ImageKitIo::Request.new(private_key, public_key, url_endpoint)
      SUT = file_api_service.new(imagekit_request)
      expect{SUT.restore_file_version(version_id: 'my_file_version_id')}.to raise_error(ArgumentError, 'file_id is required')
    end

    it 'test_restore_file_version_failed_without_version_id' do
      imagekit_request = ImageKitIo::Request.new(private_key, public_key, url_endpoint)
      SUT = file_api_service.new(imagekit_request)
      expect{SUT.restore_file_version(file_id: 'my_file_id')}.to raise_error(ArgumentError, 'version_id is required')
    end
  end

  describe 'DeleteFileVersionTest' do
    let(:success_response) {
      "{\"success\":true}"
    }
    it 'test_restore_file_version_succeeds_with_id' do
      request_client = double
      allow_any_instance_of(ImageKitIo::Request)
        .to receive(:create_headers)
              .and_return({})
      allow(RestClient::Request)
        .to receive(:new)
              .and_return(request_client)
      allow(request_client)
        .to receive(:execute)
              .and_return(OpenStruct.new(code: 200,
                                         body:  success_response,
                                         content_type: "application/json"
              ))

      imagekit_request = ImageKitIo::Request.new(private_key, public_key, url_endpoint)
      SUT = file_api_service.new(imagekit_request)
      resp = SUT.delete_file_version(file_id: "my_file_id", version_id: 'my_second_version')
      expect(resp).to_not have_key(:error)
      expect(resp[:response]['success']).to eq(true)
    end

    it 'test_delete_file_version_without_file_id' do
      imagekit_request = ImageKitIo::Request.new(private_key, public_key, url_endpoint)
      SUT = file_api_service.new(imagekit_request)
      expect{SUT.delete_file_version(version_id: 'my_file_version_id')}.to raise_error(ArgumentError, 'file_id is required')
    end

    it 'test_delete_file_version_failed_without_version_id' do
      imagekit_request = ImageKitIo::Request.new(private_key, public_key, url_endpoint)
      SUT = file_api_service.new(imagekit_request)
      expect{SUT.delete_file_version(file_id: 'my_file_id')}.to raise_error(ArgumentError, 'version_id is required')
    end
  end

  describe 'FileDetailTest' do
    it "test_get_file_details_fails_on_unauthenticated_request" do
      request_obj = double
      allow(ImageKitIo::Request)
        .to receive(:new)
              .with(private_key, public_key, url_endpoint)
              .and_return(request_obj)

      allow(request_obj)
        .to receive(:create_headers)
              .and_return({})

      allow(request_obj)
        .to receive(:request){|method,url,headers,payload| @ac={method: method, url: url, headers: headers, payload:payload}}
              .and_return({code: 401, body:{message: "Unauthorized request!"}})

      SUT = file_api_service.new(request_obj)
      resp = SUT.details(file_identifier: "demo-file-id")

      expect(@ac[:url]).to eq("https://api.imagekit.io/v1/files/demo-file-id/details/")
      expect(resp[:code]).to eq(401)
      expect(resp[:body][:message]).to eq("Unauthorized request!")
    end

    it "test_file_details_succeeds_with_id" do
      request_obj = double
      allow(ImageKitIo::Request)
        .to receive(:new)
              .with(private_key, public_key, url_endpoint)
              .and_return(request_obj)

      allow(request_obj)
        .to receive(:create_headers)
              .and_return({})

      allow(request_obj)
        .to receive(:request){|method,url,headers,payload| @ac={method: method, url: url, headers: headers, payload:payload}}
              .and_return({code: 200, body: {fileId: "demo-file-id"}})

      SUT = file_api_service.new(request_obj)
      resp = SUT.details(file_identifier: "demo-file-id")
      expect(@ac[:url]).to eq("https://api.imagekit.io/v1/files/demo-file-id/details/")
      expect(resp[:code]).to eq(200)
    end
  end

  describe 'TestDeleteFile' do
    it "test_file_delete_fails_on_unauthenticated_request" do
      request_obj = double
      allow(ImageKitIo::Request)
        .to receive(:new)
              .with(private_key, public_key, url_endpoint)
              .and_return(request_obj)

      allow(request_obj)
        .to receive(:create_headers)
              .and_return({})

      allow(request_obj)
        .to receive(:request){|method,url,headers,payload| @ac={method: method, url: url, headers: headers, payload:payload}}
              .and_return({code: 401, body: {fileId: "demo-file-id"}})

      SUT = file_api_service.new(request_obj)
      resp = SUT.delete(file_id: "demo-file-id")

      expect(@ac[:url]).to eq("https://api.imagekit.io/v1/files/demo-file-id")
      expect(@ac[:method]).to eq("delete")
      expect(resp[:code]).to eq(401)
    end

    it "test_file_delete_fails_on_item_not_found" do
      request_obj = double
      allow(ImageKitIo::Request)
        .to receive(:new)
              .with(private_key, public_key, url_endpoint)
              .and_return(request_obj)

      allow(request_obj)
        .to receive(:create_headers)
              .and_return({})

      allow(request_obj)
        .to receive(:request){|method,url,headers,payload| @ac={method: method, url: url, headers: headers, payload:payload}}
              .and_return({code: 204, body: {fileId: "demo-file-id"}})

      SUT = file_api_service.new(request_obj)
      resp = SUT.delete(file_id: "demo-file-id")

      expect(@ac[:url]).to eq("https://api.imagekit.io/v1/files/demo-file-id")
      expect(@ac[:method]).to eq("delete")
      expect(resp[:code]).to eq(204)
    end

    it "test_file_delete_succeeds" do
      request_obj = double
      allow(ImageKitIo::Request)
        .to receive(:new)
              .with(private_key, public_key, url_endpoint)
              .and_return(request_obj)

      allow(request_obj)
        .to receive(:create_headers)
              .and_return({})

      allow(request_obj)
        .to receive(:request){|method,url,headers,payload| @ac={method: method, url: url, headers: headers, payload:payload}}
              .and_return({code: 200, body: {fileId: "demo-file-id"}})

      SUT = file_api_service.new(request_obj)
      resp = SUT.delete(file_id: "demo-file-id")

      expect(@ac[:url]).to eq("https://api.imagekit.io/v1/files/demo-file-id")
      expect(@ac[:method]).to eq("delete")
      expect(resp[:code]).to eq(200)

    end
  end

  describe 'TestPurgeCache' do
    it "test_purge_cache_fails_on_unauthenticated_request" do
      request_obj = double
      allow(ImageKitIo::Request)
        .to receive(:new)
              .with(private_key, public_key, url_endpoint)
              .and_return(request_obj)

      allow(request_obj)
        .to receive(:create_headers)
              .and_return({})

      allow(request_obj)
        .to receive(:request){|method,url,headers,payload| @ac={method: method, url: url, headers: headers, payload:payload}}
              .and_return({code: 401, body: {}})

      SUT = file_api_service.new(request_obj)
      resp = SUT.purge_cache(file_url: "file_url")

      expect(@ac[:payload].to_json).to eq("{\"url\":\"file_url\"}")
      expect(resp[:code]).to eq(401)
    end

    it "test_purge_cache_succeeds" do
      request_obj = double
      allow(ImageKitIo::Request)
        .to receive(:new)
              .with(private_key, public_key, url_endpoint)
              .and_return(request_obj)

      allow(request_obj)
        .to receive(:create_headers)
              .and_return({})

      allow(request_obj)
        .to receive(:request){|method,url,headers,payload| @ac={method: method, url: url, headers: headers, payload:payload}}
              .and_return({code: 200, body: {requestId:"requestId"}})

      SUT = file_api_service.new(request_obj)
      resp = SUT.purge_cache(file_url: "file_url")

      expect(@ac[:payload].to_json).to eq("{\"url\":\"file_url\"}")
      expect(resp[:code]).to eq(200)
      expect(resp[:body][:requestId]).to eq("requestId")
    end
  end

  describe 'TestPurgeCacheStatus' do
    it "test_get_purge_cache_status_fails_on_unauthenticated_request" do
      request_obj = double
      allow(ImageKitIo::Request)
        .to receive(:new)
              .with(private_key, public_key, url_endpoint)
              .and_return(request_obj)

      allow(request_obj)
        .to receive(:create_headers)
              .and_return({})

      allow(request_obj)
        .to receive(:request){|method,url,headers,payload| @ac={method: method, url: url, headers: headers, payload:payload}}
              .and_return({code: 401, body: {}})

      SUT = file_api_service.new(request_obj)
      resp = SUT.purge_cache_status(request_id: "request-id")

      expect(@ac[:url]).to eq("https://api.imagekit.io/v1/files/purge/request-id")
      expect(resp[:code]).to eq(401)

    end

    it "test_purge_cache_status_succeeds" do
      request_obj = double
      allow(ImageKitIo::Request)
        .to receive(:new)
              .with(private_key, public_key, url_endpoint)
              .and_return(request_obj)

      allow(request_obj)
        .to receive(:create_headers)
              .and_return({})

      allow(request_obj)
        .to receive(:request){|method,url,headers,payload| @ac={method: method, url: url, headers: headers, payload:payload}}
              .and_return({code: 200, body: {status: "Complete"}})

      SUT = file_api_service.new(request_obj)
      resp = SUT.purge_cache_status(request_id: "request-id")

      expect(@ac[:url]).to eq("https://api.imagekit.io/v1/files/purge/request-id")
      expect(resp[:code]).to eq(200)
      expect(resp[:body][:status]).to eq("Complete")
    end
  end

  describe 'TestGetMetaData' do
    it "test_get_metadata_fails_on_unauthenticated_request" do
      request_obj = double
      allow(ImageKitIo::Request)
        .to receive(:new)
              .with(private_key, public_key, url_endpoint)
              .and_return(request_obj)

      allow(request_obj)
        .to receive(:create_headers)
              .and_return({})

      allow(request_obj)
        .to receive(:request){|method,url,headers,payload| @ac={method: method, url: url, headers: headers, payload:payload}}
              .and_return({code: 401, body: {}})

      SUT = file_api_service.new(request_obj)
      resp = SUT.get_metadata(file_id: "file_id")

      expect(@ac[:url]).to eq("https://api.imagekit.io/v1/files/file_id/metadata")
      expect(resp[:code]).to eq(401)

    end

    it 'raises error when parameter not provided' do
      request_obj = double
      allow(ImageKitIo::Request)
        .to receive(:new)
              .with(private_key, public_key, url_endpoint)
              .and_return(request_obj)
      allow(request_obj)
        .to receive(:create_headers)
              .and_return({})
      allow(request_obj)
        .to receive(:request){|method,url,headers,payload| @ac={method: method, url: url, headers: headers, payload:payload}}
              .and_return({code: 200, body: {}})

      SUT = file_api_service.new(request_obj)
      expect {
        SUT.get_metadata
      }.to raise_error(ArgumentError)
    end

    it "test_get_metadata_succeeds" do
      request_obj = double
      allow(ImageKitIo::Request)
        .to receive(:new)
              .with(private_key, public_key, url_endpoint)
              .and_return(request_obj)

      allow(request_obj)
        .to receive(:create_headers)
              .and_return({})

      allow(request_obj)
        .to receive(:request){|method,url,headers,payload| @ac={method: method, url: url, headers: headers, payload:payload}}
              .and_return({code: 200, body: {}})

      SUT = file_api_service.new(request_obj)
      resp = SUT.get_metadata(file_id: "file_id")

      expect(@ac[:url]).to eq("https://api.imagekit.io/v1/files/file_id/metadata")
      expect(resp[:code]).to eq(200)
    end
  end

  describe 'TestUpdateFileDetails' do
    it "test_details_fails_on_unauthenticated_request" do

      options = {"tags": %w[tag1 tag2], "custom_coordinates": "10,10,100,100"}

      request_obj = double
      allow(ImageKitIo::Request)
        .to receive(:new)
              .with(private_key, public_key, url_endpoint)
              .and_return(request_obj)

      allow(request_obj)
        .to receive(:create_headers)
              .and_return({})

      allow(request_obj)
        .to receive(:request){|method,url,headers,payload| @ac={method: method, url: url, headers: headers, payload:payload}}
              .and_return({code: 401, body: {}})

      SUT = file_api_service.new(request_obj)
      resp = SUT.update_details(file_id: "file_id", **options)
      expect(@ac[:payload]).to eq("{\"tags\":[\"tag1\",\"tag2\"],\"customCoordinates\":\"10,10,100,100\"}")
      expect(resp[:code]).to eq(401)

    end

    it "test_update_file_details_succeeds_with_id" do
      options = {tags: %w[tag1 tag2], "custom_coordinates": "10,10,100,100"}
      request_obj = double
      allow(ImageKitIo::Request)
        .to receive(:new)
              .with(private_key, public_key, url_endpoint)
              .and_return(request_obj)

      allow(request_obj)
        .to receive(:create_headers)
              .and_return({})

      allow(request_obj)
        .to receive(:request){|method,url,headers,payload| @ac={method: method, url: url, headers: headers, payload:payload}}
              .and_return({code: 200, body: options})

      SUT = file_api_service.new(request_obj)
      resp = SUT.update_details(file_id: "file_id", **options)

      expect(JSON.parse(@ac[:payload])['tags']).to eq(options[:tags])
      expect(JSON.parse(@ac[:payload])['customCoordinates']).to eq(options[:custom_coordinates])
      expect(resp[:code]).to eq(200)
      expect(resp[:body]).to eq(options)
    end

    it "test_update_file_details_fails_missing_arguments" do
      options = { tags: 'custom tag' }
      request_obj = double
      allow(ImageKitIo::Request)
        .to receive(:new)
              .with(private_key, public_key, url_endpoint)
              .and_return(request_obj)

      allow(request_obj)
        .to receive(:create_headers)
              .and_return({})

      allow(request_obj)
        .to receive(:request){|method,url,headers,payload| @ac={method: method, url: url, headers: headers, payload:payload}}
              .and_return({code: 200, body: options})

      SUT = file_api_service.new(request_obj)
      expect {
        SUT.update_details(file_id: "file_id", **options)
      }.to raise_error(ArgumentError)
    end

    it "test_update_file_details_fails_tags_not_an_array" do
      options = {tags: "RANDOM_TEXT", "custom_coordinates": "10,10,100,100"}
      request_obj = double
      allow(ImageKitIo::Request)
        .to receive(:new)
              .with(private_key, public_key, url_endpoint)
              .and_return(request_obj)

      allow(request_obj)
        .to receive(:create_headers)
              .and_return({})

      allow(request_obj)
        .to receive(:request){|method,url,headers,payload| @ac={method: method, url: url, headers: headers, payload:payload}}
              .and_return({code: 200, body: options})

      SUT = file_api_service.new(request_obj)
      expect {
        SUT.update_details(file_id: "file_id", **options)
      }.to raise_error(ArgumentError)
    end

    it "test_update_file_details_fails_custom_coordinates_not_a_string" do
      options = {"custom_coordinates": %w[random]}
      request_obj = double
      allow(ImageKitIo::Request)
        .to receive(:new)
              .with(private_key, public_key, url_endpoint)
              .and_return(request_obj)

      allow(request_obj)
        .to receive(:create_headers)
              .and_return({})

      allow(request_obj)
        .to receive(:request){|method,url,headers,payload| @ac={method: method, url: url, headers: headers, payload:payload}}
              .and_return({code: 200, body: options})

      SUT = file_api_service.new(request_obj)
      expect {
        SUT.update_details(file_id: "file_id", **options)
      }.to raise_error(ArgumentError)
    end

    it "test_update_file_details_expected_success_with_extensions" do
      request_obj = double
      allow(ImageKitIo::Request)
        .to receive(:new)
              .with(private_key, public_key, url_endpoint)
              .and_return(request_obj)

      allow(request_obj)
        .to receive(:create_headers)
              .and_return({})
      @ac={}
      allow(request_obj)
        .to receive(:request){|method,url,headers,payload| @ac={method: method, url: url, headers: headers, payload:payload}}
              .and_return({code: 200})
      SUT = file_api_service.new(request_obj)
      upload = SUT.update_details(file_id: "file_id_xyz", extensions: [
        {
          'name': 'google-auto-tagging',
          'maxTags': 5,
          'minConfidence': 95
        }
      ])
      expect(@ac[:payload]).to eq("{\"extensions\":[{\"name\":\"google-auto-tagging\",\"maxTags\":5,\"minConfidence\":95}]}")
      expect(upload[:code]).to eq(200)
    end

    it "test_update_with_valid_expected_success_with_customMetadata" do
      request_obj = double
      allow(ImageKitIo::Request)
        .to receive(:new)
              .with(private_key, public_key, url_endpoint)
              .and_return(request_obj)

      allow(request_obj)
        .to receive(:create_headers)
              .and_return({})
      @ac={}
      allow(request_obj)
        .to receive(:request){|method,url,headers,payload| @ac={method: method, url: url, headers: headers, payload:payload}}
              .and_return({code: 200})
      SUT = file_api_service.new(request_obj)
      upload = SUT.update_details(
        file_id: "file_id_xyz",
        custom_metadata: {
          brand: 'Nike',
          color: 'red'
        }
      )
      expect(@ac[:payload]).to eq("{\"customMetadata\":{\"brand\":\"Nike\",\"color\":\"red\"}}")
      expect(upload[:code]).to eq(200)
    end
  end

  describe 'TestGetRemoteFileURLMetaData' do
    it "test_get_metadata_from_remote_url_fails_on_unauthenticated_request" do
      request_obj = double
      allow(ImageKitIo::Request)
        .to receive(:new)
              .with(private_key, public_key, url_endpoint)
              .and_return(request_obj)

      allow(request_obj)
        .to receive(:create_headers)
              .and_return({})

      allow(request_obj)
        .to receive(:request){|method,url,headers,payload| @ac={method: method, url: url, headers: headers, payload:payload}}
              .and_return({code: 401, body: {}})

      SUT = file_api_service.new(request_obj)
      resp = SUT.get_metadata_from_remote_url(remote_file_url: "http://example.com/fakefileurl")

      expect(@ac[:url]).to eq("https://api.imagekit.io/v1/metadata?url=http://example.com/fakefileurl")
      expect(resp[:code]).to eq(401)
    end

    it "test_get_metadata_from_remote_url_fails_on_blank_url" do
      request_obj = double
      allow(ImageKitIo::Request)
        .to receive(:new)
              .with(private_key, public_key, url_endpoint)
              .and_return(request_obj)

      allow(request_obj)
        .to receive(:create_headers)
              .and_return({})

      allow(request_obj)
        .to receive(:request){|method,url,headers,payload| @ac={method: method, url: url, headers: headers, payload:payload}}
              .and_return({code: 401, body: {}})

      SUT = file_api_service.new(request_obj)
      expect {
        SUT.get_metadata_from_remote_url(remote_file_url: "")
      }.to raise_error(ArgumentError)
    end

    it "test_get_metadata_from_remote_url_succeeds" do
      request_obj = double
      allow(ImageKitIo::Request)
        .to receive(:new)
              .with(private_key, public_key, url_endpoint)
              .and_return(request_obj)

      allow(request_obj)
        .to receive(:create_headers)
              .and_return({})

      allow(request_obj)
        .to receive(:request){|method,url,headers,payload| @ac={method: method, url: url, headers: headers, payload:payload}}
              .and_return({code: 200, body: {}})

      SUT = file_api_service.new(request_obj)
      resp = SUT.get_metadata_from_remote_url(remote_file_url: "http://example.com/fakefileurl")

      expect(@ac[:url]).to eq("https://api.imagekit.io/v1/metadata?url=http://example.com/fakefileurl")
      expect(resp[:code]).to eq(200)
    end
  end

  context 'copy' do
    let!(:req_obj) { double }
    before do
      allow(ImageKitIo::Request)
        .to receive(:new)
              .with(private_key, public_key, url_endpoint)
              .and_return(req_obj)
      allow(req_obj)
        .to receive(:create_headers)
              .and_return({})
      allow(req_obj)
        .to receive(:request){|method,url,headers,payload| @ac={method: method, url: url, headers: headers, payload: payload}}
              .and_return({code: 200, body: { success: true }})
      @sut = file_api_service.new(req_obj)
    end

    it 'raises error when parameter not provided' do
      expect {
        @sut.copy(source_file_path: '', destination_path: nil)
      }.to raise_error(ArgumentError)

    end

    it 'test_copy' do
      source_file = 'test/dummy.png'
      destination_path = '/my_image'
      resp = @sut.copy(source_file_path: source_file, destination_path: destination_path)
      expect(@ac[:url]).to eq("https://api.imagekit.io/v1/files/copy")
      expect(@ac[:payload]).to eq("{\"sourceFilePath\":\"test/dummy.png\",\"destinationPath\":\"/my_image\",\"includeFileVersions\":false}")
      expect(resp[:code]).to eq(200)
      resp = @sut.copy(source_file_path: source_file, destination_path: destination_path, include_file_versions: true)
      expect(@ac[:payload]).to eq("{\"sourceFilePath\":\"test/dummy.png\",\"destinationPath\":\"/my_image\",\"includeFileVersions\":true}")
      expect(resp[:code]).to eq(200)
    end
  end

  context 'move' do
    let!(:req_obj) { double }
    before do
      allow(ImageKitIo::Request)
        .to receive(:new)
              .with(private_key, public_key, url_endpoint)
              .and_return(req_obj)
      allow(req_obj)
        .to receive(:create_headers)
              .and_return({})
      allow(req_obj)
        .to receive(:request){|method,url,headers,payload| @ac={method: method, url: url, headers: headers, payload: payload}}
              .and_return({code: 200, body: { success: true }})
      @sut = file_api_service.new(req_obj)
    end

    it 'raises error when parameter not provided' do
      expect {
        @sut.move(source_file_path: '', destination_path: nil)
      }.to raise_error(ArgumentError)

    end

    it 'test_move' do
      source_file = 'test/dummy.png'
      destination_path = '/my_image'
      resp = @sut.move(source_file_path: source_file, destination_path: destination_path)
      expect(@ac[:url]).to eq("https://api.imagekit.io/v1/files/move")
      expect(@ac[:payload]).to eq({:sourceFilePath=>"test/dummy.png", :destinationPath=>"/my_image"})
      expect(resp[:code]).to eq(200)
    end
  end

  context 'rename' do
    let!(:req_obj) { double }
    before do
      allow(ImageKitIo::Request)
        .to receive(:new)
              .with(private_key, public_key, url_endpoint)
              .and_return(req_obj)
      allow(req_obj)
        .to receive(:create_headers)
              .and_return({})
      allow(req_obj)
        .to receive(:request){|method,url,headers,payload| @ac={method: method, url: url, headers: headers, payload: payload}}
              .and_return({code: 200, body: { success: true }})
      @sut = file_api_service.new(req_obj)
    end

    it 'raises error when parameter not provided' do
      expect {
        @sut.rename(file_path: '', new_file_name: nil)
      }.to raise_error(ArgumentError)

    end

    it 'test_rename' do
      source_file = 'test/dummy.png'
      new_name = 'my_image.png'
      resp = @sut.rename(file_path: source_file, new_file_name: new_name)
      expect(@ac[:url]).to eq("https://api.imagekit.io/v1/files/rename")
      expect(@ac[:payload]).to eq("{\"filePath\":\"test/dummy.png\",\"newFileName\":\"my_image.png\"}")
      expect(@ac[:method]).to eq('put')
      expect(resp[:code]).to eq(200)
    end

    it 'test_rename with the option purge_cache' do
      source_file = 'test/dummy.png'
      new_name = 'my_image.png'
      resp = @sut.rename(file_path: source_file, new_file_name: new_name, purge_cache: true)
      expect(@ac[:payload]).to eq("{\"filePath\":\"test/dummy.png\",\"newFileName\":\"my_image.png\",\"purgeCache\":true}")
    end
  end

  context 'stream file' do
    let!(:req_obj) { double }

    before do
      allow(ImageKitIo::Request)
        .to receive(:new)
              .with(private_key, public_key, url_endpoint)
              .and_return(req_obj)
      allow(req_obj)
        .to receive(:create_headers)
              .and_return({})
      allow(req_obj)
        .to receive(:request_stream){|method,url,headers, &block| @ac={method: method, url: url, headers: headers, block: block}}
              .and_return({code: 200, body: { success: true }})
      @sut = file_api_service.new(req_obj)
    end

    it 'raises error when parameter not provided' do
      expect {
        @sut.stream_file
      }.to raise_error(ArgumentError)
    end

    it 'test_stream_file' do
      remote_file_url = 'https://ik.imagekit.io/kcdfvxhgfkn/testing_Hx_I_Ys_c.jpg'
      block = proc {
        puts 'block given'
      }
      @sut.stream_file(remote_file_url: remote_file_url, &block)

      expect(@ac[:block].is_a?(Proc)).to be(true)
      expect(@ac[:url]).to eq(remote_file_url)
    end
  end
end
