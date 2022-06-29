require_relative '../spec_helper'

RSpec.describe ImageKitIo::ApiService::Folder do
  let(:folder_api_service) { described_class }
  let(:config) { ImageKitIo.config }
  let(:constants) { ImageKitIo.constants }
  let!(:private_key) { config.private_key }
  let!(:public_key) { config.public_key }
  let!(:url_endpoint) { config.url_endpoint }

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

    context 'create' do
      it 'raises error when parameter not provided' do
        @sut = folder_api_service.new(req_obj)
        expect {
          @sut.create('', nil)
        }.to raise_error(ArgumentError)
      end

      it 'test_create_folder' do
        allow(req_obj)
          .to receive(:request){|method,url,headers,payload| @ac={method: method, url: url, headers: headers, payload: payload}}
                .and_return({code: 201, body: { success: true }})
        @sut = folder_api_service.new(req_obj)
        folder_name = 'test_folder'
        parent_folder = ''
        resp = @sut.create(folder_name: folder_name, parent_folder_path: parent_folder)
        expect(@ac[:url]).to eq("https://api.imagekit.io/v1/folder")
        expect(@ac[:payload]).to eq("{\"folderName\":\"test_folder\",\"parentFolderPath\":\"\"}")
        expect(@ac[:method]).to eq('post')
        expect(resp[:code]).to eq(201)
      end
    end

    context 'delete' do
      it 'raises error when parameter not provided' do
        @sut = folder_api_service.new(req_obj)
        expect {
          @sut.delete
        }.to raise_error(ArgumentError)
      end

      it 'test_delete_folder' do
        allow(req_obj)
          .to receive(:request){|method,url,headers,payload| @ac={method: method, url: url, headers: headers, payload: payload}}
                .and_return({code: 204, body: { success: true }})
        @sut = folder_api_service.new(req_obj)
        folder_path = 'test_folder'
        resp = @sut.delete(folder_path: folder_path)
        expect(@ac[:url]).to eq("https://api.imagekit.io/v1/folder")
        expect(@ac[:method]).to eq('delete')
        expect(resp[:body][:success]).to be(true)
      end
    end

    context 'copy' do
      it 'raises error when parameter not provided' do
        @sut = folder_api_service.new(req_obj)
        expect {
          @sut.copy
        }.to raise_error(ArgumentError)
      end

      it 'test_copy_folder' do
        allow(req_obj)
          .to receive(:request){|method,url,headers,payload| @ac={method: method, url: url, headers: headers, payload: payload}}
                .and_return({code: 200, body: { jobId: '123456' }})
        @sut = folder_api_service.new(req_obj)
        source_folder = 'my_folder'
        destination_path = 'copied'
        resp = @sut.copy(source_folder_path: source_folder, destination_path: destination_path)
        expect(@ac[:url]).to eq("https://api.imagekit.io/v1/bulkJobs/copyFolder")
        expect(@ac[:method]).to eq('post')
        expect(@ac[:payload]).to eq("{\"sourceFolderPath\":\"my_folder\",\"destinationPath\":\"copied\",\"includeFileVersions\":false}")
        expect(resp[:body][:jobId]).to eq('123456')
      end

      it 'test_copy_folder_with_include_versions_parameter' do
        allow(req_obj)
          .to receive(:request){|method,url,headers,payload| @ac={method: method, url: url, headers: headers, payload: payload}}
                .and_return({code: 200, body: { jobId: '123456' }})
        @sut = folder_api_service.new(req_obj)
        source_folder = 'my_folder'
        destination_path = 'copied'
        resp = @sut.copy(source_folder_path: source_folder, destination_path: destination_path, include_file_versions: true)
        expect(@ac[:url]).to eq("https://api.imagekit.io/v1/bulkJobs/copyFolder")
        expect(@ac[:method]).to eq('post')
        expect(@ac[:payload]).to eq("{\"sourceFolderPath\":\"my_folder\",\"destinationPath\":\"copied\",\"includeFileVersions\":true}")
        expect(resp[:body][:jobId]).to eq('123456')
      end
    end

    context 'move' do
      it 'raises error when parameter not provided' do
        @sut = folder_api_service.new(req_obj)
        expect {
          @sut.copy
        }.to raise_error(ArgumentError)
      end

      it 'test_move_folder' do
        allow(req_obj)
          .to receive(:request){|method,url,headers,payload| @ac={method: method, url: url, headers: headers, payload: payload}}
                .and_return({code: 200, body: { jobId: '123456' }})
        @sut = folder_api_service.new(req_obj)
        source_folder = 'my_folder/inside_folder'
        destination_path = 'moved/inside_another_folder'
        resp = @sut.move(source_folder_path: source_folder, destination_path: destination_path)
        expect(@ac[:url]).to eq("https://api.imagekit.io/v1/bulkJobs/moveFolder")
        expect(@ac[:method]).to eq('post')
        expect(@ac[:payload]).to eq({:sourceFolderPath=>"my_folder/inside_folder", :destinationPath=>"moved/inside_another_folder"})
        expect(resp[:body][:jobId]).to eq('123456')
      end
    end
  end
end
