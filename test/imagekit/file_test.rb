require_relative './helper'
require "rspec/autorun"

RSpec.describe "FileUploadTest" do
  it "test_upload_with_valid_expected_success_without_tags_and_remote_url" do
    request_obj = double
    allow(Request)
      .to receive(:new)
      .with(PRIVATE_KEY, PUBLIC_KEY, URL_ENDPOINT)
      .and_return(request_obj)
    
    allow(request_obj)
      .to receive(:create_headers)
      .and_return({})
    @ac={}
    allow(request_obj)
      .to receive(:request){|method,url,headers,payload| @ac={method: method, url: url, headers: headers, payload:payload}}
      .and_return({code: 200})
    
    SUT = File.new(request_obj)

    upload = SUT.upload("http://remotefiles.com/fake_file.jpg", "my_file_name", {})
    expect(@ac[:payload].to_json).to eq("{\"multipart\":true,\"file\":\"http://remotefiles.com/fake_file.jpg\",\"fileName\":\"my_file_name\"}")

    expect(upload[:code]).to eq(200)

  end

  it "test_upload_with_valid_expected_success_without_tags_and_base64" do
    request_obj = double
    allow(Request)
      .to receive(:new)
      .with(PRIVATE_KEY, PUBLIC_KEY, URL_ENDPOINT)
      .and_return(request_obj)
    
    allow(request_obj)
      .to receive(:create_headers)
      .and_return({})
    @ac={}
    allow(request_obj)
      .to receive(:request){|method,url,headers,payload| @ac={method: method, url: url, headers: headers, payload:payload}}
      .and_return({code: 200})
    
    SUT = File.new(request_obj)
    base64="f06830ca9f1e3e90"
    upload = SUT.upload(base64, "my_file_name", {})
    expect(@ac[:payload].to_json).to eq("{\"multipart\":true,\"file\":\"#{base64}\",\"fileName\":\"my_file_name\"}")
    expect(is_valid_hex(base64)).to eq(true)
    expect(upload[:code]).to eq(200)

  end

  it "test_upload_with_valid_expected_success_without_tags_and_file" do
    request_obj = double
    allow(Request)
      .to receive(:new)
      .with(PRIVATE_KEY, PUBLIC_KEY, URL_ENDPOINT)
      .and_return(request_obj)
    
    allow(request_obj)
      .to receive(:create_headers)
      .and_return({})
    @ac={}
    allow(request_obj)
      .to receive(:request){|method,url,headers,payload| @ac={method: method, url: url, headers: headers, payload:payload}}
      .and_return({code: 200})
    
    SUT = File.new(request_obj)
    file = open("test/imagekit/dummy_data/sample.jpg", "rb")
    upload = SUT.upload(file, "my_file_name", {})
    expect(@ac[:payload].to_json).to eq("{\"multipart\":true,\"file\":\"#{file}\",\"fileName\":\"my_file_name\"}")
    
    expect(upload[:code]).to eq(200)

  end

  it "test_upload_with_valid_expected_success_with_custom_coordinates" do
    request_obj = double
    allow(Request)
      .to receive(:new)
      .with(PRIVATE_KEY, PUBLIC_KEY, URL_ENDPOINT)
      .and_return(request_obj)
    
    allow(request_obj)
      .to receive(:create_headers)
      .and_return({})
    @ac={}
    allow(request_obj)
      .to receive(:request){|method,url,headers,payload| @ac={method: method, url: url, headers: headers, payload:payload}}
      .and_return({code: 200})
    
    SUT = File.new(request_obj)

    upload = SUT.upload("./fake_file.jpg", "my_file_name", {"custom_coordinates":"10, 10, 100, 100"})
    
    expect(@ac[:payload].to_json).to eq("{\"multipart\":true,\"file\":\"./fake_file.jpg\",\"fileName\":\"my_file_name\",\"customCoordinates\":\"10, 10, 100, 100\"}")

    expect(upload[:code]).to eq(200)

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
      .to receive(:request){|method,url,headers,payload| @ac={method: method, url: url, headers: headers, payload:payload}}
      .and_return({code: 200})
    
    SUT = File.new(request_obj)

    upload = SUT.upload("./fake_file.jpg", "my_file_name", {response_fields: %w[is_private_file tags], tags: %w[abc def], use_unique_file_name: false})
    
    expect(@ac[:payload].to_json).to eq("{\"multipart\":true,\"file\":\"./fake_file.jpg\",\"fileName\":\"my_file_name\",\"responseFields\":\"is_private_file,tags\",\"tags\":\"abc,def\",\"useUniqueFileName\":\"false\"}")
    
    expect(upload[:code]).to eq(200)

  end

  it "test_upload_fails_on_invalid_options" do
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
      .and_return({code: 401, message: nil})

    SUT = File.new(request_obj)
    expect{
      SUT.upload("fake_file.jpg", "fake_name", { invalid_option: "invalid_option" })
    }.to raise_error(ArgumentError)
  end

  it "test_upload_fails_on_unauthenticated_request" do
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
      .and_return({code: 401, message: nil})

    SUT = File.new(request_obj)
    upload = SUT.upload("fake_file.jpg", "fake_name", {})
    expect(@ac[:payload][:file]).to eq("fake_file.jpg")
    expect(@ac[:payload][:fileName]).to eq("fake_name")
    expect(upload[:code]).to eq(401)
  end
end

RSpec.describe "FileListTest" do
  it "test_list_files_fails_on_unauthenticated_request" do
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
      .and_return({code: 401})

    SUT = File.new(request_obj)
    resp = SUT.list({"skip": 0, "limit": 10})
    
    expect(@ac[:payload].to_json).to eq("{\"skip\":0,\"limit\":10}")
    expect(resp[:code]).to eq(401)
  end

  it "test_list_files_succeeds_with_basic_request" do
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
      .and_return({code: 200, body:[]})

    SUT = File.new(request_obj)
    resp = SUT.list({"skip": 0, "limit": 10})
    expect(@ac[:payload].to_json).to eq("{\"skip\":0,\"limit\":10}")
    expect(resp[:code]).to eq(200)
  end
end

RSpec.describe "FileDetailTest" do
  it "test_get_file_details_fails_on_unauthenticated_request" do
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
      .and_return({code: 401, body:{message: "Unauthorized request!"}})

    SUT = File.new(request_obj)
    resp = SUT.details("demo-file-id")
    
    expect(@ac[:url]).to eq("https://api.imagekit.io/v1/files/demo-file-id/details/")
    expect(resp[:code]).to eq(401)
    expect(resp[:body][:message]).to eq("Unauthorized request!")
  end

  it "test_file_details_succeeds_with_id" do
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
      .and_return({code: 200, body: {fileId: "demo-file-id"}})

    SUT = File.new(request_obj)
    resp = SUT.details("demo-file-id")
    expect(@ac[:url]).to eq("https://api.imagekit.io/v1/files/demo-file-id/details/")
    expect(resp[:code]).to eq(200)
  end

end

RSpec.describe "TestDeleteFile" do
  it "test_file_delete_fails_on_unauthenticated_request" do
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
      .and_return({code: 401, body: {fileId: "demo-file-id"}})

    SUT = File.new(request_obj)
    resp = SUT.delete("demo-file-id")

    expect(@ac[:url]).to eq("https://api.imagekit.io/v1/files/demo-file-id")
    expect(@ac[:method]).to eq("delete")
    expect(resp[:code]).to eq(401)
  end

  it "test_file_delete_fails_on_item_not_found" do
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
      .and_return({code: 204, body: {fileId: "demo-file-id"}})

    SUT = File.new(request_obj)
    resp = SUT.delete("demo-file-id")

    expect(@ac[:url]).to eq("https://api.imagekit.io/v1/files/demo-file-id")
    expect(@ac[:method]).to eq("delete")
    expect(resp[:code]).to eq(204)
  end

  it "test_file_delete_succeeds" do
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
      .and_return({code: 200, body: {fileId: "demo-file-id"}})

    SUT = File.new(request_obj)
    resp = SUT.delete("demo-file-id")

    expect(@ac[:url]).to eq("https://api.imagekit.io/v1/files/demo-file-id")
    expect(@ac[:method]).to eq("delete")
    expect(resp[:code]).to eq(200)
    
  end
end

RSpec.describe "TestPurgeCache" do
  it "test_purge_cache_fails_on_unauthenticated_request" do
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
      .and_return({code: 401, body: {}})

    SUT = File.new(request_obj)
    resp = SUT.purge_cache("file_url")
    
    expect(@ac[:payload].to_json).to eq("{\"url\":\"file_url\"}")
    expect(resp[:code]).to eq(401)
  end

  it "test_purge_cache_succeeds" do
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
      .and_return({code: 200, body: {requestId:"requestId"}})

    SUT = File.new(request_obj)
    resp = SUT.purge_cache("file_url")

    expect(@ac[:payload].to_json).to eq("{\"url\":\"file_url\"}")
    expect(resp[:code]).to eq(200)
    expect(resp[:body][:requestId]).to eq("requestId")
  end
end

RSpec.describe "TestPurgeCacheStatus" do
  it "test_get_purge_cache_status_fails_on_unauthenticated_request" do
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
      .and_return({code: 401, body: {}})

    SUT = File.new(request_obj)
    resp = SUT.purge_cache_status("request-id")
    
    expect(@ac[:url]).to eq("https://api.imagekit.io/v1/files/purge/request-id")
    expect(resp[:code]).to eq(401)

  end

  it "test_purge_cache_status_succeeds" do
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
      .and_return({code: 200, body: {status: "Complete"}})

    SUT = File.new(request_obj)
    resp = SUT.purge_cache_status("request-id")

    expect(@ac[:url]).to eq("https://api.imagekit.io/v1/files/purge/request-id")
    expect(resp[:code]).to eq(200)
    expect(resp[:body][:status]).to eq("Complete")
  end
end

RSpec.describe "TestGetMetaData" do
  it "test_get_metadata_fails_on_unauthenticated_request" do
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
      .and_return({code: 401, body: {}})

    SUT = File.new(request_obj)
    resp = SUT.get_metadata("file_id")
    
    expect(@ac[:url]).to eq("https://api.imagekit.io/v1/files/file_id/metadata")
    expect(resp[:code]).to eq(401)

  end

  it "test_get_metadata_succeeds" do
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

    SUT = File.new(request_obj)
    resp = SUT.get_metadata("file_id")

    expect(@ac[:url]).to eq("https://api.imagekit.io/v1/files/file_id/metadata")
    expect(resp[:code]).to eq(200)
  end

end

RSpec.describe "TestUpdateFileDetails" do
  it "test_details_fails_on_unauthenticated_request" do

    options = {"tags": %w[tag1 tag2], "custom_coordinates": "10,10,100,100"}

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
      .and_return({code: 401, body: {}})

    SUT = File.new(request_obj)
    resp = SUT.update_details("file_id", options)
    expect(@ac[:payload]).to eq("{\"tags\":[\"tag1\",\"tag2\"],\"customCoordinates\":\"10,10,100,100\"}")
    expect(resp[:code]).to eq(401)

  end

  it "test_update_file_details_succeeds_with_id" do
    options = {tags: %w[tag1 tag2], "custom_coordinates": "10,10,100,100"}
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
      .and_return({code: 200, body: options})

    SUT = File.new(request_obj)
    resp = SUT.update_details("file_id", options)
    
    expect(JSON.parse(@ac[:payload])['tags']).to eq(options[:tags])
    expect(JSON.parse(@ac[:payload])['customCoordinates']).to eq(options[:custom_coordinates])
    expect(resp[:code]).to eq(200)
    expect(resp[:body]).to eq(options)
  end

  it "test_update_file_details_fails_missing_arguments" do
    options = {}
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
      .and_return({code: 200, body: options})

    SUT = File.new(request_obj)
    expect { 
      SUT.update_details("file_id", options)
  }.to raise_error(ArgumentError)
  end

  it "test_update_file_details_fails_tags_not_an_array" do
    options = {tags: "RANDOM_TEXT", "custom_coordinates": "10,10,100,100"}
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
      .and_return({code: 200, body: options})

    SUT = File.new(request_obj)
    expect { 
      SUT.update_details("file_id", options)
  }.to raise_error(ArgumentError)
  end

  it "test_update_file_details_fails_custom_coordinates_not_a_string" do
    options = {"custom_coordinates": %w[random]}
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
      .and_return({code: 200, body: options})

    SUT = File.new(request_obj)
    expect { 
      SUT.update_details("file_id", options)
  }.to raise_error(ArgumentError)
  end
end




RSpec.describe "TestBatchDelete" do
  it "test_batch_delete_fails_on_unauthenticated_request" do
    file_ids = %w[file_id_1 file_id_2]
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
      .and_return({code: 401, body: {}})

    SUT = File.new(request_obj)
    resp = SUT.batch_delete(file_ids)
    
    expect(@ac[:payload]).to eq({"fileIds": file_ids}.to_json)
    expect(resp[:code]).to eq(401)
  end

  it "test_batch_delete_fails_on_item_not_found" do
    file_ids = %w[file_id_1 file_id_2]
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
      .and_return({code: 404, body: {message: "The requested file(s) does not exist.",
                                     help: "For support kindly contact us at support@imagekit.io .",
                                     missingFileIds: file_ids,},},)

    SUT = File.new(request_obj)
    resp = SUT.batch_delete(file_ids)

    expect(@ac[:payload]).to eq({"fileIds": file_ids}.to_json)
    expect(resp[:code]).to eq(404)
    expect(resp[:body][:missingFileIds]).to eq(file_ids)
  end

  it "test_batch_delete_succeeds" do
    request_obj = double
    file_ids = %w[file_id_1 file_id_2]

    allow(Request)
      .to receive(:new)
      .with(PRIVATE_KEY, PUBLIC_KEY, URL_ENDPOINT)
      .and_return(request_obj)

    allow(request_obj)
      .to receive(:create_headers)
      .and_return({})

    allow(request_obj)
      .to receive(:request){|method,url,headers,payload| @ac={method: method, url: url, headers: headers, payload:payload}}
      .and_return({code: 200, body: {successfullyDeletedFileIds: file_ids}})

    SUT = File.new(request_obj)
    resp = SUT.batch_delete(file_ids)

    expect(@ac[:payload]).to eq({"fileIds": file_ids}.to_json)
    expect(resp[:code]).to eq(200)
    expect(resp[:body][:successfullyDeletedFileIds]).to eq(file_ids)
  end
end


RSpec.describe "TestGetRemoteFileURLMetaData" do
  it "test_get_metadata_from_remote_url_fails_on_unauthenticated_request" do
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
      .and_return({code: 401, body: {}})

    SUT = File.new(request_obj)
    resp = SUT.get_metadata_from_remote_url("http://example.com/fakefileurl")
    
    expect(@ac[:url]).to eq("https://api.imagekit.io/v1/metadata?url=http://example.com/fakefileurl")
    expect(resp[:code]).to eq(401)
  end

  it "test_get_metadata_from_remote_url_fails_on_blank_url" do
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
      .and_return({code: 401, body: {}})

    SUT = File.new(request_obj)
    expect {
      SUT.get_metadata_from_remote_url("")
  }.to raise_error(ArgumentError)
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

    SUT = File.new(request_obj)
    resp = SUT.get_metadata_from_remote_url("http://example.com/fakefileurl")

    expect(@ac[:url]).to eq("https://api.imagekit.io/v1/metadata?url=http://example.com/fakefileurl")
    expect(resp[:code]).to eq(200)
  end
end
