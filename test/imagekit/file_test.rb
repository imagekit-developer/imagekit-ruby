require_relative './spec_helper'
require "rspec/autorun"

RSpec.describe ImageKitIo::File do
  let(:subject) { described_class }
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

      SUT = ImageKitIo::File.new(request_obj)

      upload = SUT.upload("http://remotefiles.com/fake_file.jpg", "my_file_name", {})
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

      SUT = ImageKitIo::File.new(request_obj)
      base64="f06830ca9f1e3e90"
      upload = SUT.upload(base64, "my_file_name", {})
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

      SUT = ImageKitIo::File.new(request_obj)
      file = open("test/imagekit/dummy_data/sample.jpg", "rb")
      upload = SUT.upload(file, "my_file_name", {})
      expect(@ac[:payload].to_json).to eq("{\"multipart\":true,\"file\":\"#{file}\",\"fileName\":\"my_file_name\"}")

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

      SUT = ImageKitIo::File.new(request_obj)

      upload = SUT.upload("./fake_file.jpg", "my_file_name", {"custom_coordinates":"10, 10, 100, 100"})

      expect(@ac[:payload].to_json).to eq("{\"multipart\":true,\"file\":\"./fake_file.jpg\",\"fileName\":\"my_file_name\",\"customCoordinates\":\"10, 10, 100, 100\"}")

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

      SUT = ImageKitIo::File.new(request_obj)

      upload = SUT.upload("./fake_file.jpg", "my_file_name", {response_fields: %w[is_private_file tags], tags: %w[abc def], use_unique_file_name: false})

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

      SUT = ImageKitIo::File.new(request_obj)
      expect{
        SUT.upload("fake_file.jpg", "fake_name", { invalid_option: "invalid_option" })
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

      SUT = ImageKitIo::File.new(request_obj)
      upload = SUT.upload("fake_file.jpg", "fake_name", {})
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

      SUT = ImageKitIo::File.new(request_obj)
      resp = SUT.list({"skip": 0, "limit": 10})

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

      SUT = ImageKitIo::File.new(request_obj)
      resp = SUT.list({"skip": 0, "limit": 10})
      expect(@ac[:payload].to_json).to eq("{\"skip\":0,\"limit\":10}")
      expect(resp[:code]).to eq(200)
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

      SUT = ImageKitIo::File.new(request_obj)
      resp = SUT.details("demo-file-id")

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

      SUT = ImageKitIo::File.new(request_obj)
      resp = SUT.details("demo-file-id")
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

      SUT = ImageKitIo::File.new(request_obj)
      resp = SUT.delete("demo-file-id")

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

      SUT = ImageKitIo::File.new(request_obj)
      resp = SUT.delete("demo-file-id")

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

      SUT = ImageKitIo::File.new(request_obj)
      resp = SUT.delete("demo-file-id")

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

      SUT = ImageKitIo::File.new(request_obj)
      resp = SUT.purge_cache("file_url")

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

      SUT = ImageKitIo::File.new(request_obj)
      resp = SUT.purge_cache("file_url")

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

      SUT = ImageKitIo::File.new(request_obj)
      resp = SUT.purge_cache_status("request-id")

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

      SUT = ImageKitIo::File.new(request_obj)
      resp = SUT.purge_cache_status("request-id")

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

      SUT = ImageKitIo::File.new(request_obj)
      resp = SUT.get_metadata("file_id")

      expect(@ac[:url]).to eq("https://api.imagekit.io/v1/files/file_id/metadata")
      expect(resp[:code]).to eq(401)

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

      SUT = ImageKitIo::File.new(request_obj)
      resp = SUT.get_metadata("file_id")

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

      SUT = ImageKitIo::File.new(request_obj)
      resp = SUT.update_details("file_id", options)
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

      SUT = ImageKitIo::File.new(request_obj)
      resp = SUT.update_details("file_id", options)

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

      SUT = ImageKitIo::File.new(request_obj)
      expect {
        SUT.update_details("file_id", options)
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

      SUT = ImageKitIo::File.new(request_obj)
      expect {
        SUT.update_details("file_id", options)
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

      SUT = ImageKitIo::File.new(request_obj)
      expect {
        SUT.update_details("file_id", options)
      }.to raise_error(ArgumentError)
    end
  end

  describe 'TestBatchDelete' do
    it "test_batch_delete_fails_on_unauthenticated_request" do
      file_ids = %w[file_id_1 file_id_2]
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

      SUT = ImageKitIo::File.new(request_obj)
      resp = SUT.batch_delete(file_ids)

      expect(@ac[:payload]).to eq({"fileIds": file_ids}.to_json)
      expect(resp[:code]).to eq(401)
    end

    it "test_batch_delete_fails_on_item_not_found" do
      file_ids = %w[file_id_1 file_id_2]
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
              .and_return({code: 404, body: {message: "The requested file(s) does not exist.",
                                             help: "For support kindly contact us at support@imagekit.io .",
                                             missingFileIds: file_ids,},},)

      SUT = ImageKitIo::File.new(request_obj)
      resp = SUT.batch_delete(file_ids)

      expect(@ac[:payload]).to eq({"fileIds": file_ids}.to_json)
      expect(resp[:code]).to eq(404)
      expect(resp[:body][:missingFileIds]).to eq(file_ids)
    end

    it "test_batch_delete_succeeds" do
      request_obj = double
      file_ids = %w[file_id_1 file_id_2]

      allow(ImageKitIo::Request)
        .to receive(:new)
              .with(private_key, public_key, url_endpoint)
              .and_return(request_obj)

      allow(request_obj)
        .to receive(:create_headers)
              .and_return({})

      allow(request_obj)
        .to receive(:request){|method,url,headers,payload| @ac={method: method, url: url, headers: headers, payload:payload}}
              .and_return({code: 200, body: {successfullyDeletedFileIds: file_ids}})

      SUT = ImageKitIo::File.new(request_obj)
      resp = SUT.batch_delete(file_ids)

      expect(@ac[:payload]).to eq({"fileIds": file_ids}.to_json)
      expect(resp[:code]).to eq(200)
      expect(resp[:body][:successfullyDeletedFileIds]).to eq(file_ids)
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

      SUT = ImageKitIo::File.new(request_obj)
      resp = SUT.get_metadata_from_remote_url("http://example.com/fakefileurl")

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

      SUT = ImageKitIo::File.new(request_obj)
      expect {
        SUT.get_metadata_from_remote_url("")
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

      SUT = ImageKitIo::File.new(request_obj)
      resp = SUT.get_metadata_from_remote_url("http://example.com/fakefileurl")

      expect(@ac[:url]).to eq("https://api.imagekit.io/v1/metadata?url=http://example.com/fakefileurl")
      expect(resp[:code]).to eq(200)
    end
  end

  context 'batch tags' do
    let!(:req_obj) { double }
    let(:file_ids) { %[file_id_1 file_id_2] }

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
              .and_return({code: 200, body: { successfullyUpdatedFileIds: file_ids }})
      @sut = ImageKitIo::File.new(req_obj)
    end

    it 'test_add_batch_tags' do
      resp = @sut.add_batch_tags(file_ids, ['custom_tag'])
      expect(@ac[:url]).to eq("https://api.imagekit.io/v1/files/addTags")
      expect(@ac[:payload]).to eq("{\"fileIds\":\"file_id_1 file_id_2\",\"tags\":[\"custom_tag\"]}")
      expect(resp[:code]).to eq(200)
    end

    it 'test_remove_batch_tags' do
      resp = @sut.remove_batch_tags(file_ids, ['custom_tag_remove'])
      expect(@ac[:url]).to eq("https://api.imagekit.io/v1/files/removeTags")
      expect(@ac[:payload]).to eq("{\"fileIds\":\"file_id_1 file_id_2\",\"tags\":[\"custom_tag_remove\"]}")
      expect(resp[:code]).to eq(200)
    end

    it 'test_remove_batch_ai_tags' do
      resp = @sut.remove_batch_ai_tags(file_ids, ['custom_ai_tag'])
      expect(@ac[:url]).to eq("https://api.imagekit.io/v1/files/removeAITags")
      expect(@ac[:payload]).to eq("{\"fileIds\":\"file_id_1 file_id_2\",\"AITags\":[\"custom_ai_tag\"]}")
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
      @sut = ImageKitIo::File.new(req_obj)
    end

    it 'raises error when parameter not provided' do
      expect {
        @sut.copy('', nil)
      }.to raise_error(ArgumentError)

    end

    it 'test_copy' do
      source_file = 'test/dummy.png'
      destination_path = '/my_image'
      resp = @sut.copy(source_file, destination_path)
      expect(@ac[:url]).to eq("https://api.imagekit.io/v1/files/copy")
      expect(@ac[:payload]).to eq({:sourceFilePath=>"test/dummy.png", :destinationPath=>"/my_image"})
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
      @sut = ImageKitIo::File.new(req_obj)
    end

    it 'raises error when parameter not provided' do
      expect {
        @sut.move('', nil)
      }.to raise_error(ArgumentError)

    end

    it 'test_move' do
      source_file = 'test/dummy.png'
      destination_path = '/my_image'
      resp = @sut.move(source_file, destination_path)
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
      @sut = ImageKitIo::File.new(req_obj)
    end

    it 'raises error when parameter not provided' do
      expect {
        @sut.rename('', nil)
      }.to raise_error(ArgumentError)

    end

    it 'test_move' do
      source_file = 'test/dummy.png'
      new_name = 'my_image.png'
      resp = @sut.rename(source_file, new_name)
      expect(@ac[:url]).to eq("https://api.imagekit.io/v1/files/rename")
      expect(@ac[:payload]).to eq({:filePath=>"test/dummy.png", :newFileName=>"my_image.png"})
      expect(@ac[:method]).to eq('put')
      expect(resp[:code]).to eq(200)
    end
  end

  context 'folder' do
    let!(:req_obj) { double }
    before do
      allow(ImageKitIo::Request)
        .to receive(:new)
              .with(private_key, public_key, url_endpoint)
              .and_return(req_obj)
      allow(req_obj)
        .to receive(:create_headers)
              .and_return({})
    end

    it 'raises error when parameter not provided' do
      @sut = ImageKitIo::File.new(req_obj)
      expect {
        @sut.create_folder('', nil)
      }.to raise_error(ArgumentError)
    end

    it 'test_create_folder' do
      allow(req_obj)
        .to receive(:request){|method,url,headers,payload| @ac={method: method, url: url, headers: headers, payload: payload}}
              .and_return({code: 201, body: { success: true }})
      @sut = ImageKitIo::File.new(req_obj)
      folder_name = 'test_folder'
      parent_folder = ''
      resp = @sut.create_folder(folder_name, parent_folder)
      expect(@ac[:url]).to eq("https://api.imagekit.io/v1/folder")
      expect(@ac[:payload]).to eq("{\"folderName\":\"test_folder\",\"parentFolderPath\":\"\"}")
      expect(@ac[:method]).to eq('post')
      expect(resp[:code]).to eq(201)
    end

    it 'test_delete_folder' do
      allow(req_obj)
        .to receive(:request){|method,url,headers,payload| @ac={method: method, url: url, headers: headers, payload: payload}}
              .and_return({code: 204, body: { success: true }})
      @sut = ImageKitIo::File.new(req_obj)
      folder_path = 'test_folder'
      resp = @sut.delete_folder(folder_path)
      expect(@ac[:url]).to eq("https://api.imagekit.io/v1/folder")
      expect(@ac[:method]).to eq('delete')
      expect(resp[:body][:success]).to be(true)
    end

    it 'test_copy_folder' do
      allow(req_obj)
        .to receive(:request){|method,url,headers,payload| @ac={method: method, url: url, headers: headers, payload: payload}}
              .and_return({code: 200, body: { jobId: '123456' }})
      @sut = ImageKitIo::File.new(req_obj)
      source_folder = 'my_folder'
      destination_path = 'copied'
      resp = @sut.copy_folder(source_folder, destination_path)
      expect(@ac[:url]).to eq("https://api.imagekit.io/v1/bulkJobs/copyFolder")
      expect(@ac[:method]).to eq('post')
      expect(@ac[:payload]).to eq({:sourceFolderPath=>"my_folder", :destinationPath=>"copied"})
      expect(resp[:body][:jobId]).to eq('123456')
    end

    it 'test_move_folder' do
      allow(req_obj)
        .to receive(:request){|method,url,headers,payload| @ac={method: method, url: url, headers: headers, payload: payload}}
              .and_return({code: 200, body: { jobId: '123456' }})
      @sut = ImageKitIo::File.new(req_obj)
      source_folder = 'my_folder/inside_folder'
      destination_path = 'moved/inside_another_folder'
      resp = @sut.move_folder(source_folder, destination_path)
      expect(@ac[:url]).to eq("https://api.imagekit.io/v1/bulkJobs/moveFolder")
      expect(@ac[:method]).to eq('post')
      expect(@ac[:payload]).to eq({:sourceFolderPath=>"my_folder/inside_folder", :destinationPath=>"moved/inside_another_folder"})
      expect(resp[:body][:jobId]).to eq('123456')
    end
  end

  context 'job status' do
    let(:req_obj) { double }
    let(:job_id) { '619e038e20b7ef03efc4eeb9' }

    before do
      allow(ImageKitIo::Request)
        .to receive(:new)
              .with(private_key, public_key, url_endpoint)
              .and_return(req_obj)
      allow(req_obj)
        .to receive(:create_headers)
              .and_return({})
      response_body = {"jobId"=> job_id, "type"=>"MOVE_FOLDER", "status"=>"Completed"}
      allow(req_obj)
        .to receive(:request){|method,url,headers,payload| @ac={method: method, url: url, headers: headers, payload: payload}}
              .and_return({code: 200, body: response_body })
      @sut = ImageKitIo::File.new(req_obj)
    end

    it 'raises error when parameter id not given' do
      expect {
        @sut.job_status(nil)
      }.to raise_error(ArgumentError)
    end

    it 'test_job_status' do
      resp = @sut.job_status(job_id)
      expect(@ac[:url]).to eq("https://api.imagekit.io/v1/bulkJobs/#{job_id}")
      expect(@ac[:method]).to eq('get')
      expect(@ac[:payload]).to eq({ :jobId => job_id})
      expect(resp[:body]['jobId']).to eq(job_id)
      expect(resp[:body]['status']).to eq('Completed')
    end
  end

  context 'custom metadata' do
    let(:req_obj) { double }
    let(:success_response) {
      {"id"=>"619e667520b7ef03efc5d870", "name"=>"price1", "label"=>"price", "schema"=>{"type"=>"Number", "minValue"=>100, "maxValue"=>300}}
    }
    before do
      allow(ImageKitIo::Request)
        .to receive(:new)
              .with(private_key, public_key, url_endpoint)
              .and_return(req_obj)
      allow(req_obj)
        .to receive(:create_headers)
              .and_return({})

    end

    it 'raises error when not providing parameter for creat' do
      @sut = ImageKitIo::File.new(req_obj)
      expect {
        @sut.create_custom_metadata(nil, 'test_label', '')
      }.to raise_error(ArgumentError)
    end

    it 'test_create_custom_metadata' do
      allow(req_obj)
        .to receive(:request){|method,url,headers,payload| @ac={method: method, url: url, headers: headers, payload: payload}}
              .and_return({code: 200, body: success_response })
      @sut = ImageKitIo::File.new(req_obj)
      resp = @sut.create_custom_metadata(
        'price1',
        'price',
        {
          type: 'Number',
          minValue: 100,
          maxValue: 300
        }
      )
      expect(@ac[:url]).to eq("https://api.imagekit.io/v1/customMetadataFields")
      expect(@ac[:method]).to eq('post')
      expect(resp[:body]['id']).to eq(success_response["id"])
    end

    it 'test_get_custom_metadata' do
      allow(req_obj)
        .to receive(:request){|method,url,headers,payload| @ac={method: method, url: url, headers: headers, payload: payload}}
              .and_return({code: 200, body: [success_response] })
      @sut = ImageKitIo::File.new(req_obj)
      resp = @sut.get_custom_metadata
      expect(@ac[:url]).to eq("https://api.imagekit.io/v1/customMetadataFields")
      expect(@ac[:method]).to eq('get')
      expect(resp[:body]).to eq([success_response])
    end

    it 'test_update_custom_metadata' do
      metadata_id = "619e667320b7ef03efc5d850"
      allow(req_obj)
        .to receive(:request){|method,url,headers,payload| @ac={method: method, url: url, headers: headers, payload: payload}}
              .and_return({code: 200, body: {"id"=>metadata_id, "name"=>"price1", "label"=>"price1", "schema"=>{"type"=>"Number", "minValue"=>100, "maxValue"=>300}} })
      @sut = ImageKitIo::File.new(req_obj)
      resp = @sut.update_custom_metadata(metadata_id, 'price1', nil)
      expect(@ac[:url]).to eq("https://api.imagekit.io/v1/customMetadataFields/#{metadata_id}")
      expect(@ac[:method]).to eq('patch')
      expect(resp[:body]).to eq({"id"=>metadata_id, "name"=>"price1", "label"=>"price1", "schema"=>{"type"=>"Number", "minValue"=>100, "maxValue"=>300}} )
    end

    it 'test_delete_custom_metadata' do
      metadata_id = "619e667320b7ef03efc5d850"
      allow(req_obj)
        .to receive(:request){|method,url,headers,payload| @ac={method: method, url: url, headers: headers, payload: payload}}
              .and_return({code: 204, body: { success: true} })
      @sut = ImageKitIo::File.new(req_obj)
      @sut.delete_custom_metadata(metadata_id)
      expect(@ac[:url]).to eq("https://api.imagekit.io/v1/customMetadataFields/#{metadata_id}")
      expect(@ac[:method]).to eq('delete')
    end
  end
end
