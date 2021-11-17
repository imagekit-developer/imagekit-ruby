module ImageKiIo
  module ActiveStorage
    class IKFile
      attr_accessor :identifier

      def initialize(identifier)
        @identifier = identifier
        @imagekit = ImageKitIo.client
      end

      def url
        identifier['url']
      end

      def delete
        begin
          @imagekit.delete_file(file_id)
        rescue
          file_id
        end
      end

      def file_type
        identifier['fileType']
      end

      def thumbnail_url
        identifier['thumbnailUrl']
      end

      def filename
        identifier['name']
      end

      def size
        identifier['size']
      end

      def path
        identifier['filePath']
      end

      def height
        identifier['height']
      end

      def width
        identifier['width']
      end

      def file_id
        identifier['fileId']
      end

      def exist?
        details = @imagekit.get_file_details(file_id)
        return false if details[:error].present?

        true
      end
    end
  end
end
