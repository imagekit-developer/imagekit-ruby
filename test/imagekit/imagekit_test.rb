# ImageKitIo Test
require_relative './helper'
require "rspec/autorun"

RSpec.describe "FileUploadTest" do

    it "test_initialization_with_private_key_missing" do
      request_obj = double
      expect {
        ImageKitIo::Client.new("  ", PUBLIC_KEY, URL_ENDPOINT)
    }.to raise_error(ArgumentError, MISSING_PRIVATE_KEY)
    end

    it "test_initialization_with_non_string_private_key" do
      request_obj = double
      expect {
        ImageKitIo::Client.new({ RANDOM: "RANDOM"}, PUBLIC_KEY, URL_ENDPOINT)
    }.to raise_error(ArgumentError, MISSING_PRIVATE_KEY)
    end

    it "test_initialization_with_public_key_missing" do
      request_obj = double
      expect {
        ImageKitIo::Client.new(PRIVATE_KEY, "   ", URL_ENDPOINT)
    }.to raise_error(ArgumentError, MISSING_PUBLIC_KEY)
    end

    it "test_initialization_with_non_string_public_key" do
      request_obj = double
      expect {
        ImageKitIo::Client.new(PRIVATE_KEY, { RANDOM: "RANDOM"}, URL_ENDPOINT)
    }.to raise_error(ArgumentError, MISSING_PUBLIC_KEY)
    end

    it "test_initialization_with_url_endpoint_missing" do
      request_obj = double
      expect {
        ImageKitIo::Client.new(PRIVATE_KEY, PUBLIC_KEY, "  ")
    }.to raise_error(ArgumentError, MISSING_URL_ENDPOINT)
    end

    it "test_initialization_with_non_string_url_endpoint" do
      request_obj = double
      expect {
        ImageKitIo::Client.new(PRIVATE_KEY, PUBLIC_KEY, { RANDOM: "RANDOM"})
    }.to raise_error(ArgumentError, MISSING_URL_ENDPOINT)
    end

    it "test_upload_with_valid_expected_success" do
      request_obj = double
      allow(Request)
        .to receive(:new)
        .with(PRIVATE_KEY, PUBLIC_KEY, URL_ENDPOINT)
        .and_return(request_obj)
  
      allow(request_obj)
        .to receive(:create_headers)
        .and_return({})
  
      allow(request_obj)
        .to receive(:request)
        .and_return({code: 200})
  
      SUT = ImageKitIo::Client.new(PRIVATE_KEY, PUBLIC_KEY, URL_ENDPOINT)
      SUT.set_ik_request(request_obj)
  
      upload = SUT.upload_file("fakefile.jpg", "fake", {})
  
      expect(upload[:code]).to eq(200)
    end
  
  
    it "test_list_files_with_valid_expected_success" do
      # test list_files method
  
      request_obj = double
      allow(Request)
        .to receive(:new)
        .with(PRIVATE_KEY, PUBLIC_KEY, URL_ENDPOINT)
        .and_return(request_obj)
  
      allow(request_obj)
        .to receive(:create_headers)
        .and_return({})
  
      allow(request_obj)
        .to receive(:request)
        .and_return({code: 200})
  
      SUT = ImageKitIo::Client.new(PRIVATE_KEY, PUBLIC_KEY, URL_ENDPOINT)
      SUT.set_ik_request(request_obj)
  
      file_list = SUT.list_files({})
  
      expect(file_list[:code]).to eq(200)
    end
  
    it "test_get_file_details_with_valid_expected_success" do
      request_obj = double
      allow(Request)
        .to receive(:new)
        .with(PRIVATE_KEY, PUBLIC_KEY, URL_ENDPOINT)
        .and_return(request_obj)
  
      allow(request_obj)
        .to receive(:create_headers)
        .and_return({})
  
      allow(request_obj)
        .to receive(:request)
        .and_return({code: 200})
  
      SUT = ImageKitIo::Client.new(PRIVATE_KEY, PUBLIC_KEY, URL_ENDPOINT)
      SUT.set_ik_request(request_obj)
  
      file_detail = SUT.get_file_details("http://example.com/fake.jpg")
  
      expect(file_detail[:code]).to eq(200)
    end
  
    it "test_update_file_details_with_valid_expected_success" do
  
      request_obj = double
      allow(Request)
        .to receive(:new)
        .with(PRIVATE_KEY, PUBLIC_KEY, URL_ENDPOINT)
        .and_return(request_obj)
  
      allow(request_obj)
        .to receive(:create_headers)
        .and_return({})
  
      allow(request_obj)
        .to receive(:request)
        .and_return({code: 200})
  
      SUT = ImageKitIo::Client.new(PRIVATE_KEY, PUBLIC_KEY, URL_ENDPOINT)
      SUT.set_ik_request(request_obj)
  
      upload = SUT.update_file_details("fake_id", {tags: ["image_tag"],
                                                   custom_coordinates: "10,10,100, 100", })
  
      expect(upload[:code]).to eq(200)
    end
  
    it "test_delete_file_with_valid_expected_success" do
      # test for delete_file
  
      request_obj = double
      allow(Request)
        .to receive(:new)
        .with(PRIVATE_KEY, PUBLIC_KEY, URL_ENDPOINT)
        .and_return(request_obj)
  
      allow(request_obj)
        .to receive(:create_headers)
        .and_return({})
  
      allow(request_obj)
        .to receive(:request)
        .and_return({code: 200})
  
      SUT = ImageKitIo::Client.new(PRIVATE_KEY, PUBLIC_KEY, URL_ENDPOINT)
      SUT.set_ik_request(request_obj)
  
      delete_resp = SUT.delete_file("fake_id",)
  
      expect(delete_resp[:code]).to eq(200)
    end
  
    it "test_get_file_metadata_valid_expected_success" do
      # test for get_file_metadata
  
      request_obj = double
      allow(Request)
        .to receive(:new)
        .with(PRIVATE_KEY, PUBLIC_KEY, URL_ENDPOINT)
        .and_return(request_obj)
  
      allow(request_obj)
        .to receive(:create_headers)
        .and_return({})
  
      allow(request_obj)
        .to receive(:request)
        .and_return({code: 200})
  
      SUT = ImageKitIo::Client.new(PRIVATE_KEY, PUBLIC_KEY, URL_ENDPOINT)
      SUT.set_ik_request(request_obj)
  
      resp = SUT.get_file_metadata("fake_id",)
  
      expect(resp[:code]).to eq(200)
    end

    it "test_get_metadata_from_remote_url_succeeds" do
      request_obj = double
      allow(Request)
        .to receive(:new)
        .with(PRIVATE_KEY, PUBLIC_KEY, URL_ENDPOINT)
        .and_return(request_obj)
  
      allow(request_obj)
        .to receive(:create_headers)
        .and_return({})
  
      allow(request_obj)
        .to receive(:request){|method,url,headers,payload| @ac={method: method, url: url, headers: headers, payload:payload}}
        .and_return({code: 200, body: {}})
  
      SUT = ImageKitIo::Client.new(PRIVATE_KEY, PUBLIC_KEY, URL_ENDPOINT)
      SUT.set_ik_request(request_obj)

      resp = SUT.get_remote_file_url_metadata("http://example.com/fakefileurl")
  
      expect(@ac[:url]).to eq("https://api.imagekit.io/v1/metadata?url=http://example.com/fakefileurl")
      expect(resp[:code]).to eq(200)
    end
  
    it "test_purge_file_cache_valid_expected_success" do
      # test for get_purge_file_cache
  
      request_obj = double
      allow(Request)
        .to receive(:new)
        .with(PRIVATE_KEY, PUBLIC_KEY, URL_ENDPOINT)
        .and_return(request_obj)
  
      allow(request_obj)
        .to receive(:create_headers)
        .and_return({})
  
      allow(request_obj)
        .to receive(:request)
        .and_return({code: 200})
  
      SUT = ImageKitIo::Client.new(PRIVATE_KEY, PUBLIC_KEY, URL_ENDPOINT)
      SUT.set_ik_request(request_obj)
  
      resp = SUT.purge_file_cache("http://example.com/fake.jpg")
  
      expect(resp[:code]).to eq(200)
    end
  
    it "test_purge_file_cache_status_valid_expected_success" do
      # test for get_purge_file_cache
  
      request_obj = double
      allow(Request)
        .to receive(:new)
        .with(PRIVATE_KEY, PUBLIC_KEY, URL_ENDPOINT)
        .and_return(request_obj)
  
      allow(request_obj)
        .to receive(:create_headers)
        .and_return({})
  
      allow(request_obj)
        .to receive(:request)
        .and_return({code: 200})
  
      SUT = ImageKitIo::Client.new(PRIVATE_KEY, PUBLIC_KEY, URL_ENDPOINT)
      SUT.set_ik_request(request_obj)
  
      resp = SUT.purge_file_cache_status("fake_id")
  
      expect(resp[:code]).to eq(200)
    end
  
    it "test_phash_distance_fails_if_not_hexa" do
      # test for get_purge_file_cache
  
      request_obj = double
  
      SUT = ImageKitIo::Client.new(PRIVATE_KEY, PUBLIC_KEY, URL_ENDPOINT)
      SUT.set_ik_request(request_obj)
  
      expect {
        SUT.phash_distance("f06830ca9f1e3e90", "RANDOM")
    }.to raise_error(ArgumentError)
    end

    it "test_phash_distance_fails_if_argument_missing" do
  
      request_obj = double
  
      SUT = ImageKitIo::Client.new(PRIVATE_KEY, PUBLIC_KEY, URL_ENDPOINT)
      SUT.set_ik_request(request_obj)
  
      expect {
        SUT.phash_distance("f06830ca9f1e3e90", "  ")
      }.to raise_error(NameError)
    end

    it "test_generate_url_with_path" do
      # request_obj=Request.new(@private_key,@public_key,@url_endpoint)
      # url_obj = Url.new(request_obj)

      SUT = ImageKitIo::Client.new(PRIVATE_KEY, PUBLIC_KEY, URL_ENDPOINT)
  
      options = {path: "/default-image.jpg",
        url_endpoint: @url_endpoint,
        transformation: [{height: 300, width: 400}],
      }
      url = SUT.url(options)
  
      expect(url).to eq("https://imagekit.io/your-imgekit-id/tr:h-300,w-400/default-image.jpg?ik-sdk-version=ruby-#{ImageKitIo::Sdk::VERSION}")
    end

    it "get_authentication_params_test_with_hard_coded_params" do
      SUT = ImageKitIo::Client.new('private_key_test', PUBLIC_KEY, URL_ENDPOINT)
      # SUT.set_ik_request(request_obj)

      result=SUT.get_authentication_parameters('your_token',1582269249)
      expect('your_token').to eq(result[:token])
      expect(nil).not_to eq(result[:expire])
      expect('e71bcd6031016b060d349d212e23e85c791decdd').to eq(result[:signature])
  end
  
  end
