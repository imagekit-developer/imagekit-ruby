require_relative "./helper"
require "rspec/autorun"

RSpec.configure do |config|
  config.before(:each) do
    @private_key = PRIVATE_KEY
    @public_key = PUBLIC_KEY
    @url_endpoint = URL_ENDPOINT
    @request_obj = ImageKitRequest.new(@private_key, @public_key, @url_endpoint)
    stub_request(:get, "https://www.examplenonjson.com").to_return(status: 200, body: "", headers: {content_type: "text/html"})
    stub_request(:get, "https://www.examplejson.com").to_return(body: '{"example_key": "example_value"}', headers: {content_type: "application/json"})
    stub_request(:get, "https://www.examplenotfound.com").to_return(status: 404)
    stub_request(:get, "https://www.example204.com").to_return(status: 204)
  end

  config.after(:each) do
  
  end
end

RSpec.describe "TestImageKitRequest" do
  it "test_request_init" do
    request_obj = ImageKitRequest.new(@private_key, @public_key, @url_endpoint)

    expect(request_obj.private_key).to eq(@private_key)
  end

  it "test_create_headers" do
    headers = @request_obj.create_headers
    expect(headers[:'Accept-Encoding']).to include("application/json")
  end

  it "test_auth_headers" do
    # test Auth headers working properly
    auth_headers = @request_obj.auth_headers
    expect(auth_headers[:Authorization]).to include("Basic")
  end

  it "test_request_method_non_JSON_fail" do
    response = @request_obj.request(:get, "https://www.examplenonjson.com")
    expect(response).to have_key(:error)
  end

  it "test_request_method_JSON_success" do
    response = @request_obj.request(:get, "https://www.examplejson.com")
    expect(response).to have_key(:response)
  end
  
  it "test_request_method_404" do
    response = @request_obj.request(:get, "https://www.examplenotfound.com")
    expect(response).to have_key(:error)
  end

  it "test_request_method_204" do
    response = @request_obj.request(:get, "https://www.example204.com")
    expect(response).to have_key(:error)
  end
end
