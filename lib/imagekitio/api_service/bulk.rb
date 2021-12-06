require_relative '../constant'

module ImageKitIo
  module ApiService
    class Bulk
      include Constantable

      def initialize(req_obj)
        @req_obj = req_obj
      end

      def job_status(job_id: nil)
        if job_id == '' || job_id.nil?
          raise ArgumentError, 'job_id is required'
        end
        url = "#{constants.BULK_BASE_URL}/#{job_id}"
        payload = { 'jobId': job_id }
        @req_obj.request('get', url, @req_obj.create_headers, payload)
      end

      def add_tags(file_ids: [], tags: [])
        if file_ids.empty? || tags.empty?
          raise ArgumentError, 'Parameters are required'
        end
        url = "#{constants.BASE_URL}/addTags"
        payload = { 'fileIds': file_ids, 'tags': tags }.to_json
        @req_obj.request('post', url, @req_obj.create_headers, payload)
      end

      def remove_tags(file_ids: [], tags: [])
        if file_ids.empty? || tags.empty?
          raise ArgumentError, 'Parameters are required'
        end
        url = "#{constants.BASE_URL}/removeTags"
        payload = { 'fileIds': file_ids, 'tags': tags }.to_json
        @req_obj.request('post', url, @req_obj.create_headers, payload)
      end

      def remove_ai_tags(file_ids: [], ai_tags: [])
        if file_ids.empty? || ai_tags.empty?
          raise ArgumentError, 'Parameters are required'
        end
        url = "#{constants.BASE_URL}/removeAITags"
        payload = { 'fileIds': file_ids, 'AITags': ai_tags }.to_json
        @req_obj.request('post', url, @req_obj.create_headers, payload)
      end

      def remove_files(file_ids: [])
        if file_ids.empty?
          raise ArgumentError, 'File ids are required'
        end
        url = "#{constants.BASE_URL}#{constants.BULK_FILE_DELETE}"
        payload = {'fileIds': file_ids}.to_json
        @req_obj.request("post", url, @req_obj.create_headers, payload)
      end
    end
  end
end
