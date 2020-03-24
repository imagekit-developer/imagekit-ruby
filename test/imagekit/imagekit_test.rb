# ImageKit Test
require "rspec/autorun"
require_relative './helper'

RSpec.describe "FileUploadTest" do
    it "test_upload_with_valid_expected_success" do
      request_obj = double
      allow(ImageKitRequest)
        .to receive(:new)
        .with(PRIVATE_KEY, PUBLIC_KEY, URL_ENDPOINT)
        .and_return(request_obj)
  
      allow(request_obj)
        .to receive(:create_headers)
        .and_return({})
  
      allow(request_obj)
        .to receive(:request)
        .and_return({code: 200})
  
      SUT = ImageKit::ImageKitClient.new(PRIVATE_KEY, PUBLIC_KEY, URL_ENDPOINT)
      SUT.set_ik_request(request_obj)
  
      upload = SUT.upload_file("fakefile.jpg", "fake", {})
  
      expect(upload[:code]).to eq(200)
    end
  
  
    it "test_list_files_with_valid_expected_success" do
      # test list_files method
  
      request_obj = double
      allow(ImageKitRequest)
        .to receive(:new)
        .with(PRIVATE_KEY, PUBLIC_KEY, URL_ENDPOINT)
        .and_return(request_obj)
  
      allow(request_obj)
        .to receive(:create_headers)
        .and_return({})
  
      allow(request_obj)
        .to receive(:request)
        .and_return({code: 200})
  
      SUT = ImageKit::ImageKitClient.new(PRIVATE_KEY, PUBLIC_KEY, URL_ENDPOINT)
      SUT.set_ik_request(request_obj)
  
      file_list = SUT.list_files({})
  
      expect(file_list[:code]).to eq(200)
    end
  
    it "test_get_file_details_with_valid_expected_success" do
      request_obj = double
      allow(ImageKitRequest)
        .to receive(:new)
        .with(PRIVATE_KEY, PUBLIC_KEY, URL_ENDPOINT)
        .and_return(request_obj)
  
      allow(request_obj)
        .to receive(:create_headers)
        .and_return({})
  
      allow(request_obj)
        .to receive(:request)
        .and_return({code: 200})
  
      SUT = ImageKit::ImageKitClient.new(PRIVATE_KEY, PUBLIC_KEY, URL_ENDPOINT)
      SUT.set_ik_request(request_obj)
  
      file_detail = SUT.get_file_details("http://example.com/fake.jpg")
  
      expect(file_detail[:code]).to eq(200)
    end
  
    it "test_update_file_details_with_valid_expected_success" do
  
      request_obj = double
      allow(ImageKitRequest)
        .to receive(:new)
        .with(PRIVATE_KEY, PUBLIC_KEY, URL_ENDPOINT)
        .and_return(request_obj)
  
      allow(request_obj)
        .to receive(:create_headers)
        .and_return({})
  
      allow(request_obj)
        .to receive(:request)
        .and_return({code: 200})
  
      SUT = ImageKit::ImageKitClient.new(PRIVATE_KEY, PUBLIC_KEY, URL_ENDPOINT)
      SUT.set_ik_request(request_obj)
  
      upload = SUT.update_file_details("fake_id", {tags: ["image_tag"],
                                                   custom_coordinates: "10,10,100, 100", })
  
      expect(upload[:code]).to eq(200)
    end
  
    it "test_delete_file_with_valid_expected_success" do
      # test for delete_file
  
      request_obj = double
      allow(ImageKitRequest)
        .to receive(:new)
        .with(PRIVATE_KEY, PUBLIC_KEY, URL_ENDPOINT)
        .and_return(request_obj)
  
      allow(request_obj)
        .to receive(:create_headers)
        .and_return({})
  
      allow(request_obj)
        .to receive(:request)
        .and_return({code: 200})
  
      SUT = ImageKit::ImageKitClient.new(PRIVATE_KEY, PUBLIC_KEY, URL_ENDPOINT)
      SUT.set_ik_request(request_obj)
  
      delete_resp = SUT.delete_file("fake_id",)
  
      expect(delete_resp[:code]).to eq(200)
    end
  
    it "test_get_file_metadata_valid_expected_success" do
      # test for get_file_metadata
  
      request_obj = double
      allow(ImageKitRequest)
        .to receive(:new)
        .with(PRIVATE_KEY, PUBLIC_KEY, URL_ENDPOINT)
        .and_return(request_obj)
  
      allow(request_obj)
        .to receive(:create_headers)
        .and_return({})
  
      allow(request_obj)
        .to receive(:request)
        .and_return({code: 200})
  
      SUT = ImageKit::ImageKitClient.new(PRIVATE_KEY, PUBLIC_KEY, URL_ENDPOINT)
      SUT.set_ik_request(request_obj)
  
      resp = SUT.get_file_metadata("fake_id",)
  
      expect(resp[:code]).to eq(200)
    end
  
    it "test_purge_file_cache_valid_expected_success" do
      # test for get_purge_file_cache
  
      request_obj = double
      allow(ImageKitRequest)
        .to receive(:new)
        .with(PRIVATE_KEY, PUBLIC_KEY, URL_ENDPOINT)
        .and_return(request_obj)
  
      allow(request_obj)
        .to receive(:create_headers)
        .and_return({})
  
      allow(request_obj)
        .to receive(:request)
        .and_return({code: 200})
  
      SUT = ImageKit::ImageKitClient.new(PRIVATE_KEY, PUBLIC_KEY, URL_ENDPOINT)
      SUT.set_ik_request(request_obj)
  
      resp = SUT.purge_file_cache("http://example.com/fake.jpg")
  
      expect(resp[:code]).to eq(200)
    end
  
    it "test_purge_file_cache_status_valid_expected_success" do
      # test for get_purge_file_cache
  
      request_obj = double
      allow(ImageKitRequest)
        .to receive(:new)
        .with(PRIVATE_KEY, PUBLIC_KEY, URL_ENDPOINT)
        .and_return(request_obj)
  
      allow(request_obj)
        .to receive(:create_headers)
        .and_return({})
  
      allow(request_obj)
        .to receive(:request)
        .and_return({code: 200})
  
      SUT = ImageKit::ImageKitClient.new(PRIVATE_KEY, PUBLIC_KEY, URL_ENDPOINT)
      SUT.set_ik_request(request_obj)
  
      resp = SUT.purge_file_cache_status("fake_id")
  
      expect(resp[:code]).to eq(200)
    end
  
    it "test_phash_distance_fails_if_not_hexa" do
      # test for get_purge_file_cache
  
      request_obj = double
  
      SUT = ImageKit::ImageKitClient.new(PRIVATE_KEY, PUBLIC_KEY, URL_ENDPOINT)
      SUT.set_ik_request(request_obj)
  
      resp = SUT.phash_distance("f06830ca9f1e3e90", "f06830ca9f1e3e90")
      expect(resp).to eq(0)
    end
  
  end