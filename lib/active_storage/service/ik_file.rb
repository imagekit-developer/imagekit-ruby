module ImageKiIo
  module ActiveStorage
    class IKFile
      def initialize(identifier)
        @identifier = identifier
        @imagekit = ImageKitIo.client
      end

      def url
        @identifier['url']
      end

      def delete
        begin
          @imagekit.delete_file(file_id)
        rescue
          file_id
        end
      end

      private
      def file_id
        @identifier['fileId']
      end
    end
  end
end
