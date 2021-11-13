require_relative './storage/imagekit_store'
require_relative './storage/ik_file'
require_relative './support/uri_filename'

module CarrierWave
  module Uploader
    class Base

      def initialize(*)
        @imagekit = ImageKitIo.client
        @options = {}
      end

      configure do |config|
        config.storage_engines[:imagekit_store] = 'CarrierWave::Storage::ImageKitStore'
      end

      def filename
        if options != nil
          @options = options
        end
        folder = nil
        begin
          folder = store_dir
        rescue
        end

        if folder != nil
          @options[:folder] = folder
        end

        if self.file != nil
          base64 = Base64.encode64(::File.open(self.file.file, "rb").read)
          resp = @imagekit.upload_file(open(self.file.file, 'rb'), self.file.filename, @options)
          # ::File.delete(self.file.file)
          res = resp[:response].to_json
          if res != "null"
            res
          else
            "{\"filePath\":\"\",\"url\":\"\",\"name\":\"\"}"
          end
        else
          "{\"filePath\":\"\",\"url\":\"\",\"name\":\"\"}"
        end
      end

      def fileId
        JSON.parse(self.identifier)['fileId']
      end

      def blob
        JSON.parse(self.identifier)
      end

      def url_with(opt)
        path = JSON.parse(self.identifier)['filePath']
        opt[:path] = path
        url = @imagekit.url(opt)
      end

      def url
        JSON.parse(self.identifier)['url']
      end

      def options
        options = {}
      end

      def store_dir
        store_dir = nil
      end
    end

  end

end
