require "rspec/autorun"
require_relative "./helper"

RSpec.configure do |config|
  config.before(:each) do
    @private_key = PRIVATE_KEY
    @public_key = PUBLIC_KEY
    @url_endpoint = URL_ENDPOINT
    @request_obj = ImageKitRequest.new(@private_key, @public_key, @url_endpoint)
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
  
end
