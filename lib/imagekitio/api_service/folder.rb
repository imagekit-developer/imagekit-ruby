require_relative '../constant'

module ImageKitIo
  module ApiService
    class Folder
      include Constantable

      def initialize(req_obj)
        @req_obj = req_obj
      end

      def create(folder_name, parent_folder_path)
        if folder_name == '' || folder_name.nil?
          raise ArgumentError, 'folder_name is required'
        end
        url = "#{constants.API_BASE_URL}/folder"
        payload = { 'folderName': folder_name, 'parentFolderPath': parent_folder_path }.to_json
        @req_obj.request('post', url, @req_obj.create_headers, payload)
      end

      def delete(folder_path)
        if folder_path == '' || folder_path.nil?
          raise ArgumentError, 'folder_path is required'
        end
        url = "#{constants.API_BASE_URL}/folder"
        payload = { 'folderPath': folder_path }
        @req_obj.request('delete', url, @req_obj.create_headers, payload)
      end

      def copy(source_folder_path, destination_path)
        if source_folder_path == '' || source_folder_path.nil? || destination_path == '' || destination_path.nil?
          raise ArgumentError, 'Parameters required'
        end
        url = "#{constants.BULK_BASE_URL}/copyFolder"
        payload = { 'sourceFolderPath': source_folder_path, 'destinationPath': destination_path }
        @req_obj.request('post', url, @req_obj.create_headers, payload)
      end

      def move(source_folder_path, destination_path)
        if source_folder_path == '' || source_folder_path.nil? || destination_path == '' || destination_path.nil?
          raise ArgumentError, 'Parameters required'
        end
        url = "#{constants.BULK_BASE_URL}/moveFolder"
        payload = { 'sourceFolderPath': source_folder_path, 'destinationPath': destination_path }
        @req_obj.request('post', url, @req_obj.create_headers, payload)
      end
    end
  end
end
