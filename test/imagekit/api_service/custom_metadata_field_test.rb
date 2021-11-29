require_relative '../spec_helper'

RSpec.describe ImageKitIo::ApiService::CustomMetadataField do
  let(:custom_metadata_service) { described_class }
  let(:config) { ImageKitIo.config }
  let(:constants) { ImageKitIo.constants }
  let!(:private_key) { config.private_key }
  let!(:public_key) { config.public_key }
  let!(:url_endpoint) { config.url_endpoint }

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

    it 'raises error when not providing parameter for create' do
      @sut = custom_metadata_service.new(req_obj)
      expect {
        @sut.create(name: nil, label: 'test_label', schema: '')
      }.to raise_error(ArgumentError)
    end

    it 'test_create_custom_metadata' do
      allow(req_obj)
        .to receive(:request){|method,url,headers,payload| @ac={method: method, url: url, headers: headers, payload: payload}}
              .and_return({code: 200, body: success_response })
      @sut = custom_metadata_service.new(req_obj)
      resp = @sut.create(
        name: 'price1',
        label: 'price',
        schema: {
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
      @sut = custom_metadata_service.new(req_obj)
      resp = @sut.list
      expect(@ac[:url]).to eq("https://api.imagekit.io/v1/customMetadataFields")
      expect(@ac[:method]).to eq('get')
      expect(resp[:body]).to eq([success_response])
    end

    it 'test_update_custom_metadata' do
      metadata_id = "619e667320b7ef03efc5d850"
      allow(req_obj)
        .to receive(:request){|method,url,headers,payload| @ac={method: method, url: url, headers: headers, payload: payload}}
              .and_return({code: 200, body: {"id"=>metadata_id, "name"=>"price1", "label"=>"price1", "schema"=>{"type"=>"Number", "minValue"=>100, "maxValue"=>300}} })
      @sut = custom_metadata_service.new(req_obj)
      resp = @sut.update(id: metadata_id, label: 'price1', schema: nil)
      expect(@ac[:url]).to eq("https://api.imagekit.io/v1/customMetadataFields/#{metadata_id}")
      expect(@ac[:method]).to eq('patch')
      expect(resp[:body]).to eq({"id"=>metadata_id, "name"=>"price1", "label"=>"price1", "schema"=>{"type"=>"Number", "minValue"=>100, "maxValue"=>300}} )
    end

    it 'test_delete_custom_metadata' do
      metadata_id = "619e667320b7ef03efc5d850"
      allow(req_obj)
        .to receive(:request){|method,url,headers,payload| @ac={method: method, url: url, headers: headers, payload: payload}}
              .and_return({code: 204, body: { success: true} })
      @sut = custom_metadata_service.new(req_obj)
      @sut.delete(id: metadata_id)
      expect(@ac[:url]).to eq("https://api.imagekit.io/v1/customMetadataFields/#{metadata_id}")
      expect(@ac[:method]).to eq('delete')
    end
  end
end
