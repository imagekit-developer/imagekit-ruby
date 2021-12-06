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
          @imagekit.delete_file(file_id: file_id)
        rescue
          file_id
        end
      end

      def file_type
        identifier['fileType']
      end

      def thumbnail_url
        identifier['thumbnail']
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
        details = @imagekit.get_file_details(file_id: file_id)
        return false if details[:error].present?

        true
      end

      def type
        identifier['type']
      end

      def tags
        identifier['tags']
      end

      def ai_tags
        identifier['AITags']
      end

      def is_private?
        identifier['isPrivateFile']
      end

      def custom_coordinates
        identifier['customCoordinates']
      end

      def mime
        identifier['mime']
      end

      def alpha?
        identifier['hasAlpha']
      end

      def custom_metadata
        identifier['customMetadata']
      end

      def embedded_metadata
        identifier['embeddedMetadata']
      end

      def created_at
        identifier['createdAt']
      end

      def updated_at
        identifier['updatedAt']
      end

      def extension_status
        identifier['extensionStatus']
      end
    end
  end
end
