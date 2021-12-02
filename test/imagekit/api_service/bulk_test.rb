require_relative '../spec_helper'

RSpec.describe ImageKitIo::ApiService::Bulk do
  let(:bulk_api_service) { described_class }
  let(:config) { ImageKitIo.config }
  let(:constants) { ImageKitIo.constants }
  let!(:private_key) { config.private_key }
  let!(:public_key) { config.public_key }
  let!(:url_endpoint) { config.url_endpoint }

  describe 'TestBatchDelete' do
    it "test_remove_files_fails_on_unauthenticated_request" do
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

      SUT = bulk_api_service.new(request_obj)
      resp = SUT.remove_files(file_ids: file_ids)

      expect(@ac[:payload]).to eq({"fileIds": file_ids}.to_json)
      expect(resp[:code]).to eq(401)
    end

    it "test_remove_files_fails_on_item_not_found" do
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

      SUT = bulk_api_service.new(request_obj)
      resp = SUT.remove_files(file_ids: file_ids)

      expect(@ac[:payload]).to eq({"fileIds": file_ids}.to_json)
      expect(resp[:code]).to eq(404)
      expect(resp[:body][:missingFileIds]).to eq(file_ids)
    end

    it "test_remove_files_succeeds" do
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

      SUT = bulk_api_service.new(request_obj)
      resp = SUT.remove_files(file_ids: file_ids)

      expect(@ac[:payload]).to eq({"fileIds": file_ids}.to_json)
      expect(resp[:code]).to eq(200)
      expect(resp[:body][:successfullyDeletedFileIds]).to eq(file_ids)
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
      @sut = bulk_api_service.new(req_obj)
    end

    context 'add_tags' do
      it 'raises error on empty parameters' do
        expect {
          @sut.add_tags
        }.to raise_error(ArgumentError)
      end

      it 'test_add_tags' do
        resp = @sut.add_tags(file_ids: file_ids, tags: ['custom_tag'])
        expect(@ac[:url]).to eq("https://api.imagekit.io/v1/files/addTags")
        expect(@ac[:payload]).to eq("{\"fileIds\":\"file_id_1 file_id_2\",\"tags\":[\"custom_tag\"]}")
        expect(resp[:code]).to eq(200)
      end
    end

    context 'remove_tags' do
      it 'raises error on empty parameters' do
        expect {
          @sut.remove_tags
        }.to raise_error(ArgumentError)
      end

      it 'test_remove_tags' do
        resp = @sut.remove_tags(file_ids: file_ids, tags: ['custom_tag_remove'])
        expect(@ac[:url]).to eq("https://api.imagekit.io/v1/files/removeTags")
        expect(@ac[:payload]).to eq("{\"fileIds\":\"file_id_1 file_id_2\",\"tags\":[\"custom_tag_remove\"]}")
        expect(resp[:code]).to eq(200)
      end
    end

    context 'remove_ai_tags' do
      it 'raises error on empty parameters' do
        expect {
          @sut.remove_ai_tags
        }.to raise_error(ArgumentError)
      end

      it 'test_remove_ai_tags' do
        resp = @sut.remove_ai_tags(file_ids: file_ids, ai_tags: ['custom_ai_tag'])
        expect(@ac[:url]).to eq("https://api.imagekit.io/v1/files/removeAITags")
        expect(@ac[:payload]).to eq("{\"fileIds\":\"file_id_1 file_id_2\",\"AITags\":[\"custom_ai_tag\"]}")
        expect(resp[:code]).to eq(200)
      end
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
      @sut = bulk_api_service.new(req_obj)
    end

    it 'raises error when parameter id not given' do
      expect {
        @sut.job_status
      }.to raise_error(ArgumentError)
    end

    it 'test_job_status' do
      resp = @sut.job_status(job_id: job_id)
      expect(@ac[:url]).to eq("https://api.imagekit.io/v1/bulkJobs/#{job_id}")
      expect(@ac[:method]).to eq('get')
      expect(@ac[:payload]).to eq({ :jobId => job_id})
      expect(resp[:body]['jobId']).to eq(job_id)
      expect(resp[:body]['status']).to eq('Completed')
    end
  end
end
