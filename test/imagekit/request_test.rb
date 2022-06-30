require_relative "./spec_helper"
require "rspec/autorun"

RSpec.describe ImageKitIo::Request do
  let(:subject) { described_class }

  before(:each) do
    @private_key = 'private_key_xyz'
    @public_key = 'public_key_xyz'
    @url_endpoint = 'https://imagekit.io/your-imgekit-id'
    @request_obj = subject.new(@private_key, @public_key, @url_endpoint)
    stub_request(:get, "https://www.examplenonjson.com").to_return(status: 200, body: "", headers: {content_type: "text/html"})
    stub_request(:get, "https://www.examplejson.com").to_return(body: '{"example_key": "example_value"}', headers: {content_type: "application/json"})
    stub_request(:get, "https://www.examplenotfound.com").to_return(status: 404)
    stub_request(:get, "https://www.example204.com").to_return(status: 204)
  end
  describe 'TestRequest' do
    it "test_request_init" do
      request_obj = ImageKitIo::Request.new(@private_key, @public_key, @url_endpoint)

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
      expect(response[:response]).to have_key(:success)
      expect(response).to_not have_key(:error)
    end

    it 'test_request_method_non_JSON_fail_with_post' do
      stub_request(:post, 'https://www.exampleservererror/upload').to_return(status: 400, body: '{"message": "Server failed"}', headers: {content_type: 'application/json'})
      response = @request_obj.request(:post, 'https://www.exampleservererror/upload', nil, [])
      expect(response).to have_key(:error)
    end

    it 'test_request_method_JSON_success_with_post' do
      stub_request(:post, 'https://www.exampleservererror/upload').to_return(status: 200, body: '{"id": "1"}', headers: {content_type: 'application/json'})
      response = @request_obj.request(:post, 'https://www.exampleservererror/upload', nil, [])
      expect(response).to_not have_key(:error)
      expect(response).to have_key(:response)
    end

    it 'test_request_method_JSON_success_with_multipart_post' do
      stub_request(:post, 'https://www.exampleservererror/upload').to_return(status: 200, body: '{"id": "1"}', headers: {content_type: 'application/json'})
      response = @request_obj.request(:post, 'https://www.exampleservererror/upload', nil, { multipart: true })
      expect(response).to_not have_key(:error)
      expect(response).to have_key(:response)
    end

    it 'test_request_method_non_JSON_fail_with_multipart_post' do
      stub_request(:post, 'https://www.exampleservererror/upload').to_return(status: 400, body: '{"message": "Server failed"}', headers: {content_type: 'application/json'})
      response = @request_obj.request(:post, 'https://www.exampleservererror/upload', nil, { multipart: true })
      expect(response).to have_key(:error)
    end

    it 'test_request_method_403' do
      stub_request(:post, 'https://www.exampleservererror/upload').to_return(status: 403, body: "{\"message\":\"Your account cannot be authenticated.\",\"help\":\"For support kindly contact us at support@imagekit.io .\"}", headers: {content_type: 'application/json'})
      response = @request_obj.request(:post, 'https://www.exampleservererror/upload', nil, { multipart: true })
      expect(response).to have_key(:error)
      expect(response[:error]).to eq({"message"=>"Your account cannot be authenticated.", "help"=>"For support kindly contact us at support@imagekit.io ."})
      expect(response[:headers]).to eq({"content-type"=>["application/json"]})
      expect(response[:raw_body]).to eq("{\"message\":\"Your account cannot be authenticated.\",\"help\":\"For support kindly contact us at support@imagekit.io .\"}")
      expect(response[:status_code]).to eq("403")
    end

    it 'test_response_headers' do
      stub_request(:post, 'https://www.exampleservererror/upload').to_return(status: 200, body: "{\"message\":\"Success.\"}", headers: {"strict-transport-security"=>["max-age=15552000"],
                                                                                                                                        "x-ik-requestid"=>["39e19bd4-c9c3-4025-453e-a13e6a412aa0"],
                                                                                                                                        "content-type"=>["application/json; charset=utf-8"],
                                                                                                                                        "x-request-id"=>["39e19bd4-c9c3-4025-a043-a13e6a412aa0"]})
      response = @request_obj.request(:post, 'https://www.exampleservererror/upload', nil, { multipart: true })
      expect(response[:headers]).to eq({"strict-transport-security"=>["max-age=15552000"],
                                        "x-ik-requestid"=>["39e19bd4-c9c3-4025-453e-a13e6a412aa0"],
                                        "content-type"=>["application/json; charset=utf-8"],
                                        "x-request-id"=>["39e19bd4-c9c3-4025-a043-a13e6a412aa0"]})
    end

    it 'test_response_raw_body' do
      stub_request(:post, 'https://www.exampleservererror/upload').to_return(status: 200, body: "{\"message\":\"Success.\"}", headers: {"strict-transport-security"=>["max-age=15552000"], "content-type"=>["application/json; charset=utf-8"]})
      response = @request_obj.request(:post, 'https://www.exampleservererror/upload', nil, { multipart: false })
      expect(response[:raw_body]).to eq("{\"message\":\"Success.\"}")
    end
  end
end
