require_relative 'utils/formatter'

module ImageKitIo
  class CustomMetaDataField
    include Utils::Formatter
    include Constantable

    def initialize(req_obj)
      @req_obj = req_obj
    end

    def create(name, label, schema)
      if name == '' || name.nil? || label == '' || label.nil? || schema == '' || schema.nil?
        raise ArgumentError, 'parameters required'
      end
      unless schema.is_a?(Hash)
        raise ArgumentError, 'schema must be hash object'
      end
      url = "#{constants.API_BASE_URL}/customMetadataFields"
      payload = { 'name': name, 'label': label, 'schema': schema }.to_json
      @req_obj.request('post', url, @req_obj.create_headers, payload)
    end

    def list(options = {})
      url = "#{constants.API_BASE_URL}/customMetadataFields"
      payload = request_formatter(options)
      @req_obj.request('get', url, @req_obj.create_headers, payload)
    end

    def update(id, label = nil, schema = nil)
      if id == '' || id.nil?
        raise ArgumentError, 'id is required'
      end
      url = "#{constants.API_BASE_URL}/customMetadataFields/#{id}"
      payload = {}
      payload = payload.merge({ 'label': label }) unless label.nil?
      payload = payload.merge({ 'schema': label }) unless schema.nil?
      @req_obj.request('patch', url, @req_obj.create_headers, payload.to_json)
    end

    def delete(id)
      if id == '' || id.nil?
        raise ArgumentError, 'id is required'
      end
      url = "#{constants.API_BASE_URL}/customMetadataFields/#{id}"
      @req_obj.request('delete', url, @req_obj.create_headers)
    end
  end
end
